# zip-with

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
Compiling /tmp/dojo-zip-with-0.almd
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-0.almd:3:81
  in call to zip_with()
  hint: Check the function name
  |
3 | test "zip_with add" { assert_eq(zip_with([1, 2, 3], [10, 20, 30], (a, b) => a + b), [11, 22, 33]) }
  |                                                                                 ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-0.almd:4:77
  in call to zip_with()
  hint: Check the function name
  |
4 | test "zip_with multiply" { assert_eq(zip_with([2, 3], [4, 5], (a, b) => a * b), [8, 15]) }
  |                                                                             ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-0.almd:5:87
  in call to zip_with()
  hint: Check the function name
  |
5 | test "zip_with shorter left" { assert_eq(zip_with([1, 2], [10, 20, 30], (a, b) => a + b), [11, 22]) }
  |                                                                                       ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-0.almd:6:87
  in call to zip_with()
  hint: Check the function name
  |
6 | test "zip_with shorter right" { assert_eq(zip_with([1, 2, 3], [10, 20], (a, b) => a + b), [11, 22]) }
  |                                                                                       ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-0.almd:7:75
  in call to zip_with()
  hint: Check the function name
  |
7 | test "zip_with empty left" { assert_eq(zip_with([], [1, 2], (a, b) => a + b), []) }
  |                                                                           ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-0.almd:8:76
  in call to zip_with()
  hint: Check the function name
  |
8 | test "zip_with empty right" { assert_eq(zip_with([1, 2], [], (a, b) => a + b), []) }
  |                                                                            ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-0.almd:9:71
  in call to zip_with()
  hint: Check the function name
  |
9 | test "zip_with both empty" { assert_eq(zip_with([], [], (a, b) => a + b), []) }
  |                                                                       ^

7 error(s) found
Compile error for /tmp/dojo-zip-with-0.almd:
compile failed
FAILED: /tmp/dojo-zip-with-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-1.almd
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-1.almd:3:81
  in call to zip_with()
  hint: Check the function name
  |
3 | test "zip_with add" { assert_eq(zip_with([1, 2, 3], [10, 20, 30], (a, b) => a + b), [11, 22, 33]) }
  |                                                                                 ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-1.almd:4:77
  in call to zip_with()
  hint: Check the function name
  |
4 | test "zip_with multiply" { assert_eq(zip_with([2, 3], [4, 5], (a, b) => a * b), [8, 15]) }
  |                                                                             ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-1.almd:5:87
  in call to zip_with()
  hint: Check the function name
  |
5 | test "zip_with shorter left" { assert_eq(zip_with([1, 2], [10, 20, 30], (a, b) => a + b), [11, 22]) }
  |                                                                                       ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-1.almd:6:87
  in call to zip_with()
  hint: Check the function name
  |
6 | test "zip_with shorter right" { assert_eq(zip_with([1, 2, 3], [10, 20], (a, b) => a + b), [11, 22]) }
  |                                                                                       ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-1.almd:7:75
  in call to zip_with()
  hint: Check the function name
  |
7 | test "zip_with empty left" { assert_eq(zip_with([], [1, 2], (a, b) => a + b), []) }
  |                                                                           ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-1.almd:8:76
  in call to zip_with()
  hint: Check the function name
  |
8 | test "zip_with empty right" { assert_eq(zip_with([1, 2], [], (a, b) => a + b), []) }
  |                                                                            ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-1.almd:9:71
  in call to zip_with()
  hint: Check the function name
  |
9 | test "zip_with both empty" { assert_eq(zip_with([], [], (a, b) => a + b), []) }
  |                                                                       ^

7 error(s) found
Compile error for /tmp/dojo-zip-with-1.almd:
compile failed
FAILED: /tmp/dojo-zip-with-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-2.almd
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-2.almd:3:81
  in call to zip_with()
  hint: Check the function name
  |
3 | test "zip_with add" { assert_eq(zip_with([1, 2, 3], [10, 20, 30], (a, b) => a + b), [11, 22, 33]) }
  |                                                                                 ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-2.almd:4:77
  in call to zip_with()
  hint: Check the function name
  |
4 | test "zip_with multiply" { assert_eq(zip_with([2, 3], [4, 5], (a, b) => a * b), [8, 15]) }
  |                                                                             ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-2.almd:5:87
  in call to zip_with()
  hint: Check the function name
  |
5 | test "zip_with shorter left" { assert_eq(zip_with([1, 2], [10, 20, 30], (a, b) => a + b), [11, 22]) }
  |                                                                                       ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-2.almd:6:87
  in call to zip_with()
  hint: Check the function name
  |
6 | test "zip_with shorter right" { assert_eq(zip_with([1, 2, 3], [10, 20], (a, b) => a + b), [11, 22]) }
  |                                                                                       ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-2.almd:7:75
  in call to zip_with()
  hint: Check the function name
  |
7 | test "zip_with empty left" { assert_eq(zip_with([], [1, 2], (a, b) => a + b), []) }
  |                                                                           ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-2.almd:8:76
  in call to zip_with()
  hint: Check the function name
  |
8 | test "zip_with empty right" { assert_eq(zip_with([1, 2], [], (a, b) => a + b), []) }
  |                                                                            ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-2.almd:9:71
  in call to zip_with()
  hint: Check the function name
  |
9 | test "zip_with both empty" { assert_eq(zip_with([], [], (a, b) => a + b), []) }
  |                                                                       ^

7 error(s) found
Compile error for /tmp/dojo-zip-with-2.almd:
compile failed
FAILED: /tmp/dojo-zip-with-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-3.almd
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-3.almd:3:81
  in call to zip_with()
  hint: Check the function name
  |
3 | test "zip_with add" { assert_eq(zip_with([1, 2, 3], [10, 20, 30], (a, b) => a + b), [11, 22, 33]) }
  |                                                                                 ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-3.almd:4:77
  in call to zip_with()
  hint: Check the function name
  |
4 | test "zip_with multiply" { assert_eq(zip_with([2, 3], [4, 5], (a, b) => a * b), [8, 15]) }
  |                                                                             ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-3.almd:5:87
  in call to zip_with()
  hint: Check the function name
  |
5 | test "zip_with shorter left" { assert_eq(zip_with([1, 2], [10, 20, 30], (a, b) => a + b), [11, 22]) }
  |                                                                                       ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-3.almd:6:87
  in call to zip_with()
  hint: Check the function name
  |
6 | test "zip_with shorter right" { assert_eq(zip_with([1, 2, 3], [10, 20], (a, b) => a + b), [11, 22]) }
  |                                                                                       ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-3.almd:7:75
  in call to zip_with()
  hint: Check the function name
  |
7 | test "zip_with empty left" { assert_eq(zip_with([], [1, 2], (a, b) => a + b), []) }
  |                                                                           ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-3.almd:8:76
  in call to zip_with()
  hint: Check the function name
  |
8 | test "zip_with empty right" { assert_eq(zip_with([1, 2], [], (a, b) => a + b), []) }
  |                                                                            ^
error[E002]: undefined function 'zip_with'
  --> /tmp/dojo-zip-with-3.almd:9:71
  in call to zip_with()
  hint: Check the function name
  |
9 | test "zip_with both empty" { assert_eq(zip_with([], [], (a, b) => a + b), []) }
  |                                                                       ^

7 error(s) found
Compile error for /tmp/dojo-zip-with-3.almd:
compile failed
FAILED: /tmp/dojo-zip-with-3.almd

1/1 test file(s) failed

```
