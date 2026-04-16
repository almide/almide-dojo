# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

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
  else list.all(list.range(3, n), (x) => if n % x == 0 then false else true)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn is_prime(n: Int) -> Bool = 
  if n < 2 then false
  else if n == 2 then true
  else list.all(list.range(2, n), (x) => if n % x == 0 then false else true)
```
