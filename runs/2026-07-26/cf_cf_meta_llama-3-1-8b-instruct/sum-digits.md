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
  let digits = list.map(int.digits(int.abs(n)), fn(d) => d)
  list.fold(digits, 0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: Expected expression at line 2:49 (got Fn 'fn')
  --> /tmp/dojo-sum-digits-0.almd:2:49
  |
2 |   let digits = list.map(int.digits(int.abs(n)), fn(d) => d)
  |                                                 ^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-0.almd:3:13
  in variable digits
  hint: Check the variable name
  |
3 |   list.fold(digits, 0, (acc, x) => acc + x)
  |             ^^^^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = list.map(int.digits(int.abs(n)), (d) => d)
  list.fold(digits, 0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E002]: undefined function 'int.digits'
  --> /tmp/dojo-sum-digits-1.almd:2:44
  in call to int.digits()
  hint: No function 'digits' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
2 |   let digits = list.map(int.digits(int.abs(n)), (d) => d)
  |                                            ^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = list.map(string.from_int(int.abs(n)), (s) => string.chars(s).map(string.to_int))
  list.fold(digits, 0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error[E002]: undefined function 'string.from_int'
  --> /tmp/dojo-sum-digits-2.almd:2:49
  in call to string.from_int()
  hint: No function 'from_int' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
2 |   let digits = list.map(string.from_int(int.abs(n)), (s) => string.chars(s).map(string.to_int))
  |                                                 ^
error[E003]: undefined variable 'string'
  --> /tmp/dojo-sum-digits-2.almd:2:81
  in variable string
  hint: Check the variable name
  |
2 |   let digits = list.map(string.from_int(int.abs(n)), (s) => string.chars(s).map(string.to_int))
  |                                                                                 ^^^^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = list.map(string.from_int(int.to_string(int.abs(n))), (s) => string.chars(s).map(string.to_int))
  list.fold(digits, 0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E002]: undefined function 'string.from_int'
  --> /tmp/dojo-sum-digits-3.almd:2:63
  in call to string.from_int()
  hint: No function 'from_int' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
2 |   let digits = list.map(string.from_int(int.to_string(int.abs(n))), (s) => string.chars(s).map(string.to_int))
  |                                                               ^
error[E003]: undefined variable 'string'
  --> /tmp/dojo-sum-digits-3.almd:2:96
  in variable string
  hint: Check the variable name
  |
2 |   let digits = list.map(string.from_int(int.to_string(int.abs(n))), (s) => string.chars(s).map(string.to_int))
  |                                                                                                ^^^^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
