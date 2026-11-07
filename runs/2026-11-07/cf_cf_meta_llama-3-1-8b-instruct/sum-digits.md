# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 
    if n == 0 then 0 
    else 
      let digit = n % 10 
      digit + sum_digits(n / 10) 
  sum
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-0.almd:5:7
  in let-in
  here: let digit = n % 10
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let digit = n % 10
  |       ^^^
error[E003]: undefined variable 'digit'
  --> /tmp/dojo-sum-digits-0.almd:6:7
  in variable digit
  here: digit + sum_digits(n / 10)
  hint: Did you mean `sum_digits`?
  try:
      sum_digits
  |
6 |       digit + sum_digits(n / 10)
  |       ^^^^^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-0.almd:7:3
  in variable sum
  here: sum
  hint: Check the variable name
  |
7 |   sum
  |   ^^^

3 error(s) found
FAILED: /tmp/dojo-sum-digits-0.almd
  parse error: 'let' is not an expression in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-sum-digits-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0 
  else 
    let digit = n % 10 
    digit + sum_digits(n / 10)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-1.almd:4:5
  in let-in
  here: let digit = n % 10
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let digit = n % 10
  |     ^^^
error: 'let' is not an expression in Almide at line 4:5
  --> /tmp/dojo-sum-digits-1.almd:4:5
  here: let digit = n % 10
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |     let digit = n % 10
  |     ^

2 error(s) found
FAILED: /tmp/dojo-sum-digits-1.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide at line 4:5
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-sum-digits-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0 
  else 
    let digit = n % 10 
    digit + sum_digits(n / 10)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-2.almd:4:5
  in let-in
  here: let digit = n % 10
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let digit = n % 10
  |     ^^^
error: 'let' is not an expression in Almide at line 4:5
  --> /tmp/dojo-sum-digits-2.almd:4:5
  here: let digit = n % 10
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |     let digit = n % 10
  |     ^

2 error(s) found
FAILED: /tmp/dojo-sum-digits-2.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide at line 4:5
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-sum-digits-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0 
  else 
    let digit = n % 10 
    digit + sum_digits(n / 10)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-3.almd:4:5
  in let-in
  here: let digit = n % 10
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let digit = n % 10
  |     ^^^
error: 'let' is not an expression in Almide at line 4:5
  --> /tmp/dojo-sum-digits-3.almd:4:5
  here: let digit = n % 10
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |     let digit = n % 10
  |     ^

2 error(s) found
FAILED: /tmp/dojo-sum-digits-3.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide at line 4:5
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-sum-digits-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
