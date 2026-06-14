# count-vowels

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
Compiling /tmp/dojo-count-vowels-0.almd
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-0.almd:3:52
  in call to count_vowels()
  hint: Check the function name
  |
3 | test "count_vowels empty" { assert_eq(count_vowels(""), 0) }
  |                                                    ^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-0.almd:4:52
  in call to count_vowels()
  hint: Check the function name
  |
4 | test "count_vowels hello" { assert_eq(count_vowels("hello"), 2) }
  |                                                    ^^^^^^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-0.almd:5:52
  in call to count_vowels()
  hint: Check the function name
  |
5 | test "count_vowels aeiou" { assert_eq(count_vowels("aeiou"), 5) }
  |                                                    ^^^^^^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-0.almd:6:56
  in call to count_vowels()
  hint: Check the function name
  |
6 | test "count_vowels no vowels" { assert_eq(count_vowels("rhythm"), 0) }
  |                                                        ^^^^^^^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-0.almd:7:64
  in call to count_vowels()
  hint: Check the function name
  |
7 | test "count_vowels uppercase ignored" { assert_eq(count_vowels("HELLO"), 0) }
  |                                                                ^^^^^^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-0.almd:8:57
  in call to count_vowels()
  hint: Check the function name
  |
8 | test "count_vowels mixed case" { assert_eq(count_vowels("Hello World"), 3) }
  |                                                         ^^^^^^^^^^^^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-0.almd:9:59
  in call to count_vowels()
  hint: Check the function name
  |
9 | test "count_vowels single vowel" { assert_eq(count_vowels("a"), 1) }
  |                                                           ^^^

7 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-1.almd
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-1.almd:3:52
  in call to count_vowels()
  hint: Check the function name
  |
3 | test "count_vowels empty" { assert_eq(count_vowels(""), 0) }
  |                                                    ^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-1.almd:4:52
  in call to count_vowels()
  hint: Check the function name
  |
4 | test "count_vowels hello" { assert_eq(count_vowels("hello"), 2) }
  |                                                    ^^^^^^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-1.almd:5:52
  in call to count_vowels()
  hint: Check the function name
  |
5 | test "count_vowels aeiou" { assert_eq(count_vowels("aeiou"), 5) }
  |                                                    ^^^^^^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-1.almd:6:56
  in call to count_vowels()
  hint: Check the function name
  |
6 | test "count_vowels no vowels" { assert_eq(count_vowels("rhythm"), 0) }
  |                                                        ^^^^^^^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-1.almd:7:64
  in call to count_vowels()
  hint: Check the function name
  |
7 | test "count_vowels uppercase ignored" { assert_eq(count_vowels("HELLO"), 0) }
  |                                                                ^^^^^^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-1.almd:8:57
  in call to count_vowels()
  hint: Check the function name
  |
8 | test "count_vowels mixed case" { assert_eq(count_vowels("Hello World"), 3) }
  |                                                         ^^^^^^^^^^^^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-1.almd:9:59
  in call to count_vowels()
  hint: Check the function name
  |
9 | test "count_vowels single vowel" { assert_eq(count_vowels("a"), 1) }
  |                                                           ^^^

7 error(s) found
Compile error for /tmp/dojo-count-vowels-1.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-2.almd
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-2.almd:3:52
  in call to count_vowels()
  hint: Check the function name
  |
3 | test "count_vowels empty" { assert_eq(count_vowels(""), 0) }
  |                                                    ^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-2.almd:4:52
  in call to count_vowels()
  hint: Check the function name
  |
4 | test "count_vowels hello" { assert_eq(count_vowels("hello"), 2) }
  |                                                    ^^^^^^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-2.almd:5:52
  in call to count_vowels()
  hint: Check the function name
  |
5 | test "count_vowels aeiou" { assert_eq(count_vowels("aeiou"), 5) }
  |                                                    ^^^^^^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-2.almd:6:56
  in call to count_vowels()
  hint: Check the function name
  |
6 | test "count_vowels no vowels" { assert_eq(count_vowels("rhythm"), 0) }
  |                                                        ^^^^^^^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-2.almd:7:64
  in call to count_vowels()
  hint: Check the function name
  |
7 | test "count_vowels uppercase ignored" { assert_eq(count_vowels("HELLO"), 0) }
  |                                                                ^^^^^^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-2.almd:8:57
  in call to count_vowels()
  hint: Check the function name
  |
8 | test "count_vowels mixed case" { assert_eq(count_vowels("Hello World"), 3) }
  |                                                         ^^^^^^^^^^^^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-2.almd:9:59
  in call to count_vowels()
  hint: Check the function name
  |
9 | test "count_vowels single vowel" { assert_eq(count_vowels("a"), 1) }
  |                                                           ^^^

7 error(s) found
Compile error for /tmp/dojo-count-vowels-2.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-3.almd
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-3.almd:3:52
  in call to count_vowels()
  hint: Check the function name
  |
3 | test "count_vowels empty" { assert_eq(count_vowels(""), 0) }
  |                                                    ^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-3.almd:4:52
  in call to count_vowels()
  hint: Check the function name
  |
4 | test "count_vowels hello" { assert_eq(count_vowels("hello"), 2) }
  |                                                    ^^^^^^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-3.almd:5:52
  in call to count_vowels()
  hint: Check the function name
  |
5 | test "count_vowels aeiou" { assert_eq(count_vowels("aeiou"), 5) }
  |                                                    ^^^^^^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-3.almd:6:56
  in call to count_vowels()
  hint: Check the function name
  |
6 | test "count_vowels no vowels" { assert_eq(count_vowels("rhythm"), 0) }
  |                                                        ^^^^^^^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-3.almd:7:64
  in call to count_vowels()
  hint: Check the function name
  |
7 | test "count_vowels uppercase ignored" { assert_eq(count_vowels("HELLO"), 0) }
  |                                                                ^^^^^^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-3.almd:8:57
  in call to count_vowels()
  hint: Check the function name
  |
8 | test "count_vowels mixed case" { assert_eq(count_vowels("Hello World"), 3) }
  |                                                         ^^^^^^^^^^^^^
error[E002]: undefined function 'count_vowels'
  --> /tmp/dojo-count-vowels-3.almd:9:59
  in call to count_vowels()
  hint: Check the function name
  |
9 | test "count_vowels single vowel" { assert_eq(count_vowels("a"), 1) }
  |                                                           ^^^

7 error(s) found
Compile error for /tmp/dojo-count-vowels-3.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-3.almd

1/1 test file(s) failed

```
