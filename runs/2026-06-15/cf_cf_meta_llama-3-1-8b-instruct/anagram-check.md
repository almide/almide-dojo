# anagram-check

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
Compiling /tmp/dojo-anagram-check-0.almd
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-0.almd:3:49
  in call to is_anagram()
  hint: Check the function name
  |
3 | test "anagram empty" { assert_eq(is_anagram("", ""), true) }
  |                                                 ^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-0.almd:4:56
  in call to is_anagram()
  hint: Check the function name
  |
4 | test "anagram simple" { assert_eq(is_anagram("listen", "silent"), true) }
  |                                                        ^^^^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-0.almd:5:66
  in call to is_anagram()
  hint: Check the function name
  |
5 | test "anagram case insensitive" { assert_eq(is_anagram("Listen", "Silent"), true) }
  |                                                                  ^^^^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-0.almd:6:60
  in call to is_anagram()
  hint: Check the function name
  |
6 | test "anagram with spaces" { assert_eq(is_anagram("a b c", "cba"), true) }
  |                                                            ^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-0.almd:7:68
  in call to is_anagram()
  hint: Check the function name
  |
7 | test "not anagram different chars" { assert_eq(is_anagram("hello", "world"), false) }
  |                                                                    ^^^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-0.almd:8:68
  in call to is_anagram()
  hint: Check the function name
  |
8 | test "not anagram different lengths" { assert_eq(is_anagram("abc", "abcd"), false) }
  |                                                                    ^^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-0.almd:9:57
  in call to is_anagram()
  hint: Check the function name
  |
9 | test "anagram same word" { assert_eq(is_anagram("test", "test"), true) }
  |                                                         ^^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-0.almd:10:57
  in call to is_anagram()
  hint: Check the function name
   |
10 | test "not anagram subset" { assert_eq(is_anagram("abc", "ab"), false) }
   |                                                         ^^^^

8 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-1.almd:3:49
  in call to is_anagram()
  hint: Check the function name
  |
3 | test "anagram empty" { assert_eq(is_anagram("", ""), true) }
  |                                                 ^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-1.almd:4:56
  in call to is_anagram()
  hint: Check the function name
  |
4 | test "anagram simple" { assert_eq(is_anagram("listen", "silent"), true) }
  |                                                        ^^^^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-1.almd:5:66
  in call to is_anagram()
  hint: Check the function name
  |
5 | test "anagram case insensitive" { assert_eq(is_anagram("Listen", "Silent"), true) }
  |                                                                  ^^^^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-1.almd:6:60
  in call to is_anagram()
  hint: Check the function name
  |
6 | test "anagram with spaces" { assert_eq(is_anagram("a b c", "cba"), true) }
  |                                                            ^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-1.almd:7:68
  in call to is_anagram()
  hint: Check the function name
  |
7 | test "not anagram different chars" { assert_eq(is_anagram("hello", "world"), false) }
  |                                                                    ^^^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-1.almd:8:68
  in call to is_anagram()
  hint: Check the function name
  |
8 | test "not anagram different lengths" { assert_eq(is_anagram("abc", "abcd"), false) }
  |                                                                    ^^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-1.almd:9:57
  in call to is_anagram()
  hint: Check the function name
  |
9 | test "anagram same word" { assert_eq(is_anagram("test", "test"), true) }
  |                                                         ^^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-1.almd:10:57
  in call to is_anagram()
  hint: Check the function name
   |
10 | test "not anagram subset" { assert_eq(is_anagram("abc", "ab"), false) }
   |                                                         ^^^^

8 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-2.almd:3:49
  in call to is_anagram()
  hint: Check the function name
  |
3 | test "anagram empty" { assert_eq(is_anagram("", ""), true) }
  |                                                 ^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-2.almd:4:56
  in call to is_anagram()
  hint: Check the function name
  |
4 | test "anagram simple" { assert_eq(is_anagram("listen", "silent"), true) }
  |                                                        ^^^^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-2.almd:5:66
  in call to is_anagram()
  hint: Check the function name
  |
5 | test "anagram case insensitive" { assert_eq(is_anagram("Listen", "Silent"), true) }
  |                                                                  ^^^^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-2.almd:6:60
  in call to is_anagram()
  hint: Check the function name
  |
6 | test "anagram with spaces" { assert_eq(is_anagram("a b c", "cba"), true) }
  |                                                            ^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-2.almd:7:68
  in call to is_anagram()
  hint: Check the function name
  |
7 | test "not anagram different chars" { assert_eq(is_anagram("hello", "world"), false) }
  |                                                                    ^^^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-2.almd:8:68
  in call to is_anagram()
  hint: Check the function name
  |
8 | test "not anagram different lengths" { assert_eq(is_anagram("abc", "abcd"), false) }
  |                                                                    ^^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-2.almd:9:57
  in call to is_anagram()
  hint: Check the function name
  |
9 | test "anagram same word" { assert_eq(is_anagram("test", "test"), true) }
  |                                                         ^^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-2.almd:10:57
  in call to is_anagram()
  hint: Check the function name
   |
10 | test "not anagram subset" { assert_eq(is_anagram("abc", "ab"), false) }
   |                                                         ^^^^

8 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-3.almd:3:49
  in call to is_anagram()
  hint: Check the function name
  |
3 | test "anagram empty" { assert_eq(is_anagram("", ""), true) }
  |                                                 ^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-3.almd:4:56
  in call to is_anagram()
  hint: Check the function name
  |
4 | test "anagram simple" { assert_eq(is_anagram("listen", "silent"), true) }
  |                                                        ^^^^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-3.almd:5:66
  in call to is_anagram()
  hint: Check the function name
  |
5 | test "anagram case insensitive" { assert_eq(is_anagram("Listen", "Silent"), true) }
  |                                                                  ^^^^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-3.almd:6:60
  in call to is_anagram()
  hint: Check the function name
  |
6 | test "anagram with spaces" { assert_eq(is_anagram("a b c", "cba"), true) }
  |                                                            ^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-3.almd:7:68
  in call to is_anagram()
  hint: Check the function name
  |
7 | test "not anagram different chars" { assert_eq(is_anagram("hello", "world"), false) }
  |                                                                    ^^^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-3.almd:8:68
  in call to is_anagram()
  hint: Check the function name
  |
8 | test "not anagram different lengths" { assert_eq(is_anagram("abc", "abcd"), false) }
  |                                                                    ^^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-3.almd:9:57
  in call to is_anagram()
  hint: Check the function name
  |
9 | test "anagram same word" { assert_eq(is_anagram("test", "test"), true) }
  |                                                         ^^^^^^
error[E002]: undefined function 'is_anagram'
  --> /tmp/dojo-anagram-check-3.almd:10:57
  in call to is_anagram()
  hint: Check the function name
   |
10 | test "not anagram subset" { assert_eq(is_anagram("abc", "ab"), false) }
   |                                                         ^^^^

8 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
