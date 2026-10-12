# is-prime

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, int.to_float(n).|> math.sqrt().|> float.to_int()), (x) => n % x != 0)
```

**Diagnostic:**

```
error: Expected name at line 3:47 (got PipeArrow '|>')
  --> /tmp/dojo-is-prime-0.almd:3:47
  here: else list.all(list.range(2, int.to_float(n).|> math.sqrt().|> float.to_int()), (x) => n % x != 0)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   else list.all(list.range(2, int.to_float(n).|> math.sqrt().|> float.to_int()), (x) => n % x != 0)
  |                                               ^

1 error(s) found
FAILED: /tmp/dojo-is-prime-0.almd
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, float.to_int(math.sqrt(int.to_float(n)))), (x) => n % x != 0)
```

**Diagnostic:**

```
FAILED: /tmp/dojo-is-prime-1.almd
  test: is_prime 4 is false
  at:   /tmp/dojo-is-prime-1.almd:10
  expected: false
  found:    true
  test: is_prime 9 is false
  at:   /tmp/dojo-is-prime-1.almd:12
  expected: false
  found:    true
  test: is_prime 25 is false
  at:   /tmp/dojo-is-prime-1.almd:14
  expected: false
  found:    true

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (PASS)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, int.min(n - 1, float.to_int(math.sqrt(int.to_float(n)))) + 1), (x) => n % x != 0)
```
