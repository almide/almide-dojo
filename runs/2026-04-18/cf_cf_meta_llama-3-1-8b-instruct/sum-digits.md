# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int {
  let abs_n = int.abs(n)
  let sum = int.fold(abs_n, 0, |acc, x| {
    let digit = int.mod(x, 10)
    acc + digit
  })
  sum
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: Missing '=' before function body at line 1:30
  --> /tmp/dojo-sum-digits-0.almd:1:30
  hint: Almide requires '=' before the body. Write: fn sum_digits(...) -> Type = { ... }
  |
1 | fn sum_digits(n: Int) -> Int {
  |                              ^
error: Expected Fn at line 4:24 (got LParen '(')
  --> /tmp/dojo-sum-digits-0.almd:4:24
  |
4 |     let digit = int.mod(x, 10)
  |                        ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs_n = int.abs(n)
  let sum = int.fold(abs_n, 0, (acc, x) => {
    let digit = int.mod(x, 10)
    acc + digit
  })
  sum
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: Expected name at line 4:21 (got Mod 'mod')
  --> /tmp/dojo-sum-digits-1.almd:4:21
  |
4 |     let digit = int.mod(x, 10)
  |                     ^
error[E003]: undefined variable 'digit'
  --> /tmp/dojo-sum-digits-1.almd:5:11
  in variable digit
  hint: Check the variable name
  |
5 |     acc + digit
  |           ^^^^^
error[E002]: undefined function 'int.fold'
  --> /tmp/dojo-sum-digits-1.almd:5:11
  in call to int.fold()
  hint: No function 'fold' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |     acc + digit
  |           ^^^^^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs_n = int.abs(n)
  let sum = list.fold(abs_n, 0, (acc, x) => {
    let digit = int.mod(x, 10)
    acc + digit
  })
  sum
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: Expected name at line 4:21 (got Mod 'mod')
  --> /tmp/dojo-sum-digits-2.almd:4:21
  |
4 |     let digit = int.mod(x, 10)
  |                     ^
error[E003]: undefined variable 'digit'
  --> /tmp/dojo-sum-digits-2.almd:5:11
  in variable digit
  hint: Check the variable name
  |
5 |     acc + digit
  |           ^^^^^
error[E005]: argument 'xs' expects List[A] but got Int
  --> /tmp/dojo-sum-digits-2.almd:5:11
  in call to list.fold()
  hint: Fix the argument type
  |
5 |     acc + digit
  |           ^^^^^
error[E001]: type mismatch in call to list.fold(): expected List[?1] but got Int
  --> /tmp/dojo-sum-digits-2.almd:5:11
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
5 |     acc + digit
  |           ^^^^^

4 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs_n = int.abs(n)
  let digits = list.map(abs_n, (x) => int.mod(x, 10))
  list.fold(digits, 0, (acc, x) => acc + x)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: Expected name at line 3:43 (got Mod 'mod')
  --> /tmp/dojo-sum-digits-3.almd:3:43
  |
3 |   let digits = list.map(abs_n, (x) => int.mod(x, 10))
  |                                           ^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-3.almd:4:13
  in variable digits
  hint: Check the variable name
  |
4 |   list.fold(digits, 0, (acc, x) => acc + x)
  |             ^^^^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
