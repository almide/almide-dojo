# bounded-total

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn safe_total(xs: List[Int]) -> Int = {
  fn sum(xs: List[Int]) -> Int = {
    match xs {
      some(x :: xs) => x + sum(xs)
      none => 0
    }
  }
  fan.bounded(compute.ms(100)) {
    sum(xs)
  } ?? -1
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-0.almd:2:3
  in nested fn
  here: fn sum(xs: List[Int]) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn sum(xs: List[Int]) -> Int = {
  |   ^^
error: Expected RParen at line 4:14 (got Colon ':')
  --> /tmp/dojo-bounded-total-0.almd:4:14
  here: some(x :: xs) => x + sum(xs)
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
  |
4 |       some(x :: xs) => x + sum(xs)
  |              ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:3 (got Fan 'fan')
  --> /tmp/dojo-bounded-total-0.almd:8:3
  here: fan.bounded(compute.ms(100)) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   fan.bounded(compute.ms(100)) {
  |   ^
error[E001]: type mismatch in fn 'safe_total': expected Int but got Unit
  --> /tmp/dojo-bounded-total-0.almd:1:39
  in fn 'safe_total'
  here: fn safe_total(xs: List[Int]) -> Int = {
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
1 | fn safe_total(xs: List[Int]) -> Int = {
  |                                       ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?0]
  --> /tmp/dojo-bounded-total-0.almd:15:19
  in call to assert_eq()
  here: assert_eq(r, ok(6))
  hint: Fix the expression type or change the expected type
   |
15 |   assert_eq(r, ok(6))
   |                   ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?2]
  --> /tmp/dojo-bounded-total-0.almd:19:19
  in call to assert_eq()
  here: assert_eq(r, ok(0))
  hint: Fix the expression type or change the expected type
   |
19 |   assert_eq(r, ok(0))
   |                   ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?3]
  --> /tmp/dojo-bounded-total-0.almd:23:19
  in call to assert_eq()
  here: assert_eq(r, ok(0))
  hint: Fix the expression type or change the expected type
   |
23 |   assert_eq(r, ok(0))
   |                   ^

7 error(s) found
FAILED: /tmp/dojo-bounded-total-0.almd
  parse error: `fn` cannot be declared inside a function body
  parse error: Expected RParen at line 4:14 (got Colon ':')
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:3 (got Fan 'fan')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-bounded-total-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn safe_total(xs: List[Int]) -> Int = {
  fn sum(xs: List[Int]) -> Int = {
    match xs {
      some(x :: xs) => x + sum(xs)
      none => 0
    }
  }
  let r = fan.bounded(compute.ms(100)) {
    sum(xs)
  }
  match r {
    some(x) => x
    none => -1
  }
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-1.almd:2:3
  in nested fn
  here: fn sum(xs: List[Int]) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn sum(xs: List[Int]) -> Int = {
  |   ^^
error: Expected RParen at line 4:14 (got Colon ':')
  --> /tmp/dojo-bounded-total-1.almd:4:14
  here: some(x :: xs) => x + sum(xs)
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
  |
4 |       some(x :: xs) => x + sum(xs)
  |              ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 11:3 (got Match 'match')
  --> /tmp/dojo-bounded-total-1.almd:11:3
  here: match r {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |   match r {
   |   ^
error[E007]: fan.bounded can only be used inside an effect fn
  --> /tmp/dojo-bounded-total-1.almd:8:11
  in fan.bounded
  here: let r = fan.bounded(compute.ms(100)) {
  hint: Mark the enclosing function as `effect fn`
  |
8 |   let r = fan.bounded(compute.ms(100)) {
  |           ^^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-bounded-total-1.almd:9:9
  in variable xs
  here: sum(xs)
  hint: Did you mean `r`?
  try:
      r
  |
9 |     sum(xs)
  |         ^^
error[E001]: type mismatch in fn 'safe_total': expected Int but got Unit
  --> /tmp/dojo-bounded-total-1.almd:1:39
  in fn 'safe_total'
  here: fn safe_total(xs: List[Int]) -> Int = {
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
1 | fn safe_total(xs: List[Int]) -> Int = {
  |                                       ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?0]
  --> /tmp/dojo-bounded-total-1.almd:19:19
  in call to assert_eq()
  here: assert_eq(r, ok(6))
  hint: Fix the expression type or change the expected type
   |
19 |   assert_eq(r, ok(6))
   |                   ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?2]
  --> /tmp/dojo-bounded-total-1.almd:23:19
  in call to assert_eq()
  here: assert_eq(r, ok(0))
  hint: Fix the expression type or change the expected type
   |
23 |   assert_eq(r, ok(0))
   |                   ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?3]
  --> /tmp/dojo-bounded-total-1.almd:27:19
  in call to assert_eq()
  here: assert_eq(r, ok(0))
  hint: Fix the expression type or change the expected type
   |
27 |   assert_eq(r, ok(0))
   |                   ^

9 error(s) found
FAILED: /tmp/dojo-bounded-total-1.almd
  parse error: `fn` cannot be declared inside a function body
  parse error: Expected RParen at line 4:14 (got Colon ':')
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 11:3 (got Match 'match')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-bounded-total-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = {
  fn sum(xs: List[Int]) -> Int = {
    match xs {
      some(x :: xs) => x + sum(xs)
      none => 0
    }
  }
  let r = fan.bounded(compute.ms(100)) {
    sum(xs)
  } ?? -1
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-2.almd:2:3
  in nested fn
  here: fn sum(xs: List[Int]) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn sum(xs: List[Int]) -> Int = {
  |   ^^
error: Expected RParen at line 4:14 (got Colon ':')
  --> /tmp/dojo-bounded-total-2.almd:4:14
  here: some(x :: xs) => x + sum(xs)
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
  |
4 |       some(x :: xs) => x + sum(xs)
  |              ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 11:1 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:11:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 | }
   | ^
error[E007]: fan.bounded can only be used inside an effect fn
  --> /tmp/dojo-bounded-total-2.almd:8:11
  in fan.bounded
  here: let r = fan.bounded(compute.ms(100)) {
  hint: Mark the enclosing function as `effect fn`
  |
8 |   let r = fan.bounded(compute.ms(100)) {
  |           ^^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-bounded-total-2.almd:9:9
  in variable xs
  here: sum(xs)
  hint: Did you mean `r`?
  try:
      r
  |
9 |     sum(xs)
  |         ^^
error[E001]: type mismatch in fn 'safe_total': expected Int but got Unit
  --> /tmp/dojo-bounded-total-2.almd:1:46
  in fn 'safe_total'
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
1 | effect fn safe_total(xs: List[Int]) -> Int = {
  |                                              ^

6 error(s) found
FAILED: /tmp/dojo-bounded-total-2.almd
  parse error: `fn` cannot be declared inside a function body
  parse error: Expected RParen at line 4:14 (got Colon ':')
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 11:1 (got RBrace '}')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-bounded-total-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = {
  fn sum(xs: List[Int]) -> Int = {
    match xs {
      some(x :: xs) => x + sum(xs)
      none => 0
    }
  }
  effect fn bounded_sum(xs: List[Int]) -> Int = {
    fan.bounded(compute.ms(100)) {
      sum(xs)
    } ?? -1
  }
  bounded_sum(xs)
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-3.almd:2:3
  in nested fn
  here: fn sum(xs: List[Int]) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn sum(xs: List[Int]) -> Int = {
  |   ^^
error: Expected RParen at line 4:14 (got Colon ':')
  --> /tmp/dojo-bounded-total-3.almd:4:14
  here: some(x :: xs) => x + sum(xs)
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
  |
4 |       some(x :: xs) => x + sum(xs)
  |              ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 13:3 (got Ident 'bounded_sum')
  --> /tmp/dojo-bounded-total-3.almd:13:3
  here: bounded_sum(xs)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |   bounded_sum(xs)
   |   ^
error[E001]: type mismatch in fn 'safe_total': expected Int but got Unit
  --> /tmp/dojo-bounded-total-3.almd:1:46
  in fn 'safe_total'
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
1 | effect fn safe_total(xs: List[Int]) -> Int = {
  |                                              ^

4 error(s) found
FAILED: /tmp/dojo-bounded-total-3.almd
  parse error: `fn` cannot be declared inside a function body
  parse error: Expected RParen at line 4:14 (got Colon ':')
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 13:3 (got Ident 'bounded_sum')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-bounded-total-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
