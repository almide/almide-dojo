#!/usr/bin/env bash
# Replay of almide-dojo#61 on committed data, no model call.
#
# The job's working tree as run 36357844362 left it: the checkout held the
# 2026-09-22 runs, `rm -rf runs/` deleted them from disk, and the lane wrote
# the 2026-09-27 run (committed in d34a926). A second scenario also rewrites
# one past manifest in place, the shape the issue first suspected. In both,
# the old git-status locator picks a past run and the new one must not:
#   1. the retired locator picks 2026-09-22 (the bug, reproduced)
#   2. `locate` returns exactly the path the lane recorded
#   3. `check` accepts that manifest for this run's date, model and label
#   4. `check` refuses the stale 2026-09-22 manifest for the same identity
#   5. `locate` refuses an empty record, a two-manifest record and a path
#      that is not on disk
set -euo pipefail

cd "$(dirname "$0")/.."
ROOT=$PWD
TOOL="$ROOT/scripts/msr-manifest.sh"

FRESH='runs/msr/2026-09-27/cf_cf_meta_llama-3-3-70b-instruct-fp8-fast-v0.65.0-llama-70b-only-(restrained)'
STALE='runs/msr/2026-09-22/cf_cf_meta_llama-3-1-8b-instruct/manifest.json'
MODEL='cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast'
LABEL='v0.65.0 llama-70b only (restrained)'
for f in "$FRESH/manifest.json" "$FRESH/table.md" "$STALE"; do
  [ -f "$f" ] || { echo "fixture missing: $f" >&2; exit 1; }
done

fail=0
pass() { echo "ok   $*"; }
bad()  { echo "FAIL $*"; fail=1; }

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

# A repo whose history is the checkout the job started from: every committed
# run from 2026-09-22 and nothing from 2026-09-27.
build_repo() {
  local repo="$1"
  mkdir -p "$repo"
  (cd "$ROOT" && git ls-files -- 'runs/msr/2026-09-22') | while read -r f; do
    mkdir -p "$repo/$(dirname "$f")"
    cp "$ROOT/$f" "$repo/$f"
  done
  git -C "$repo" init -q
  git -C "$repo" add -A
  git -C "$repo" -c user.name=t -c user.email=t@t commit -q -m history
}

# The job: clear runs/, then the lane writes this run and records its path.
run_job() {
  local repo="$1" record="$2"
  rm -rf "$repo/runs"
  mkdir -p "$repo/$FRESH"
  cp "$ROOT/$FRESH/manifest.json" "$ROOT/$FRESH/table.md" "$repo/$FRESH/"
  : > "$record"
  echo "$FRESH/manifest.json" >> "$record"   # what run.almd appends under MSR_MANIFEST_RECORD
}

retired_locator() {
  git status --porcelain --untracked-files=all -- runs/msr \
    | sed 's/^...//' | grep -E '/manifest\.json$' | head -n1 || true
}

scenario() {
  local name="$1" rewrite_stale="$2"
  local repo="$TMP/$name" record="$TMP/$name.record"
  build_repo "$repo"
  run_job "$repo" "$record"
  if [ "$rewrite_stale" = yes ]; then
    mkdir -p "$repo/$(dirname "$STALE")"
    jq '. + {"rewritten": true}' "$ROOT/$STALE" > "$repo/$STALE"
  fi
  cd "$repo"

  local old; old=$(retired_locator)
  case "$old" in
    runs/msr/2026-09-22/*) pass "[$name] the retired locator picks a past run ($old): the bug reproduces" ;;
    *) bad "[$name] the retired locator picked '$old'; this replay no longer reproduces #61" ;;
  esac

  local got
  if got=$("$TOOL" locate "$record" 2>&1) && [ "$got" = "$FRESH/manifest.json" ]; then
    pass "[$name] locate returns the recorded manifest"
  else
    bad "[$name] locate returned '$got'"
  fi

  if "$TOOL" check "$FRESH/manifest.json" "$MODEL" "$LABEL" 2026-09-27 >/dev/null 2>&1; then
    pass "[$name] check accepts this run's manifest"
  else
    bad "[$name] check refused this run's own manifest"
  fi

  cp "$ROOT/$STALE" "$TMP/stale-manifest.json"
  if "$TOOL" check "$TMP/stale-manifest.json" "$MODEL" "$LABEL" 2026-09-27 >/dev/null 2>&1; then
    bad "[$name] check accepted the stale 2026-09-22 manifest"
  else
    pass "[$name] check refuses the stale 2026-09-22 manifest"
  fi
  # Each identity field refuses on its own, not just the date.
  if "$TOOL" check "$FRESH/manifest.json" "cf:@cf/meta/llama-3.1-8b-instruct" "$LABEL" 2026-09-27 >/dev/null 2>&1; then
    bad "[$name] check accepted a wrong model"; else pass "[$name] check refuses a wrong model"; fi
  if "$TOOL" check "$FRESH/manifest.json" "$MODEL" "" 2026-09-27 >/dev/null 2>&1; then
    bad "[$name] check accepted a wrong label"; else pass "[$name] check refuses a wrong label"; fi
  if "$TOOL" check "$FRESH/manifest.json" "$MODEL" "$LABEL" 2026-09-26 2026-09-28 >/dev/null 2>&1; then
    bad "[$name] check accepted a wrong date"; else pass "[$name] check refuses a wrong date"; fi
  if "$TOOL" check "$FRESH/manifest.json" "$MODEL" "$LABEL" 2026-09-27 2026-09-28 >/dev/null 2>&1; then
    pass "[$name] check accepts a run that crossed midnight"; else bad "[$name] check refused a run whose date is one of two"; fi
  cd "$ROOT"
}

scenario deleted no
scenario rewritten yes

: > "$TMP/empty"
if "$TOOL" locate "$TMP/empty" >/dev/null 2>&1; then bad "locate accepted an empty record"; else pass "locate refuses an empty record"; fi
printf '%s\n%s\n' "$FRESH/manifest.json" "$STALE" > "$TMP/two"
if "$TOOL" locate "$TMP/two" >/dev/null 2>&1; then bad "locate picked one of two recorded manifests"; else pass "locate refuses a two-manifest record"; fi
echo "runs/msr/2026-09-27/nowhere/manifest.json" > "$TMP/gone"
if "$TOOL" locate "$TMP/gone" >/dev/null 2>&1; then bad "locate accepted a path not on disk"; else pass "locate refuses a recorded path that is not on disk"; fi

[ "$fail" -eq 0 ] && echo "all manifest-locator cases passed" || { echo "manifest-locator cases FAILED"; exit 1; }
