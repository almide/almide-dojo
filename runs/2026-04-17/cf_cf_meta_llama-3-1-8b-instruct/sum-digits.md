# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let abs_n = int.abs(n)
  let sum = 
    if abs_n == 0 then 0
    else 
      let digit = abs_n % 10
      digit + sum_digits(abs_n / 10)
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-0.almd:6:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |       let digit = abs_n % 10
  |       ^^^
error[E003]: undefined variable 'digit'
  --> /tmp/dojo-sum-digits-0.almd:7:7
  in variable digit
  hint: Check the variable name
  |
7 |       digit + sum_digits(abs_n / 10)
  |       ^^^^^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-0.almd:8:3
  in variable sum
  hint: Check the variable name
  |
8 |   sum
  |   ^^^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let abs_n = int.abs(n)
  if abs_n == 0 then 0
  else 
    let digit = abs_n % 10
    digit + sum_digits(abs_n / 10)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-1.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let digit = abs_n % 10
  |     ^^^
error[E003]: undefined variable 'digit'
  --> /tmp/dojo-sum-digits-1.almd:6:5
  in variable digit
  hint: Check the variable name
  |
6 |     digit + sum_digits(abs_n / 10)
  |     ^^^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let abs_n = int.abs(n)
  if abs_n == 0 then 0
  else 
    let digit = abs_n % 10
    digit + sum_digits(abs_n / 10)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-2.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let digit = abs_n % 10
  |     ^^^
error[E003]: undefined variable 'digit'
  --> /tmp/dojo-sum-digits-2.almd:6:5
  in variable digit
  hint: Check the variable name
  |
6 |     digit + sum_digits(abs_n / 10)
  |     ^^^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let abs_n = int.abs(n)
  if abs_n == 0 then 0
  else 
    let digit = abs_n % 10
    digit + sum_digits(abs_n / 10)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-3.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let digit = abs_n % 10
  |     ^^^
error[E003]: undefined variable 'digit'
  --> /tmp/dojo-sum-digits-3.almd:6:5
  in variable digit
  hint: Check the variable name
  |
6 |     digit + sum_digits(abs_n / 10)
  |     ^^^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
