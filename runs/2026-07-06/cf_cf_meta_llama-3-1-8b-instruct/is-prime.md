# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else n % 2 == 0 && false || 
       (2 .. int.sqrt(n) + 1).all((i) => n % i != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: '&&' is not valid in Almide at line 4:19
  --> /tmp/dojo-is-prime-0.almd:4:19
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |   else n % 2 == 0 && false ||
  |                   ^

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
  else if n == 2 then true
  else (2 .. int.sqrt(n) + 1).all((i) => n % i != 0) && not(n % 2 == 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: '&&' is not valid in Almide at line 4:54
  --> /tmp/dojo-is-prime-1.almd:4:54
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |   else (2 .. int.sqrt(n) + 1).all((i) => n % i != 0) && not(n % 2 == 0)
  |                                                      ^

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
  else (2 .. int.sqrt(n) + 1).all((i) => n % i != 0) and not(n % 2 == 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-2.almd:4:23
  in call to int.sqrt()
  hint: Did you mean `float.sqrt(int.to_float(n))`?
  try:
      // Almide has float.sqrt; int.sqrt doesn't exist.
      // Convert → sqrt → (optionally) convert back:
      let root_f = float.sqrt(int.to_float(n))       // Float
      let root_i = float.to_int(root_f)              // Int (truncates)
      // — or inline: float.to_int(float.sqrt(int.to_float(n)))
  |
4 |   else (2 .. int.sqrt(n) + 1).all((i) => n % i != 0) and not(n % 2 == 0)
  |                       ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else (2 .. float.to_int(float.sqrt(int.to_float(n))) + 1).all((i) => n % i != 0) and not(n % 2 == 0)
```
