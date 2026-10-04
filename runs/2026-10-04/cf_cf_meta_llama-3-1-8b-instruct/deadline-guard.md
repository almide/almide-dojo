# deadline-guard

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn within_deadline(n: Int) -> Int = {
  fan.timeout(duration.s(2)) {
    compute_square_plus_one(n)
  } ?? 0
}

fn compute_square_plus_one(n: Int) -> Int = n * n + 1
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
    let r = compute_square_plus_one(n)
    r
  } ?? 0
}

fn compute_square_plus_one(n: Int) -> Int = n * n + 1
```

**Diagnostic:**

```
FAILED: /tmp/dojo-deadline-guard-1.almd
Compile error for /tmp/dojo-deadline-guard-1.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Int = {
  fan.timeout(duration.s(2)) {
    let r = compute_square_plus_one(n)
    r
  } ?? 0
}

fn compute_square_plus_one(n: Int) -> Int = n * n + 1
```

**Diagnostic:**

```
FAILED: /tmp/dojo-deadline-guard-2.almd
Compile error for /tmp/dojo-deadline-guard-2.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Int = {
  fan.timeout(duration.s(2)) {
    let r = compute_square_plus_one(n)
    r
  } ?? 0
}

fn compute_square_plus_one(n: Int) -> Int = n * n + 1
```

**Diagnostic:**

```
FAILED: /tmp/dojo-deadline-guard-3.almd
Compile error for /tmp/dojo-deadline-guard-3.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
