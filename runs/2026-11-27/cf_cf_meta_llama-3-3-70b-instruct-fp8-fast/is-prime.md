# is-prime

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, int.sqrt(float.from(n)).to_int()), (x) => n % x != 0)
```

**Diagnostic:**

```
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-0.almd:3:31
  in call to int.sqrt()
  here: else list.all(list.range(2, int.sqrt(float.from(n)).to_int()), (x) => n % x != 0)
  hint: Did you mean `math.sqrt(float.from(n))`?
  try:
      // Almide has math.sqrt; int.sqrt doesn't exist.
      // Convert → sqrt → (optionally) convert back:
      let root_f = math.sqrt(float.from(n))          // Float
      let root_i = int.from_saturating(root_f)       // Int (truncates)
      // — or inline: int.from_saturating(math.sqrt(float.from(n)))
  |
3 |   else list.all(list.range(2, int.sqrt(float.from(n)).to_int()), (x) => n % x != 0)
  |                               ^^^^^^^^

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
  else list.all(list.range(2, int.from_saturating(math.sqrt(float.from(n)))), (x) => n % x != 0)
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

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, int.from_saturating(math.sqrt(float.from(n)) + 1)), (x) => n % x != 0)
```

**Diagnostic:**

```
internal compiler error: IR verify: AddFloat expects Float operands, got Float and Int (in is_prime) at line 3
FAILED: /tmp/dojo-is-prime-2.almd
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (PASS)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, int.from_saturating(math.sqrt(float.from(n)) + 1.0)), (x) => n % x != 0)
```
