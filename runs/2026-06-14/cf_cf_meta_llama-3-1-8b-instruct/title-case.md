# title-case

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
Compiling /tmp/dojo-title-case-0.almd
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-0.almd:3:48
  in call to title_case()
  hint: Check the function name
  |
3 | test "title_case empty" { assert_eq(title_case(""), "") }
  |                                                ^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-0.almd:4:54
  in call to title_case()
  hint: Check the function name
  |
4 | test "title_case single word" { assert_eq(title_case("hello"), "Hello") }
  |                                                      ^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-0.almd:5:52
  in call to title_case()
  hint: Check the function name
  |
5 | test "title_case two words" { assert_eq(title_case("hello world"), "Hello World") }
  |                                                    ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-0.almd:6:57
  in call to title_case()
  hint: Check the function name
  |
6 | test "title_case already titled" { assert_eq(title_case("Hello World"), "Hello World") }
  |                                                         ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-0.almd:7:52
  in call to title_case()
  hint: Check the function name
  |
7 | test "title_case all upper" { assert_eq(title_case("HELLO WORLD"), "Hello World") }
  |                                                    ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-0.almd:8:48
  in call to title_case()
  hint: Check the function name
  |
8 | test "title_case mixed" { assert_eq(title_case("hELLO wORLD"), "Hello World") }
  |                                                ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-0.almd:9:60
  in call to title_case()
  hint: Check the function name
  |
9 | test "title_case single char words" { assert_eq(title_case("a b c"), "A B C") }
  |                                                            ^^^^^^^

7 error(s) found
Compile error for /tmp/dojo-title-case-0.almd:
compile failed
FAILED: /tmp/dojo-title-case-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-1.almd
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-1.almd:3:48
  in call to title_case()
  hint: Check the function name
  |
3 | test "title_case empty" { assert_eq(title_case(""), "") }
  |                                                ^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-1.almd:4:54
  in call to title_case()
  hint: Check the function name
  |
4 | test "title_case single word" { assert_eq(title_case("hello"), "Hello") }
  |                                                      ^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-1.almd:5:52
  in call to title_case()
  hint: Check the function name
  |
5 | test "title_case two words" { assert_eq(title_case("hello world"), "Hello World") }
  |                                                    ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-1.almd:6:57
  in call to title_case()
  hint: Check the function name
  |
6 | test "title_case already titled" { assert_eq(title_case("Hello World"), "Hello World") }
  |                                                         ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-1.almd:7:52
  in call to title_case()
  hint: Check the function name
  |
7 | test "title_case all upper" { assert_eq(title_case("HELLO WORLD"), "Hello World") }
  |                                                    ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-1.almd:8:48
  in call to title_case()
  hint: Check the function name
  |
8 | test "title_case mixed" { assert_eq(title_case("hELLO wORLD"), "Hello World") }
  |                                                ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-1.almd:9:60
  in call to title_case()
  hint: Check the function name
  |
9 | test "title_case single char words" { assert_eq(title_case("a b c"), "A B C") }
  |                                                            ^^^^^^^

7 error(s) found
Compile error for /tmp/dojo-title-case-1.almd:
compile failed
FAILED: /tmp/dojo-title-case-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-2.almd
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-2.almd:3:48
  in call to title_case()
  hint: Check the function name
  |
3 | test "title_case empty" { assert_eq(title_case(""), "") }
  |                                                ^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-2.almd:4:54
  in call to title_case()
  hint: Check the function name
  |
4 | test "title_case single word" { assert_eq(title_case("hello"), "Hello") }
  |                                                      ^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-2.almd:5:52
  in call to title_case()
  hint: Check the function name
  |
5 | test "title_case two words" { assert_eq(title_case("hello world"), "Hello World") }
  |                                                    ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-2.almd:6:57
  in call to title_case()
  hint: Check the function name
  |
6 | test "title_case already titled" { assert_eq(title_case("Hello World"), "Hello World") }
  |                                                         ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-2.almd:7:52
  in call to title_case()
  hint: Check the function name
  |
7 | test "title_case all upper" { assert_eq(title_case("HELLO WORLD"), "Hello World") }
  |                                                    ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-2.almd:8:48
  in call to title_case()
  hint: Check the function name
  |
8 | test "title_case mixed" { assert_eq(title_case("hELLO wORLD"), "Hello World") }
  |                                                ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-2.almd:9:60
  in call to title_case()
  hint: Check the function name
  |
9 | test "title_case single char words" { assert_eq(title_case("a b c"), "A B C") }
  |                                                            ^^^^^^^

7 error(s) found
Compile error for /tmp/dojo-title-case-2.almd:
compile failed
FAILED: /tmp/dojo-title-case-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-3.almd
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-3.almd:3:48
  in call to title_case()
  hint: Check the function name
  |
3 | test "title_case empty" { assert_eq(title_case(""), "") }
  |                                                ^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-3.almd:4:54
  in call to title_case()
  hint: Check the function name
  |
4 | test "title_case single word" { assert_eq(title_case("hello"), "Hello") }
  |                                                      ^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-3.almd:5:52
  in call to title_case()
  hint: Check the function name
  |
5 | test "title_case two words" { assert_eq(title_case("hello world"), "Hello World") }
  |                                                    ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-3.almd:6:57
  in call to title_case()
  hint: Check the function name
  |
6 | test "title_case already titled" { assert_eq(title_case("Hello World"), "Hello World") }
  |                                                         ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-3.almd:7:52
  in call to title_case()
  hint: Check the function name
  |
7 | test "title_case all upper" { assert_eq(title_case("HELLO WORLD"), "Hello World") }
  |                                                    ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-3.almd:8:48
  in call to title_case()
  hint: Check the function name
  |
8 | test "title_case mixed" { assert_eq(title_case("hELLO wORLD"), "Hello World") }
  |                                                ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-3.almd:9:60
  in call to title_case()
  hint: Check the function name
  |
9 | test "title_case single char words" { assert_eq(title_case("a b c"), "A B C") }
  |                                                            ^^^^^^^

7 error(s) found
Compile error for /tmp/dojo-title-case-3.almd:
compile failed
FAILED: /tmp/dojo-title-case-3.almd

1/1 test file(s) failed

```
