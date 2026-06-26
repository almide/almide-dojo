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
  if n < 0 then int.abs(n) else n
  |> list.fold([], 0, (acc, x) => acc + x) 
  |> (x => x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-sum-digits-0.almd:4:9
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
4 |   |> (x => x)
  |         ^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n < 0 then int.abs(n) else n
  |> list.fold([], 0, (acc, x) => acc + x)
  |> (x => x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-sum-digits-1.almd:4:9
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
4 |   |> (x => x)
  |         ^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n < 0 then int.abs(n) else n
  |> list.fold([], 0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error[E004]: list.fold() expects 3 argument(s) but got 4
  --> /tmp/dojo-sum-digits-2.almd:3:41
  in call to list.fold()
  hint: Check the number of arguments
  try:
      // list.fold() takes 3 arg(s) — you passed 4
      list.fold(<xs: List[A]>, <init: B>, <f: fn(B, A) -> B>)
  |
3 |   |> list.fold([], 0, (acc, x) => acc + x)
  |                                         ^
error[E005]: argument 'xs' expects List[A] but got Int
  --> /tmp/dojo-sum-digits-2.almd:3:41
  in call to list.fold()
  hint: Fix the argument type
  |
3 |   |> list.fold([], 0, (acc, x) => acc + x)
  |                                         ^
error[E005]: argument 'f' expects fn(List[?0], A) -> List[?0] but got Int
  --> /tmp/dojo-sum-digits-2.almd:3:41
  in call to list.fold()
  hint: Fix the argument type
  |
3 |   |> list.fold([], 0, (acc, x) => acc + x)
  |                                         ^
error[E001]: type mismatch in call to list.fold(): expected List[A] but got Int
  --> /tmp/dojo-sum-digits-2.almd:3:41
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
3 |   |> list.fold([], 0, (acc, x) => acc + x)
  |                                         ^
error[E001]: type mismatch in call to list.fold(): expected fn(List[?0], A) -> List[?0] but got Int
  --> /tmp/dojo-sum-digits-2.almd:3:41
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
3 |   |> list.fold([], 0, (acc, x) => acc + x)
  |                                         ^
error[E001]: type mismatch in if branches: expected Int but got List[?0]
  --> /tmp/dojo-sum-digits-2.almd:3:41
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
3 |   |> list.fold([], 0, (acc, x) => acc + x)
  |                                         ^

6 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n < 0 then int.abs(n) else n
  |> string.chars
  |> list.map(int.to_int)
  |> list.fold(0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E005]: argument 's' expects String but got Int
  --> /tmp/dojo-sum-digits-3.almd:2:33
  in call to string.chars()
  hint: Fix the argument type. Or use `int.to_string(x)` to convert Int to String
  |
2 |   if n < 0 then int.abs(n) else n
  |                                 ^
error[E003]: undefined variable 'int'
  --> /tmp/dojo-sum-digits-3.almd:4:15
  in variable int
  hint: Did you mean `n`?
  try:
      // int  →  n
      n
  |
4 |   |> list.map(int.to_int)
  |               ^^^
error[E001]: type mismatch in call to string.chars(): expected String but got Int
  --> /tmp/dojo-sum-digits-3.almd:2:33
  in call to string.chars()
  hint: Fix the expression type or change the expected type. Or use `int.to_string(x)` to convert Int to String
  |
2 |   if n < 0 then int.abs(n) else n
  |                                 ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
