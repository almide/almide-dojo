# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else 
    let is_prime_candidate = (x) => x > 1 && x < n && n % x != 0
    list.all(list.range(3, int.to_float(n) / 2.0), is_prime_candidate)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-0.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let is_prime_candidate = (x) => x > 1 && x < n && n % x != 0
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
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else 
    list.all(list.range(3, int.to_float(n) / 2.0), (x) => x > 1 && x < n && n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: '&&' is not valid in Almide at line 6:65
  --> /tmp/dojo-is-prime-1.almd:6:65
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
6 |     list.all(list.range(3, int.to_float(n) / 2.0), (x) => x > 1 && x < n && n % x != 0)
  |                                                                 ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else 
    list.all(list.range(3, int.to_float(n) / 2.0), (x) => x > 1 and x < n and n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E005]: argument 'end' expects Int but got Float
  --> /tmp/dojo-is-prime-2.almd:6:46
  in call to list.range()
  hint: Fix the argument type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
6 |     list.all(list.range(3, int.to_float(n) / 2.0), (x) => x > 1 and x < n and n % x != 0)
  |                                              ^^^
error[E001]: type mismatch in call to list.range(): expected Int but got Float
  --> /tmp/dojo-is-prime-2.almd:6:46
  in call to list.range()
  hint: Fix the expression type or change the expected type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
6 |     list.all(list.range(3, int.to_float(n) / 2.0), (x) => x > 1 and x < n and n % x != 0)
  |                                              ^^^

2 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else 
    list.all(list.range(3, int.to_int(int.to_float(n) / 2.0)), (x) => x > 1 and x < n and n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-3.almd:6:57
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |     list.all(list.range(3, int.to_int(int.to_float(n) / 2.0)), (x) => x > 1 and x < n and n % x != 0)
  |                                                         ^^^

1 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
