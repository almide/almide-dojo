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
    let is_divisible = list.any(list.range(3, n), fn(x) => n % x == 0)
    not is_divisible
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-0.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let is_divisible = list.any(list.range(3, n), fn(x) => n % x == 0)
  |     ^^^
error: Expected function name at line 6:53 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:6:53
  |
6 |     let is_divisible = list.any(list.range(3, n), fn(x) => n % x == 0)
  |                                                     ^

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
    not (list.any(list.range(3, n), fn(x) => n % x == 0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected expression at line 6:37 (got Fn 'fn')
  --> /tmp/dojo-is-prime-1.almd:6:37
  |
6 |     not (list.any(list.range(3, n), fn(x) => n % x == 0))
  |                                     ^
error: Expected function name at line 6:39 (got LParen '(')
  --> /tmp/dojo-is-prime-1.almd:6:39
  |
6 |     not (list.any(list.range(3, n), fn(x) => n % x == 0))
  |                                       ^

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
  else not (list.any(list.range(3, n), (x) => n % x == 0))
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
  else not (list.any(list.range(2, n), (x) => n % x == 0))
```
