# deadline-guard

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E041`

## Attempts

### Attempt 1 (FAIL)

```almide
fn within_deadline(n: Int) -> Int = {
  fan.timeout(duration.s(2)) {
    compute_square(n)
  } ?? 0
}

fn compute_square(n: Int) -> Int = n * n + 1
```

**Diagnostic:**

```
error[E007]: fan.timeout can only be used inside an effect fn
  --> /tmp/dojo-deadline-guard-0.almd:2:3
  in fan.timeout
  here: fan.timeout(duration.s(2)) {
  hint: Mark the enclosing function as `effect fn`
  |
2 |   fan.timeout(duration.s(2)) {
  |   ^^^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?0]
  --> /tmp/dojo-deadline-guard-0.almd:11:19
  in call to assert_eq()
  here: assert_eq(r, ok(17))
  hint: Fix the expression type or change the expected type
   |
11 |   assert_eq(r, ok(17))
   |                   ^^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?1]
  --> /tmp/dojo-deadline-guard-0.almd:15:19
  in call to assert_eq()
  here: assert_eq(r, ok(1))
  hint: Fix the expression type or change the expected type
   |
15 |   assert_eq(r, ok(1))
   |                   ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?2]
  --> /tmp/dojo-deadline-guard-0.almd:19:19
  in call to assert_eq()
  here: assert_eq(r, ok(10))
  hint: Fix the expression type or change the expected type
   |
19 |   assert_eq(r, ok(10))
   |                   ^^
error[E025]: cannot infer a concrete type for this expression (type Result[Int, ?0])
  --> /tmp/dojo-deadline-guard-0.almd:11:16
  in this expression with an unconstrained type
  here: assert_eq(r, ok(17))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Result[Int, String] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
11 |   assert_eq(r, ok(17))
   |                ^^
error[E025]: cannot infer a concrete type for this expression (type Result[Int, ?1])
  --> /tmp/dojo-deadline-guard-0.almd:15:16
  in this expression with an unconstrained type
  here: assert_eq(r, ok(1))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Result[Int, String] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
15 |   assert_eq(r, ok(1))
   |                ^^
error[E025]: cannot infer a concrete type for this expression (type Result[Int, ?2])
  --> /tmp/dojo-deadline-guard-0.almd:19:16
  in this expression with an unconstrained type
  here: assert_eq(r, ok(10))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Result[Int, String] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
19 |   assert_eq(r, ok(10))
   |                ^^

7 error(s) found
FAILED: /tmp/dojo-deadline-guard-0.almd
Compile error for /tmp/dojo-deadline-guard-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Int = {
  fan.timeout(duration.s(2)) {
    let r = compute_square(n)
    r
  } ?? 0
}

fn compute_square(n: Int) -> Result[Int, String] = {
  let result = n * n + 1
  ok(result)
}
```

**Diagnostic:**

```
error[E041]: implicit propagation of this binding's value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-deadline-guard-1.almd:3:13
  in implicit propagation
  here: let r = compute_square(n)
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
  try:
      !
  |
3 |     let r = compute_square(n)
  |             ^^^^^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-deadline-guard-1.almd
Compile error for /tmp/dojo-deadline-guard-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Int = {
  fan.timeout(duration.s(2)) {
    let r = compute_square(n)
    r.unwrap_or(0)
  }
}

fn compute_square(n: Int) -> Result[Int, String] = {
  let result = n * n + 1
  ok(result)
}
```

**Diagnostic:**

```
error[E002]: undefined method 'unwrap_or' on int
  --> /tmp/dojo-deadline-guard-2.almd:4:5
  in method call .unwrap_or()
  here: r.unwrap_or(0)
  hint: Almide doesn't use method-call syntax. Write `int.<fn>(x)` (or `x |> int.<fn>`) — there is no method `unwrap_or` on `int`. Run `almide explain E002` for examples.
  |
4 |     r.unwrap_or(0)
  |     ^^^^^^^^^^^^^^
error[E041]: implicit propagation of this binding's value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-deadline-guard-2.almd:3:13
  in implicit propagation
  here: let r = compute_square(n)
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
  try:
      !
  |
3 |     let r = compute_square(n)
  |             ^^^^^^^^^^^^^^^^^
error[E041]: implicit propagation of this fn's tail value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-deadline-guard-2.almd:2:3
  in implicit propagation
  here: fan.timeout(duration.s(2)) {
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
  |
2 |   fan.timeout(duration.s(2)) {
  |   ^^^

3 error(s) found
FAILED: /tmp/dojo-deadline-guard-2.almd
Compile error for /tmp/dojo-deadline-guard-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Int = {
  fan.timeout(duration.s(2)) {
    let r = compute_square(n)
    match r {
      ok(x) => x,
      err(_) => 0
    }
  }
}

fn compute_square(n: Int) -> Result[Int, String] = {
  let result = n * n + 1
  ok(result)
}
```

**Diagnostic:**

```
error[E041]: implicit propagation of this fn's tail value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-deadline-guard-3.almd:2:3
  in implicit propagation
  here: fan.timeout(duration.s(2)) {
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
  |
2 |   fan.timeout(duration.s(2)) {
  |   ^^^

1 error(s) found
FAILED: /tmp/dojo-deadline-guard-3.almd
Compile error for /tmp/dojo-deadline-guard-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
