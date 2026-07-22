# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else if n == 2 then true 
  else if n % 2 == 0 then false 
  else list.all(list.range(3, int.to_float(n)), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error[E005]: argument 'end' expects Int but got Float
  --> /tmp/dojo-is-prime-0.almd:5:44
  in call to list.range()
  hint: Fix the argument type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
5 |   else list.all(list.range(3, int.to_float(n)), (x) => n % x != 0)
  |                                            ^
error[E001]: type mismatch in call to list.range(): expected Int but got Float
  --> /tmp/dojo-is-prime-0.almd:5:44
  in call to list.range()
  hint: Fix the expression type or change the expected type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
5 |   else list.all(list.range(3, int.to_float(n)), (x) => n % x != 0)
  |                                            ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else if n == 2 then true 
  else if n % 2 == 0 then false 
  else list.all(list.range(3, int.to_int(int.floor(int.to_float(n)))), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error[E002]: undefined function 'int.floor'
  --> /tmp/dojo-is-prime-1.almd:5:65
  in call to int.floor()
  hint: No function 'floor' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |   else list.all(list.range(3, int.to_int(int.floor(int.to_float(n)))), (x) => n % x != 0)
  |                                                                 ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-1.almd:5:65
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |   else list.all(list.range(3, int.to_int(int.floor(int.to_float(n)))), (x) => n % x != 0)
  |                                                                 ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else if n == 2 then true 
  else if n % 2 == 0 then false 
  else list.all(list.range(3, int.to_int(math.floor(float.to_float(n)))), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E002]: undefined function 'float.to_float'
  --> /tmp/dojo-is-prime-2.almd:6:66
  in call to float.to_float()
  hint: No function 'to_float' in module 'float'. See docs/CHEATSHEET.md for available functions
  |
6 | else list.all(list.range(3, int.to_int(math.floor(float.to_float(n)))), (x) => n % x != 0)
  |                                                                  ^
error[E002]: undefined function 'math.floor'
  --> /tmp/dojo-is-prime-2.almd:6:66
  in call to math.floor()
  hint: No function 'floor' in module 'math'. See docs/CHEATSHEET.md for available functions
  |
6 | else list.all(list.range(3, int.to_int(math.floor(float.to_float(n)))), (x) => n % x != 0)
  |                                                                  ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-2.almd:6:66
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 | else list.all(list.range(3, int.to_int(math.floor(float.to_float(n)))), (x) => n % x != 0)
  |                                                                  ^

3 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else if n == 2 then true 
  else if n % 2 == 0 then false 
  else list.all(list.range(3, math.ceil(float.sqrt(float.to_float(n)))), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E002]: undefined function 'float.to_float'
  --> /tmp/dojo-is-prime-3.almd:6:65
  in call to float.to_float()
  hint: No function 'to_float' in module 'float'. See docs/CHEATSHEET.md for available functions
  |
6 | else list.all(list.range(3, math.ceil(float.sqrt(float.to_float(n)))), (x) => n % x != 0)
  |                                                                 ^
error[E002]: undefined function 'math.ceil'
  --> /tmp/dojo-is-prime-3.almd:6:65
  in call to math.ceil()
  hint: No function 'ceil' in module 'math'. See docs/CHEATSHEET.md for available functions
  |
6 | else list.all(list.range(3, math.ceil(float.sqrt(float.to_float(n)))), (x) => n % x != 0)
  |                                                                 ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
