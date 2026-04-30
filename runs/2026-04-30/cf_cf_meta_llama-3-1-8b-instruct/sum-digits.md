# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0 else int.abs(n) |> int.to_string |> string.chars |> list.map(fn(c) => int.parse(c)) |> list.sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: Expected expression at line 2:81 (got Fn 'fn')
  --> /tmp/dojo-sum-digits-0.almd:2:81
  |
2 |   if n == 0 then 0 else int.abs(n) |> int.to_string |> string.chars |> list.map(fn(c) => int.parse(c)) |> list.sum
  |                                                                                 ^
error: Expected function name at line 2:83 (got LParen '(')
  --> /tmp/dojo-sum-digits-0.almd:2:83
  |
2 |   if n == 0 then 0 else int.abs(n) |> int.to_string |> string.chars |> list.map(fn(c) => int.parse(c)) |> list.sum
  |                                                                                   ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0 else int.abs(n) |> int.to_string |> string.chars |> list.map(int.parse) |> list.sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E005]: argument 'xs' expects List[Int] but got List[Result[Int, String]]
  --> /tmp/dojo-sum-digits-1.almd:2:84
  in call to list.sum()
  hint: Fix the argument type
  |
2 |   if n == 0 then 0 else int.abs(n) |> int.to_string |> string.chars |> list.map(int.parse) |> list.sum
  |                                                                                    ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[Result[Int, String]]
  --> /tmp/dojo-sum-digits-1.almd:2:84
  in call to list.sum()
  hint: Fix the expression type or change the expected type
  |
2 |   if n == 0 then 0 else int.abs(n) |> int.to_string |> string.chars |> list.map(int.parse) |> list.sum
  |                                                                                    ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0 else 
    int.abs(n) |> int.to_string |> string.chars |> list.map(int.parse) |> list.filter_map(x => option.unwrap_or(x, 0)) |> list.sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-sum-digits-2.almd:3:93
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
3 |     int.abs(n) |> int.to_string |> string.chars |> list.map(int.parse) |> list.filter_map(x => option.unwrap_or(x, 0)) |> list.sum
  |                                                                                             ^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0 else 
    int.abs(n) |> int.to_string |> string.chars |> list.map((x) => int.parse(x)) |> list.filter_map((x) => option.unwrap_or(x, 0)) |> list.sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E005]: argument 'f' expects fn(Result[Int, String]) -> Option[B] but got fn(Option[Int]) -> Int
  --> /tmp/dojo-sum-digits-3.almd:3:128
  in call to list.filter_map()
  hint: Fix the argument type
  |
3 |     int.abs(n) |> int.to_string |> string.chars |> list.map((x) => int.parse(x)) |> list.filter_map((x) => option.unwrap_or(x, 0)) |> list.sum
  |                                                                                                                                ^
error[E001]: type mismatch in call to list.filter_map(): expected fn(Result[Int, String]) -> Option[B] but got fn(Option[Int]) -> Int
  --> /tmp/dojo-sum-digits-3.almd:3:128
  in call to list.filter_map()
  hint: Fix the expression type or change the expected type
  |
3 |     int.abs(n) |> int.to_string |> string.chars |> list.map((x) => int.parse(x)) |> list.filter_map((x) => option.unwrap_or(x, 0)) |> list.sum
  |                                                                                                                                ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
