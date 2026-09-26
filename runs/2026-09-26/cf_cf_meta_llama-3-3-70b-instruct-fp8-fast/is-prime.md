# is-prime

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: unknown

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

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, int.min(n - 1, float.to_int(math.sqrt(int.to_float(n))))) + [n], (x) => n % x != 0 && x != n)
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 3:114
  --> /tmp/dojo-is-prime-2.almd:3:114
  here: else list.all(list.range(2, int.min(n - 1, float.to_int(math.sqrt(int.to_float(n))))) + [n], (x) => n % x != 0 && x != n)
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
3 |   else list.all(list.range(2, int.min(n - 1, float.to_int(math.sqrt(int.to_float(n))))) + [n], (x) => n % x != 0 && x != n)
  |                                                                                                                  ^

1 error(s) found
FAILED: /tmp/dojo-is-prime-2.almd
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, int.min(n - 1, float.to_int(math.sqrt(int.to_float(n))))) + [n], (x) => n % x != 0 and x != n)
```

**Diagnostic:**

```
FAILED: /tmp/dojo-is-prime-3.almd
  test: is_prime 2 is true
  at:   /tmp/dojo-is-prime-3.almd:8
  expected: true
  found:    false
  test: is_prime 3 is true
  at:   /tmp/dojo-is-prime-3.almd:9
  expected: true
  found:    false
  test: is_prime 7 is true
  at:   /tmp/dojo-is-prime-3.almd:11
  expected: true
  found:    false
  test: is_prime 17 is true
  at:   /tmp/dojo-is-prime-3.almd:13
  expected: true
  found:    false
  test: is_prime 97 is true
  at:   /tmp/dojo-is-prime-3.almd:15
  expected: true
  found:    false

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
