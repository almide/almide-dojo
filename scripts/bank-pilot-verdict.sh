#!/usr/bin/env bash
# THE BANK PILOT'S VERDICT (almide-dojo#3, almide/almide#1998 step 6)
#
#   scripts/bank-pilot-verdict.sh <runs-dir> <clusters> <families> <repetitions>
#
# Reads every bank-summary*.md under <runs-dir> (one per model x repetition, as
# the bank-pilot workflow writes them) and decides two things, in this order:
#
# 1. SCALE — is this run the size it is published as? #1998's frozen decision:
#    400 clusters x 3 model families x 3 repetitions is a pilot, 800 x 4 x 3 a
#    published comparison. Clusters are the bank's independent task clusters
#    (a task's `cluster = "..."` in meta.toml, else the task itself — renamings
#    and seeds of one task share its cluster and do not add one); families are
#    the model families the summaries came from (the vendor segment of the
#    spec: `cf:@cf/meta/...` -> meta); repetitions are the summaries per model.
#    Short on any axis -> `under-scale`, whatever the numbers say.
# 2. The RESULT — `not-comparable` when any series is (a planned cell never
#    answered, or a resource task a compiler could not judge);
#    `INCONCLUSIVE_BANK_SATURATED` when every model series, pooled over its
#    repetitions, is at >= 98% of the cells it measured (the threshold of
#    src/cellstate.almd: valid as a regression suite, invalid as ranking
#    evidence); else `comparable`.
#
# Both lines are printed and written to <runs-dir>/bank-pilot-verdict.md.
# Exit 0 always when the inputs parse: the verdict is the output, not the code
# (a CI step that is red by design stops being read). Exit 2 = nothing to read.
set -uo pipefail
cd "$(dirname "$0")/.." || exit 2
RUNS="${1:?runs dir}"; NEED_CLUSTERS="${2:?clusters}"; NEED_FAMILIES="${3:?families}"; NEED_REPS="${4:?repetitions}"
SAT_PCT=$(sed -nE 's/^let SATURATION_PCT = ([0-9]+).*/\1/p' src/cellstate.almd)
[ -n "$SAT_PCT" ] || { echo "cannot read SATURATION_PCT from src/cellstate.almd"; exit 2; }

FILES=(); while IFS= read -r f; do FILES+=("$f"); done < <(find "$RUNS" -name 'bank-summary*.md' | sort)
[ "${#FILES[@]}" -gt 0 ] || { echo "no bank-summary*.md under $RUNS"; exit 2; }

# Independent clusters in the bank as checked out.
CLUSTERS=$(for d in tasks/bank/*/*/; do
  c=$(sed -nE 's/^[[:space:]]*cluster[[:space:]]*=[[:space:]]*"([^"]+)".*/\1/p' "$d/meta.toml" 2>/dev/null | head -1)
  echo "${c:-$(basename "$d")}"
done | sort -u | grep -c .)

# One row per summary: model  survived  reached  planned  verdict  scope
ROWS=$(for f in "${FILES[@]}"; do
  model=$(sed -nE 's/^- \*\*model\*\*: `?([^`]+)`?.*/\1/p' "$f" | head -1)
  [ -n "$model" ] || model=$(basename "$(dirname "$f")")
  read -r surv planned reached < <(sed -nE 's/^- \*\*survived\*\*: ([0-9]+)\/([0-9]+) planned \(([0-9]+) reached.*/\1 \2 \3/p' "$f" | head -1)
  verdict=$(sed -nE 's/^> \*\*Verdict: `([a-z-]+)`.*/\1/p' "$f" | head -1)
  smoke=$(grep -c 'BANK_LIMIT' "$f")
  rep=$(basename "$f" .md | sed -nE 's/.*-(rep[0-9]+).*/\1/p'); rep="${rep:-$f}"
  printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\n' "$model" "${surv:-0}" "${reached:-0}" "${planned:-0}" "${verdict:-unstamped}" "$smoke" "$rep"
done)

family_of() { printf '%s' "$1" | sed -E 's#^[a-z]+:##; s#^@cf/##; s#^([^/]+)/.*#\1#'; }
FAMILIES=$(printf '%s\n' "$ROWS" | cut -f1 | while read -r m; do family_of "$m"; echo; done | grep . | sort -u | grep -c .)
# Repetitions: distinct `rep<r>` labels per model (BANK_RUN_LABEL=rep<r>-shard<i>;
# shards of one repetition are one repetition). An unlabelled summary is one.
MIN_REPS=$(printf '%s\n' "$ROWS" | awk -F'\t' '{ print $1 "\t" $7 }' | sort -u | cut -f1 | uniq -c | awk 'NR==1||$1<m{m=$1} END{print m+0}')
SMOKES=$(printf '%s\n' "$ROWS" | awk -F'\t' '$6>0' | grep -c .)

scale_reasons=()
[ "$CLUSTERS" -ge "$NEED_CLUSTERS" ] || scale_reasons+=("clusters $CLUSTERS < $NEED_CLUSTERS")
[ "$FAMILIES" -ge "$NEED_FAMILIES" ] || scale_reasons+=("model families $FAMILIES < $NEED_FAMILIES")
[ "$MIN_REPS" -ge "$NEED_REPS" ] || scale_reasons+=("repetitions $MIN_REPS < $NEED_REPS")
[ "$SMOKES" -eq 0 ] || scale_reasons+=("$SMOKES summaries ran a BANK_LIMIT subset")
if [ "${#scale_reasons[@]}" -eq 0 ]; then SCALE="at-scale"; else SCALE="under-scale"; fi

# Result: pooled per model.
RESULT=$(printf '%s\n' "$ROWS" | awk -F'\t' -v pct="$SAT_PCT" '
  { s[$1]+=$2; r[$1]+=$3; if ($5!="comparable" && $5!="inconclusive-saturated") bad=1 }
  END {
    if (bad) { print "not-comparable"; exit }
    sat=1; for (m in s) if (!(r[m]>0 && s[m]*100 >= r[m]*pct)) sat=0
    print (sat ? "INCONCLUSIVE_BANK_SATURATED" : "comparable")
  }')

OUT="$RUNS/bank-pilot-verdict.md"
{
  echo "# Bank pilot verdict"
  echo
  echo "> **Scale: \`$SCALE\`**$([ "$SCALE" = at-scale ] || echo " — $(IFS=';'; echo "${scale_reasons[*]}")")"
  echo "> **Result: \`$RESULT\`**"
  echo
  echo "- required: $NEED_CLUSTERS clusters x $NEED_FAMILIES model families x $NEED_REPS repetitions (almide/almide#1998: 400 x 3 x 3 pilot, 800 x 4 x 3 published)"
  echo "- measured: $CLUSTERS clusters in the bank, $FAMILIES model families, min $MIN_REPS repetitions per model"
  echo "- saturation: every model series at >= $SAT_PCT% of the cells it measured -> INCONCLUSIVE_BANK_SATURATED"
  echo
  echo "| model | survived | reached | planned | verdict | subset |"
  echo "|---|---:|---:|---:|---|---|"
  printf '%s\n' "$ROWS" | awk -F'\t' '{ printf "| `%s` | %s | %s | %s | `%s` | %s |\n", $1, $2, $3, $4, $5, ($6>0?"BANK_LIMIT":"") }'
} > "$OUT"
cat "$OUT"
