# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 
    if n == 0 then 
      0 
    else 
      let digits = 
        if n < 0 then 
          int.abs(n) 
        else 
          n 
      in 
        let digit = int.to_int(digits % 10) in 
        digit + sum_digits(int.to_int(digits / 10))
  in 
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
6 |       let digits =
  |       ^^^
error: Expected expression at line 11:7 (got In 'in')
  --> /tmp/dojo-sum-digits-0.almd:11:7
   |
11 |       in
   |       ^
error: Expected expression at line 14:3 (got In 'in')
  --> /tmp/dojo-sum-digits-0.almd:14:3
   |
14 |   in
   |   ^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-0.almd:12:32
  in variable digits
  hint: Check the variable name
   |
12 |         let digit = int.to_int(digits % 10)
   |                                ^^^^^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-0.almd:12:41
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
   |
12 |         let digit = int.to_int(digits % 10)
   |                                         ^^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-0.almd:13:39
  in variable digits
  hint: Did you mean `digit`?
  try:
      // digits  →  digit
      digit
   |
13 |         digit + sum_digits(int.to_int(digits / 10))
   |                                       ^^^^^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-0.almd:13:48
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
   |
13 |         digit + sum_digits(int.to_int(digits / 10))
   |                                                ^^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-0.almd:15:5
  in variable sum
  hint: Check the variable name
   |
15 |     sum
   |     ^^^

8 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 
    0 
  else 
    let digits = 
      if n < 0 then 
        int.abs(n) 
      else 
        n 
    in 
      let digit = digits % 10 in 
      digit + sum_digits(int.to_float(digits / 10)) |>
      int.to_int
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-1.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let digits =
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
  if n == 0 then 
    0 
  else 
    let digits = 
      if n < 0 then 
        int.abs(n) 
      else 
        n 
    in 
      let digit = digits % 10 in 
      digit + sum_digits(int.to_float(digits / 10)) |>
      int.to_int
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-2.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let digits =
  |     ^^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 
    0 
  else 
    let digits = 
      if n < 0 then 
        int.abs(n) 
      else 
        n 
    in 
    let digit = digits % 10 in 
    digit + sum_digits(int.to_float(digits / 10)) |>
    int.to_int
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-3.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let digits =
  |     ^^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
