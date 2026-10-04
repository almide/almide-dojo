# is-prime

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, int.to_float(n).sqrt() |> float.to_int()), (x) => n % x != 0)
```

**Diagnostic:**

```
FAILED: /tmp/dojo-is-prime-0.almd
  test: is_prime 4 is false
  at:   /tmp/dojo-is-prime-0.almd:10
  expected: false
  found:    true
  test: is_prime 9 is false
  at:   /tmp/dojo-is-prime-0.almd:12
  expected: false
  found:    true
  test: is_prime 25 is false
  at:   /tmp/dojo-is-prime-0.almd:14
  expected: false
  found:    true

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, int.to_float(n).sqrt() |> float.to_int() + 1), (x) => n % x != 0)
```
