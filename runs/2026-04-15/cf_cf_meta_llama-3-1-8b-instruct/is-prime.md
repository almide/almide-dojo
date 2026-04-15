# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.for_each(list.range(3, n), (x) => if n % x == 0 then false else true)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error[E002]: undefined function 'list.for_each'
  --> /tmp/dojo-is-prime-0.almd:5:77
  in call to list.for_each()
  hint: No function 'for_each' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
5 |   else list.for_each(list.range(3, n), (x) => if n % x == 0 then false else true)
  |                                                                             ^^^^

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
  else list.all(list.range(3, n), (x) => n % x != 0)
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
  if n < 2 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all(list.range(3, n), (x) => x * x <= n && n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: '&&' is not valid in Almide at line 5:53
  --> /tmp/dojo-is-prime-2.almd:5:53
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |   else list.all(list.range(3, n), (x) => x * x <= n && n % x != 0)
  |                                                     ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n < 2 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all(list.range(3, n), (x) => x * x < n and n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
