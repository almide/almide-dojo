# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else 
    let half = int.to_float(n) / 2.0
    let sqrt = float.sqrt(half)
    let max_divisor = int.to_int(sqrt)
    let is_prime = (2..max_divisor).all(fn(x) => n % x != 0)
    is_prime
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-0.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let half = int.to_float(n) / 2.0
  |     ^^^
error: Expected function name at line 9:43 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:9:43
  |
9 |     let is_prime = (2..max_divisor).all(fn(x) => n % x != 0)
  |                                           ^

2 error(s) found
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
    let half = int.to_float(n) / 2.0
    let sqrt = float.sqrt(half)
    let max_divisor = int.to_int(sqrt)
    (2..max_divisor).all(fn(x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-1.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let half = int.to_float(n) / 2.0
  |     ^^^
error: Expected function name at line 9:28 (got LParen '(')
  --> /tmp/dojo-is-prime-1.almd:9:28
  |
9 |     (2..max_divisor).all(fn(x) => n % x != 0)
  |                            ^

2 error(s) found
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
    let half = int.to_float(n) / 2.0
    let sqrt = float.sqrt(half)
    let max_divisor = int.to_int(sqrt)
    (2..max_divisor).all(fn(x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-2.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let half = int.to_float(n) / 2.0
  |     ^^^
error: Expected function name at line 9:28 (got LParen '(')
  --> /tmp/dojo-is-prime-2.almd:9:28
  |
9 |     (2..max_divisor).all(fn(x) => n % x != 0)
  |                            ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n < 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else
    let half = int.to_float(n) / 2.0
    let sqrt = float.sqrt(half)
    let max_divisor = int.to_int(sqrt)
    (2..max_divisor).all(fn(x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-3.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let half = int.to_float(n) / 2.0
  |     ^^^
error: Expected function name at line 9:28 (got LParen '(')
  --> /tmp/dojo-is-prime-3.almd:9:28
  |
9 |     (2..max_divisor).all(fn(x) => n % x != 0)
  |                            ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
