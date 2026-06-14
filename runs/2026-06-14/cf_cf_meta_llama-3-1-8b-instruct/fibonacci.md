# fibonacci

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
Compiling /tmp/dojo-fibonacci-0.almd
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-0.almd:3:47
  in call to fibonacci()
  hint: Check the function name
  |
3 | test "fibonacci 0 is 0" { assert_eq(fibonacci(0), 0) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-0.almd:4:47
  in call to fibonacci()
  hint: Check the function name
  |
4 | test "fibonacci 1 is 1" { assert_eq(fibonacci(1), 1) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-0.almd:5:47
  in call to fibonacci()
  hint: Check the function name
  |
5 | test "fibonacci 2 is 1" { assert_eq(fibonacci(2), 1) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-0.almd:6:47
  in call to fibonacci()
  hint: Check the function name
  |
6 | test "fibonacci 3 is 2" { assert_eq(fibonacci(3), 2) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-0.almd:7:47
  in call to fibonacci()
  hint: Check the function name
  |
7 | test "fibonacci 5 is 5" { assert_eq(fibonacci(5), 5) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-0.almd:8:49
  in call to fibonacci()
  hint: Check the function name
  |
8 | test "fibonacci 10 is 55" { assert_eq(fibonacci(10), 55) }
  |                                                 ^^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-0.almd:9:50
  in call to fibonacci()
  hint: Check the function name
  |
9 | test "fibonacci 15 is 610" { assert_eq(fibonacci(15), 610) }
  |                                                  ^^

7 error(s) found
Compile error for /tmp/dojo-fibonacci-0.almd:
compile failed
FAILED: /tmp/dojo-fibonacci-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-fibonacci-1.almd
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-1.almd:3:47
  in call to fibonacci()
  hint: Check the function name
  |
3 | test "fibonacci 0 is 0" { assert_eq(fibonacci(0), 0) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-1.almd:4:47
  in call to fibonacci()
  hint: Check the function name
  |
4 | test "fibonacci 1 is 1" { assert_eq(fibonacci(1), 1) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-1.almd:5:47
  in call to fibonacci()
  hint: Check the function name
  |
5 | test "fibonacci 2 is 1" { assert_eq(fibonacci(2), 1) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-1.almd:6:47
  in call to fibonacci()
  hint: Check the function name
  |
6 | test "fibonacci 3 is 2" { assert_eq(fibonacci(3), 2) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-1.almd:7:47
  in call to fibonacci()
  hint: Check the function name
  |
7 | test "fibonacci 5 is 5" { assert_eq(fibonacci(5), 5) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-1.almd:8:49
  in call to fibonacci()
  hint: Check the function name
  |
8 | test "fibonacci 10 is 55" { assert_eq(fibonacci(10), 55) }
  |                                                 ^^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-1.almd:9:50
  in call to fibonacci()
  hint: Check the function name
  |
9 | test "fibonacci 15 is 610" { assert_eq(fibonacci(15), 610) }
  |                                                  ^^

7 error(s) found
Compile error for /tmp/dojo-fibonacci-1.almd:
compile failed
FAILED: /tmp/dojo-fibonacci-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-fibonacci-2.almd
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-2.almd:3:47
  in call to fibonacci()
  hint: Check the function name
  |
3 | test "fibonacci 0 is 0" { assert_eq(fibonacci(0), 0) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-2.almd:4:47
  in call to fibonacci()
  hint: Check the function name
  |
4 | test "fibonacci 1 is 1" { assert_eq(fibonacci(1), 1) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-2.almd:5:47
  in call to fibonacci()
  hint: Check the function name
  |
5 | test "fibonacci 2 is 1" { assert_eq(fibonacci(2), 1) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-2.almd:6:47
  in call to fibonacci()
  hint: Check the function name
  |
6 | test "fibonacci 3 is 2" { assert_eq(fibonacci(3), 2) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-2.almd:7:47
  in call to fibonacci()
  hint: Check the function name
  |
7 | test "fibonacci 5 is 5" { assert_eq(fibonacci(5), 5) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-2.almd:8:49
  in call to fibonacci()
  hint: Check the function name
  |
8 | test "fibonacci 10 is 55" { assert_eq(fibonacci(10), 55) }
  |                                                 ^^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-2.almd:9:50
  in call to fibonacci()
  hint: Check the function name
  |
9 | test "fibonacci 15 is 610" { assert_eq(fibonacci(15), 610) }
  |                                                  ^^

7 error(s) found
Compile error for /tmp/dojo-fibonacci-2.almd:
compile failed
FAILED: /tmp/dojo-fibonacci-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-fibonacci-3.almd
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-3.almd:3:47
  in call to fibonacci()
  hint: Check the function name
  |
3 | test "fibonacci 0 is 0" { assert_eq(fibonacci(0), 0) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-3.almd:4:47
  in call to fibonacci()
  hint: Check the function name
  |
4 | test "fibonacci 1 is 1" { assert_eq(fibonacci(1), 1) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-3.almd:5:47
  in call to fibonacci()
  hint: Check the function name
  |
5 | test "fibonacci 2 is 1" { assert_eq(fibonacci(2), 1) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-3.almd:6:47
  in call to fibonacci()
  hint: Check the function name
  |
6 | test "fibonacci 3 is 2" { assert_eq(fibonacci(3), 2) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-3.almd:7:47
  in call to fibonacci()
  hint: Check the function name
  |
7 | test "fibonacci 5 is 5" { assert_eq(fibonacci(5), 5) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-3.almd:8:49
  in call to fibonacci()
  hint: Check the function name
  |
8 | test "fibonacci 10 is 55" { assert_eq(fibonacci(10), 55) }
  |                                                 ^^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-3.almd:9:50
  in call to fibonacci()
  hint: Check the function name
  |
9 | test "fibonacci 15 is 610" { assert_eq(fibonacci(15), 610) }
  |                                                  ^^

7 error(s) found
Compile error for /tmp/dojo-fibonacci-3.almd:
compile failed
FAILED: /tmp/dojo-fibonacci-3.almd

1/1 test file(s) failed

```
