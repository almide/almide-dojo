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
    else (2..int.to_float(n).sqrt().to_int()).all((d) => n % d != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
    if n <= 1 then false
    else if n == 2 then true
    else if n % 2 == 0 then false
    else (2..int.to_float(math.sqrt(n)).to_int()).all((d) => n % d != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error[E003]: undefined variable 'math'
  --> /tmp/dojo-is-prime-1.almd:5:27
  in variable math
  hint: Did you mean `math.e`?
  try:
      // math  →  math.e
      math.e
  |
5 |     else (2..int.to_float(math.sqrt(n)).to_int()).all((d) => n % d != 0)
  |                           ^^^^

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
    else if n == 2 then true
    else if n % 2 == 0 then false
    else (2..int.to_float(float.sqrt(int.to_float(n))).to_int()).all((d) => n % d != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E005]: argument 'n' expects Int but got Float
  --> /tmp/dojo-is-prime-2.almd:5:51
  in call to int.to_float()
  hint: Fix the argument type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
5 |     else (2..int.to_float(float.sqrt(int.to_float(n))).to_int()).all((d) => n % d != 0)
  |                                                   ^
error[E001]: type mismatch in call to int.to_float(): expected Int but got Float
  --> /tmp/dojo-is-prime-2.almd:5:51
  in call to int.to_float()
  hint: Fix the expression type or change the expected type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
5 |     else (2..int.to_float(float.sqrt(int.to_float(n))).to_int()).all((d) => n % d != 0)
  |                                                   ^

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
    else if n == 2 then true
    else if n % 2 == 0 then false
    else (2..math.sqrt(float.to_int(n))).all((d) => n % d != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E005]: argument 'n' expects Float but got Int
  --> /tmp/dojo-is-prime-3.almd:5:37
  in call to float.to_int()
  hint: Fix the argument type. Or use `to_float(x)` to convert Int to Float
  |
5 |     else (2..math.sqrt(float.to_int(n))).all((d) => n % d != 0)
  |                                     ^
error[E003]: undefined variable 'math'
  --> /tmp/dojo-is-prime-3.almd:5:14
  in variable math
  hint: Did you mean `math.e`?
  try:
      // math  →  math.e
      math.e
  |
5 |     else (2..math.sqrt(float.to_int(n))).all((d) => n % d != 0)
  |              ^^^^
error[E001]: type mismatch in call to float.to_int(): expected Float but got Int
  --> /tmp/dojo-is-prime-3.almd:5:37
  in call to float.to_int()
  hint: Fix the expression type or change the expected type. Or use `to_float(x)` to convert Int to Float
  |
5 |     else (2..math.sqrt(float.to_int(n))).all((d) => n % d != 0)
  |                                     ^

3 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
