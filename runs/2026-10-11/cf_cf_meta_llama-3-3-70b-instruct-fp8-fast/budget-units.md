# budget-units

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E034`

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = 
  let budget = compute.ms(ms) + compute.us(us)
  let result = fan.bounded(budget, count_to(n))
  match result {
    some(x) => x
    none => -1
  }

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
error: fan.bounded takes a BLOCK, not a thunk argument, at line 3:34
  --> /tmp/dojo-budget-units-0.almd:3:34
  here: let result = fan.bounded(budget, count_to(n))
  hint: fan.bounded(compute.ms(100)) { work(x) } — drop the `() =>` wrapper; the braces are the region
  |
3 |   let result = fan.bounded(budget, count_to(n))
  |                                  ^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-budget-units-0.almd:4:9
  in variable result
  here: match result {
  hint: Did you mean `result.zip`?
  try:
      result.zip
  |
4 |   match result {
  |         ^^^^^^

2 error(s) found
FAILED: /tmp/dojo-budget-units-0.almd
Compile error for /tmp/dojo-budget-units-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = 
  let budget = compute.ms(ms) + compute.us(us)
  let result = fan.bounded(budget) {
    count_to(n)
  }
  match result {
    some(x) => x
    none => -1
  }

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
error: pattern `some(..)` cannot match Int — the subject is not an Option
  --> /tmp/dojo-budget-units-1.almd:6:9
  in match pattern
  here: match result {
  hint: the value is already a plain Int. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
6 |   match result {
  |         ^^^^^^
error: pattern `none` cannot match Int — the subject is not an Option
  --> /tmp/dojo-budget-units-1.almd:7:16
  in match pattern
  here: some(x) => x
  hint: the value is already a plain Int. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
7 |     some(x) => x
  |                ^
error[E041]: implicit propagation of this binding's value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-budget-units-1.almd:3:16
  in implicit propagation
  here: let result = fan.bounded(budget) {
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
  |
3 |   let result = fan.bounded(budget) {
  |                ^^^

3 error(s) found
FAILED: /tmp/dojo-budget-units-1.almd
Compile error for /tmp/dojo-budget-units-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = 
  let budget = compute.ms(ms) + compute.us(us)
  let result = fan.bounded(budget) { count_to(n) } ?? -1
  result

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
FAILED: /tmp/dojo-budget-units-2.almd
Compile error for /tmp/dojo-budget-units-2.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = 
  let budget = compute.ms(ms) + compute.us(us)
  let result = fan.bounded(budget) { count_to(n) } 
  if result == none then -1 else option.unwrap_or(result, -1)

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
error: cannot compare Int with none — only Option types support none comparison
  --> /tmp/dojo-budget-units-3.almd:4:16
  in comparison with none
  here: if result == none then -1
  hint: Use Option type or check with is_ok()/is_err() for Result
  |
4 |   if result == none then -1
  |                ^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-budget-units-3.almd:5:19
  in operator ??
  here: else result ?? -1
  hint: Use '??' only on Option[T] or Result[T, E] values
  |
5 |   else result ?? -1
  |                   ^
error[E041]: implicit propagation of this binding's value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-budget-units-3.almd:3:16
  in implicit propagation
  here: let result = fan.bounded(budget) { count_to(n) }
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
  |
3 |   let result = fan.bounded(budget) { count_to(n) }
  |                ^^^

3 error(s) found
FAILED: /tmp/dojo-budget-units-3.almd
Compile error for /tmp/dojo-budget-units-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
