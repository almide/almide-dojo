# gcd

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn gcd(a: Int, b: Int) -> Int = 
  if b == 0 then a 
  else gcd(b, int.mod(a, b))
```

**Diagnostic:**

```
Compiling /tmp/dojo-gcd-0.almd
error: Expected name at line 3:19 (got Mod 'mod')
  --> /tmp/dojo-gcd-0.almd:3:19
  |
3 |   else gcd(b, int.mod(a, b))
  |                   ^
error: Expected Fn at line 3:22 (got LParen '(')
  --> /tmp/dojo-gcd-0.almd:3:22
  |
3 |   else gcd(b, int.mod(a, b))
  |                      ^

2 error(s) found
Compile error for /tmp/dojo-gcd-0.almd:
compile failed
FAILED: /tmp/dojo-gcd-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn gcd(a: Int, b: Int) -> Int = 
  if b == 0 then a 
  else gcd(b, a % b)
```
