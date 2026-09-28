# bounded-total

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = {
  fn sum(xs: List[Int], i: Int) -> Int = {
    if list.is_empty(xs) then 0
    else xs.get(i).unwrap_or(0) + sum(xs, i + 1)
  }
  fan.bounded(compute.ms(100)) {
    sum(xs, 0)
  } ?? -1
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-0.almd:2:3
  in nested fn
  here: fn sum(xs: List[Int], i: Int) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn sum(xs: List[Int], i: Int) -> Int = {
  |   ^^

1 error(s) found
FAILED: /tmp/dojo-bounded-total-0.almd
Compile error for /tmp/dojo-bounded-total-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = {
  fn sum(xs: List[Int], i: Int) -> Int = {
    if list.is_empty(xs) then 0
    else xs.get(i).unwrap_or(0) + sum(xs, i + 1)
  }
  fan.bounded(compute.ms(100)) {
    sum(xs, 0)
  } ?? -1
}

// Move the sum function to the top level
fn sum(xs: List[Int], i: Int) -> Int = {
  if list.is_empty(xs) then 0
  else xs.get(i).unwrap_or(0) + sum(xs, i + 1)
}

effect fn safe_total(xs: List[Int]) -> Int = {
  fan.bounded(compute.ms(100)) {
    sum(xs, 0)
  } ?? -1
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-1.almd:2:3
  in nested fn
  here: fn sum(xs: List[Int], i: Int) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn sum(xs: List[Int], i: Int) -> Int = {
  |   ^^
error[E012]: duplicate function 'safe_total'
  at line 17
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ------------------------------------- first definition of 'safe_total' here
...
17 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ^

2 error(s) found
FAILED: /tmp/dojo-bounded-total-1.almd
Compile error for /tmp/dojo-bounded-total-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn sum(xs: List[Int], i: Int) -> Int = {
  if list.is_empty(xs) then 0
  else xs.get(i).unwrap_or(0) + sum(xs, i + 1)
}

effect fn safe_total(xs: List[Int]) -> Int = {
  fan.bounded(compute.ms(100)) {
    sum(xs, 0)
  } ?? -1
```

**Diagnostic:**

```
error: Expected expression at line 11:1 (got Test 'test')
  --> /tmp/dojo-bounded-total-2.almd:11:1
  here: test "bounded total small" {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 | test "bounded total small" {
   | ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?0]
  --> /tmp/dojo-bounded-total-2.almd:13:19
  in call to assert_eq()
  here: assert_eq(r, ok(6))
  hint: Fix the expression type or change the expected type
   |
13 |   assert_eq(r, ok(6))
   |                   ^
error[E025]: cannot infer a concrete type for this expression (type Result[Int, ?0])
  --> /tmp/dojo-bounded-total-2.almd:13:16
  in this expression with an unconstrained type
  here: assert_eq(r, ok(6))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Result[Int, String] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
13 |   assert_eq(r, ok(6))
   |                ^^
error[E041]: implicit propagation of this binding's value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-bounded-total-2.almd:12:11
  in implicit propagation
  here: let r = safe_total([1, 2, 3])
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
  try:
      !
   |
12 |   let r = safe_total([1, 2, 3])
   |           ^^^^^^^^^^^^^^^^^^^^^

4 error(s) found
FAILED: /tmp/dojo-bounded-total-2.almd
Compile error for /tmp/dojo-bounded-total-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = {
  fn sum(xs: List[Int], i: Int) -> Int = {
    if list.is_empty(xs) then 0
    else xs.get(i).unwrap_or(0) + sum(xs, i + 1)
  }
  fan.bounded(compute.ms(100)) {
    sum(xs, 0)
  } ?? -1
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-3.almd:2:3
  in nested fn
  here: fn sum(xs: List[Int], i: Int) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn sum(xs: List[Int], i: Int) -> Int = {
  |   ^^

1 error(s) found
FAILED: /tmp/dojo-bounded-total-3.almd
Compile error for /tmp/dojo-bounded-total-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
