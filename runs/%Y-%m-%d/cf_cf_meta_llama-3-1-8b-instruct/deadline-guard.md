# deadline-guard

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Int = {
  fan.timeout(duration.s(2)) {
    fn compute_square_plus_one(n: Int) -> Int = {
      n * n + 1
    };
    compute_square_plus_one(n)
  } ?? 0
```

**Diagnostic:**

```
Compiling /tmp/dojo-deadline-guard-0.almd
error: Expected expression at line 3:5 (got Fn 'fn')
  --> /tmp/dojo-deadline-guard-0.almd:3:5
  |
3 |     fn compute_square_plus_one(n: Int) -> Int = {
  |     ^
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
error[E002]: undefined function 'compute_square_plus_one'
  --> /tmp/dojo-deadline-guard-0.almd:6:29
  in call to compute_square_plus_one()
  hint: Check the function name
  |
6 |     compute_square_plus_one(n)
  |                             ^

4 error(s) found
Compile error for /tmp/dojo-deadline-guard-0.almd:
compile failed
FAILED: /tmp/dojo-deadline-guard-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Int = {
  fan.timeout(2000000000, () => {
    fn compute_square_plus_one(n: Int) -> Int = {
      n * n + 1
    };
    compute_square_plus_one(n)
  }) ?? 0
```

**Diagnostic:**

```
Compiling /tmp/dojo-deadline-guard-1.almd
error: Expected expression at line 3:5 (got Fn 'fn')
  --> /tmp/dojo-deadline-guard-1.almd:3:5
  |
3 |     fn compute_square_plus_one(n: Int) -> Int = {
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:4 (got RParen ')')
  --> /tmp/dojo-deadline-guard-1.almd:7:4
  |
7 |   }) ?? 0
  |    ^
error[E002]: undefined function 'compute_square_plus_one'
  --> /tmp/dojo-deadline-guard-1.almd:6:29
  in call to compute_square_plus_one()
  hint: Check the function name
  |
6 |     compute_square_plus_one(n)
  |                             ^

3 error(s) found
Compile error for /tmp/dojo-deadline-guard-1.almd:
compile failed
FAILED: /tmp/dojo-deadline-guard-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Int = {
  fan.timeout(duration.s(2), () => {
    let square_plus_one = fn compute_square_plus_one(n: Int) -> Int = {
      n * n + 1
    };
    compute_square_plus_one(n)
  }) ?? 0
```

**Diagnostic:**

```
Compiling /tmp/dojo-deadline-guard-2.almd
error: Expected expression at line 3:27 (got Fn 'fn')
  --> /tmp/dojo-deadline-guard-2.almd:3:27
  |
3 |     let square_plus_one = fn compute_square_plus_one(n: Int) -> Int = {
  |                           ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:4 (got RParen ')')
  --> /tmp/dojo-deadline-guard-2.almd:7:4
  |
7 |   }) ?? 0
  |    ^
error[E002]: undefined function 'compute_square_plus_one'
  --> /tmp/dojo-deadline-guard-2.almd:6:29
  in call to compute_square_plus_one()
  hint: Check the function name
  |
6 |     compute_square_plus_one(n)
  |                             ^

3 error(s) found
Compile error for /tmp/dojo-deadline-guard-2.almd:
compile failed
FAILED: /tmp/dojo-deadline-guard-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Int = {
  fan.timeout(duration.s(2), () => {
    fn compute_square_plus_one(n: Int) -> Int = {
      n * n + 1
    };
    compute_square_plus_one(n)
  }) ?? 0
```

**Diagnostic:**

```
Compiling /tmp/dojo-deadline-guard-3.almd
error: Expected expression at line 3:5 (got Fn 'fn')
  --> /tmp/dojo-deadline-guard-3.almd:3:5
  |
3 |     fn compute_square_plus_one(n: Int) -> Int = {
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:4 (got RParen ')')
  --> /tmp/dojo-deadline-guard-3.almd:7:4
  |
7 |   }) ?? 0
  |    ^
error[E002]: undefined function 'compute_square_plus_one'
  --> /tmp/dojo-deadline-guard-3.almd:6:29
  in call to compute_square_plus_one()
  hint: Check the function name
  |
6 |     compute_square_plus_one(n)
  |                             ^

3 error(s) found
Compile error for /tmp/dojo-deadline-guard-3.almd:
compile failed
FAILED: /tmp/dojo-deadline-guard-3.almd

1/1 test file(s) failed

```
