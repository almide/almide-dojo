# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else 
    let is_divisor = (x: Int) => x > 1 && x < n && n % x == 0
    not (list.any(list.range(3, n), is_divisor))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-0.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let is_divisor = (x: Int) => x > 1 && x < n && n % x == 0
  |     ^^^

1 error(s) found
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
  else 
    not (list.any(list.range(3, n), (x: Int) => x > 1 && x < n && n % x == 0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: '&&' is not valid in Almide at line 6:55
  --> /tmp/dojo-is-prime-1.almd:6:55
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
6 |     not (list.any(list.range(3, n), (x: Int) => x > 1 && x < n && n % x == 0))
  |                                                       ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n < 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else 
    not (list.any(list.range(3, n), (x: Int) => x > 1 and x < n and n % x == 0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn is_prime(n: Int) -> Bool = 
  if n < 2 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else 
    not (list.any(list.range(3, n), (x: Int) => x * x <= n and n % x == 0))
```
