# deadline-guard

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E0593`

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Int = 
  fan.timeout(duration.s(2)) { 
    pure_helper(n) 
  } ?? 0

fn pure_helper(n: Int) -> Int = 
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
  fan.timeout(2000, (x) => pure_helper(n)) ?? 0

fn pure_helper(n: Int) -> Int = 
  n * n + 1
```

**Diagnostic:**

```
Compiling /tmp/dojo-deadline-guard-1.almd
Compile error for /tmp/dojo-deadline-guard-1.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0593]: closure is expected to take 0 arguments, but it takes 1 argument
   --> <generated.rs>:332:14
    |
332 |     Ok(match almide_rt_fan_timeout(2000i64, move |x| pure_helper(n)) { Ok(v) => v, Err(_) => 0i64, })
    |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--------^^^^^^^^^^^^^^^^
    |              |                              |
    |              |                              takes 1 argument
    |              expected closure that takes 0 arguments


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error; 2 warnings emitted

FAILED: /tmp/dojo-deadline-guard-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Int = 
  fan.timeout(duration.s(2)) { pure_helper(n) } ?? 0

fn pure_helper(n: Int) -> Int = 
  n * n + 1
```

**Diagnostic:**

```
Compiling /tmp/dojo-deadline-guard-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:30 (got LBrace '{')
  --> /tmp/dojo-deadline-guard-2.almd:2:30
  |
2 |   fan.timeout(duration.s(2)) { pure_helper(n) } ?? 0
  |                              ^
error[E003]: undefined variable 'duration'
  --> /tmp/dojo-deadline-guard-2.almd:2:15
  in variable duration
  hint: Check the variable name
  |
2 |   fan.timeout(duration.s(2)) { pure_helper(n) } ?? 0
  |               ^^^^^^^^
error: fan.timeout() expects 2 arguments but got 1
  --> /tmp/dojo-deadline-guard-2.almd:2:15
  in call to fan.timeout()
  hint: Usage: fan.timeout(5000, () => expr)
  |
2 |   fan.timeout(duration.s(2)) { pure_helper(n) } ?? 0
  |               ^^^^^^^^

3 error(s) found
Compile error for /tmp/dojo-deadline-guard-2.almd:
compile failed
FAILED: /tmp/dojo-deadline-guard-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Int = 
  fan.timeout(2000, (x) => pure_helper(n)) ?? 0

fn pure_helper(n: Int) -> Int = 
  n * n + 1
```

**Diagnostic:**

```
Compiling /tmp/dojo-deadline-guard-3.almd
Compile error for /tmp/dojo-deadline-guard-3.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0593]: closure is expected to take 0 arguments, but it takes 1 argument
   --> <generated.rs>:332:14
    |
332 |     Ok(match almide_rt_fan_timeout(2000i64, move |x| pure_helper(n)) { Ok(v) => v, Err(_) => 0i64, })
    |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--------^^^^^^^^^^^^^^^^
    |              |                              |
    |              |                              takes 1 argument
    |              expected closure that takes 0 arguments


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error; 2 warnings emitted

FAILED: /tmp/dojo-deadline-guard-3.almd

1/1 test file(s) failed

```
