# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all[Int](list.range(3, int.to_float(n)), (x) => n % x != 0)
```

**Diagnostic:**

```
error[E005]: argument 'end' expects Int but got Float
  --> /tmp/dojo-is-prime-0.almd:5:36
  in call to list.range()
  here: else list.all[Int](list.range(3, int.to_float(n)), (x) => n % x != 0)
  hint: Fix the argument type. Or use `float.to_int(x)` to convert Float to Int (truncates)
  try:
      // Try:
      float.to_int(int.to_float(n))
...
5 |   else list.all[Int](list.range(3, int.to_float(n)), (x) => n % x != 0)
  |                                    ^^^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-is-prime-0.almd
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all[Int](list.range(3, float.to_int(int.to_float(n))), (x) => n % x != 0)
```
