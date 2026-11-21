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
  let mut sum = 0
  while n > 0 {
    sum += n
    n -= 1
  }
  sum
}

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
    exact(n)
    heuristic(n)
  }
  match (exact_time, heuristic_time) {
    (Some(t), Some(h)) => if t < h then exact(n) else heuristic(n)
    (Some(t), _) => -1
    (_, Some(h)) => heuristic(n)
    _ => -1
  }
}
```

**Diagnostic:**

```
error: 'let mut' is not valid in Almide
  --> /tmp/dojo-race-strategies-0.almd:2:7
  in let mut
  here: let mut sum = 0
  hint: Use 'var' for mutable variables. Example: var x = 0
  try:
      var x = 0
  |
2 |   let mut sum = 0
  |       ^^^
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
  --> /tmp/dojo-race-strategies-0.almd:13:38
  in fan.race
  here: let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
  hint: `fan.min(compute.ms(5)) { a(), b() }` picks the branch that spends the LEAST deterministic computation within the budget (ties go to source order); a dynamic list is `fan.min(compute.ms(5), xs, (x) => ok(f(x)))`. The clock says what "least" is measured on. For the first candidate that SUCCEEDS in source order, write `a() ?? b()`.
   |
13 |   let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
   |                                      ^^^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-0.almd:15:15
  in tuple destructure
  here: heuristic(n)
  hint: Destructure only tuples: `let (a, b) = pair`
   |
15 |     heuristic(n)
   |               ^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-0.almd:2:17
  in fn 'exact'
  here: let mut sum = 0
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let mut sum = 0
  |                 ^

7 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
  parse error: 'let mut' is not valid in Almide
  parse error: Assignments return Unit and can't appear here
  parse error: Assignments return Unit and can't appear here
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0
  while n > 0 {
    let r = n
    let r = sum + r
    sum = r
    n -= 1
  }
  sum
}

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, heuristic_time) = fan.min(compute.ms(1)) {
    exact(n)
    heuristic(n)
  }
  match (exact_time, heuristic_time) {
    (Some(t), Some(h)) => if t < h then exact(n) else heuristic(n)
    (Some(t), _) => -1
    (_, Some(h)) => heuristic(n)
    _ => -1
  }
}
```

**Diagnostic:**

```
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-1.almd:7:8
  in assignment-in-expr
  here: n -= 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |     n -= 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:3 (got Ident 'sum')
  --> /tmp/dojo-race-strategies-1.almd:9:3
  here: sum
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |   sum
  |   ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-1.almd:17:15
  in tuple destructure
  here: heuristic(n)
  hint: Destructure only tuples: `let (a, b) = pair`
   |
17 |     heuristic(n)
   |               ^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-1.almd:2:13
  in fn 'exact'
  here: var sum = 0
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   var sum = 0
  |             ^

4 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
  parse error: Assignments return Unit and can't appear here
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:3 (got Ident 'sum')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let sum = 0
  while n > 0 {
    let r = n
    let r = sum + r
    sum = r
    n -= 1
  }
  sum
}

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, heuristic_time) = fan.min(compute.ms(1)) {
    let _ = exact(n)
    let _ = heuristic(n)
  }
  match (exact_time, heuristic_time) {
    (Some(t), Some(h)) => if t < h then exact(n) else heuristic(n)
    (Some(t), _) => -1
    (_, Some(h)) => heuristic(n)
    _ => -1
  }
}
```

**Diagnostic:**

```
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-2.almd:7:8
  in assignment-in-expr
  here: n -= 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |     n -= 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:3 (got Ident 'sum')
  --> /tmp/dojo-race-strategies-2.almd:9:3
  here: sum
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |   sum
  |   ^
error: `let` is not allowed inside fan.min at line 16:5
  --> /tmp/dojo-race-strategies-2.almd:16:5
  here: let _ = exact(n)
  hint: arms are expressions — wrap statements in a block arm: { let x = f(); g(x) }
   |
16 |     let _ = exact(n)
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 19:3 (got Match 'match')
  --> /tmp/dojo-race-strategies-2.almd:19:3
  here: match (exact_time, heuristic_time) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 |   match (exact_time, heuristic_time) {
   |   ^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-2.almd:2:13
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
error[E001]: type mismatch in fn 'best_effort': expected Int but got Unit
  --> /tmp/dojo-race-strategies-2.almd:17:23
  in fn 'best_effort'
  here: let _ = heuristic(n)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
17 |     let _ = heuristic(n)
   |                       ^

6 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
  parse error: Assignments return Unit and can't appear here
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:3 (got Ident 'sum')
  parse error: `let` is not allowed inside fan.min at line 16:5
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let sum = 0
  while n > 0 {
    let r = n
    let r = sum + r
    sum = r
    n -= 1
  }
  sum
}

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, heuristic_time) = fan.min(compute.ms(1)) {
    let exact_result = exact(n)
    let _ = exact_result
    let heuristic_result = heuristic(n)
    let _ = heuristic_result
  }
  match (exact_time, heuristic_time) {
    (Some(t), Some(h)) => if t < h then exact(n) else heuristic(n)
    (Some(t), _) => -1
    (_, Some(h)) => heuristic(n)
    _ => -1
  }
}
```

**Diagnostic:**

```
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-3.almd:7:8
  in assignment-in-expr
  here: n -= 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |     n -= 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:3 (got Ident 'sum')
  --> /tmp/dojo-race-strategies-3.almd:9:3
  here: sum
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |   sum
  |   ^
error: `let` is not allowed inside fan.min at line 16:5
  --> /tmp/dojo-race-strategies-3.almd:16:5
  here: let exact_result = exact(n)
  hint: arms are expressions — wrap statements in a block arm: { let x = f(); g(x) }
   |
16 |     let exact_result = exact(n)
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 21:3 (got Match 'match')
  --> /tmp/dojo-race-strategies-3.almd:21:3
  here: match (exact_time, heuristic_time) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   match (exact_time, heuristic_time) {
   |   ^
error[E003]: undefined variable 'exact_result'
  --> /tmp/dojo-race-strategies-3.almd:17:13
  in variable exact_result
  here: let _ = exact_result
  hint: Check the variable name
   |
17 |     let _ = exact_result
   |             ^^^^^^^^^^^^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-3.almd:2:13
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
error[E001]: type mismatch in fn 'best_effort': expected Int but got Unit
  --> /tmp/dojo-race-strategies-3.almd:19:13
  in fn 'best_effort'
  here: let _ = heuristic_result
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
19 |     let _ = heuristic_result
   |             ^^^^^^^^^^^^^^^^

7 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
  parse error: Assignments return Unit and can't appear here
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:3 (got Ident 'sum')
  parse error: `let` is not allowed inside fan.min at line 16:5
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
