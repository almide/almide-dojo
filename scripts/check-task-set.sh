#!/usr/bin/env bash
# The cross-language task set is a total decision over the bank: every task
# under tasks/{basic,intermediate,advanced}/ is named exactly once in
# msr/task-set.json, in `include` (with a spec, a reference in every plugin
# language) or in `exclude` (with a reason). A task that is in neither would
# be silently absent from the table.
set -euo pipefail
cd "$(dirname "$0")/.."

fail=0
say() { echo "check-task-set: $*" >&2; fail=1; }

included=$(python3 -c 'import json;print("\n".join(t["task"] for t in json.load(open("msr/task-set.json"))["include"]))')
excluded=$(python3 -c 'import json;print("\n".join(t["task"] for t in json.load(open("msr/task-set.json"))["exclude"]))')
langs=$(ls msr/reference)

for dir in tasks/basic/* tasks/intermediate/* tasks/advanced/*; do
  [ -d "$dir" ] || continue
  name=$(basename "$dir")
  in_inc=$(printf '%s\n' "$included" | grep -cx "$name" || true)
  in_exc=$(printf '%s\n' "$excluded" | grep -cx "$name" || true)
  case "$in_inc$in_exc" in
    10) ;;
    01) ;;
    00) say "$name is in neither include nor exclude of msr/task-set.json" ;;
    *)  say "$name is listed more than once in msr/task-set.json" ;;
  esac
done

for name in $included; do
  [ -f "msr/specs/$name.md" ] || say "$name has no msr/specs/$name.md"
  for lang in $langs; do
    ls "msr/reference/$lang/$name".* >/dev/null 2>&1 || say "$name has no reference under msr/reference/$lang/"
  done
done

for name in $excluded; do
  [ -f "msr/specs/$name.md" ] && say "$name is excluded but has a spec at msr/specs/$name.md"
done

if [ "$fail" = 0 ]; then
  echo "check-task-set: $(printf '%s\n' "$included" | wc -l | tr -d ' ') included, $(printf '%s\n' "$excluded" | wc -l | tr -d ' ') excluded, every bank task decided"
fi
exit $fail
