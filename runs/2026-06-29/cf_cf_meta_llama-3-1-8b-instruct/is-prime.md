# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
    if n <= 1 then 
        false 
    else 
        list.all[Int](list.range(2, n), fn(x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected expression at line 5:41 (got Fn 'fn')
  --> /tmp/dojo-is-prime-0.almd:5:41
  |
5 |         list.all[Int](list.range(2, n), fn(x) => n % x != 0)
  |                                         ^
error: Expected function name at line 5:43 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:5:43
  |
5 |         list.all[Int](list.range(2, n), fn(x) => n % x != 0)
  |                                           ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_prime(n: Int) -> Bool = 
    if n <= 1 then 
        false 
    else 
        list.all[Int](list.range(2, n), (x) => n % x != 0)
```
