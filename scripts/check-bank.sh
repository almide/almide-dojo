#!/usr/bin/env bash
# THE CONTRACT-PRESERVING BANK GATE (almide-dojo#3, almide/almide#1998)
#
# A bank task is a MODIFICATION of an already-correct program. Every task dir
# under tasks/bank/<family>/<name>/ must carry:
#   baseline.almd   the program the model is asked to edit (correct BEFORE the edit)
#   solution.almd   a reference patch (proves a correct edit exists)
#   wrong.almd      a plausible wrong patch: compiles, passes the visible tests,
#                   fails the hidden oracle (proves the bank DISCRIMINATES)
#                   — optional when meta says resource_oracle = "pending" | "active"
#   wrong_resource.almd, probe.almd   (resource_oracle = "active", almide-dojo#5)
#                   a plausible wrong patch that passes the visible tests AND the
#                   hidden oracle and fails the resource oracle
#                   (scripts/resource-oracle.sh), and the probe that measures it
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
#   (g) resource_oracle = "active": wrong_resource + tests or + hidden FAILS (not
#       behaviour-identical), and — when the compiler carries the allocation
#       counters (`scripts/resource-oracle.sh --armed`) — the solution exceeds the
#       resource bound or wrong_resource stays within it. Unarmed, the leg is
#       reported off; BANK_REQUIRE_RESOURCE=1 makes that an error.
#   (f) with wasmtime on PATH: solution + tests + hidden differ between native and
#       wasm (cross-target agreement is part of the score). A solution the compiler
#       SKIPs at a wasm "v1 wall" (exit 0, nothing run) is counted and reported as
#       unscored, never as agreement; BANK_REQUIRE_WASM_RENDER=1 makes it an error.
#   (h) two baselines of one family are near-duplicates (scripts/bank_dedup.almd:
#       identifiers/literals normalised to placeholders, token 6-gram Jaccard at or
#       above its calibrated threshold) — a renamed task is not an independent cluster.
#       Always over the WHOLE bank, so a filtered run still sees every sibling.
#
# BANK_JOBS=<n> caps the parallel tasks (default: every core); BANK_VERBOSE=1 names each passing task.
# Filter (authoring loop): check only some tasks, in seconds —
#   bash scripts/check-bank.sh tasks/bank/<family>/<name> [more task or family dirs]
#   BANK_ONLY=<family>/<name>,<family> bash scripts/check-bank.sh
# A filter that matches no task is an error, never a silent green.
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
HAVE_RES=0; RES_STATE="$(bash scripts/resource-oracle.sh --armed 2>/dev/null)" && HAVE_RES=1
if [ "$HAVE_RES" = 0 ] && [ "${BANK_REQUIRE_RESOURCE:-0}" = 1 ]; then echo "::error::BANK_REQUIRE_RESOURCE=1 but the compiler is $RES_STATE"; exit 2; fi
HAVE_WASM=0; command -v wasmtime >/dev/null && HAVE_WASM=1
if [ "$HAVE_WASM" = 0 ] && [ "${BANK_REQUIRE_WASM:-0}" = 1 ]; then echo "::error::BANK_REQUIRE_WASM=1 but wasmtime is not on PATH: the cross-target leg would be skipped"; exit 2; fi

fail=0
err() { fail=1; echo "::error::$*"; }
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT

# run_pair <task-dir> <program> <suite> [--target wasm] -> 0 pass / 1 fail
run_pair() {
  local dir="$1" prog="$2" suite="$3"; shift 3
  local f="$TMP/$(echo "${dir#$BANK/}" | tr / _)-$prog-$suite.almd"
  command cat "$dir/$prog.almd" "$dir/$suite.almd" > "$f"
  almide test "$f" "$@" >"$f.log" 2>&1
}
# run_triple: program + tests + hidden, for the cross-target leg
run_triple() {
  local dir="$1" prog="$2"; shift 2
  local f="$TMP/$(echo "${dir#$BANK/}" | tr / _)-$prog-all$*.almd"
  command cat "$dir/$prog.almd" "$dir/tests.almd" "$dir/hidden.almd" > "$f"
  almide test "$f" "$@" >"$f.log" 2>&1
}
meta() { grep -E "^[[:space:]]*$2[[:space:]]*=" "$1/meta.toml" | head -1 | sed -E 's/^[^=]*=[[:space:]]*//; s/"//g; s/#.*$//; s/[[:space:]]+$//'; }

# The task list: every task, or the ones named by the arguments / BANK_ONLY.
want=()
for a in "$@"; do a="${a%/}"; want+=("${a#$BANK/}"); done
if [ -n "${BANK_ONLY:-}" ]; then IFS=',' read -ra only <<<"$BANK_ONLY"; for a in "${only[@]}"; do a="${a%/}"; want+=("${a#$BANK/}"); done; fi
selected() {
  [ "${#want[@]}" = 0 ] && return 0
  local name="$1" w
  for w in "${want[@]}"; do [ "$name" = "$w" ] || [ "${name%%/*}" = "$w" ] && return 0; done
  return 1
}

# check_task <task-dir>: every leg of one task; prints ::error:: lines, exit 1 on any.
check_task() {
  local dir="$1" fail=0 name famdir kind fam res f out rc
  name="${dir#$BANK/}"; famdir="${name%%/*}"
  for f in baseline solution tests hidden; do [ -f "$dir/$f.almd" ] || err "$name: missing $f.almd"; done
  for f in prompt.md meta.toml; do [ -f "$dir/$f" ] || err "$name: missing $f"; done
  [ -f "$dir/meta.toml" ] || return 1
  kind="$(meta "$dir" kind)"; [ "$kind" = "modify" ] || err "$name: kind='$kind' (bank tasks are kind = \"modify\")"
  fam="$(meta "$dir" family)"
  [ "$fam" = "dojo:$famdir" ] || err "$name: family='$fam' but the directory says dojo:$famdir"
  grep -qxF -- "$fam" <<<"$FAMILY_SLUGS" || err "$name: family '$fam' is not a row of $FAMILIES"
  res="$(meta "$dir" resource_oracle)"
  case "$res" in not-needed|pending|active) ;; *) err "$name: resource_oracle='$res' (not-needed | pending | active)" ;; esac
  if [ ! -f "$dir/wrong.almd" ] && [ "$res" != "pending" ] && [ "$res" != "active" ]; then err "$name: missing wrong.almd (required unless resource_oracle = \"pending\" or \"active\")"; fi
  if [ "$res" = "active" ]; then
    for f in wrong_resource.almd "$(meta "$dir" resource_probe)"; do [ -f "$dir/$f" ] || err "$name: resource_oracle = \"active\" needs $f"; done
  fi
  [ -f "$dir/baseline.almd" ] && [ -f "$dir/solution.almd" ] && [ -f "$dir/tests.almd" ] && [ -f "$dir/hidden.almd" ] || return 1
  # (b) the edit is required
  if run_pair "$dir" baseline tests; then err "$name: baseline already passes the visible tests — the requested edit is not required"; fi
  # (c) a correct patch exists
  run_pair "$dir" solution tests  || err "$name: solution fails the visible tests"
  run_pair "$dir" solution hidden || err "$name: solution fails the hidden oracle"
  # (d) the bank discriminates
  if [ -f "$dir/wrong.almd" ]; then
    run_pair "$dir" wrong tests || err "$name: wrong.almd does not pass the visible tests — not a plausible wrong patch"
    if run_pair "$dir" wrong hidden; then err "$name: wrong.almd passes the hidden oracle — the task does not discriminate"; fi
  fi
  # (g) the resource oracle discriminates, and only on resources
  if [ "$res" = "active" ] && [ -f "$dir/wrong_resource.almd" ]; then
    run_pair "$dir" wrong_resource tests  || err "$name: wrong_resource.almd does not pass the visible tests"
    run_pair "$dir" wrong_resource hidden || err "$name: wrong_resource.almd fails the hidden oracle — it must differ on resources only"
    if [ "$HAVE_RES" = 1 ]; then
      out="$(bash scripts/resource-oracle.sh "$dir" "$dir/solution.almd" 2>/dev/null)" || err "$name: the solution fails the resource oracle: $(echo $out)"
      out="$(bash scripts/resource-oracle.sh "$dir" "$dir/wrong_resource.almd" 2>/dev/null)"; rc=$?
      [ "$rc" = 1 ] || err "$name: wrong_resource.almd is not rejected by the resource oracle (exit $rc): $(echo $out)"
    fi
  fi
  # (f) cross-target agreement
  if [ "$HAVE_WASM" = 1 ]; then
    run_triple "$dir" solution --target wasm || err "$name: solution passes natively but not on --target wasm"
    # A wasm "v1 wall" SKIPs the file and exits 0: that is NOT agreement, it was never run.
    if grep -q '^SKIP .*v1 wall' "$TMP/$(echo "$name" | tr / _)-solution-all--target wasm.almd.log" 2>/dev/null; then
      : > "$TMP/walled-$(echo "$name" | tr / _)"
      [ "${BANK_REQUIRE_WASM_RENDER:-0}" = 1 ] && err "$name: the solution hits a wasm v1 wall — the cross-target leg is skipped, not scored"
    fi
  fi
  [ "$fail" = 0 ] && [ -n "${BANK_VERBOSE:-}" ] && echo "ok   $name"
  return "$fail"
}

dirs=()
for dir in "$BANK"/*/*/; do
  dir="${dir%/}"; [ -d "$dir" ] || continue
  selected "${dir#$BANK/}" && dirs+=("$dir")
done
n=${#dirs[@]}
# The tasks are independent: BANK_JOBS of them at a time (default: every core).
JOBS="${BANK_JOBS:-$(getconf _NPROCESSORS_ONLN 2>/dev/null || echo 2)}"
if [ "$n" -gt 0 ]; then
  export BANK FAMILIES FAMILY_SLUGS HAVE_RES HAVE_WASM TMP
  export -f err run_pair run_triple meta check_task
  printf '%s\n' "${dirs[@]}" | xargs -P "$JOBS" -I{} bash -c 'check_task "$1"' _ {} || fail=1
fi
[ "$n" -gt 0 ] || err "no bank tasks found under $BANK${want:+ matching: ${want[*]}}"
# (h) no two baselines of a family are near-duplicates (self-test first: a renamed
# copy of a seed must be refused, or the gate itself is broken)
almide test scripts/bank_dedup.almd >"$TMP/dedup-test.log" 2>&1 || err "scripts/bank_dedup.almd self-test failed ($(tail -5 "$TMP/dedup-test.log" | tr '\n' ' '))"
almide run scripts/bank_dedup.almd -- "$BANK" || fail=1
walled=$(ls "$TMP" | grep -c '^walled-' || true)
echo "bank gate: $n task(s), wasm leg $([ "$HAVE_WASM" = 1 ] && echo "on ($((n - walled)) rendered, $walled skipped at a v1 wall — unscored)" || echo off), resource leg $([ "$HAVE_RES" = 1 ] && echo on || echo "off ($RES_STATE)")"
[ "$fail" = 0 ] && { echo "bank gate OK"; exit 0; } || { echo "bank gate FAILED"; exit 1; }
