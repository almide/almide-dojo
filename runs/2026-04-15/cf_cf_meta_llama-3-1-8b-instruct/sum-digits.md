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
  if n == 0 then 0 
  else n.abs().to_string().map(c => int.parse(c.to_string())).fold(0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-sum-digits-0.almd:3:34
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
3 |   else n.abs().to_string().map(c => int.parse(c.to_string())).fold(0, (acc, x) => acc + x)
  |                                  ^^
error: Lambda parameter must be wrapped in parentheses at line 3:34
  --> /tmp/dojo-sum-digits-0.almd:3:34
  |
3 |   else n.abs().to_string().map(c => int.parse(c.to_string())).fold(0, (acc, x) => acc + x)
  |                                  ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:5:44
  in call to sum_digits()
  hint: Check the function name
  |
5 | test "sum_digits 0" { assert_eq(sum_digits(0), 0) }
  |                                            ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:6:44
  in call to sum_digits()
  hint: Check the function name
  |
6 | test "sum_digits 5" { assert_eq(sum_digits(5), 5) }
  |                                            ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:7:46
  in call to sum_digits()
  hint: Check the function name
  |
7 | test "sum_digits 123" { assert_eq(sum_digits(123), 6) }
  |                                              ^^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:8:47
  in call to sum_digits()
  hint: Check the function name
  |
8 | test "sum_digits 9999" { assert_eq(sum_digits(9999), 36) }
  |                                               ^^^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:9:52
  in call to sum_digits()
  hint: Check the function name
  |
9 | test "sum_digits negative" { assert_eq(sum_digits(-42), 6) }
  |                                                    ^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:10:45
  in call to sum_digits()
  hint: Check the function name
   |
10 | test "sum_digits 10" { assert_eq(sum_digits(10), 1) }
   |                                             ^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:11:46
  in call to sum_digits()
  hint: Check the function name
   |
11 | test "sum_digits 100" { assert_eq(sum_digits(100), 1) }
   |                                              ^^^

9 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0 
  else n.abs().to_string().map(c => int.parse(c.to_string())).fold(0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-sum-digits-1.almd:3:34
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
3 |   else n.abs().to_string().map(c => int.parse(c.to_string())).fold(0, (acc, x) => acc + x)
  |                                  ^^
error: Lambda parameter must be wrapped in parentheses at line 3:34
  --> /tmp/dojo-sum-digits-1.almd:3:34
  |
3 |   else n.abs().to_string().map(c => int.parse(c.to_string())).fold(0, (acc, x) => acc + x)
  |                                  ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-1.almd:5:44
  in call to sum_digits()
  hint: Check the function name
  |
5 | test "sum_digits 0" { assert_eq(sum_digits(0), 0) }
  |                                            ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-1.almd:6:44
  in call to sum_digits()
  hint: Check the function name
  |
6 | test "sum_digits 5" { assert_eq(sum_digits(5), 5) }
  |                                            ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-1.almd:7:46
  in call to sum_digits()
  hint: Check the function name
  |
7 | test "sum_digits 123" { assert_eq(sum_digits(123), 6) }
  |                                              ^^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-1.almd:8:47
  in call to sum_digits()
  hint: Check the function name
  |
8 | test "sum_digits 9999" { assert_eq(sum_digits(9999), 36) }
  |                                               ^^^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-1.almd:9:52
  in call to sum_digits()
  hint: Check the function name
  |
9 | test "sum_digits negative" { assert_eq(sum_digits(-42), 6) }
  |                                                    ^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-1.almd:10:45
  in call to sum_digits()
  hint: Check the function name
   |
10 | test "sum_digits 10" { assert_eq(sum_digits(10), 1) }
   |                                             ^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-1.almd:11:46
  in call to sum_digits()
  hint: Check the function name
   |
11 | test "sum_digits 100" { assert_eq(sum_digits(100), 1) }
   |                                              ^^^

9 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0 
  else n.abs().to_string().map(c => int.parse(c.to_string())).fold(0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-sum-digits-2.almd:3:34
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
3 |   else n.abs().to_string().map(c => int.parse(c.to_string())).fold(0, (acc, x) => acc + x)
  |                                  ^^
error: Lambda parameter must be wrapped in parentheses at line 3:34
  --> /tmp/dojo-sum-digits-2.almd:3:34
  |
3 |   else n.abs().to_string().map(c => int.parse(c.to_string())).fold(0, (acc, x) => acc + x)
  |                                  ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-2.almd:5:44
  in call to sum_digits()
  hint: Check the function name
  |
5 | test "sum_digits 0" { assert_eq(sum_digits(0), 0) }
  |                                            ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-2.almd:6:44
  in call to sum_digits()
  hint: Check the function name
  |
6 | test "sum_digits 5" { assert_eq(sum_digits(5), 5) }
  |                                            ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-2.almd:7:46
  in call to sum_digits()
  hint: Check the function name
  |
7 | test "sum_digits 123" { assert_eq(sum_digits(123), 6) }
  |                                              ^^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-2.almd:8:47
  in call to sum_digits()
  hint: Check the function name
  |
8 | test "sum_digits 9999" { assert_eq(sum_digits(9999), 36) }
  |                                               ^^^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-2.almd:9:52
  in call to sum_digits()
  hint: Check the function name
  |
9 | test "sum_digits negative" { assert_eq(sum_digits(-42), 6) }
  |                                                    ^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-2.almd:10:45
  in call to sum_digits()
  hint: Check the function name
   |
10 | test "sum_digits 10" { assert_eq(sum_digits(10), 1) }
   |                                             ^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-2.almd:11:46
  in call to sum_digits()
  hint: Check the function name
   |
11 | test "sum_digits 100" { assert_eq(sum_digits(100), 1) }
   |                                              ^^^

9 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0 
  else n.abs().to_string().map(c => int.parse(c.to_string())).fold(0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-sum-digits-3.almd:3:34
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
3 |   else n.abs().to_string().map(c => int.parse(c.to_string())).fold(0, (acc, x) => acc + x)
  |                                  ^^
error: Lambda parameter must be wrapped in parentheses at line 3:34
  --> /tmp/dojo-sum-digits-3.almd:3:34
  |
3 |   else n.abs().to_string().map(c => int.parse(c.to_string())).fold(0, (acc, x) => acc + x)
  |                                  ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-3.almd:5:44
  in call to sum_digits()
  hint: Check the function name
  |
5 | test "sum_digits 0" { assert_eq(sum_digits(0), 0) }
  |                                            ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-3.almd:6:44
  in call to sum_digits()
  hint: Check the function name
  |
6 | test "sum_digits 5" { assert_eq(sum_digits(5), 5) }
  |                                            ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-3.almd:7:46
  in call to sum_digits()
  hint: Check the function name
  |
7 | test "sum_digits 123" { assert_eq(sum_digits(123), 6) }
  |                                              ^^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-3.almd:8:47
  in call to sum_digits()
  hint: Check the function name
  |
8 | test "sum_digits 9999" { assert_eq(sum_digits(9999), 36) }
  |                                               ^^^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-3.almd:9:52
  in call to sum_digits()
  hint: Check the function name
  |
9 | test "sum_digits negative" { assert_eq(sum_digits(-42), 6) }
  |                                                    ^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-3.almd:10:45
  in call to sum_digits()
  hint: Check the function name
   |
10 | test "sum_digits 10" { assert_eq(sum_digits(10), 1) }
   |                                             ^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-3.almd:11:46
  in call to sum_digits()
  hint: Check the function name
   |
11 | test "sum_digits 100" { assert_eq(sum_digits(100), 1) }
   |                                              ^^^

9 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
