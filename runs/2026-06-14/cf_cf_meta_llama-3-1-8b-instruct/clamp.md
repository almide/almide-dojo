# clamp

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
Compiling /tmp/dojo-clamp-0.almd
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-0.almd:3:47
  in call to clamp()
  hint: Check the function name
  |
3 | test "clamp in range" { assert_eq(clamp(5, 0, 10), 5) }
  |                                               ^^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-0.almd:4:49
  in call to clamp()
  hint: Check the function name
  |
4 | test "clamp below low" { assert_eq(clamp(-5, 0, 10), 0) }
  |                                                 ^^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-0.almd:5:50
  in call to clamp()
  hint: Check the function name
  |
5 | test "clamp above high" { assert_eq(clamp(15, 0, 10), 10) }
  |                                                  ^^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-0.almd:6:45
  in call to clamp()
  hint: Check the function name
  |
6 | test "clamp at low" { assert_eq(clamp(0, 0, 10), 0) }
  |                                             ^^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-0.almd:7:47
  in call to clamp()
  hint: Check the function name
  |
7 | test "clamp at high" { assert_eq(clamp(10, 0, 10), 10) }
  |                                               ^^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-0.almd:8:56
  in call to clamp()
  hint: Check the function name
  |
8 | test "clamp negative range" { assert_eq(clamp(0, -10, -5), -5) }
  |                                                        ^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-0.almd:9:51
  in call to clamp()
  hint: Check the function name
  |
9 | test "clamp single point" { assert_eq(clamp(3, 7, 7), 7) }
  |                                                   ^

7 error(s) found
Compile error for /tmp/dojo-clamp-0.almd:
compile failed
FAILED: /tmp/dojo-clamp-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-clamp-1.almd
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-1.almd:3:47
  in call to clamp()
  hint: Check the function name
  |
3 | test "clamp in range" { assert_eq(clamp(5, 0, 10), 5) }
  |                                               ^^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-1.almd:4:49
  in call to clamp()
  hint: Check the function name
  |
4 | test "clamp below low" { assert_eq(clamp(-5, 0, 10), 0) }
  |                                                 ^^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-1.almd:5:50
  in call to clamp()
  hint: Check the function name
  |
5 | test "clamp above high" { assert_eq(clamp(15, 0, 10), 10) }
  |                                                  ^^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-1.almd:6:45
  in call to clamp()
  hint: Check the function name
  |
6 | test "clamp at low" { assert_eq(clamp(0, 0, 10), 0) }
  |                                             ^^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-1.almd:7:47
  in call to clamp()
  hint: Check the function name
  |
7 | test "clamp at high" { assert_eq(clamp(10, 0, 10), 10) }
  |                                               ^^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-1.almd:8:56
  in call to clamp()
  hint: Check the function name
  |
8 | test "clamp negative range" { assert_eq(clamp(0, -10, -5), -5) }
  |                                                        ^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-1.almd:9:51
  in call to clamp()
  hint: Check the function name
  |
9 | test "clamp single point" { assert_eq(clamp(3, 7, 7), 7) }
  |                                                   ^

7 error(s) found
Compile error for /tmp/dojo-clamp-1.almd:
compile failed
FAILED: /tmp/dojo-clamp-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-clamp-2.almd
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-2.almd:3:47
  in call to clamp()
  hint: Check the function name
  |
3 | test "clamp in range" { assert_eq(clamp(5, 0, 10), 5) }
  |                                               ^^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-2.almd:4:49
  in call to clamp()
  hint: Check the function name
  |
4 | test "clamp below low" { assert_eq(clamp(-5, 0, 10), 0) }
  |                                                 ^^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-2.almd:5:50
  in call to clamp()
  hint: Check the function name
  |
5 | test "clamp above high" { assert_eq(clamp(15, 0, 10), 10) }
  |                                                  ^^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-2.almd:6:45
  in call to clamp()
  hint: Check the function name
  |
6 | test "clamp at low" { assert_eq(clamp(0, 0, 10), 0) }
  |                                             ^^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-2.almd:7:47
  in call to clamp()
  hint: Check the function name
  |
7 | test "clamp at high" { assert_eq(clamp(10, 0, 10), 10) }
  |                                               ^^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-2.almd:8:56
  in call to clamp()
  hint: Check the function name
  |
8 | test "clamp negative range" { assert_eq(clamp(0, -10, -5), -5) }
  |                                                        ^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-2.almd:9:51
  in call to clamp()
  hint: Check the function name
  |
9 | test "clamp single point" { assert_eq(clamp(3, 7, 7), 7) }
  |                                                   ^

7 error(s) found
Compile error for /tmp/dojo-clamp-2.almd:
compile failed
FAILED: /tmp/dojo-clamp-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-clamp-3.almd
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-3.almd:3:47
  in call to clamp()
  hint: Check the function name
  |
3 | test "clamp in range" { assert_eq(clamp(5, 0, 10), 5) }
  |                                               ^^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-3.almd:4:49
  in call to clamp()
  hint: Check the function name
  |
4 | test "clamp below low" { assert_eq(clamp(-5, 0, 10), 0) }
  |                                                 ^^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-3.almd:5:50
  in call to clamp()
  hint: Check the function name
  |
5 | test "clamp above high" { assert_eq(clamp(15, 0, 10), 10) }
  |                                                  ^^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-3.almd:6:45
  in call to clamp()
  hint: Check the function name
  |
6 | test "clamp at low" { assert_eq(clamp(0, 0, 10), 0) }
  |                                             ^^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-3.almd:7:47
  in call to clamp()
  hint: Check the function name
  |
7 | test "clamp at high" { assert_eq(clamp(10, 0, 10), 10) }
  |                                               ^^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-3.almd:8:56
  in call to clamp()
  hint: Check the function name
  |
8 | test "clamp negative range" { assert_eq(clamp(0, -10, -5), -5) }
  |                                                        ^
error[E002]: undefined function 'clamp'
  --> /tmp/dojo-clamp-3.almd:9:51
  in call to clamp()
  hint: Check the function name
  |
9 | test "clamp single point" { assert_eq(clamp(3, 7, 7), 7) }
  |                                                   ^

7 error(s) found
Compile error for /tmp/dojo-clamp-3.almd:
compile failed
FAILED: /tmp/dojo-clamp-3.almd

1/1 test file(s) failed

```
