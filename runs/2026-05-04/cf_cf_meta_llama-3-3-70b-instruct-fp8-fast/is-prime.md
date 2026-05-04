# is-prime

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else list.all(list.range(2, int.to_float(n |> float.sqrt |> float.ceil).to_int), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error[E005]: argument 'n' expects Float but got Int
  --> /tmp/dojo-is-prime-0.almd:3:44
  in call to float.sqrt()
  hint: Fix the argument type. Or use `to_float(x)` to convert Int to Float
  |
3 |   else list.all(list.range(2, int.to_float(n |> float.sqrt |> float.ceil).to_int), (x) => n % x != 0)
  |                                            ^
error[E005]: argument 'n' expects Int but got Float
  --> /tmp/dojo-is-prime-0.almd:3:44
  in call to int.to_float()
  hint: Fix the argument type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
3 |   else list.all(list.range(2, int.to_float(n |> float.sqrt |> float.ceil).to_int), (x) => n % x != 0)
  |                                            ^
error[E001]: type mismatch in call to float.sqrt(): expected Float but got Int
  --> /tmp/dojo-is-prime-0.almd:3:44
  in call to float.sqrt()
  hint: Fix the expression type or change the expected type. Or use `to_float(x)` to convert Int to Float
  |
3 |   else list.all(list.range(2, int.to_float(n |> float.sqrt |> float.ceil).to_int), (x) => n % x != 0)
  |                                            ^
error[E001]: type mismatch in call to int.to_float(): expected Int but got Float
  --> /tmp/dojo-is-prime-0.almd:3:44
  in call to int.to_float()
  hint: Fix the expression type or change the expected type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
3 |   else list.all(list.range(2, int.to_float(n |> float.sqrt |> float.ceil).to_int), (x) => n % x != 0)
  |                                            ^

4 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else list.all(list.range(2, int.to_float(n) |> float.sqrt |> float.ceil |> int.to_int), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-1.almd:3:44
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   else list.all(list.range(2, int.to_float(n) |> float.sqrt |> float.ceil |> int.to_int), (x) => n % x != 0)
  |                                            ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else list.all(list.range(2, int.to_float(n) |> float.sqrt |> float.ceil), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E005]: argument 'end' expects Int but got Float
  --> /tmp/dojo-is-prime-2.almd:3:44
  in call to list.range()
  hint: Fix the argument type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
3 |   else list.all(list.range(2, int.to_float(n) |> float.sqrt |> float.ceil), (x) => n % x != 0)
  |                                            ^
error[E001]: type mismatch in call to list.range(): expected Int but got Float
  --> /tmp/dojo-is-prime-2.almd:3:44
  in call to list.range()
  hint: Fix the expression type or change the expected type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
3 |   else list.all(list.range(2, int.to_float(n) |> float.sqrt |> float.ceil), (x) => n % x != 0)
  |                                            ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else list.all(list.range(2, float.to_int(float.sqrt(float.to_int(n)) |> float.ceil)), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E005]: argument 'n' expects Float but got Int
  --> /tmp/dojo-is-prime-3.almd:3:68
  in call to float.to_int()
  hint: Fix the argument type. Or use `to_float(x)` to convert Int to Float
  |
3 |   else list.all(list.range(2, float.to_int(float.sqrt(float.to_int(n)) |> float.ceil)), (x) => n % x != 0)
  |                                                                    ^
error[E005]: argument 'n' expects Float but got Int
  --> /tmp/dojo-is-prime-3.almd:3:68
  in call to float.sqrt()
  hint: Fix the argument type. Or use `to_float(x)` to convert Int to Float
  |
3 |   else list.all(list.range(2, float.to_int(float.sqrt(float.to_int(n)) |> float.ceil)), (x) => n % x != 0)
  |                                                                    ^
error[E001]: type mismatch in call to float.to_int(): expected Float but got Int
  --> /tmp/dojo-is-prime-3.almd:3:68
  in call to float.to_int()
  hint: Fix the expression type or change the expected type. Or use `to_float(x)` to convert Int to Float
  |
3 |   else list.all(list.range(2, float.to_int(float.sqrt(float.to_int(n)) |> float.ceil)), (x) => n % x != 0)
  |                                                                    ^
error[E001]: type mismatch in call to float.sqrt(): expected Float but got Int
  --> /tmp/dojo-is-prime-3.almd:3:68
  in call to float.sqrt()
  hint: Fix the expression type or change the expected type. Or use `to_float(x)` to convert Int to Float
  |
3 |   else list.all(list.range(2, float.to_int(float.sqrt(float.to_int(n)) |> float.ceil)), (x) => n % x != 0)
  |                                                                    ^

4 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
