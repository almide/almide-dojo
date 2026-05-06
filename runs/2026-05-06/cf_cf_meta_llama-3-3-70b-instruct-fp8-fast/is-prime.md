# is-prime

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: unknown

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
error: Expected name at line 3:49 (got PipeArrow '|>')
  --> /tmp/dojo-is-prime-0.almd:3:49
  |
3 |     else list.all(list.range(2, int.to_float(n).|> float.sqrt().|> float.to_int()), (x) => n % x != 0)
  |                                                 ^

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
    else list.all(list.range(2, float.to_int(float.sqrt(float.to_int(n)))), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error[E005]: argument 'n' expects Float but got Int
  --> /tmp/dojo-is-prime-1.almd:3:70
  in call to float.to_int()
  hint: Fix the argument type. Or use `to_float(x)` to convert Int to Float
  |
3 |     else list.all(list.range(2, float.to_int(float.sqrt(float.to_int(n)))), (x) => n % x != 0)
  |                                                                      ^
error[E005]: argument 'n' expects Float but got Int
  --> /tmp/dojo-is-prime-1.almd:3:70
  in call to float.sqrt()
  hint: Fix the argument type. Or use `to_float(x)` to convert Int to Float
  |
3 |     else list.all(list.range(2, float.to_int(float.sqrt(float.to_int(n)))), (x) => n % x != 0)
  |                                                                      ^
error[E001]: type mismatch in call to float.to_int(): expected Float but got Int
  --> /tmp/dojo-is-prime-1.almd:3:70
  in call to float.to_int()
  hint: Fix the expression type or change the expected type. Or use `to_float(x)` to convert Int to Float
  |
3 |     else list.all(list.range(2, float.to_int(float.sqrt(float.to_int(n)))), (x) => n % x != 0)
  |                                                                      ^
error[E001]: type mismatch in call to float.sqrt(): expected Float but got Int
  --> /tmp/dojo-is-prime-1.almd:3:70
  in call to float.sqrt()
  hint: Fix the expression type or change the expected type. Or use `to_float(x)` to convert Int to Float
  |
3 |     else list.all(list.range(2, float.to_int(float.sqrt(float.to_int(n)))), (x) => n % x != 0)
  |                                                                      ^

4 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
    if n <= 1 then false
    else list.all(list.range(2, int.to_int(math.sqrt(int.to_float(n)))), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-2.almd:4:63
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
4 | else list.all(list.range(2, int.to_int(math.sqrt(int.to_float(n)))), (x) => n % x != 0)
  |                                                               ^

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
    else list.all(list.range(2, float.to_int(math.sqrt(int.to_float(n)) + 1)), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
internal compiler error: IR verify: AddFloat expects Float operands, got Float and Int (in is_prime) at line 4
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
