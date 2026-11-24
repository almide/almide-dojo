# budget-units

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E034`

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  var result = fan.bounded(count_to(n), budget) {
    count_to(n)
  }
  match result {
    some(x) => x
    none => -1
  }
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
error: fan.bounded takes a BLOCK, not a thunk argument, at line 3:39
  --> /tmp/dojo-budget-units-0.almd:3:39
  here: var result = fan.bounded(count_to(n), budget) {
  hint: fan.bounded(compute.ms(100)) { work(x) } — drop the `() =>` wrapper; the braces are the region
  |
3 |   var result = fan.bounded(count_to(n), budget) {
  |                                       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 6:3 (got Match 'match')
  --> /tmp/dojo-budget-units-0.almd:6:3
  here: match result {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
6 |   match result {
  |   ^

2 error(s) found
FAILED: /tmp/dojo-budget-units-0.almd
  parse error: fan.bounded takes a BLOCK, not a thunk argument, at line 3:39
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 6:3 (got Match 'match')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-budget-units-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  fan.bounded(budget) {
    count_to(n)
  }
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
error[E041]: implicit propagation of this fn's tail value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-budget-units-1.almd:3:3
  in implicit propagation
  here: fan.bounded(budget) {
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
  |
3 |   fan.bounded(budget) {
  |   ^^^

1 error(s) found
FAILED: /tmp/dojo-budget-units-1.almd
Compile error for /tmp/dojo-budget-units-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  fan.bounded(budget) {
    match count_to(n) {
      ok(x) => x,
      err(_) => -1
    }
  }
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
error: pattern `ok(..)` cannot match Int — the subject is not a Result
  --> /tmp/dojo-budget-units-2.almd:4:20
  in match pattern
  here: match count_to(n) {
  hint: the value is already a plain Int. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
4 |     match count_to(n) {
  |                    ^
error: pattern `err(..)` cannot match Int — the subject is not a Result
  --> /tmp/dojo-budget-units-2.almd:5:16
  in match pattern
  here: ok(x) => x,
  hint: the value is already a plain Int. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
5 |       ok(x) => x,
  |                ^
error[E041]: implicit propagation of this fn's tail value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-budget-units-2.almd:3:3
  in implicit propagation
  here: fan.bounded(budget) {
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
  |
3 |   fan.bounded(budget) {
  |   ^^^

3 error(s) found
FAILED: /tmp/dojo-budget-units-2.almd
Compile error for /tmp/dojo-budget-units-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  fan.bounded(budget) {
    count_to(n) ?? -1
  }
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
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-budget-units-3.almd:4:21
  in operator ??
  here: count_to(n) ?? -1
  hint: Use '??' only on Option[T] or Result[T, E] values
  |
4 |     count_to(n) ?? -1
  |                     ^
error[E041]: implicit propagation of this fn's tail value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-budget-units-3.almd:3:3
  in implicit propagation
  here: fan.bounded(budget) {
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
  |
3 |   fan.bounded(budget) {
  |   ^^^

2 error(s) found
FAILED: /tmp/dojo-budget-units-3.almd
Compile error for /tmp/dojo-budget-units-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
