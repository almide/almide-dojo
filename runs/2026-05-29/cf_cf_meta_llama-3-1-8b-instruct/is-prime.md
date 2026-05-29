# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = if n <= 1 then false else if n == 2 then true else if n % 2 == 0 then false else list.all[Int](list.range(3, list.int_to_float(n) + 1), fn(x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected expression at line 1:167 (got Fn 'fn')
  --> /tmp/dojo-is-prime-0.almd:1:167
  |
1 | fn is_prime(n: Int) -> Bool = if n <= 1 then false else if n == 2 then true else if n % 2 == 0 then false else list.all[Int](list.range(3, list.int_to_float(n) + 1), fn(x) => n % x != 0)
  |                                                                                                                                                                       ^
error: Expected function name at line 1:169 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:1:169
  |
1 | fn is_prime(n: Int) -> Bool = if n <= 1 then false else if n == 2 then true else if n % 2 == 0 then false else list.all[Int](list.range(3, list.int_to_float(n) + 1), fn(x) => n % x != 0)
  |                                                                                                                                                                         ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = if n < 1 then false else if n == 2 then true else if n % 2 == 0 then false else list.all[Int](list.range(3, list.int_to_float(n) + 1), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error[E002]: undefined function 'list.int_to_float'
  --> /tmp/dojo-is-prime-1.almd:1:157
  in call to list.int_to_float()
  hint: No function 'int_to_float' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
1 | fn is_prime(n: Int) -> Bool = if n < 1 then false else if n == 2 then true else if n % 2 == 0 then false else list.all[Int](list.range(3, list.int_to_float(n) + 1), (x) => n % x != 0)
  |                                                                                                                                                             ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = if n < 1 then false else if n == 2 then true else if n % 2 == 0 then false else list.all[Int](list.range(3, int.to_float(n) + 1), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E005]: argument 'end' expects Int but got Float
  --> /tmp/dojo-is-prime-2.almd:1:157
  in call to list.range()
  hint: Fix the argument type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
1 | fn is_prime(n: Int) -> Bool = if n < 1 then false else if n == 2 then true else if n % 2 == 0 then false else list.all[Int](list.range(3, int.to_float(n) + 1), (x) => n % x != 0)
  |                                                                                                                                                             ^
error[E001]: type mismatch in call to list.range(): expected Int but got Float
  --> /tmp/dojo-is-prime-2.almd:1:157
  in call to list.range()
  hint: Fix the expression type or change the expected type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
1 | fn is_prime(n: Int) -> Bool = if n < 1 then false else if n == 2 then true else if n % 2 == 0 then false else list.all[Int](list.range(3, int.to_float(n) + 1), (x) => n % x != 0)
  |                                                                                                                                                             ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = if n < 1 then false else if n == 2 then true else if n % 2 == 0 then false else list.all[Int](list.range(3, int.to_int(int.to_float(n) + 1)), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-3.almd:1:168
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
1 | fn is_prime(n: Int) -> Bool = if n < 1 then false else if n == 2 then true else if n % 2 == 0 then false else list.all[Int](list.range(3, int.to_int(int.to_float(n) + 1)), (x) => n % x != 0)
  |                                                                                                                                                                        ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
