# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then 
    false
  else 
    list.all(list.range(2, int.to_float(n)), (divisor) => int.rem(n, divisor) != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error[E005]: argument 'end' expects Int but got Float
  --> /tmp/dojo-is-prime-0.almd:5:41
  in call to list.range()
  hint: Fix the argument type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
5 |     list.all(list.range(2, int.to_float(n)), (divisor) => int.rem(n, divisor) != 0)
  |                                         ^
error[E002]: undefined function 'int.rem'
  --> /tmp/dojo-is-prime-0.almd:5:70
  in call to int.rem()
  hint: No function 'rem' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |     list.all(list.range(2, int.to_float(n)), (divisor) => int.rem(n, divisor) != 0)
  |                                                                      ^^^^^^^
error[E001]: type mismatch in call to list.range(): expected Int but got Float
  --> /tmp/dojo-is-prime-0.almd:5:41
  in call to list.range()
  hint: Fix the expression type or change the expected type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
5 |     list.all(list.range(2, int.to_float(n)), (divisor) => int.rem(n, divisor) != 0)
  |                                         ^

3 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then 
    false
  else if n < 0 then 
    false
  else 
    list.all(list.range(2, int.to_int(math.floor(float.to_int(n)))), (divisor) => int.rem(n, divisor) != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error[E005]: argument 'n' expects Float but got Int
  --> /tmp/dojo-is-prime-1.almd:5:64
  in call to float.to_int()
  hint: Fix the argument type. Or use `to_float(x)` to convert Int to Float
  |
5 | else list.all(list.range(2, int.to_int(math.floor(float.to_int(n)))), (divisor) => int.rem(n, divisor) != 0)
  |                                                                ^
error[E002]: undefined function 'math.floor'
  --> /tmp/dojo-is-prime-1.almd:5:64
  in call to math.floor()
  hint: No function 'floor' in module 'math'. See docs/CHEATSHEET.md for available functions
  |
5 | else list.all(list.range(2, int.to_int(math.floor(float.to_int(n)))), (divisor) => int.rem(n, divisor) != 0)
  |                                                                ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-1.almd:5:64
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 | else list.all(list.range(2, int.to_int(math.floor(float.to_int(n)))), (divisor) => int.rem(n, divisor) != 0)
  |                                                                ^
error[E002]: undefined function 'int.rem'
  --> /tmp/dojo-is-prime-1.almd:5:95
  in call to int.rem()
  hint: No function 'rem' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 | else list.all(list.range(2, int.to_int(math.floor(float.to_int(n)))), (divisor) => int.rem(n, divisor) != 0)
  |                                                                                               ^^^^^^^
error[E001]: type mismatch in call to float.to_int(): expected Float but got Int
  --> /tmp/dojo-is-prime-1.almd:5:64
  in call to float.to_int()
  hint: Fix the expression type or change the expected type. Or use `to_float(x)` to convert Int to Float
  |
5 | else list.all(list.range(2, int.to_int(math.floor(float.to_int(n)))), (divisor) => int.rem(n, divisor) != 0)
  |                                                                ^

5 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then 
    false
  else if n < 0 then 
    false
  else 
    list.all(list.range(2, int.to_int(math.sqrt(float.to_int(n)))), (divisor) => int.rem(n, divisor) != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E005]: argument 'n' expects Float but got Int
  --> /tmp/dojo-is-prime-2.almd:5:63
  in call to float.to_int()
  hint: Fix the argument type. Or use `to_float(x)` to convert Int to Float
  |
5 | else list.all(list.range(2, int.to_int(math.sqrt(float.to_int(n)))), (divisor) => int.rem(n, divisor) != 0)
  |                                                               ^
error[E005]: argument 'x' expects Float but got Int
  --> /tmp/dojo-is-prime-2.almd:5:63
  in call to math.sqrt()
  hint: Fix the argument type. Or use `to_float(x)` to convert Int to Float
  |
5 | else list.all(list.range(2, int.to_int(math.sqrt(float.to_int(n)))), (divisor) => int.rem(n, divisor) != 0)
  |                                                               ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-2.almd:5:63
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 | else list.all(list.range(2, int.to_int(math.sqrt(float.to_int(n)))), (divisor) => int.rem(n, divisor) != 0)
  |                                                               ^
error[E002]: undefined function 'int.rem'
  --> /tmp/dojo-is-prime-2.almd:5:94
  in call to int.rem()
  hint: No function 'rem' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 | else list.all(list.range(2, int.to_int(math.sqrt(float.to_int(n)))), (divisor) => int.rem(n, divisor) != 0)
  |                                                                                              ^^^^^^^
error[E001]: type mismatch in call to float.to_int(): expected Float but got Int
  --> /tmp/dojo-is-prime-2.almd:5:63
  in call to float.to_int()
  hint: Fix the expression type or change the expected type. Or use `to_float(x)` to convert Int to Float
  |
5 | else list.all(list.range(2, int.to_int(math.sqrt(float.to_int(n)))), (divisor) => int.rem(n, divisor) != 0)
  |                                                               ^
error[E001]: type mismatch in call to math.sqrt(): expected Float but got Int
  --> /tmp/dojo-is-prime-2.almd:5:63
  in call to math.sqrt()
  hint: Fix the expression type or change the expected type. Or use `to_float(x)` to convert Int to Float
  |
5 | else list.all(list.range(2, int.to_int(math.sqrt(float.to_int(n)))), (divisor) => int.rem(n, divisor) != 0)
  |                                                               ^

6 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then 
    false
  else if n < 0 then 
    false
  else 
    list.all(list.range(2, list.len(list.map(list.range(2, int.to_float(math.sqrt(float.to_int(n)))), int.to_float))), (divisor) => int.rem(n, int.to_int(divisor)) != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E005]: argument 'n' expects Float but got Int
  --> /tmp/dojo-is-prime-3.almd:5:97
  in call to float.to_int()
  hint: Fix the argument type. Or use `to_float(x)` to convert Int to Float
  |
5 | else list.all(list.range(2, list.len(list.map(list.range(2, int.to_float(math.sqrt(float.to_int(n)))), int.to_float))), (divisor) => int.rem(n, int.to_int(divisor)) != 0)
  |                                                                                                 ^
error[E005]: argument 'x' expects Float but got Int
  --> /tmp/dojo-is-prime-3.almd:5:97
  in call to math.sqrt()
  hint: Fix the argument type. Or use `to_float(x)` to convert Int to Float
  |
5 | else list.all(list.range(2, list.len(list.map(list.range(2, int.to_float(math.sqrt(float.to_int(n)))), int.to_float))), (divisor) => int.rem(n, int.to_int(divisor)) != 0)
  |                                                                                                 ^
error[E005]: argument 'n' expects Int but got Float
  --> /tmp/dojo-is-prime-3.almd:5:97
  in call to int.to_float()
  hint: Fix the argument type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
5 | else list.all(list.range(2, list.len(list.map(list.range(2, int.to_float(math.sqrt(float.to_int(n)))), int.to_float))), (divisor) => int.rem(n, int.to_int(divisor)) != 0)
  |                                                                                                 ^
error[E005]: argument 'end' expects Int but got Float
  --> /tmp/dojo-is-prime-3.almd:5:97
  in call to list.range()
  hint: Fix the argument type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
5 | else list.all(list.range(2, list.len(list.map(list.range(2, int.to_float(math.sqrt(float.to_int(n)))), int.to_float))), (divisor) => int.rem(n, int.to_int(divisor)) != 0)
  |                                                                                                 ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-3.almd:5:156
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 | else list.all(list.range(2, list.len(list.map(list.range(2, int.to_float(math.sqrt(float.to_int(n)))), int.to_float))), (divisor) => int.rem(n, int.to_int(divisor)) != 0)
  |                                                                                                                                                            ^^^^^^^
error[E002]: undefined function 'int.rem'
  --> /tmp/dojo-is-prime-3.almd:5:156
  in call to int.rem()
  hint: No function 'rem' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 | else list.all(list.range(2, list.len(list.map(list.range(2, int.to_float(math.sqrt(float.to_int(n)))), int.to_float))), (divisor) => int.rem(n, int.to_int(divisor)) != 0)
  |                                                                                                                                                            ^^^^^^^
error[E001]: type mismatch in call to float.to_int(): expected Float but got Int
  --> /tmp/dojo-is-prime-3.almd:5:97
  in call to float.to_int()
  hint: Fix the expression type or change the expected type. Or use `to_float(x)` to convert Int to Float
  |
5 | else list.all(list.range(2, list.len(list.map(list.range(2, int.to_float(math.sqrt(float.to_int(n)))), int.to_float))), (divisor) => int.rem(n, int.to_int(divisor)) != 0)
  |                                                                                                 ^
error[E001]: type mismatch in call to math.sqrt(): expected Float but got Int
  --> /tmp/dojo-is-prime-3.almd:5:97
  in call to math.sqrt()
  hint: Fix the expression type or change the expected type. Or use `to_float(x)` to convert Int to Float
  |
5 | else list.all(list.range(2, list.len(list.map(list.range(2, int.to_float(math.sqrt(float.to_int(n)))), int.to_float))), (divisor) => int.rem(n, int.to_int(divisor)) != 0)
  |                                                                                                 ^
error[E001]: type mismatch in call to int.to_float(): expected Int but got Float
  --> /tmp/dojo-is-prime-3.almd:5:97
  in call to int.to_float()
  hint: Fix the expression type or change the expected type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
5 | else list.all(list.range(2, list.len(list.map(list.range(2, int.to_float(math.sqrt(float.to_int(n)))), int.to_float))), (divisor) => int.rem(n, int.to_int(divisor)) != 0)
  |                                                                                                 ^
error[E001]: type mismatch in call to list.range(): expected Int but got Float
  --> /tmp/dojo-is-prime-3.almd:5:97
  in call to list.range()
  hint: Fix the expression type or change the expected type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
5 | else list.all(list.range(2, list.len(list.map(list.range(2, int.to_float(math.sqrt(float.to_int(n)))), int.to_float))), (divisor) => int.rem(n, int.to_int(divisor)) != 0)
  |                                                                                                 ^

10 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
