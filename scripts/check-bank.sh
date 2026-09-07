#!/usr/bin/env bash
# THE CONTRACT-PRESERVING BANK GATE (almide-dojo#3, almide/almide#1998)
#
# A bank task is a MODIFICATION of an already-correct program. Every task dir
# under tasks/bank/<family>/<name>/ must carry:
#   baseline.almd   the program the model is asked to edit (correct BEFORE the edit)
#   solution.almd   a reference patch (proves a correct edit exists)
#   wrong.almd      a plausible wrong patch: compiles, passes the visible tests,
#                   fails the hidden oracle (proves the bank DISCRIMINATES)
#                   — optional while meta says resource_oracle = "pending"
#   tests.almd      the visible tests (the model may see their names, never hidden.almd)
#   hidden.almd     the hidden oracle: untouched behaviour + adversarial inputs
#   prompt.md       the requested edit AND the protected contract, in words
#   meta.toml       kind = "modify", family = "dojo:<slug>", contracts = [...]
#
# It FAILS when:
#   (a) a required file is missing, or wrong.almd is missing without a pending
#       resource oracle;
#   (b) baseline + tests PASSES  — the edit is not required, "do nothing" would score;
#   (c) solution + tests FAILS or solution + hidden FAILS — no correct patch exists;
#   (d) wrong + tests FAILS — the wrong patch is not plausible (it does not fool the
#       visible suite), or wrong + hidden PASSES — the oracle does not discriminate;
#   (e) the family slug in meta.toml is not the directory name, or is not a row of
#       bank/families.txt (the pinned copy of almide's scripts/lib/dojo-families.txt);
#   (f) with wasmtime on PATH: solution + tests + hidden differ between native and
#       wasm (cross-target agreement is part of the score).
# Pure shell + the `almide` binary on PATH; every compile is a real compile.
set -uo pipefail
cd "$(dirname "$0")/.." || exit 2
export PATH="/opt/homebrew/bin:$PATH"

BANK="tasks/bank"
FAMILIES="bank/families.txt"
[ -d "$BANK" ] || { echo "::error::$BANK not found"; exit 2; }
[ -f "$FAMILIES" ] || { echo "::error::$FAMILIES not found"; exit 2; }
command -v almide >/dev/null || { echo "::error::almide not on PATH"; exit 2; }
FAMILY_SLUGS="$(grep -vE '^[[:space:]]*(#|$)' "$FAMILIES" | cut -f1)"
HAVE_WASM=0; command -v wasmtime >/dev/null && HAVE_WASM=1

fail=0
err() { fail=1; echo "::error::$*"; }
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT

# run_pair <task-dir> <program> <suite> [--target wasm] -> 0 pass / 1 fail
run_pair() {
  local dir="$1" prog="$2" suite="$3"; shift 3
  local f="$TMP/$(basename "$dir")-$prog-$suite.almd"
  command cat "$dir/$prog.almd" "$dir/$suite.almd" > "$f"
  almide test "$f" "$@" >"$f.log" 2>&1
}
# run_triple: program + tests + hidden, for the cross-target leg
run_triple() {
  local dir="$1" prog="$2"; shift 2
  local f="$TMP/$(basename "$dir")-$prog-all$*.almd"
  command cat "$dir/$prog.almd" "$dir/tests.almd" "$dir/hidden.almd" > "$f"
  almide test "$f" "$@" >"$f.log" 2>&1
}
meta() { grep -E "^[[:space:]]*$2[[:space:]]*=" "$1/meta.toml" | head -1 | sed -E 's/^[^=]*=[[:space:]]*//; s/"//g; s/#.*$//; s/[[:space:]]+$//'; }

n=0
for dir in "$BANK"/*/*/; do
  dir="${dir%/}"; [ -d "$dir" ] || continue
  n=$((n+1)); name="${dir#$BANK/}"; famdir="${name%%/*}"
  for f in baseline solution tests hidden; do [ -f "$dir/$f.almd" ] || err "$name: missing $f.almd"; done
  for f in prompt.md meta.toml; do [ -f "$dir/$f" ] || err "$name: missing $f"; done
  [ -f "$dir/meta.toml" ] || continue
  kind="$(meta "$dir" kind)"; [ "$kind" = "modify" ] || err "$name: kind='$kind' (bank tasks are kind = \"modify\")"
  fam="$(meta "$dir" family)"
  [ "$fam" = "dojo:$famdir" ] || err "$name: family='$fam' but the directory says dojo:$famdir"
  grep -qxF -- "$fam" <<<"$FAMILY_SLUGS" || err "$name: family '$fam' is not a row of $FAMILIES"
  res="$(meta "$dir" resource_oracle)"
  case "$res" in not-needed|pending|active) ;; *) err "$name: resource_oracle='$res' (not-needed | pending | active)" ;; esac
  if [ ! -f "$dir/wrong.almd" ] && [ "$res" != "pending" ]; then err "$name: missing wrong.almd (required unless resource_oracle = \"pending\")"; fi
  [ -f "$dir/baseline.almd" ] && [ -f "$dir/solution.almd" ] && [ -f "$dir/tests.almd" ] && [ -f "$dir/hidden.almd" ] || continue
  # (b) the edit is required
  if run_pair "$dir" baseline tests; then err "$name: baseline already passes the visible tests — the requested edit is not required"; fi
  # (c) a correct patch exists
  run_pair "$dir" solution tests  || err "$name: solution fails the visible tests ($TMP/*solution-tests*.log)"
  run_pair "$dir" solution hidden || err "$name: solution fails the hidden oracle"
  # (d) the bank discriminates
  if [ -f "$dir/wrong.almd" ]; then
    run_pair "$dir" wrong tests || err "$name: wrong.almd does not pass the visible tests — not a plausible wrong patch"
    if run_pair "$dir" wrong hidden; then err "$name: wrong.almd passes the hidden oracle — the task does not discriminate"; fi
  fi
  # (f) cross-target agreement
  if [ "$HAVE_WASM" = 1 ]; then
    run_triple "$dir" solution --target wasm || err "$name: solution passes natively but not on --target wasm"
  fi
done
[ "$n" -gt 0 ] || err "no bank tasks found under $BANK"
echo "bank gate: $n task(s), wasm leg $([ "$HAVE_WASM" = 1 ] && echo on || echo off)"
[ "$fail" = 0 ] && { echo "bank gate OK"; exit 0; } || { echo "bank gate FAILED"; exit 1; }
