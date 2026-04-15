# is-prime

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool =
  if n <= 1 then
    false
  else
    list.all(
      list.range(2, int.sqrt(n).to_int() + 1),
      (x) => n % x != 0
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-0.almd:6:30
  in call to int.sqrt()
  hint: No function 'sqrt' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |       list.range(2, int.sqrt(n).to_int() + 1),
  |                              ^

1 error(s) found
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
  else
    list.all(
      list.range(2, math.sqrt(n.to_float()).to_int() + 1),
      (x) => n % x != 0
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error[E003]: undefined variable 'math'
  --> /tmp/dojo-is-prime-1.almd:6:21
  in variable math
  hint: Did you mean `math.e`?
  try:
      // math  →  math.e
      math.e
  |
6 |       list.range(2, math.sqrt(n.to_float()).to_int() + 1),
  |                     ^^^^

1 error(s) found
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
  else
    list.all(
      list.range(2, int.sqrt(n).unwrap_or(2) + 1),
      (x) => n % x != 0
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-2.almd:6:30
  in call to int.sqrt()
  hint: No function 'sqrt' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |       list.range(2, int.sqrt(n).unwrap_or(2) + 1),
  |                              ^

1 error(s) found
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
  else
    list.all(
      list.range(2, math.sqrt(int.to_float(n)).unwrap_or(2.0).to_int() + 1),
      (x) => n % x != 0
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E003]: undefined variable 'math'
  --> /tmp/dojo-is-prime-3.almd:6:21
  in variable math
  hint: Did you mean `math.e`?
  try:
      // math  →  math.e
      math.e
  |
6 |       list.range(2, math.sqrt(int.to_float(n)).unwrap_or(2.0).to_int() + 1),
  |                     ^^^^

1 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
