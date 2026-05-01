# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 
    if n < 0 then 
      let abs_n = int.abs(n) 
      let sum = 
        if abs_n == 0 then 
          0 
        else 
          let digit = abs_n % 10 
          digit + sum_digits(abs_n / 10) 
      sum 
    else 
      if n == 0 then 
        0 
      else 
        let digit = n % 10 
        digit + sum_digits(n / 10) 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-0.almd:4:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |       let abs_n = int.abs(n)
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-0.almd:9:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |           let digit = abs_n % 10
  |           ^^^
error: Expected expression at line 12:5 (got Else 'else')
  --> /tmp/dojo-sum-digits-0.almd:12:5
   |
12 |     else
   |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-0.almd:16:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
16 |         let digit = n % 10
   |         ^^^
error[E003]: undefined variable 'digit'
  --> /tmp/dojo-sum-digits-0.almd:10:11
  in variable digit
  hint: Check the variable name
   |
10 |           digit + sum_digits(abs_n / 10)
   |           ^^^^^
error[E003]: undefined variable 'abs_n'
  --> /tmp/dojo-sum-digits-0.almd:10:30
  in variable abs_n
  hint: Check the variable name
   |
10 |           digit + sum_digits(abs_n / 10)
   |                              ^^^^^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-0.almd:11:7
  in variable sum
  hint: Check the variable name
   |
11 |       sum
   |       ^^^
error[E003]: undefined variable 'digit'
  --> /tmp/dojo-sum-digits-0.almd:17:9
  in variable digit
  hint: Check the variable name
   |
17 |         digit + sum_digits(n / 10)
   |         ^^^^^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-0.almd:18:3
  in variable sum
  hint: Check the variable name
   |
18 |   sum
   |   ^^^

9 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n < 0 then 
    let abs_n = int.abs(n) 
    if abs_n == 0 then 
      0 
    else 
      let digit = abs_n % 10 
      digit + sum_digits(abs_n / 10) 
  else 
    if n == 0 then 
      0 
    else 
      let digit = n % 10 
      digit + sum_digits(n / 10)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-1.almd:3:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
3 |     let abs_n = int.abs(n)
  |     ^^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n < 0 then 
    sum_digits(int.abs(n)) 
  else 
    if n == 0 then 
      0 
    else 
      let digit = n % 10 
      digit + sum_digits(n / 10)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-2.almd:8:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let digit = n % 10
  |       ^^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  if n < 0 then 
    sum_digits(int.abs(n)) 
  else 
    if n == 0 then 
      0 
    else 
      sum_digits(n / 10) + (n % 10)
```
