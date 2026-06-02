# gcd

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn gcd(a: Int, b: Int) -> Int {
  if b == 0 then a
  else gcd(b, a % b)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-gcd-0.almd
error: Missing '=' before function body at line 1:31
  --> /tmp/dojo-gcd-0.almd:1:31
  hint: Almide requires '=' before the body. Write: fn gcd(...) -> Type = { ... }
  |
1 | fn gcd(a: Int, b: Int) -> Int {
  |                               ^

1 error(s) found
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
