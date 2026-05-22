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
    let is_divisible = (x: Int) => x * x <= n && n % x == 0
    not (list.some(list.range(3, int.to_int(math.sqrt(n)) + 1), is_divisible))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-0.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let is_divisible = (x: Int) => x * x <= n && n % x == 0
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
    not (list.some(list.range(3, int.to_int(math.sqrt(n)) + 1), (x: Int) => x * x < n && n % x == 0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected name at line 6:15 (got Some 'some')
  --> /tmp/dojo-is-prime-1.almd:6:15
  |
6 |     not (list.some(list.range(3, int.to_int(math.sqrt(n)) + 1), (x: Int) => x * x < n && n % x == 0))
  |               ^

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
    not (list.some(list.range(3, int.to_int(math.sqrt(n)) + 1), (x: Int) => x * x <= n && n % x == 0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected name at line 6:15 (got Some 'some')
  --> /tmp/dojo-is-prime-2.almd:6:15
  |
6 |     not (list.some(list.range(3, int.to_int(math.sqrt(n)) + 1), (x: Int) => x * x <= n && n % x == 0))
  |               ^

1 error(s) found
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
    not (list.some(list.range(3, int.to_int(math.sqrt(n)) + 1), (x: Int) => x * x <= n && n % x == 0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: Expected name at line 6:15 (got Some 'some')
  --> /tmp/dojo-is-prime-3.almd:6:15
  |
6 |     not (list.some(list.range(3, int.to_int(math.sqrt(n)) + 1), (x: Int) => x * x <= n && n % x == 0))
  |               ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
