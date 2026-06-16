# is-prime

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
Compiling /tmp/dojo-is-prime-0.almd
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:3:51
  in call to is_prime()
  hint: Check the function name
  |
3 | test "is_prime -1 is false" { assert_eq(is_prime(-1), false) }
  |                                                   ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:4:49
  in call to is_prime()
  hint: Check the function name
  |
4 | test "is_prime 0 is false" { assert_eq(is_prime(0), false) }
  |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:5:49
  in call to is_prime()
  hint: Check the function name
  |
5 | test "is_prime 1 is false" { assert_eq(is_prime(1), false) }
  |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:6:48
  in call to is_prime()
  hint: Check the function name
  |
6 | test "is_prime 2 is true" { assert_eq(is_prime(2), true) }
  |                                                ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:7:48
  in call to is_prime()
  hint: Check the function name
  |
7 | test "is_prime 3 is true" { assert_eq(is_prime(3), true) }
  |                                                ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:8:49
  in call to is_prime()
  hint: Check the function name
  |
8 | test "is_prime 4 is false" { assert_eq(is_prime(4), false) }
  |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:9:48
  in call to is_prime()
  hint: Check the function name
  |
9 | test "is_prime 7 is true" { assert_eq(is_prime(7), true) }
  |                                                ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:10:49
  in call to is_prime()
  hint: Check the function name
   |
10 | test "is_prime 9 is false" { assert_eq(is_prime(9), false) }
   |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:11:49
  in call to is_prime()
  hint: Check the function name
   |
11 | test "is_prime 17 is true" { assert_eq(is_prime(17), true) }
   |                                                 ^^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:12:50
  in call to is_prime()
  hint: Check the function name
   |
12 | test "is_prime 25 is false" { assert_eq(is_prime(25), false) }
   |                                                  ^^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:13:49
  in call to is_prime()
  hint: Check the function name
   |
13 | test "is_prime 97 is true" { assert_eq(is_prime(97), true) }
   |                                                 ^^

11 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-1.almd:3:51
  in call to is_prime()
  hint: Check the function name
  |
3 | test "is_prime -1 is false" { assert_eq(is_prime(-1), false) }
  |                                                   ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-1.almd:4:49
  in call to is_prime()
  hint: Check the function name
  |
4 | test "is_prime 0 is false" { assert_eq(is_prime(0), false) }
  |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-1.almd:5:49
  in call to is_prime()
  hint: Check the function name
  |
5 | test "is_prime 1 is false" { assert_eq(is_prime(1), false) }
  |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-1.almd:6:48
  in call to is_prime()
  hint: Check the function name
  |
6 | test "is_prime 2 is true" { assert_eq(is_prime(2), true) }
  |                                                ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-1.almd:7:48
  in call to is_prime()
  hint: Check the function name
  |
7 | test "is_prime 3 is true" { assert_eq(is_prime(3), true) }
  |                                                ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-1.almd:8:49
  in call to is_prime()
  hint: Check the function name
  |
8 | test "is_prime 4 is false" { assert_eq(is_prime(4), false) }
  |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-1.almd:9:48
  in call to is_prime()
  hint: Check the function name
  |
9 | test "is_prime 7 is true" { assert_eq(is_prime(7), true) }
  |                                                ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-1.almd:10:49
  in call to is_prime()
  hint: Check the function name
   |
10 | test "is_prime 9 is false" { assert_eq(is_prime(9), false) }
   |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-1.almd:11:49
  in call to is_prime()
  hint: Check the function name
   |
11 | test "is_prime 17 is true" { assert_eq(is_prime(17), true) }
   |                                                 ^^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-1.almd:12:50
  in call to is_prime()
  hint: Check the function name
   |
12 | test "is_prime 25 is false" { assert_eq(is_prime(25), false) }
   |                                                  ^^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-1.almd:13:49
  in call to is_prime()
  hint: Check the function name
   |
13 | test "is_prime 97 is true" { assert_eq(is_prime(97), true) }
   |                                                 ^^

11 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-2.almd:3:51
  in call to is_prime()
  hint: Check the function name
  |
3 | test "is_prime -1 is false" { assert_eq(is_prime(-1), false) }
  |                                                   ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-2.almd:4:49
  in call to is_prime()
  hint: Check the function name
  |
4 | test "is_prime 0 is false" { assert_eq(is_prime(0), false) }
  |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-2.almd:5:49
  in call to is_prime()
  hint: Check the function name
  |
5 | test "is_prime 1 is false" { assert_eq(is_prime(1), false) }
  |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-2.almd:6:48
  in call to is_prime()
  hint: Check the function name
  |
6 | test "is_prime 2 is true" { assert_eq(is_prime(2), true) }
  |                                                ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-2.almd:7:48
  in call to is_prime()
  hint: Check the function name
  |
7 | test "is_prime 3 is true" { assert_eq(is_prime(3), true) }
  |                                                ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-2.almd:8:49
  in call to is_prime()
  hint: Check the function name
  |
8 | test "is_prime 4 is false" { assert_eq(is_prime(4), false) }
  |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-2.almd:9:48
  in call to is_prime()
  hint: Check the function name
  |
9 | test "is_prime 7 is true" { assert_eq(is_prime(7), true) }
  |                                                ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-2.almd:10:49
  in call to is_prime()
  hint: Check the function name
   |
10 | test "is_prime 9 is false" { assert_eq(is_prime(9), false) }
   |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-2.almd:11:49
  in call to is_prime()
  hint: Check the function name
   |
11 | test "is_prime 17 is true" { assert_eq(is_prime(17), true) }
   |                                                 ^^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-2.almd:12:50
  in call to is_prime()
  hint: Check the function name
   |
12 | test "is_prime 25 is false" { assert_eq(is_prime(25), false) }
   |                                                  ^^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-2.almd:13:49
  in call to is_prime()
  hint: Check the function name
   |
13 | test "is_prime 97 is true" { assert_eq(is_prime(97), true) }
   |                                                 ^^

11 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:3:51
  in call to is_prime()
  hint: Check the function name
  |
3 | test "is_prime -1 is false" { assert_eq(is_prime(-1), false) }
  |                                                   ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:4:49
  in call to is_prime()
  hint: Check the function name
  |
4 | test "is_prime 0 is false" { assert_eq(is_prime(0), false) }
  |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:5:49
  in call to is_prime()
  hint: Check the function name
  |
5 | test "is_prime 1 is false" { assert_eq(is_prime(1), false) }
  |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:6:48
  in call to is_prime()
  hint: Check the function name
  |
6 | test "is_prime 2 is true" { assert_eq(is_prime(2), true) }
  |                                                ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:7:48
  in call to is_prime()
  hint: Check the function name
  |
7 | test "is_prime 3 is true" { assert_eq(is_prime(3), true) }
  |                                                ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:8:49
  in call to is_prime()
  hint: Check the function name
  |
8 | test "is_prime 4 is false" { assert_eq(is_prime(4), false) }
  |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:9:48
  in call to is_prime()
  hint: Check the function name
  |
9 | test "is_prime 7 is true" { assert_eq(is_prime(7), true) }
  |                                                ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:10:49
  in call to is_prime()
  hint: Check the function name
   |
10 | test "is_prime 9 is false" { assert_eq(is_prime(9), false) }
   |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:11:49
  in call to is_prime()
  hint: Check the function name
   |
11 | test "is_prime 17 is true" { assert_eq(is_prime(17), true) }
   |                                                 ^^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:12:50
  in call to is_prime()
  hint: Check the function name
   |
12 | test "is_prime 25 is false" { assert_eq(is_prime(25), false) }
   |                                                  ^^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:13:49
  in call to is_prime()
  hint: Check the function name
   |
13 | test "is_prime 97 is true" { assert_eq(is_prime(97), true) }
   |                                                 ^^

11 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
