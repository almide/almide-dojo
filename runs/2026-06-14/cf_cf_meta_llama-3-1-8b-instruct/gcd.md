# gcd

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
Compiling /tmp/dojo-gcd-0.almd
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-0.almd:3:40
  in call to gcd()
  hint: Check the function name
  |
3 | test "gcd 0 0 is 0" { assert_eq(gcd(0, 0), 0) }
  |                                        ^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-0.almd:4:40
  in call to gcd()
  hint: Check the function name
  |
4 | test "gcd 5 0 is 5" { assert_eq(gcd(5, 0), 5) }
  |                                        ^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-0.almd:5:40
  in call to gcd()
  hint: Check the function name
  |
5 | test "gcd 0 7 is 7" { assert_eq(gcd(0, 7), 7) }
  |                                        ^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-0.almd:6:42
  in call to gcd()
  hint: Check the function name
  |
6 | test "gcd 12 8 is 4" { assert_eq(gcd(12, 8), 4) }
  |                                          ^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-0.almd:7:43
  in call to gcd()
  hint: Check the function name
  |
7 | test "gcd 17 13 is 1" { assert_eq(gcd(17, 13), 1) }
  |                                           ^^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-0.almd:8:46
  in call to gcd()
  hint: Check the function name
  |
8 | test "gcd 100 75 is 25" { assert_eq(gcd(100, 75), 25) }
  |                                              ^^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-0.almd:9:43
  in call to gcd()
  hint: Check the function name
  |
9 | test "gcd 54 24 is 6" { assert_eq(gcd(54, 24), 6) }
  |                                           ^^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-0.almd:10:43
  in call to gcd()
  hint: Check the function name
   |
10 | test "gcd same number" { assert_eq(gcd(7, 7), 7) }
   |                                           ^

8 error(s) found
Compile error for /tmp/dojo-gcd-0.almd:
compile failed
FAILED: /tmp/dojo-gcd-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-gcd-1.almd
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-1.almd:3:40
  in call to gcd()
  hint: Check the function name
  |
3 | test "gcd 0 0 is 0" { assert_eq(gcd(0, 0), 0) }
  |                                        ^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-1.almd:4:40
  in call to gcd()
  hint: Check the function name
  |
4 | test "gcd 5 0 is 5" { assert_eq(gcd(5, 0), 5) }
  |                                        ^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-1.almd:5:40
  in call to gcd()
  hint: Check the function name
  |
5 | test "gcd 0 7 is 7" { assert_eq(gcd(0, 7), 7) }
  |                                        ^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-1.almd:6:42
  in call to gcd()
  hint: Check the function name
  |
6 | test "gcd 12 8 is 4" { assert_eq(gcd(12, 8), 4) }
  |                                          ^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-1.almd:7:43
  in call to gcd()
  hint: Check the function name
  |
7 | test "gcd 17 13 is 1" { assert_eq(gcd(17, 13), 1) }
  |                                           ^^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-1.almd:8:46
  in call to gcd()
  hint: Check the function name
  |
8 | test "gcd 100 75 is 25" { assert_eq(gcd(100, 75), 25) }
  |                                              ^^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-1.almd:9:43
  in call to gcd()
  hint: Check the function name
  |
9 | test "gcd 54 24 is 6" { assert_eq(gcd(54, 24), 6) }
  |                                           ^^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-1.almd:10:43
  in call to gcd()
  hint: Check the function name
   |
10 | test "gcd same number" { assert_eq(gcd(7, 7), 7) }
   |                                           ^

8 error(s) found
Compile error for /tmp/dojo-gcd-1.almd:
compile failed
FAILED: /tmp/dojo-gcd-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-gcd-2.almd
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-2.almd:3:40
  in call to gcd()
  hint: Check the function name
  |
3 | test "gcd 0 0 is 0" { assert_eq(gcd(0, 0), 0) }
  |                                        ^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-2.almd:4:40
  in call to gcd()
  hint: Check the function name
  |
4 | test "gcd 5 0 is 5" { assert_eq(gcd(5, 0), 5) }
  |                                        ^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-2.almd:5:40
  in call to gcd()
  hint: Check the function name
  |
5 | test "gcd 0 7 is 7" { assert_eq(gcd(0, 7), 7) }
  |                                        ^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-2.almd:6:42
  in call to gcd()
  hint: Check the function name
  |
6 | test "gcd 12 8 is 4" { assert_eq(gcd(12, 8), 4) }
  |                                          ^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-2.almd:7:43
  in call to gcd()
  hint: Check the function name
  |
7 | test "gcd 17 13 is 1" { assert_eq(gcd(17, 13), 1) }
  |                                           ^^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-2.almd:8:46
  in call to gcd()
  hint: Check the function name
  |
8 | test "gcd 100 75 is 25" { assert_eq(gcd(100, 75), 25) }
  |                                              ^^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-2.almd:9:43
  in call to gcd()
  hint: Check the function name
  |
9 | test "gcd 54 24 is 6" { assert_eq(gcd(54, 24), 6) }
  |                                           ^^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-2.almd:10:43
  in call to gcd()
  hint: Check the function name
   |
10 | test "gcd same number" { assert_eq(gcd(7, 7), 7) }
   |                                           ^

8 error(s) found
Compile error for /tmp/dojo-gcd-2.almd:
compile failed
FAILED: /tmp/dojo-gcd-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-gcd-3.almd
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-3.almd:3:40
  in call to gcd()
  hint: Check the function name
  |
3 | test "gcd 0 0 is 0" { assert_eq(gcd(0, 0), 0) }
  |                                        ^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-3.almd:4:40
  in call to gcd()
  hint: Check the function name
  |
4 | test "gcd 5 0 is 5" { assert_eq(gcd(5, 0), 5) }
  |                                        ^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-3.almd:5:40
  in call to gcd()
  hint: Check the function name
  |
5 | test "gcd 0 7 is 7" { assert_eq(gcd(0, 7), 7) }
  |                                        ^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-3.almd:6:42
  in call to gcd()
  hint: Check the function name
  |
6 | test "gcd 12 8 is 4" { assert_eq(gcd(12, 8), 4) }
  |                                          ^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-3.almd:7:43
  in call to gcd()
  hint: Check the function name
  |
7 | test "gcd 17 13 is 1" { assert_eq(gcd(17, 13), 1) }
  |                                           ^^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-3.almd:8:46
  in call to gcd()
  hint: Check the function name
  |
8 | test "gcd 100 75 is 25" { assert_eq(gcd(100, 75), 25) }
  |                                              ^^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-3.almd:9:43
  in call to gcd()
  hint: Check the function name
  |
9 | test "gcd 54 24 is 6" { assert_eq(gcd(54, 24), 6) }
  |                                           ^^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-3.almd:10:43
  in call to gcd()
  hint: Check the function name
   |
10 | test "gcd same number" { assert_eq(gcd(7, 7), 7) }
   |                                           ^

8 error(s) found
Compile error for /tmp/dojo-gcd-3.almd:
compile failed
FAILED: /tmp/dojo-gcd-3.almd

1/1 test file(s) failed

```
