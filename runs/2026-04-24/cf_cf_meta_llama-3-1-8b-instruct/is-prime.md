# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all(x in list.range(3, n), (x * x > n) || (n % x != 0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected ')' to close function call opened at line 5:16
  --> /tmp/dojo-is-prime-0.almd:5:19
  hint: Add ')' or check for a missing delimiter inside the function call
  |
5 |   else list.all(x in list.range(3, n), (x * x > n) || (n % x != 0))
  |                --------------- '(' opened here
  |
5 |   else list.all(x in list.range(3, n), (x * x > n) || (n % x != 0))
  |                   ^^

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
  else list.all(x in list.range(3, n), (x * x > n) || (n % x != 0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected ')' to close function call opened at line 5:16
  --> /tmp/dojo-is-prime-1.almd:5:19
  hint: Add ')' or check for a missing delimiter inside the function call
  |
5 |   else list.all(x in list.range(3, n), (x * x > n) || (n % x != 0))
  |                --------------- '(' opened here
  |
5 |   else list.all(x in list.range(3, n), (x * x > n) || (n % x != 0))
  |                   ^^

1 error(s) found
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
  else list.all(x in list.range(3, n), (x * x > n) || (n % x != 0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected ')' to close function call opened at line 5:16
  --> /tmp/dojo-is-prime-2.almd:5:19
  hint: Add ')' or check for a missing delimiter inside the function call
  |
5 |   else list.all(x in list.range(3, n), (x * x > n) || (n % x != 0))
  |                --------------- '(' opened here
  |
5 |   else list.all(x in list.range(3, n), (x * x > n) || (n % x != 0))
  |                   ^^

1 error(s) found
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
  else list.all(x in list.range(3, n), (x * x > n) || (n % x != 0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: Expected ')' to close function call opened at line 5:16
  --> /tmp/dojo-is-prime-3.almd:5:19
  hint: Add ')' or check for a missing delimiter inside the function call
  |
5 |   else list.all(x in list.range(3, n), (x * x > n) || (n % x != 0))
  |                --------------- '(' opened here
  |
5 |   else list.all(x in list.range(3, n), (x * x > n) || (n % x != 0))
  |                   ^^

1 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
