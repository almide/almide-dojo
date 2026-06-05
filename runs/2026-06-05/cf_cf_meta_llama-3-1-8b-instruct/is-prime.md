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
  else list.all[Int](list.range(3, n), fn(x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected expression at line 5:40 (got Fn 'fn')
  --> /tmp/dojo-is-prime-0.almd:5:40
  |
5 |   else list.all[Int](list.range(3, n), fn(x) => n % x != 0)
  |                                        ^
error: Expected function name at line 5:42 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:5:42
  |
5 |   else list.all[Int](list.range(3, n), fn(x) => n % x != 0)
  |                                          ^

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
  else list.all[Int](list.range(3, n), (x) => n % x != 0)
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
  else not (list.any[Int](list.range(2, n), (x) => n % x == 0))
```
