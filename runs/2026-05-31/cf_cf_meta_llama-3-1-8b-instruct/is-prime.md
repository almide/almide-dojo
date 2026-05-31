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
    let f = (i: Int) => i * i <= n
    let rec check_divisor = (i: Int) => 
      if f(i) then i != n && n % i == 0
      else check_divisor(i + 1)
    check_divisor(3)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-0.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let f = (i: Int) => i * i <= n
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
    let f = fn(i: Int) -> i * i < n
    let rec check_divisor = fn(i: Int) -> 
      if f(i) then i != n && n % i == 0
      else check_divisor(i + 1)
    check_divisor(3)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-1.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let f = fn(i: Int) -> i * i < n
  |     ^^^
error: Expected function name at line 6:15 (got LParen '(')
  --> /tmp/dojo-is-prime-1.almd:6:15
  |
6 |     let f = fn(i: Int) -> i * i < n
  |               ^
error: Expected function name at line 7:31 (got LParen '(')
  --> /tmp/dojo-is-prime-1.almd:7:31
  |
7 |     let rec check_divisor = fn(i: Int) ->
  |                               ^

3 error(s) found
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
    let f = fn(i: Int) -> i * i >= n
    let rec check_divisor = fn(i: Int) -> 
      if f(i) then i != n && n % i == 0
      else check_divisor(i + 1)
    check_divisor(3)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-2.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let f = fn(i: Int) -> i * i >= n
  |     ^^^
error: Expected function name at line 6:15 (got LParen '(')
  --> /tmp/dojo-is-prime-2.almd:6:15
  |
6 |     let f = fn(i: Int) -> i * i >= n
  |               ^
error: Expected function name at line 7:31 (got LParen '(')
  --> /tmp/dojo-is-prime-2.almd:7:31
  |
7 |     let rec check_divisor = fn(i: Int) ->
  |                               ^

3 error(s) found
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
    let f = fn(i: Int) -> i * i >= n
    let rec check_divisor = fn(i: Int) -> 
      if f(i) then i != n && n % i == 0
      else { let next_i = i + 1; check_divisor(next_i) }
    check_divisor(3)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-3.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let f = fn(i: Int) -> i * i >= n
  |     ^^^
error: Expected function name at line 6:15 (got LParen '(')
  --> /tmp/dojo-is-prime-3.almd:6:15
  |
6 |     let f = fn(i: Int) -> i * i >= n
  |               ^
error: Expected function name at line 7:31 (got LParen '(')
  --> /tmp/dojo-is-prime-3.almd:7:31
  |
7 |     let rec check_divisor = fn(i: Int) ->
  |                               ^

3 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
