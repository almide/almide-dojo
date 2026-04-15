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
  else int.range(3, int.sqrt(n) + 1).all(x => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-is-prime-0.almd:5:44
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
5 |   else int.range(3, int.sqrt(n) + 1).all(x => n % x != 0)
  |                                            ^^

1 error(s) found
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
  else int.range(3, int.sqrt(n) + 1).all((x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-1.almd:5:30
  in call to int.sqrt()
  hint: No function 'sqrt' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |   else int.range(3, int.sqrt(n) + 1).all((x) => n % x != 0)
  |                              ^
error[E002]: undefined function 'int.range'
  --> /tmp/dojo-is-prime-1.almd:5:35
  in call to int.range()
  hint: No function 'range' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |   else int.range(3, int.sqrt(n) + 1).all((x) => n % x != 0)
  |                                   ^

2 error(s) found
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
  else math.range(3, math.sqrt(n) + 1).all((x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E003]: undefined variable 'math'
  --> /tmp/dojo-is-prime-2.almd:5:22
  in variable math
  hint: Did you mean `math.e`?
  try:
      // math  →  math.e
      math.e
  |
5 |   else math.range(3, math.sqrt(n) + 1).all((x) => n % x != 0)
  |                      ^^^^
error[E003]: undefined variable 'math'
  --> /tmp/dojo-is-prime-2.almd:5:8
  in variable math
  hint: Did you mean `math.e`?
  try:
      // math  →  math.e
      math.e
  |
5 |   else math.range(3, math.sqrt(n) + 1).all((x) => n % x != 0)
  |        ^^^^

2 error(s) found
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
  else list.range(3, int.sqrt(n) + 1).all((x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-3.almd:5:31
  in call to int.sqrt()
  hint: No function 'sqrt' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |   else list.range(3, int.sqrt(n) + 1).all((x) => n % x != 0)
  |                               ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
