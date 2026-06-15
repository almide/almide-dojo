# factorial

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-factorial-0.almd
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-0.almd:3:47
  in call to factorial()
  hint: Check the function name
  |
3 | test "factorial 0 is 1" { assert_eq(factorial(0), 1) }
  |                                               ^
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-0.almd:4:47
  in call to factorial()
  hint: Check the function name
  |
4 | test "factorial 1 is 1" { assert_eq(factorial(1), 1) }
  |                                               ^
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-0.almd:5:47
  in call to factorial()
  hint: Check the function name
  |
5 | test "factorial 2 is 2" { assert_eq(factorial(2), 2) }
  |                                               ^
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-0.almd:6:47
  in call to factorial()
  hint: Check the function name
  |
6 | test "factorial 3 is 6" { assert_eq(factorial(3), 6) }
  |                                               ^
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-0.almd:7:49
  in call to factorial()
  hint: Check the function name
  |
7 | test "factorial 5 is 120" { assert_eq(factorial(5), 120) }
  |                                                 ^
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-0.almd:8:54
  in call to factorial()
  hint: Check the function name
  |
8 | test "factorial 10 is 3628800" { assert_eq(factorial(10), 3628800) }
  |                                                      ^^

6 error(s) found
Compile error for /tmp/dojo-factorial-0.almd:
compile failed
FAILED: /tmp/dojo-factorial-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-factorial-1.almd
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-1.almd:3:47
  in call to factorial()
  hint: Check the function name
  |
3 | test "factorial 0 is 1" { assert_eq(factorial(0), 1) }
  |                                               ^
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-1.almd:4:47
  in call to factorial()
  hint: Check the function name
  |
4 | test "factorial 1 is 1" { assert_eq(factorial(1), 1) }
  |                                               ^
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-1.almd:5:47
  in call to factorial()
  hint: Check the function name
  |
5 | test "factorial 2 is 2" { assert_eq(factorial(2), 2) }
  |                                               ^
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-1.almd:6:47
  in call to factorial()
  hint: Check the function name
  |
6 | test "factorial 3 is 6" { assert_eq(factorial(3), 6) }
  |                                               ^
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-1.almd:7:49
  in call to factorial()
  hint: Check the function name
  |
7 | test "factorial 5 is 120" { assert_eq(factorial(5), 120) }
  |                                                 ^
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-1.almd:8:54
  in call to factorial()
  hint: Check the function name
  |
8 | test "factorial 10 is 3628800" { assert_eq(factorial(10), 3628800) }
  |                                                      ^^

6 error(s) found
Compile error for /tmp/dojo-factorial-1.almd:
compile failed
FAILED: /tmp/dojo-factorial-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-factorial-2.almd
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-2.almd:3:47
  in call to factorial()
  hint: Check the function name
  |
3 | test "factorial 0 is 1" { assert_eq(factorial(0), 1) }
  |                                               ^
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-2.almd:4:47
  in call to factorial()
  hint: Check the function name
  |
4 | test "factorial 1 is 1" { assert_eq(factorial(1), 1) }
  |                                               ^
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-2.almd:5:47
  in call to factorial()
  hint: Check the function name
  |
5 | test "factorial 2 is 2" { assert_eq(factorial(2), 2) }
  |                                               ^
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-2.almd:6:47
  in call to factorial()
  hint: Check the function name
  |
6 | test "factorial 3 is 6" { assert_eq(factorial(3), 6) }
  |                                               ^
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-2.almd:7:49
  in call to factorial()
  hint: Check the function name
  |
7 | test "factorial 5 is 120" { assert_eq(factorial(5), 120) }
  |                                                 ^
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-2.almd:8:54
  in call to factorial()
  hint: Check the function name
  |
8 | test "factorial 10 is 3628800" { assert_eq(factorial(10), 3628800) }
  |                                                      ^^

6 error(s) found
Compile error for /tmp/dojo-factorial-2.almd:
compile failed
FAILED: /tmp/dojo-factorial-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-factorial-3.almd
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-3.almd:3:47
  in call to factorial()
  hint: Check the function name
  |
3 | test "factorial 0 is 1" { assert_eq(factorial(0), 1) }
  |                                               ^
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-3.almd:4:47
  in call to factorial()
  hint: Check the function name
  |
4 | test "factorial 1 is 1" { assert_eq(factorial(1), 1) }
  |                                               ^
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-3.almd:5:47
  in call to factorial()
  hint: Check the function name
  |
5 | test "factorial 2 is 2" { assert_eq(factorial(2), 2) }
  |                                               ^
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-3.almd:6:47
  in call to factorial()
  hint: Check the function name
  |
6 | test "factorial 3 is 6" { assert_eq(factorial(3), 6) }
  |                                               ^
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-3.almd:7:49
  in call to factorial()
  hint: Check the function name
  |
7 | test "factorial 5 is 120" { assert_eq(factorial(5), 120) }
  |                                                 ^
error[E002]: undefined function 'factorial'
  --> /tmp/dojo-factorial-3.almd:8:54
  in call to factorial()
  hint: Check the function name
  |
8 | test "factorial 10 is 3628800" { assert_eq(factorial(10), 3628800) }
  |                                                      ^^

6 error(s) found
Compile error for /tmp/dojo-factorial-3.almd:
compile failed
FAILED: /tmp/dojo-factorial-3.almd

1/1 test file(s) failed

```
