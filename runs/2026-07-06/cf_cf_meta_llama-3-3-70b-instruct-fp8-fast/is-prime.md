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
  else list.all(list.range(2, float.to_int(float.sqrt(float.from_int(n)))), (x) => n % x != 0)
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
  else list.all(list.range(2, float.to_int(float.sqrt(float.to_float(n)) + 1)), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E002]: undefined function 'float.to_float'
  --> /tmp/dojo-is-prime-2.almd:3:70
  in call to float.to_float()
  hint: No function 'to_float' in module 'float'. See docs/CHEATSHEET.md for available functions
  |
3 |   else list.all(list.range(2, float.to_int(float.sqrt(float.to_float(n)) + 1)), (x) => n % x != 0)
  |                                                                      ^

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
  else list.all(list.range(2, int.to_int(float.sqrt(int.to_float(n)) + 1)), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-3.almd:3:72
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   else list.all(list.range(2, int.to_int(float.sqrt(int.to_float(n)) + 1)), (x) => n % x != 0)
  |                                                                        ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
