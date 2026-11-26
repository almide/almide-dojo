# race-strategies

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let sum = 0
  while n > 0 {
    sum += n
    n -= 1
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  }
  match (exact_time, heuristic_time) {
    | (Some(t), Some(h)) if t < h => exact(n)
    | (Some(t), Some(h)) if h < t => heuristic(n)
    | _ => -1
  }
}
```

**Diagnostic:**

```
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-0.almd:4:10
  in assignment-in-expr
  here: sum += n
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
4 |     sum += n
  |          ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-0.almd:5:8
  in assignment-in-expr
  here: n -= 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
5 |     n -= 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:3 (got Ident 'sum')
  --> /tmp/dojo-race-strategies-0.almd:7:3
  here: sum
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |   sum
  |   ^
error[E027]: fan.race was renamed to fan.min, and the clock argument is required
  --> /tmp/dojo-race-strategies-0.almd:15:38
  in fan.race
  here: let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
  hint: `fan.min(compute.ms(5)) { a(), b() }` picks the branch that spends the LEAST deterministic computation within the budget (ties go to source order); a dynamic list is `fan.min(compute.ms(5), xs, (x) => ok(f(x)))`. The clock says what "least" is measured on. For the first candidate that SUCCEEDS in source order, write `a() ?? b()`.
   |
15 |   let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
   |                                      ^^^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 19:3 (got Match 'match')
  --> /tmp/dojo-race-strategies-0.almd:19:3
  here: match (exact_time, heuristic_time) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 |   match (exact_time, heuristic_time) {
   |   ^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-0.almd:2:13
  in fn 'exact'
  here: let sum = 0
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let sum = 0
  |             ^

6 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
  parse error: Assignments return Unit and can't appear here
  parse error: Assignments return Unit and can't appear here
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:3 (got Ident 'sum')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let sum = 0
  let r = while n > 0 {
    sum = sum + n
    n = n - 1
  }
  r
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, heuristic_time) = fan.min(compute.ms(1)) {
    exact(n);
    heuristic(n)
  }
  match (exact_time, heuristic_time) {
    | (Some(t), Some(h)) if t < h => exact(n)
    | (Some(t), Some(h)) if h < t => heuristic(n)
    | _ => -1
  }
}
```

**Diagnostic:**

```
error: fan.min arms are separated by `,` or a newline, not `;`, at line 16:13
  --> /tmp/dojo-race-strategies-1.almd:16:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
16 |     exact(n);
   |             ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 19:3 (got Match 'match')
  --> /tmp/dojo-race-strategies-1.almd:19:3
  here: match (exact_time, heuristic_time) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 |   match (exact_time, heuristic_time) {
   |   ^
error[E009]: cannot reassign immutable binding 'sum'
  --> /tmp/dojo-race-strategies-1.almd:4:17
  in sum = ...
  here: sum = sum + n
  hint: Use 'var sum = ...' instead of 'let sum = ...' to declare a mutable variable
  try:
      // let sum = ...  →  var sum = ...
      var sum = <initial value>
  |
2 |   let sum = 0
  |   ------------------- 'sum' declared here
...
4 |     sum = sum + n
  |                 ^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-race-strategies-1.almd:5:13
  in n = ...
  here: n = n - 1
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
  |
5 |     n = n - 1
  |             ^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-1.almd:7:3
  in fn 'exact'
  here: r
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
7 |   r
  |   ^

5 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
  parse error: fan.min arms are separated by `,` or a newline, not `;`, at line 16:13
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 19:3 (got Match 'match')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0
  var n_ = n
  while n_ > 0 {
    sum = sum + n_
    n_ = n_ - 1
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, heuristic_time) = fan.min(compute.ms(1)) {
    exact(n);
    heuristic(n)
  }
  match (exact_time, heuristic_time) {
    | (Some(t), Some(h)) if t < h => exact(n)
    | (Some(t), Some(h)) if h < t => heuristic(n)
    | _ => -1
  }
}
```

**Diagnostic:**

```
error: fan.min arms are separated by `,` or a newline, not `;`, at line 17:13
  --> /tmp/dojo-race-strategies-2.almd:17:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
17 |     exact(n);
   |             ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 20:3 (got Match 'match')
  --> /tmp/dojo-race-strategies-2.almd:20:3
  here: match (exact_time, heuristic_time) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |   match (exact_time, heuristic_time) {
   |   ^

2 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
  parse error: fan.min arms are separated by `,` or a newline, not `;`, at line 17:13
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 20:3 (got Match 'match')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0
  var n_ = n
  while n_ > 0 {
    sum = sum + n_
    n_ = n_ - 1
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  }
  match (exact_time, heuristic_time) {
    | (Some(t), Some(h)) if t < h => exact(n)
    | (Some(t), Some(h)) if h < t => heuristic(n)
    | _ => -1
  }
}
```

**Diagnostic:**

```
error[E027]: fan.race was renamed to fan.min, and the clock argument is required
  --> /tmp/dojo-race-strategies-3.almd:16:38
  in fan.race
  here: let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
  hint: `fan.min(compute.ms(5)) { a(), b() }` picks the branch that spends the LEAST deterministic computation within the budget (ties go to source order); a dynamic list is `fan.min(compute.ms(5), xs, (x) => ok(f(x)))`. The clock says what "least" is measured on. For the first candidate that SUCCEEDS in source order, write `a() ?? b()`.
   |
16 |   let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
   |                                      ^^^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 20:3 (got Match 'match')
  --> /tmp/dojo-race-strategies-3.almd:20:3
  here: match (exact_time, heuristic_time) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |   match (exact_time, heuristic_time) {
   |   ^

2 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
  parse error: fan.race was renamed to fan.min, and the clock argument is required
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 20:3 (got Match 'match')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
