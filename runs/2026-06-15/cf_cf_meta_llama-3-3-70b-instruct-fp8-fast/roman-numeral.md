# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
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
Compiling /tmp/dojo-roman-numeral-0.almd
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-0.almd:3:40
  in call to to_roman()
  hint: Check the function name
  |
3 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
  |                                        ^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-0.almd:4:40
  in call to to_roman()
  hint: Check the function name
  |
4 | test "to_roman 4" { assert_eq(to_roman(4), "IV") }
  |                                        ^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-0.almd:5:40
  in call to to_roman()
  hint: Check the function name
  |
5 | test "to_roman 9" { assert_eq(to_roman(9), "IX") }
  |                                        ^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-0.almd:6:41
  in call to to_roman()
  hint: Check the function name
  |
6 | test "to_roman 14" { assert_eq(to_roman(14), "XIV") }
  |                                         ^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-0.almd:7:41
  in call to to_roman()
  hint: Check the function name
  |
7 | test "to_roman 42" { assert_eq(to_roman(42), "XLII") }
  |                                         ^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-0.almd:8:41
  in call to to_roman()
  hint: Check the function name
  |
8 | test "to_roman 99" { assert_eq(to_roman(99), "XCIX") }
  |                                         ^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-0.almd:9:42
  in call to to_roman()
  hint: Check the function name
  |
9 | test "to_roman 399" { assert_eq(to_roman(399), "CCCXCIX") }
  |                                          ^^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-0.almd:10:42
  in call to to_roman()
  hint: Check the function name
   |
10 | test "to_roman 500" { assert_eq(to_roman(500), "D") }
   |                                          ^^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-0.almd:11:43
  in call to to_roman()
  hint: Check the function name
   |
11 | test "to_roman 1994" { assert_eq(to_roman(1994), "MCMXCIV") }
   |                                           ^^^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-0.almd:12:43
  in call to to_roman()
  hint: Check the function name
   |
12 | test "to_roman 3999" { assert_eq(to_roman(3999), "MMMCMXCIX") }
   |                                           ^^^^

10 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-1.almd:3:40
  in call to to_roman()
  hint: Check the function name
  |
3 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
  |                                        ^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-1.almd:4:40
  in call to to_roman()
  hint: Check the function name
  |
4 | test "to_roman 4" { assert_eq(to_roman(4), "IV") }
  |                                        ^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-1.almd:5:40
  in call to to_roman()
  hint: Check the function name
  |
5 | test "to_roman 9" { assert_eq(to_roman(9), "IX") }
  |                                        ^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-1.almd:6:41
  in call to to_roman()
  hint: Check the function name
  |
6 | test "to_roman 14" { assert_eq(to_roman(14), "XIV") }
  |                                         ^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-1.almd:7:41
  in call to to_roman()
  hint: Check the function name
  |
7 | test "to_roman 42" { assert_eq(to_roman(42), "XLII") }
  |                                         ^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-1.almd:8:41
  in call to to_roman()
  hint: Check the function name
  |
8 | test "to_roman 99" { assert_eq(to_roman(99), "XCIX") }
  |                                         ^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-1.almd:9:42
  in call to to_roman()
  hint: Check the function name
  |
9 | test "to_roman 399" { assert_eq(to_roman(399), "CCCXCIX") }
  |                                          ^^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-1.almd:10:42
  in call to to_roman()
  hint: Check the function name
   |
10 | test "to_roman 500" { assert_eq(to_roman(500), "D") }
   |                                          ^^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-1.almd:11:43
  in call to to_roman()
  hint: Check the function name
   |
11 | test "to_roman 1994" { assert_eq(to_roman(1994), "MCMXCIV") }
   |                                           ^^^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-1.almd:12:43
  in call to to_roman()
  hint: Check the function name
   |
12 | test "to_roman 3999" { assert_eq(to_roman(3999), "MMMCMXCIX") }
   |                                           ^^^^

10 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-2.almd:3:40
  in call to to_roman()
  hint: Check the function name
  |
3 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
  |                                        ^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-2.almd:4:40
  in call to to_roman()
  hint: Check the function name
  |
4 | test "to_roman 4" { assert_eq(to_roman(4), "IV") }
  |                                        ^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-2.almd:5:40
  in call to to_roman()
  hint: Check the function name
  |
5 | test "to_roman 9" { assert_eq(to_roman(9), "IX") }
  |                                        ^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-2.almd:6:41
  in call to to_roman()
  hint: Check the function name
  |
6 | test "to_roman 14" { assert_eq(to_roman(14), "XIV") }
  |                                         ^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-2.almd:7:41
  in call to to_roman()
  hint: Check the function name
  |
7 | test "to_roman 42" { assert_eq(to_roman(42), "XLII") }
  |                                         ^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-2.almd:8:41
  in call to to_roman()
  hint: Check the function name
  |
8 | test "to_roman 99" { assert_eq(to_roman(99), "XCIX") }
  |                                         ^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-2.almd:9:42
  in call to to_roman()
  hint: Check the function name
  |
9 | test "to_roman 399" { assert_eq(to_roman(399), "CCCXCIX") }
  |                                          ^^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-2.almd:10:42
  in call to to_roman()
  hint: Check the function name
   |
10 | test "to_roman 500" { assert_eq(to_roman(500), "D") }
   |                                          ^^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-2.almd:11:43
  in call to to_roman()
  hint: Check the function name
   |
11 | test "to_roman 1994" { assert_eq(to_roman(1994), "MCMXCIV") }
   |                                           ^^^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-2.almd:12:43
  in call to to_roman()
  hint: Check the function name
   |
12 | test "to_roman 3999" { assert_eq(to_roman(3999), "MMMCMXCIX") }
   |                                           ^^^^

10 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-3.almd:3:40
  in call to to_roman()
  hint: Check the function name
  |
3 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
  |                                        ^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-3.almd:4:40
  in call to to_roman()
  hint: Check the function name
  |
4 | test "to_roman 4" { assert_eq(to_roman(4), "IV") }
  |                                        ^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-3.almd:5:40
  in call to to_roman()
  hint: Check the function name
  |
5 | test "to_roman 9" { assert_eq(to_roman(9), "IX") }
  |                                        ^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-3.almd:6:41
  in call to to_roman()
  hint: Check the function name
  |
6 | test "to_roman 14" { assert_eq(to_roman(14), "XIV") }
  |                                         ^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-3.almd:7:41
  in call to to_roman()
  hint: Check the function name
  |
7 | test "to_roman 42" { assert_eq(to_roman(42), "XLII") }
  |                                         ^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-3.almd:8:41
  in call to to_roman()
  hint: Check the function name
  |
8 | test "to_roman 99" { assert_eq(to_roman(99), "XCIX") }
  |                                         ^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-3.almd:9:42
  in call to to_roman()
  hint: Check the function name
  |
9 | test "to_roman 399" { assert_eq(to_roman(399), "CCCXCIX") }
  |                                          ^^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-3.almd:10:42
  in call to to_roman()
  hint: Check the function name
   |
10 | test "to_roman 500" { assert_eq(to_roman(500), "D") }
   |                                          ^^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-3.almd:11:43
  in call to to_roman()
  hint: Check the function name
   |
11 | test "to_roman 1994" { assert_eq(to_roman(1994), "MCMXCIV") }
   |                                           ^^^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-3.almd:12:43
  in call to to_roman()
  hint: Check the function name
   |
12 | test "to_roman 3999" { assert_eq(to_roman(3999), "MMMCMXCIX") }
   |                                           ^^^^

10 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
