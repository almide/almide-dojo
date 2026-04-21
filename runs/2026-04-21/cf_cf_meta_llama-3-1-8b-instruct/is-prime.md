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
    let max_divisor = int.sqrt(n)
    let is_prime = (2..max_divisor).all(fn(x) => n % x != 0)
    is_prime

// or 

fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else 
    let max_divisor = int.sqrt(n)
    list.all((2..max_divisor), fn(x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-0.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let max_divisor = int.sqrt(n)
  |     ^^^
error: Expected function name at line 7:43 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:7:43
  |
7 |     let is_prime = (2..max_divisor).all(fn(x) => n % x != 0)
  |                                           ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-0.almd:17:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
17 |     let max_divisor = int.sqrt(n)
   |     ^^^
error: Expected function name at line 18:34 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:18:34
   |
18 |     list.all((2..max_divisor), fn(x) => n % x != 0)
   |                                  ^

4 error(s) found
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
    let max_divisor = int.sqrt(n)
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
6 |     let max_divisor = int.sqrt(n)
  |     ^^^
error: Expected function name at line 7:28 (got LParen '(')
  --> /tmp/dojo-is-prime-1.almd:7:28
  |
7 |     (2..max_divisor).all(fn(x) => n % x != 0)
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
    let max_divisor = int.sqrt(n)
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
6 |     let max_divisor = int.sqrt(n)
  |     ^^^
error: Expected function name at line 7:28 (got LParen '(')
  --> /tmp/dojo-is-prime-2.almd:7:28
  |
7 |     (2..max_divisor).all(fn(x) => n % x != 0)
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
    let max_divisor = int.sqrt(n)
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
6 |     let max_divisor = int.sqrt(n)
  |     ^^^
error: Expected function name at line 7:28 (got LParen '(')
  --> /tmp/dojo-is-prime-3.almd:7:28
  |
7 |     (2..max_divisor).all(fn(x) => n % x != 0)
  |                            ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
