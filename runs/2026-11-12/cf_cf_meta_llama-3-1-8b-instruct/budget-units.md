# budget-units

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  var result = fan.bounded(count_to(n), budget) {
    count_to(n)
  }
  result ?? -1
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
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 6:3 (got Ident 'result')
  --> /tmp/dojo-budget-units-0.almd:6:3
  here: result ?? -1
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
6 |   result ?? -1
  |   ^

2 error(s) found
FAILED: /tmp/dojo-budget-units-0.almd
  parse error: fan.bounded takes a BLOCK, not a thunk argument, at line 3:39
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 6:3 (got Ident 'result')
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
    var result = count_to(n)
    result ?? -1
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
  --> /tmp/dojo-budget-units-1.almd:5:16
  in operator ??
  here: result ?? -1
  hint: Use '??' only on Option[T] or Result[T, E] values
  |
5 |     result ?? -1
  |                ^
error[E041]: implicit propagation of this fn's tail value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-budget-units-1.almd:3:3
  in implicit propagation
  here: fan.bounded(budget) {
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
  |
3 |   fan.bounded(budget) {
  |   ^^^

2 error(s) found
FAILED: /tmp/dojo-budget-units-1.almd
Compile error for /tmp/dojo-budget-units-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  match fan.bounded(budget) {
    | ok(result) => result
    | err(_) => -1
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
error: Expected expression at line 4:5 (got Pipe '|')
  --> /tmp/dojo-budget-units-2.almd:4:5
  here: | ok(result) => result
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |     | ok(result) => result
  |     ^
error[E001]: type mismatch in fn 'run_with_budget': expected Int but got Unit
  --> /tmp/dojo-budget-units-2.almd:2:44
  in fn 'run_with_budget'
  here: var budget = compute.ms(ms) + compute.us(us)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   var budget = compute.ms(ms) + compute.us(us)
  |                                            ^^

2 error(s) found
FAILED: /tmp/dojo-budget-units-2.almd
  parse error: Expected expression at line 4:5 (got Pipe '|')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-budget-units-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  match fan.bounded(budget) {
    | ok(result) => result
    | err(_) => -1
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
error: Expected expression at line 4:5 (got Pipe '|')
  --> /tmp/dojo-budget-units-3.almd:4:5
  here: | ok(result) => result
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |     | ok(result) => result
  |     ^
error[E001]: type mismatch in fn 'run_with_budget': expected Int but got Unit
  --> /tmp/dojo-budget-units-3.almd:2:44
  in fn 'run_with_budget'
  here: var budget = compute.ms(ms) + compute.us(us)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   var budget = compute.ms(ms) + compute.us(us)
  |                                            ^^

2 error(s) found
FAILED: /tmp/dojo-budget-units-3.almd
  parse error: Expected expression at line 4:5 (got Pipe '|')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-budget-units-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
