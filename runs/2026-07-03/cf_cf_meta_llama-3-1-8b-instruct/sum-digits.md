# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.range(0, int.to_int(math.log10(n) + 1)), 0, (acc, i) => 
    let digit = (n / int.pow(10, i)) % 10
    acc + digit
  ) 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-0.almd:3:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
3 |     let digit = (n / int.pow(10, i)) % 10
  |     ^^^
error: Expected expression at line 5:3 (got RParen ')')
  --> /tmp/dojo-sum-digits-0.almd:5:3
  |
5 |   )
  |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-sum-digits-0.almd:4:5
  in variable acc
  hint: Check the variable name
  |
4 |     acc + digit
  |     ^^^
error[E003]: undefined variable 'digit'
  --> /tmp/dojo-sum-digits-0.almd:4:11
  in variable digit
  hint: Check the variable name
  |
4 |     acc + digit
  |           ^^^^^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-0.almd:6:3
  in variable sum
  hint: Check the variable name
  |
6 |   sum
  |   ^^^

5 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  list.fold(list.range(0, int.to_int(math.log10(n) + 1)), 0, (acc, i) => 
    let digit = (n / int.pow(10, i)) % 10
    acc + digit
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-1.almd:3:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
3 |     let digit = (n / int.pow(10, i)) % 10
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
  list.fold(list.range(0, int.to_int(math.log10(n) + 1)), 0, (acc, i) => 
    (n / int.pow(10, i)) % 10 + acc
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error[E005]: argument 'x' expects Float but got Int
  --> /tmp/dojo-sum-digits-2.almd:3:78
  in call to math.log10()
  hint: Fix the argument type. Or use `to_float(x)` to convert Int to Float
  |
3 | fn sum_digits(n: Int) -> Int = list.fold(list.range(0, int.to_int(math.log10(n) + 1)), 0, (acc, i) => (n / int.pow(10, i)) % 10 + acc)
  |                                                                              ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-2.almd:3:83
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 | fn sum_digits(n: Int) -> Int = list.fold(list.range(0, int.to_int(math.log10(n) + 1)), 0, (acc, i) => (n / int.pow(10, i)) % 10 + acc)
  |                                                                                   ^
error[E002]: undefined function 'int.pow'
  --> /tmp/dojo-sum-digits-2.almd:3:120
  in call to int.pow()
  hint: Did you mean `int.bor`?
  try:
      // int.pow(...)  →  int.bor(...)
      int.bor(...)
  |
3 | fn sum_digits(n: Int) -> Int = list.fold(list.range(0, int.to_int(math.log10(n) + 1)), 0, (acc, i) => (n / int.pow(10, i)) % 10 + acc)
  |                                                                                                                        ^
error[E001]: type mismatch in call to math.log10(): expected Float but got Int
  --> /tmp/dojo-sum-digits-2.almd:3:78
  in call to math.log10()
  hint: Fix the expression type or change the expected type. Or use `to_float(x)` to convert Int to Float
  |
3 | fn sum_digits(n: Int) -> Int = list.fold(list.range(0, int.to_int(math.log10(n) + 1)), 0, (acc, i) => (n / int.pow(10, i)) % 10 + acc)
  |                                                                              ^

4 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  list.fold(list.range(0, int.to_int(math.log10(float.to_float(n)) + 1)), 0, (acc, i) => 
    (n / int.pow(10, i)) % 10 + acc
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E002]: undefined function 'float.to_float'
  --> /tmp/dojo-sum-digits-3.almd:3:93
  in call to float.to_float()
  hint: No function 'to_float' in module 'float'. See docs/CHEATSHEET.md for available functions
  |
3 | fn sum_digits(n: Int) -> Int = list.fold(list.range(0, int.to_int(math.log10(float.to_float(n)) + 1)), 0, (acc, i) => (n / int.pow(10, i)) % 10 + acc)
  |                                                                                             ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-3.almd:3:99
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 | fn sum_digits(n: Int) -> Int = list.fold(list.range(0, int.to_int(math.log10(float.to_float(n)) + 1)), 0, (acc, i) => (n / int.pow(10, i)) % 10 + acc)
  |                                                                                                   ^
error[E002]: undefined function 'int.pow'
  --> /tmp/dojo-sum-digits-3.almd:3:136
  in call to int.pow()
  hint: Did you mean `int.bor`?
  try:
      // int.pow(...)  →  int.bor(...)
      int.bor(...)
  |
3 | fn sum_digits(n: Int) -> Int = list.fold(list.range(0, int.to_int(math.log10(float.to_float(n)) + 1)), 0, (acc, i) => (n / int.pow(10, i)) % 10 + acc)
  |                                                                                                                                        ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
