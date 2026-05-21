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
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all[Int](list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected expression at line 5:67 (got Fn 'fn')
  --> /tmp/dojo-is-prime-0.almd:5:67
  |
5 |   else list.all[Int](list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0)
  |                                                                   ^
error: Expected function name at line 5:69 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:5:69
  |
5 |   else list.all[Int](list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0)
  |                                                                     ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n < 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all[Int](list.range(3, int.to_int(math.sqrt(n)) + 1), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error[E005]: argument 'x' expects Float but got Int
  --> /tmp/dojo-is-prime-1.almd:6:55
  in call to math.sqrt()
  hint: Fix the argument type. Or use `to_float(x)` to convert Int to Float
  |
6 | else list.all[Int](list.range(3, int.to_int(math.sqrt(n)) + 1), (x) => n % x != 0)
  |                                                       ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-1.almd:6:55
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 | else list.all[Int](list.range(3, int.to_int(math.sqrt(n)) + 1), (x) => n % x != 0)
  |                                                       ^
error[E001]: type mismatch in call to math.sqrt(): expected Float but got Int
  --> /tmp/dojo-is-prime-1.almd:6:55
  in call to math.sqrt()
  hint: Fix the expression type or change the expected type. Or use `to_float(x)` to convert Int to Float
  |
6 | else list.all[Int](list.range(3, int.to_int(math.sqrt(n)) + 1), (x) => n % x != 0)
  |                                                       ^

3 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n < 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all[Int](list.range(3, list.to_int(math.sqrt(n)) + 1), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E005]: argument 'x' expects Float but got Int
  --> /tmp/dojo-is-prime-2.almd:6:56
  in call to math.sqrt()
  hint: Fix the argument type. Or use `to_float(x)` to convert Int to Float
  |
6 | else list.all[Int](list.range(3, list.to_int(math.sqrt(n)) + 1), (x) => n % x != 0)
  |                                                        ^
error[E002]: undefined function 'list.to_int'
  --> /tmp/dojo-is-prime-2.almd:6:56
  in call to list.to_int()
  hint: No function 'to_int' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
6 | else list.all[Int](list.range(3, list.to_int(math.sqrt(n)) + 1), (x) => n % x != 0)
  |                                                        ^
error[E001]: type mismatch in call to math.sqrt(): expected Float but got Int
  --> /tmp/dojo-is-prime-2.almd:6:56
  in call to math.sqrt()
  hint: Fix the expression type or change the expected type. Or use `to_float(x)` to convert Int to Float
  |
6 | else list.all[Int](list.range(3, list.to_int(math.sqrt(n)) + 1), (x) => n % x != 0)
  |                                                        ^

3 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n < 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all[Int](list.range(3, int.to_int(math.to_float(math.sqrt(n))) + 1), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E005]: argument 'x' expects Float but got Int
  --> /tmp/dojo-is-prime-3.almd:6:69
  in call to math.sqrt()
  hint: Fix the argument type. Or use `to_float(x)` to convert Int to Float
  |
6 | else list.all[Int](list.range(3, int.to_int(math.to_float(math.sqrt(n))) + 1), (x) => n % x != 0)
  |                                                                     ^
error[E002]: undefined function 'math.to_float'
  --> /tmp/dojo-is-prime-3.almd:6:69
  in call to math.to_float()
  hint: No function 'to_float' in module 'math'. See docs/CHEATSHEET.md for available functions
  |
6 | else list.all[Int](list.range(3, int.to_int(math.to_float(math.sqrt(n))) + 1), (x) => n % x != 0)
  |                                                                     ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-3.almd:6:69
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 | else list.all[Int](list.range(3, int.to_int(math.to_float(math.sqrt(n))) + 1), (x) => n % x != 0)
  |                                                                     ^
error[E001]: type mismatch in call to math.sqrt(): expected Float but got Int
  --> /tmp/dojo-is-prime-3.almd:6:69
  in call to math.sqrt()
  hint: Fix the expression type or change the expected type. Or use `to_float(x)` to convert Int to Float
  |
6 | else list.all[Int](list.range(3, int.to_int(math.to_float(math.sqrt(n))) + 1), (x) => n % x != 0)
  |                                                                     ^

4 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
