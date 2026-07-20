# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0 else int.abs(n) |> list.fold(list.chars(int.to_string(n)), 0, (acc, x) => acc + int.parse(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E002]: undefined function 'list.chars'
  --> /tmp/dojo-sum-digits-0.almd:2:74
  in call to list.chars()
  hint: No function 'chars' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   if n == 0 then 0 else int.abs(n) |> list.fold(list.chars(int.to_string(n)), 0, (acc, x) => acc + int.parse(x))
  |                                                                          ^
error: operator '+' requires numeric, String, or List types but got ?0 and Result[Int, String]
  --> /tmp/dojo-sum-digits-0.almd:2:110
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   if n == 0 then 0 else int.abs(n) |> list.fold(list.chars(int.to_string(n)), 0, (acc, x) => acc + int.parse(x))
  |                                                                                                              ^
error[E004]: list.fold() expects 3 argument(s) but got 4
  --> /tmp/dojo-sum-digits-0.almd:2:110
  in call to list.fold()
  hint: Check the number of arguments
  try:
      // list.fold() takes 3 arg(s) — you passed 4
      list.fold(<xs: List[A]>, <init: B>, <f: fn(B, A) -> B>)
  |
2 |   if n == 0 then 0 else int.abs(n) |> list.fold(list.chars(int.to_string(n)), 0, (acc, x) => acc + int.parse(x))
  |                                                                                                              ^
error[E005]: argument 'xs' expects List[A] but got Int
  --> /tmp/dojo-sum-digits-0.almd:2:110
  in call to list.fold()
  hint: Fix the argument type
  |
2 |   if n == 0 then 0 else int.abs(n) |> list.fold(list.chars(int.to_string(n)), 0, (acc, x) => acc + int.parse(x))
  |                                                                                                              ^
error[E005]: argument 'f' expects fn(B, A) -> B but got Int
  --> /tmp/dojo-sum-digits-0.almd:2:110
  in call to list.fold()
  hint: Fix the argument type
  |
2 |   if n == 0 then 0 else int.abs(n) |> list.fold(list.chars(int.to_string(n)), 0, (acc, x) => acc + int.parse(x))
  |                                                                                                              ^
error[E001]: type mismatch in call to list.fold(): expected List[A] but got Int
  --> /tmp/dojo-sum-digits-0.almd:2:110
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
2 |   if n == 0 then 0 else int.abs(n) |> list.fold(list.chars(int.to_string(n)), 0, (acc, x) => acc + int.parse(x))
  |                                                                                                              ^
error[E001]: type mismatch in call to list.fold(): expected fn(B, A) -> B but got Int
  --> /tmp/dojo-sum-digits-0.almd:2:110
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
2 |   if n == 0 then 0 else int.abs(n) |> list.fold(list.chars(int.to_string(n)), 0, (acc, x) => acc + int.parse(x))
  |                                                                                                              ^

7 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0 else 
    int.abs(n) |> string.chars |> list.map(string.to_int) |> list.fold(0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E005]: argument 's' expects String but got Int
  --> /tmp/dojo-sum-digits-1.almd:3:13
  in call to string.chars()
  hint: Fix the argument type. Or use `int.to_string(x)` to convert Int to String
  |
3 |     int.abs(n) |> string.chars |> list.map(string.to_int) |> list.fold(0, (acc, x) => acc + x)
  |             ^
error[E003]: undefined variable 'string'
  --> /tmp/dojo-sum-digits-1.almd:3:44
  in variable string
  hint: Check the variable name
  |
3 |     int.abs(n) |> string.chars |> list.map(string.to_int) |> list.fold(0, (acc, x) => acc + x)
  |                                            ^^^^^^
error[E001]: type mismatch in call to string.chars(): expected String but got Int
  --> /tmp/dojo-sum-digits-1.almd:3:13
  in call to string.chars()
  hint: Fix the expression type or change the expected type. Or use `int.to_string(x)` to convert Int to String
  |
3 |     int.abs(n) |> string.chars |> list.map(string.to_int) |> list.fold(0, (acc, x) => acc + x)
  |             ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0 else 
    int.abs(n) |> string.to_string |> string.chars |> list.map(string.to_int) |> list.fold(0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error[E002]: undefined function 'string.to_string'
  --> /tmp/dojo-sum-digits-2.almd:3:13
  in call to string.to_string()
  hint: No function 'to_string' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |     int.abs(n) |> string.to_string |> string.chars |> list.map(string.to_int) |> list.fold(0, (acc, x) => acc + x)
  |             ^
error[E003]: undefined variable 'string'
  --> /tmp/dojo-sum-digits-2.almd:3:64
  in variable string
  hint: Check the variable name
  |
3 |     int.abs(n) |> string.to_string |> string.chars |> list.map(string.to_int) |> list.fold(0, (acc, x) => acc + x)
  |                                                                ^^^^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0 else 
    string.to_string(int.abs(n)) |> string.chars |> list.map(string.to_int) |> list.fold(0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E002]: undefined function 'string.to_string'
  --> /tmp/dojo-sum-digits-3.almd:3:30
  in call to string.to_string()
  hint: No function 'to_string' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |     string.to_string(int.abs(n)) |> string.chars |> list.map(string.to_int) |> list.fold(0, (acc, x) => acc + x)
  |                              ^
error[E003]: undefined variable 'string'
  --> /tmp/dojo-sum-digits-3.almd:3:62
  in variable string
  hint: Check the variable name
  |
3 |     string.to_string(int.abs(n)) |> string.chars |> list.map(string.to_int) |> list.fold(0, (acc, x) => acc + x)
  |                                                              ^^^^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
