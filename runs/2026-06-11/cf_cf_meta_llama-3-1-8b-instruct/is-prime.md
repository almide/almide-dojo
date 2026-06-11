# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else fold[A](range(3, int.to_float(n).sqrt().to_int() + 1), 3, (acc, x) => 
    if n % x == 0 then false
    else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error[E002]: undefined function 'range'
  --> /tmp/dojo-is-prime-0.almd:5:59
  in call to range()
  hint: Check the function name
  |
5 |   else fold[A](range(3, int.to_float(n).sqrt().to_int() + 1), 3, (acc, x) =>
  |                                                           ^
error[E002]: undefined function 'fold'
  --> /tmp/dojo-is-prime-0.almd:7:10
  in call to fold()
  hint: Check the function name
  |
7 |     else acc)
  |          ^^^

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
  else list.fold(list.range(3, int.to_float(n).sqrt().to_int() + 1), 3, (acc, x) => 
    if n % x == 0 then false
    else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got fn(Bool, ?1) -> Bool
  --> /tmp/dojo-is-prime-1.almd:7:10
  in call to list.fold()
  hint: Fix the argument type
  |
7 |     else acc)
  |          ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(Int, Int) -> Int but got fn(Bool, ?1) -> Bool
  --> /tmp/dojo-is-prime-1.almd:7:10
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
7 |     else acc)
  |          ^^^
error[E001]: type mismatch in if branches: expected Bool but got Int
  --> /tmp/dojo-is-prime-1.almd:7:10
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
7 |     else acc)
  |          ^^^

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
  else list.fold(list.range(3, int.to_float(n).sqrt().to_int() + 1), 1, (acc, x) => 
    if n % x == 0 then false
    else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got fn(Bool, ?1) -> Bool
  --> /tmp/dojo-is-prime-2.almd:7:10
  in call to list.fold()
  hint: Fix the argument type
  |
7 |     else acc)
  |          ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(Int, Int) -> Int but got fn(Bool, ?1) -> Bool
  --> /tmp/dojo-is-prime-2.almd:7:10
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
7 |     else acc)
  |          ^^^
error[E001]: type mismatch in if branches: expected Bool but got Int
  --> /tmp/dojo-is-prime-2.almd:7:10
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
7 |     else acc)
  |          ^^^

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
  else list.fold(list.range(3, int.to_float(n).sqrt().to_int() + 1), 1, (acc, x) => 
    if n % x == 0 then false
    else if x > int.to_float(n).sqrt().to_int() then true
    else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got fn(Bool, Int) -> Bool
  --> /tmp/dojo-is-prime-3.almd:8:10
  in call to list.fold()
  hint: Fix the argument type
  |
8 |     else acc)
  |          ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(Int, Int) -> Int but got fn(Bool, Int) -> Bool
  --> /tmp/dojo-is-prime-3.almd:8:10
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
8 |     else acc)
  |          ^^^
error[E001]: type mismatch in if branches: expected Bool but got Int
  --> /tmp/dojo-is-prime-3.almd:8:10
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
8 |     else acc)
  |          ^^^

3 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
