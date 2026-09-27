#!/usr/bin/env bash
# Which manifest did THIS job write, and is it really this job's? (almide-dojo#61)
#
#   scripts/msr-manifest.sh locate <record-file>
#       Print the one manifest path the lane recorded in <record-file> (the file
#       named by MSR_MANIFEST_RECORD while `src/msr/run.almd -- run` ran). Exit 1
#       when nothing was recorded, when more than one manifest was recorded, or
#       when the recorded file is not on disk. Nothing is inferred: no git
#       status, no find, no sort.
#
#   scripts/msr-manifest.sh check <manifest> <model-spec> <label> <date> [<date>...]
#       Refuse a manifest that is not this run's: its `model.spec` must equal
#       <model-spec>, its `label` must equal <label> (may be ""), its `lane` must
#       be cross-language, and its `date` must be one of the <date>s (the job
#       passes the UTC date before and after the lane, because a run can cross
#       midnight).
#
# Why: the locator used to be
#   git status --porcelain --untracked-files=all -- runs/msr | grep manifest.json | head -n1
# and the job runs `rm -rf runs/` before the lane, so every committed past
# manifest shows up as a deletion. Run 36357844362 picked
# runs/msr/2026-09-22/cf_cf_meta_llama-3-1-8b-instruct/manifest.json — five
# days old, another model, and not even on disk — instead of the 2026-09-27
# run it had just written. scripts/test-msr-manifest.sh replays that.
set -euo pipefail

die() { echo "::error::$*" >&2; exit 1; }

cmd="${1:-}"
case "$cmd" in
  locate)
    record="${2:-}"
    [ -n "$record" ] || die "usage: msr-manifest.sh locate <record-file>"
    [ -s "$record" ] || die "the lane recorded no manifest ($record is missing or empty) — nothing was measured"
    n=$(grep -c . "$record" || true)
    if [ "$n" -ne 1 ]; then
      die "the lane recorded $n manifests, one job measures one model: $(tr '\n' ' ' < "$record")— judge each explicitly rather than picking one"
    fi
    path=$(grep . "$record")
    [ -f "$path" ] || die "the lane recorded $path but it is not on disk"
    printf '%s\n' "$path"
    ;;
  check)
    manifest="${2:-}"; model="${3:-}"; label="${4-}"
    [ $# -ge 5 ] || die "usage: msr-manifest.sh check <manifest> <model-spec> <label> <date> [<date>...]"
    shift 4
    [ -f "$manifest" ] || die "$manifest is not on disk"
    got_lane=$(jq -r '.lane // ""' "$manifest")
    got_model=$(jq -r '.model.spec // ""' "$manifest")
    got_label=$(jq -r '.label // ""' "$manifest")
    got_date=$(jq -r '.date // ""' "$manifest")
    bad=""
    [ "$got_lane" = "cross-language" ] || bad="$bad lane=\`$got_lane\` (want cross-language);"
    [ "$got_model" = "$model" ] || bad="$bad model=\`$got_model\` (want \`$model\`);"
    [ "$got_label" = "$label" ] || bad="$bad label=\`$got_label\` (want \`$label\`);"
    date_ok=false
    for d in "$@"; do [ "$got_date" = "$d" ] && date_ok=true; done
    $date_ok || bad="$bad date=\`$got_date\` (want one of: $*);"
    [ -z "$bad" ] || die "$manifest is not this run's manifest:$bad refusing to judge it"
    echo "manifest identity ok: $manifest (date $got_date, model $got_model, label \`$got_label\`)"
    ;;
  *)
    die "usage: msr-manifest.sh <locate|check> ..."
    ;;
esac
