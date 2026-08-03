# deadline-guard

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Int =
  fan.timeout(duration.s(2)) {
    let square_plus_one = square_plus_one(n)
    square_plus_one
  } ?? 0

fn square_plus_one(n: Int) -> Int =
  n * n + 1
```

**Diagnostic:**

```
Compiling /tmp/dojo-deadline-guard-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:30 (got LBrace '{')
  --> /tmp/dojo-deadline-guard-0.almd:2:30
  |
2 |   fan.timeout(duration.s(2)) {
  |                              ^
error[E003]: undefined variable 'duration'
  --> /tmp/dojo-deadline-guard-0.almd:2:15
  in variable duration
  hint: Check the variable name
  |
2 |   fan.timeout(duration.s(2)) {
  |               ^^^^^^^^
error: fan.timeout() expects 2 arguments but got 1
  --> /tmp/dojo-deadline-guard-0.almd:2:15
  in call to fan.timeout()
  hint: Usage: fan.timeout(5000, () => expr)
  |
2 |   fan.timeout(duration.s(2)) {
  |               ^^^^^^^^

3 error(s) found
Compile error for /tmp/dojo-deadline-guard-0.almd:
compile failed
FAILED: /tmp/dojo-deadline-guard-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Int =
  fan.timeout(2000, () => {
    let square_plus_one = square_plus_one(n)
    square_plus_one
  }) ?? 0

fn square_plus_one(n: Int) -> Int =
  n * n + 1
```

**Diagnostic:**

```
Compiling /tmp/dojo-deadline-guard-1.almd
Compile error for /tmp/dojo-deadline-guard-1.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0308]: mismatched types
   --> <generated.rs>:334:9
    |
334 |         square_plus_one
    |         ^^^^^^^^^^^^^^^ expected `Result<_, String>`, found `i64`
    |
    = note: expected enum `Result<_, String>`
               found type `i64`
help: try wrapping the expression in `Ok`
    |
334 |         Ok(square_plus_one)
    |         +++               +


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error; 2 warnings emitted

FAILED: /tmp/dojo-deadline-guard-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
effect fn within_deadline(n: Int) -> Int =
  fan.timeout(2000, () => {
    let result = square_plus_one(n)
    Ok(result)
  }) ?? 0

fn square_plus_one(n: Int) -> Int =
  n * n + 1
```
