# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = n.abs() |> int.fold(n, 0, (acc, x) => acc + x % 10)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E002]: undefined function 'int.fold'
  --> /tmp/dojo-sum-digits-0.almd:1:80
  in call to int.fold()
  hint: No function 'fold' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
1 | fn sum_digits(n: Int) -> Int = n.abs() |> int.fold(n, 0, (acc, x) => acc + x % 10)
  |                                                                                ^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = n.abs() |> list.fold(n, 0, (acc, x) => acc + x % 10)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E004]: list.fold() expects 3 argument(s) but got 4
  --> /tmp/dojo-sum-digits-1.almd:1:81
  in call to list.fold()
  hint: Check the number of arguments
  try:
      // list.fold() takes 3 arg(s) — you passed 4
      list.fold(<xs: List[A]>, <init: B>, <f: fn(B, A) -> B>)
  |
1 | fn sum_digits(n: Int) -> Int = n.abs() |> list.fold(n, 0, (acc, x) => acc + x % 10)
  |                                                                                 ^^
error[E005]: argument 'xs' expects List[A] but got Int
  --> /tmp/dojo-sum-digits-1.almd:1:81
  in call to list.fold()
  hint: Fix the argument type
  |
1 | fn sum_digits(n: Int) -> Int = n.abs() |> list.fold(n, 0, (acc, x) => acc + x % 10)
  |                                                                                 ^^
error[E005]: argument 'f' expects fn(Int, A) -> Int but got Int
  --> /tmp/dojo-sum-digits-1.almd:1:81
  in call to list.fold()
  hint: Fix the argument type
  |
1 | fn sum_digits(n: Int) -> Int = n.abs() |> list.fold(n, 0, (acc, x) => acc + x % 10)
  |                                                                                 ^^
error[E001]: type mismatch in call to list.fold(): expected List[A] but got Int
  --> /tmp/dojo-sum-digits-1.almd:1:81
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
1 | fn sum_digits(n: Int) -> Int = n.abs() |> list.fold(n, 0, (acc, x) => acc + x % 10)
  |                                                                                 ^^
error[E001]: type mismatch in call to list.fold(): expected fn(Int, A) -> Int but got Int
  --> /tmp/dojo-sum-digits-1.almd:1:81
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
1 | fn sum_digits(n: Int) -> Int = n.abs() |> list.fold(n, 0, (acc, x) => acc + x % 10)
  |                                                                                 ^^

5 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = n.abs() |> list.map(x => x % 10) |> list.fold(0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-sum-digits-2.almd:1:54
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
1 | fn sum_digits(n: Int) -> Int = n.abs() |> list.map(x => x % 10) |> list.fold(0, (acc, x) => acc + x)
  |                                                      ^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = n.abs() |> list.map((x) => x % 10) |> list.fold(0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E005]: argument 'xs' expects List[A] but got Int
  --> /tmp/dojo-sum-digits-3.almd:1:63
  in call to list.map()
  hint: Fix the argument type
  |
1 | fn sum_digits(n: Int) -> Int = n.abs() |> list.map((x) => x % 10) |> list.fold(0, (acc, x) => acc + x)
  |                                                               ^^
error[E001]: type mismatch in call to list.map(): expected List[?0] but got Int
  --> /tmp/dojo-sum-digits-3.almd:1:63
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
1 | fn sum_digits(n: Int) -> Int = n.abs() |> list.map((x) => x % 10) |> list.fold(0, (acc, x) => acc + x)
  |                                                               ^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
