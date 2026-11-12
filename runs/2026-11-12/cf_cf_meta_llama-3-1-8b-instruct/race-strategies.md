# race-strategies

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let acc = 0
  while n > 0 {
    acc += n
    n -= 1
  }
  acc
}

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
    exact(n)
    heuristic(n)
  }
  match (exact_time, heuristic_time) {
    (Some(exact_time), Some(heuristic_time)) => {
      if exact_time < heuristic_time {
        exact(n)
      } else if exact_time > heuristic_time {
        heuristic(n)
      } else {
        exact(n)
      }
    }
    _ => -1
  }
}
```

**Diagnostic:**

```
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-0.almd:4:10
  in assignment-in-expr
  here: acc += n
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
4 |     acc += n
  |          ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-0.almd:5:8
  in assignment-in-expr
  here: n -= 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
5 |     n -= 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:3 (got Ident 'acc')
  --> /tmp/dojo-race-strategies-0.almd:7:3
  here: acc
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |   acc
  |   ^
error[E027]: fan.race was renamed to fan.min, and the clock argument is required
  --> /tmp/dojo-race-strategies-0.almd:13:38
  in fan.race
  here: let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
  hint: `fan.min(compute.ms(5)) { a(), b() }` picks the branch that spends the LEAST deterministic computation within the budget (ties go to source order); a dynamic list is `fan.min(compute.ms(5), xs, (x) => ok(f(x)))`. The clock says what "least" is measured on. For the first candidate that SUCCEEDS in source order, write `a() ?? b()`.
   |
13 |   let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
   |                                      ^^^
error: if requires 'then', not a brace block
  --> /tmp/dojo-race-strategies-0.almd:19:38
  in if
  here: if exact_time < heuristic_time {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
19 |       if exact_time < heuristic_time {
   |                                      ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-race-strategies-0.almd:21:45
  in if
  here: } else if exact_time > heuristic_time {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
21 |       } else if exact_time > heuristic_time {
   |                                             ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-0.almd:15:15
  in tuple destructure
  here: heuristic(n)
  hint: Destructure only tuples: `let (a, b) = pair`
   |
15 |     heuristic(n)
   |               ^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-0.almd:2:13
  in fn 'exact'
  here: let acc = 0
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let acc = 0
  |             ^

8 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
  parse error: Assignments return Unit and can't appear here
  parse error: Assignments return Unit and can't appear here
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:3 (got Ident 'acc')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let acc = 0
  let i = 0
  while i < n {
    acc += i
    i += 1
  }
  acc
}

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, heuristic_time) = fan.min(compute.ms(1)) {
    exact(n)
    heuristic(n)
  }
  match (exact_time, heuristic_time) {
    (Some(exact_time), Some(heuristic_time)) => {
      if exact_time < heuristic_time then exact(n) else heuristic(n)
    }
    _ => -1
  }
}
```

**Diagnostic:**

```
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-1.almd:5:10
  in assignment-in-expr
  here: acc += i
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
5 |     acc += i
  |          ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-1.almd:6:8
  in assignment-in-expr
  here: i += 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
6 |     i += 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:3 (got Ident 'acc')
  --> /tmp/dojo-race-strategies-1.almd:8:3
  here: acc
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   acc
  |   ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-1.almd:16:15
  in tuple destructure
  here: heuristic(n)
  hint: Destructure only tuples: `let (a, b) = pair`
   |
16 |     heuristic(n)
   |               ^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-1.almd:3:11
  in fn 'exact'
  here: let i = 0
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
3 |   let i = 0
  |           ^

5 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
  parse error: Assignments return Unit and can't appear here
  parse error: Assignments return Unit and can't appear here
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:3 (got Ident 'acc')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let acc = 0
  let i = 0
  while i < n {
    acc = acc + i
    i = i + 1
  }
  acc
}

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, heuristic_time) = fan.min(compute.ms(1)) {
    let _ = exact(n)
    let _ = heuristic(n)
  }
  match (exact_time, heuristic_time) {
    (Some(exact_time), Some(heuristic_time)) => {
      if exact_time < heuristic_time then exact(n) else heuristic(n)
    }
    _ => -1
  }
}
```

**Diagnostic:**

```
error: `let` is not allowed inside fan.min at line 15:5
  --> /tmp/dojo-race-strategies-2.almd:15:5
  here: let _ = exact(n)
  hint: arms are expressions — wrap statements in a block arm: { let x = f(); g(x) }
   |
15 |     let _ = exact(n)
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 18:3 (got Match 'match')
  --> /tmp/dojo-race-strategies-2.almd:18:3
  here: match (exact_time, heuristic_time) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |   match (exact_time, heuristic_time) {
   |   ^
error[E009]: cannot reassign immutable binding 'acc'
  --> /tmp/dojo-race-strategies-2.almd:5:17
  in acc = ...
  here: acc = acc + i
  hint: Use 'var acc = ...' instead of 'let acc = ...' to declare a mutable variable
  try:
      // let acc = ...  →  var acc = ...
      var acc = <initial value>
  |
2 |   let acc = 0
  |   ------------------- 'acc' declared here
...
5 |     acc = acc + i
  |                 ^
error[E009]: cannot reassign immutable binding 'i'
  --> /tmp/dojo-race-strategies-2.almd:6:13
  in i = ...
  here: i = i + 1
  hint: Use 'var i = ...' instead of 'let i = ...' to declare a mutable variable
  try:
      // let i = ...  →  var i = ...
      var i = <initial value>
  |
3 |   let i = 0
  |   ----------------- 'i' declared here
...
6 |     i = i + 1
  |             ^
error[E001]: type mismatch in fn 'best_effort': expected Int but got Unit
  --> /tmp/dojo-race-strategies-2.almd:16:23
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
16 |     let _ = heuristic(n)
   |                       ^

5 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
  parse error: `let` is not allowed inside fan.min at line 15:5
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 18:3 (got Match 'match')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var acc = 0
  var i = 0
  while i < n {
    acc = acc + i
    i = i + 1
  }
  acc
}

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, heuristic_time) = fan.min(compute.ms(1)) {
    exact(n)
    heuristic(n)
  }
  match (exact_time, heuristic_time) {
    (Some(exact_time), Some(heuristic_time)) => {
      if exact_time < heuristic_time then exact(n) else heuristic(n)
    }
    _ => -1
  }
}
```

**Diagnostic:**

```
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-3.almd:16:15
  in tuple destructure
  here: heuristic(n)
  hint: Destructure only tuples: `let (a, b) = pair`
   |
16 |     heuristic(n)
   |               ^

1 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
