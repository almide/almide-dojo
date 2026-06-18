# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = 
    if n == 0 then 
      [] 
    else 
      let head = int.to_string(n).first().unwrap_or('0').to_digit(10)
      let tail = int.to_string(n).drop(1)
      let tail = if int.to_string(n).len() == 1 then [] else tail
      head :: digits 
  in 
  list.fold(digits, 0, (acc, x) => acc + int.to_int(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-0.almd:6:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |       let head = int.to_string(n).first().unwrap_or('0').to_digit(10)
  |       ^^^
error: '::' is not valid in Almide at line 9:12
  --> /tmp/dojo-sum-digits-0.almd:9:12
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
  |
9 |       head :: digits
  |            ^
error[E003]: undefined variable 'head'
  --> /tmp/dojo-sum-digits-0.almd:9:7
  in variable head
  hint: Check the variable name
  |
9 |       head :: digits
  |       ^^^^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-0.almd:11:13
  in variable digits
  hint: Check the variable name
   |
11 |   list.fold(digits, 0, (acc, x) => acc + int.to_int(x))
   |             ^^^^^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-0.almd:11:53
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
   |
11 |   list.fold(digits, 0, (acc, x) => acc + int.to_int(x))
   |                                                     ^
error[E001]: type mismatch in if branches: expected List[?0] but got String
  --> /tmp/dojo-sum-digits-0.almd:8:62
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
8 |       let tail = if int.to_string(n).len() == 1 then [] else tail
  |                                                              ^^^^

6 error(s) found
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
      let s = int.to_string(n)
      let head = s.first().unwrap_or('0').to_digit(10)
      let tail = s.drop(1)
      head :: list.map(tail, string.to_digit)
    in 
    list.fold(digits, 0, (acc, x) => acc + int.to_int(x))
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
    let s = int.to_string(n)
    let head = s.first().unwrap_or('0').to_digit(10)
    let tail = s.drop(1)
    let digits = head :: list.map(tail, string.to_digit)
    list.fold(digits, 0, (acc, x) => acc + int.to_int(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-2.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let s = int.to_string(n)
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
    let s = int.to_string(n)
    let digits = s.chars().map(string.to_digit).toList()
    list.fold(digits, 0, (acc, x) => acc + int.to_int(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-3.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let s = int.to_string(n)
  |     ^^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
