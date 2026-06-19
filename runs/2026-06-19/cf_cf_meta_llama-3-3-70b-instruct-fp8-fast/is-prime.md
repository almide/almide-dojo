# is-prime

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, int.to_float(n).|> float.sqrt().|> float.to_int()), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected name at line 3:47 (got PipeArrow '|>')
  --> /tmp/dojo-is-prime-0.almd:3:47
  |
3 |   else list.all(list.range(2, int.to_float(n).|> float.sqrt().|> float.to_int()), (x) => n % x != 0)
  |                                               ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, float.to_int(float.sqrt(int.to_float(n)))), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, int.min(int.to_int(float.sqrt(int.to_float(n))) + 1, n)), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-2.almd:3:74
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   else list.all(list.range(2, int.min(int.to_int(float.sqrt(int.to_float(n))) + 1, n)), (x) => n % x != 0)
  |                                                                          ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, int.min(int.from_hex(string.to_hex(int.to_string(float.to_int(float.sqrt(int.to_float(n))))) ), n)), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E002]: undefined function 'string.to_hex'
  --> /tmp/dojo-is-prime-3.almd:3:117
  in call to string.to_hex()
  hint: No function 'to_hex' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   else list.all(list.range(2, int.min(int.from_hex(string.to_hex(int.to_string(float.to_int(float.sqrt(int.to_float(n))))) ), n)), (x) => n % x != 0)
  |                                                                                                                     ^
error[E005]: argument 'a' expects Int but got Result[Int, String]
  --> /tmp/dojo-is-prime-3.almd:3:127
  in call to int.min()
  hint: Fix the argument type
  |
3 |   else list.all(list.range(2, int.min(int.from_hex(string.to_hex(int.to_string(float.to_int(float.sqrt(int.to_float(n))))) ), n)), (x) => n % x != 0)
  |                                                                                                                               ^
error[E001]: type mismatch in call to int.min(): expected Int but got Result[Int, String]
  --> /tmp/dojo-is-prime-3.almd:3:127
  in call to int.min()
  hint: Fix the expression type or change the expected type
  |
3 |   else list.all(list.range(2, int.min(int.from_hex(string.to_hex(int.to_string(float.to_int(float.sqrt(int.to_float(n))))) ), n)), (x) => n % x != 0)
  |                                                                                                                               ^

3 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
