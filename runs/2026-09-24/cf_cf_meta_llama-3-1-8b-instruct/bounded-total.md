# bounded-total

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E012`

## Attempts

### Attempt 1 (FAIL)

```almide
fn safe_total(xs: List[Int]) -> Int = {
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
error[E007]: fan.bounded can only be used inside an effect fn
  --> /tmp/dojo-bounded-total-0.almd:6:3
  in fan.bounded
  here: fan.bounded(compute.ms(100)) {
  hint: Mark the enclosing function as `effect fn`
  |
6 |   fan.bounded(compute.ms(100)) {
  |   ^^^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?0]
  --> /tmp/dojo-bounded-total-0.almd:13:19
  in call to assert_eq()
  here: assert_eq(r, ok(6))
  hint: Fix the expression type or change the expected type
   |
13 |   assert_eq(r, ok(6))
   |                   ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?2]
  --> /tmp/dojo-bounded-total-0.almd:17:19
  in call to assert_eq()
  here: assert_eq(r, ok(0))
  hint: Fix the expression type or change the expected type
   |
17 |   assert_eq(r, ok(0))
   |                   ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?3]
  --> /tmp/dojo-bounded-total-0.almd:21:19
  in call to assert_eq()
  here: assert_eq(r, ok(0))
  hint: Fix the expression type or change the expected type
   |
21 |   assert_eq(r, ok(0))
   |                   ^
error[E025]: cannot infer a concrete type for this expression (type Result[Int, ?0])
  --> /tmp/dojo-bounded-total-0.almd:13:16
  in this expression with an unconstrained type
  here: assert_eq(r, ok(6))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Result[Int, String] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
13 |   assert_eq(r, ok(6))
   |                ^^
error[E025]: cannot infer a concrete type for this expression (type Result[Int, ?2])
  --> /tmp/dojo-bounded-total-0.almd:17:16
  in this expression with an unconstrained type
  here: assert_eq(r, ok(0))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Result[Int, String] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
17 |   assert_eq(r, ok(0))
   |                ^^
error[E025]: cannot infer a concrete type for this expression (type Result[Int, ?3])
  --> /tmp/dojo-bounded-total-0.almd:21:16
  in this expression with an unconstrained type
  here: assert_eq(r, ok(0))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Result[Int, String] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
21 |   assert_eq(r, ok(0))
   |                ^^

8 error(s) found
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
  let r = fan.bounded(compute.ms(100)) {
    sum(xs, 0)
  }
  match r {
    ok(x) => x
    err(_) => -1
  }
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
error[E025]: cannot infer a concrete type for binding 'r' (type Result[Unknown, String])
  --> /tmp/dojo-bounded-total-1.almd:6:11
  in binding 'r' with an unconstrained type
  here: let r = fan.bounded(compute.ms(100)) {
  hint: Annotate the binding with the full type, e.g. `let r: Result[Int, String] = ...`. An unconstrained slot (such as the error type of a value that is always `ok(...)`, reachable only through an un-exercised branch) cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  try:
      let r: Result[Int, String] = ...
  |
6 |   let r = fan.bounded(compute.ms(100)) {
  |           ^^^

2 error(s) found
FAILED: /tmp/dojo-bounded-total-1.almd
Compile error for /tmp/dojo-bounded-total-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = {
  fn sum(xs: List[Int], i: Int) -> Int = {
    if list.is_empty(xs) then 0
    else xs.get(i).unwrap_or(0) + sum(xs, i + 1)
  }
  let r: Result[Int, String] = fan.bounded(compute.ms(100)) {
    sum(xs, 0)
  }
  match r {
    ok(x) => x
    err(_) => -1
  }
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-2.almd:2:3
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
  let r: Result[Int, String] = fan.bounded(compute.ms(100)) {
    sum(xs, 0)
  }
  match r {
    ok(x) => x
    err(_) => -1
  }
}

effect fn sum(xs: List[Int], i: Int) -> Int = {
  if list.is_empty(xs) then 0
  else xs.get(i).unwrap_or(0) + sum(xs, i + 1)
}

effect fn safe_total(xs: List[Int]) -> Int = {
  let r: Result[Int, String] = fan.bounded(compute.ms(100)) {
    sum(xs, 0)
  }
  match r {
    ok(x) => x
    err(_) => -1
  }
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
error[E012]: duplicate function 'safe_total'
  at line 20
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ------------------------------------- first definition of 'safe_total' here
...
20 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ^^^^^^^^^^^^^
error[E006]: cannot call effect function 'sum' inside a fan.bounded region
  --> /tmp/dojo-bounded-total-3.almd:7:13
  in call to sum()
  here: sum(xs, 0)
  hint: fan.bounded meters deterministic computation, so its body is PURE. Run the effect before the region and pass the value in
   |
15 | effect fn sum(xs: List[Int], i: Int) -> Int = {
   | -------------------------------- 'sum' declared as effect fn here
...
7 |     sum(xs, 0)
  |             ^
error: fan.bounded body must return a plain value in v1
  --> /tmp/dojo-bounded-total-3.almd:7:13
  in fan.bounded body
  here: sum(xs, 0)
  hint: Return the value directly; the budget adds its own Err channel
  |
7 |     sum(xs, 0)
  |             ^
error[E006]: cannot call effect function 'sum' inside a fan.bounded region
  --> /tmp/dojo-bounded-total-3.almd:22:13
  in call to sum()
  here: sum(xs, 0)
  hint: fan.bounded meters deterministic computation, so its body is PURE. Run the effect before the region and pass the value in
   |
15 | effect fn sum(xs: List[Int], i: Int) -> Int = {
   | -------------------------------- 'sum' declared as effect fn here
...
22 |     sum(xs, 0)
   |             ^
error: fan.bounded body must return a plain value in v1
  --> /tmp/dojo-bounded-total-3.almd:22:13
  in fan.bounded body
  here: sum(xs, 0)
  hint: Return the value directly; the budget adds its own Err channel
   |
22 |     sum(xs, 0)
   |             ^
error[E001]: type mismatch in let r: expected Result[Int, String] but got Result[Result[Int, String], String]
  --> /tmp/dojo-bounded-total-3.almd:7:13
  in let r
  here: sum(xs, 0)
  hint: Fix the expression type or change the expected type
  |
7 |     sum(xs, 0)
  |             ^
error[E001]: type mismatch in let r: expected Result[Int, String] but got Result[Result[Int, String], String]
  --> /tmp/dojo-bounded-total-3.almd:22:13
  in let r
  here: sum(xs, 0)
  hint: Fix the expression type or change the expected type
   |
22 |     sum(xs, 0)
   |             ^

8 error(s) found
FAILED: /tmp/dojo-bounded-total-3.almd
Compile error for /tmp/dojo-bounded-total-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
