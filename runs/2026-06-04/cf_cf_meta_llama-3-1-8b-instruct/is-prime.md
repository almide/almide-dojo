# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  n <= 1 -> false
  | n == 2 -> true
  | n % 2 == 0 -> false
  | otherwise -> 
    let test_divisor = int.sqrt(n) in
    let is_divisible = (n % _) == 0 for _ in 3..test_divisor by 2 in
    not is_divisible
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:10 (got Arrow '->')
  --> /tmp/dojo-is-prime-0.almd:2:10
  |
2 |   n <= 1 -> false
  |          ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  n < 1 -> false
  | n == 2 -> true
  | n % 2 == 0 -> false
  | n == 0 -> false
  | n == 1 -> false
  | otherwise -> 
    let test_divisor = int.sqrt(n) in
    let is_divisible = (n % _) == 0 for _ in 3..test_divisor by 2 in
    not is_divisible
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:9 (got Arrow '->')
  --> /tmp/dojo-is-prime-1.almd:2:9
  |
2 |   n < 1 -> false
  |         ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  n < 1 -> false
  | n == 2 -> true
  | n % 2 == 0 -> false
  | n == 0 -> false
  | n == 1 -> false
  | otherwise -> 
    let test_divisor = int.to_int(float.sqrt(int.to_float(n))) in
    let is_divisible = (n % _) == 0 for _ in 3..test_divisor by 2 in
    not is_divisible
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:9 (got Arrow '->')
  --> /tmp/dojo-is-prime-2.almd:2:9
  |
2 |   n < 1 -> false
  |         ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  n < 1 -> false
  | n == 2 -> true
  | n % 2 == 0 -> false
  | n == 0 -> false
  | n == 1 -> false
  | otherwise -> 
    let test_divisor = int.to_int(float.sqrt(int.to_float(n))) in
    let is_divisible = (n % _) == 0 for _ in 3..test_divisor by 2 in
    not is_divisible
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:9 (got Arrow '->')
  --> /tmp/dojo-is-prime-3.almd:2:9
  |
2 |   n < 1 -> false
  |         ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
