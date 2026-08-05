# deadline-guard

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
fn within_deadline(n: Int) -> Int {
  fan.timeout(duration.s(2)) {
    work(n)
  } ?? 0
}

fn work(n: Int) -> Int {
  square_plus_one(n)
}

fn square_plus_one(n: Int) -> Int {
  n * n + 1
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-deadline-guard-0.almd
error: Missing '=' before function body at line 1:35
  --> /tmp/dojo-deadline-guard-0.almd:1:35
  hint: Almide requires '=' before the body. Write: fn within_deadline(...) -> Type = { ... }
  |
1 | fn within_deadline(n: Int) -> Int {
  |                                   ^
error: Missing '=' before function body at line 7:24
  --> /tmp/dojo-deadline-guard-0.almd:7:24
  hint: Almide requires '=' before the body. Write: fn work(...) -> Type = { ... }
  |
7 | fn work(n: Int) -> Int {
  |                        ^
error: Missing '=' before function body at line 11:35
  --> /tmp/dojo-deadline-guard-0.almd:11:35
  hint: Almide requires '=' before the body. Write: fn square_plus_one(...) -> Type = { ... }
   |
11 | fn square_plus_one(n: Int) -> Int {
   |                                   ^

3 error(s) found
Compile error for /tmp/dojo-deadline-guard-0.almd:
compile failed
FAILED: /tmp/dojo-deadline-guard-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn within_deadline(n: Int) -> Int = {
  fan.timeout(duration.s(2)) {
    work(n)
  } ?? 0
}

fn work(n: Int) -> Int = {
  square_plus_one(n)
}

fn square_plus_one(n: Int) -> Int = {
  n * n + 1
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-deadline-guard-1.almd
error[E003]: undefined variable 'duration'
  --> /tmp/dojo-deadline-guard-1.almd:2:15
  in variable duration
  hint: Check the variable name
  |
2 |   fan.timeout(duration.s(2)) {
  |               ^^^^^^^^
error: fan.timeout() can only be used inside an effect fn
  --> /tmp/dojo-deadline-guard-1.almd:2:15
  in call to fan.timeout()
  hint: Mark the enclosing function as `effect fn`
  |
2 |   fan.timeout(duration.s(2)) {
  |               ^^^^^^^^
error: fan.timeout() expects 2 arguments but got 1
  --> /tmp/dojo-deadline-guard-1.almd:2:15
  in call to fan.timeout()
  hint: Usage: fan.timeout(5000, () => expr)
  |
2 |   fan.timeout(duration.s(2)) {
  |               ^^^^^^^^
error: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-deadline-guard-1.almd:4:8
  in operator ??
  hint: Use '??' only on Option[T] or Result[T, E] values
  |
4 |   } ?? 0
  |        ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?1]
  --> /tmp/dojo-deadline-guard-1.almd:17:19
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
17 |   assert_eq(r, ok(17))
   |                   ^^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?2]
  --> /tmp/dojo-deadline-guard-1.almd:21:19
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
21 |   assert_eq(r, ok(1))
   |                   ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?3]
  --> /tmp/dojo-deadline-guard-1.almd:25:19
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
25 |   assert_eq(r, ok(10))
   |                   ^^

7 error(s) found
Compile error for /tmp/dojo-deadline-guard-1.almd:
compile failed
FAILED: /tmp/dojo-deadline-guard-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Result[Int, String] = {
  fan.timeout(duration.s(2), () => {
    work(n)
  }) ?? err("Deadline exceeded")
}

fn work(n: Int) -> Result[Int, String] = {
  square_plus_one(n)
}

fn square_plus_one(n: Int) -> Result[Int, String] = {
  Ok(n * n + 1)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-deadline-guard-2.almd
error[E003]: undefined variable 'duration'
  --> /tmp/dojo-deadline-guard-2.almd:2:15
  in variable duration
  hint: Check the variable name
  |
2 |   fan.timeout(duration.s(2), () => {
  |               ^^^^^^^^

1 error(s) found
Compile error for /tmp/dojo-deadline-guard-2.almd:
compile failed
FAILED: /tmp/dojo-deadline-guard-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Int = {
  fan.timeout(Duration.s(2), () => {
    work(n)
  }) ?? 0
}

fn work(n: Int) -> Int = {
  square_plus_one(n)
}

fn square_plus_one(n: Int) -> Int = {
  n * n + 1
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-deadline-guard-3.almd
error[E001]: type mismatch in method call: expected Duration but got fn(Int) -> Int
  --> /tmp/dojo-deadline-guard-3.almd:2:15
  in method call
  hint: Fix the expression type or change the expected type
  |
2 |   fan.timeout(Duration.s(2), () => {
  |               ^^^^^^^^

1 error(s) found
Compile error for /tmp/dojo-deadline-guard-3.almd:
compile failed
FAILED: /tmp/dojo-deadline-guard-3.almd

1/1 test file(s) failed

```
