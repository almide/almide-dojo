#!/usr/bin/env bash
# THE BANK'S RESOURCE ORACLE (almide-dojo#5, the third oracle of almide-dojo#3)
#
#   scripts/resource-oracle.sh <task-dir> <program.almd>   judge one program
#   scripts/resource-oracle.sh --armed                     does this compiler carry the counters?
#
# What it measures. A resource task ships `probe.almd`: an `effect fn main`
# that drives the task's boundary `__K__` times (K from `resource_scales`) and
# keeps every result live. The probe is appended to the program, built and run
# on BOTH targets with the compiler's allocation counters armed:
#
#   native  ALMIDE_ALLOC_COUNT=1       -> `__ALMD_ALLOC allocs=… peak=…`
#   wasm    ALMIDE_WASM_ALLOC_COUNT=1  -> `__ALMD_WASM_ALLOC allocs=… heap_end=…`
#
# The metric (`resource_metric`) is `peak` (native peak / wasm heap_end: live
# storage) or `allocs` (allocation count: routing). The oracle compares GROWTH
# between the two scales, candidate against the task's own reference solution
# measured by the same compiler in the same run:
#
#   candidate_growth <= reference_growth * resource_factor_pct / 100 + resource_slack
#
# on every target. Growth, not level, so the probe's own fixed costs cancel;
# the reference, not a pinned number, so a compiler change moves both sides.
# This is the `live_payload <= A * largest_batch + B` form of almide-dojo#5.
#
# What it does NOT measure: outstanding ownership AT a named boundary. The
# counters are process-end totals; the per-boundary read is almide/almide#2581.
# A task whose protected observation is only expressible at the boundary stays
# `resource_oracle = "pending"`.
#
# Every build runs in a scratch directory, never the repo root: `almide run`
# reads ./almide.toml / ./almide.lock from its cwd, and a probe is a single file.
# A program that takes the incumbent wasm leg prints no counter line (the
# counters are a structural-leg instrument) and reads as unarmed (exit 2).
#
# The counter lines are printed on stderr by the runtime. They are read here and
# never reach the behaviour oracle (that runs with the switches unset).
#
# Exit: 0 within bound on every target / 1 bound exceeded (a resource violation)
#       2 unarmed: this compiler prints no counter line (a harness limitation,
#         never a score) / 3 the probe could not run (details on stdout)
set -uo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="/opt/homebrew/bin:$PATH"
ALMIDE="${ALMIDE_RESOURCE_BIN:-almide}"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT

# counter <target> <file> <metric> -> prints the number; returns 2 when no
# counter line was printed, 3 when the program itself failed.
counter() {
  local target="$1" f="$2" metric="$3" out rc line key
  if [ "$target" = wasm ]; then
    out="$(cd "$TMP" && ALMIDE_WASM_ALLOC_COUNT=1 "$ALMIDE" run "$f" --target wasm 2>&1 >/dev/null)"; rc=$?
    line="$(printf '%s\n' "$out" | grep -E '^__ALMD_WASM_ALLOC allocs=' | tail -1)"
    [ "$metric" = peak ] && key=heap_end || key=allocs
  else
    out="$(cd "$TMP" && ALMIDE_ALLOC_COUNT=1 "$ALMIDE" run "$f" 2>&1 >/dev/null)"; rc=$?
    line="$(printf '%s\n' "$out" | grep -E '^__ALMD_ALLOC allocs=' | tail -1)"
    [ "$metric" = peak ] && key=peak || key=allocs
  fi
  if [ "$rc" != 0 ]; then printf '%s\n' "$out" | tail -5 >"$f.err"; return 3; fi
  [ -n "$line" ] || return 2
  printf '%s\n' "$line" | tr ' ' '\n' | sed -nE "s/^$key=([0-9]+)$/\1/p"
}

armed() {
  local f="$TMP/armed.almd"
  printf 'effect fn main() -> Unit = println(int.to_string(list.len(list.range(0, 3))))\n' >"$f"
  local n w
  n="$(counter native "$f" allocs)" || { echo "unarmed: native leg prints no __ALMD_ALLOC line ($("$ALMIDE" --version))"; return 2; }
  w="$(counter wasm "$f" allocs)" || { echo "unarmed: wasm leg prints no __ALMD_WASM_ALLOC line ($("$ALMIDE" --version))"; return 2; }
  echo "armed: $("$ALMIDE" --version) (native allocs=$n, wasm allocs=$w on the arming probe)"
}

if [ "${1:-}" = "--armed" ]; then armed; exit $?; fi
[ $# -eq 2 ] || { echo "usage: $0 <task-dir> <program.almd> | --armed"; exit 3; }
DIR="$1"; PROG="$2"
meta() { grep -E "^[[:space:]]*$1[[:space:]]*=" "$DIR/meta.toml" | head -1 | sed -E 's/^[^=]*=[[:space:]]*//; s/"//g; s/#.*$//; s/[[:space:]]+$//'; }
PROBE="$DIR/$(meta resource_probe)"; METRIC="$(meta resource_metric)"; SCALES="$(meta resource_scales)"
FACTOR="$(meta resource_factor_pct)"; SLACK="$(meta resource_slack)"
# The harness reads the verdict from this stderr tag (process.exec hands it
# stderr only); stdout carries the measurement for a human.
tag() { echo "__RESOURCE_VERDICT $1" >&2; }
trap 'rc=$?; case $rc in 0) tag ok ;; 1) tag violation ;; 2) tag unarmed ;; *) tag probe-failed ;; esac; rm -rf "$TMP"' EXIT
[ -f "$PROBE" ] || { echo "no probe: $PROBE"; exit 3; }
case "$METRIC" in peak|allocs) ;; *) echo "resource_metric='$METRIC' (peak | allocs)"; exit 3 ;; esac
K1="${SCALES%%,*}"; K2="${SCALES##*,}"
[[ "$K1" =~ ^[0-9]+$ && "$K2" =~ ^[0-9]+$ && "$K2" -gt "$K1" ]] || { echo "resource_scales='$SCALES' (two increasing integers, e.g. \"1,8\")"; exit 3; }
[[ "$FACTOR" =~ ^[0-9]+$ && "$SLACK" =~ ^[0-9]+$ ]] || { echo "resource_factor_pct / resource_slack must be integers"; exit 3; }

# measure <program> <target> -> prints growth between the two scales
measure() {
  local prog="$1" target="$2" who="$3" k f v a=""
  for k in "$K1" "$K2"; do
    f="$TMP/$who-$target-$k.almd"
    { command cat "$prog"; printf '\n\n'; sed "s/__K__/$k/g" "$PROBE"; } >"$f"
    v="$(counter "$target" "$f" "$METRIC")"; local rc=$?
    if [ "$rc" = 2 ]; then echo "unarmed ($target)"; return 2; fi
    if [ "$rc" != 0 ]; then echo "probe failed on $who ($target, K=$k): $(tr '\n' ' ' <"$f.err" 2>/dev/null)"; echo "__RESOURCE_FAILED_ON $who" >&2; return 3; fi
    [ -z "$a" ] && a="$v" || { echo $((v - a)); return 0; }
  done
}

verdict=0
for target in native wasm; do
  ref="$(measure "$DIR/solution.almd" "$target" reference)"; rc=$?
  [ "$rc" = 0 ] || { echo "$ref"; exit "$rc"; }
  cand="$(measure "$PROG" "$target" candidate)"; rc=$?
  [ "$rc" = 0 ] || { echo "$cand"; exit "$rc"; }
  [ "$ref" -lt 0 ] && ref=0
  bound=$(( ref * FACTOR / 100 + SLACK ))
  if [ "$cand" -le "$bound" ]; then st=ok; else st=VIOLATION; verdict=1; fi
  echo "resource $target $METRIC growth K=$K1..$K2: candidate=$cand reference=$ref bound=$bound $st"
done
exit "$verdict"
