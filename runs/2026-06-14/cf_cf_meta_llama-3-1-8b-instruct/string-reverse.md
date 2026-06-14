# string-reverse

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
Compiling /tmp/dojo-string-reverse-0.almd
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-0.almd:3:49
  in call to reverse()
  hint: Check the function name
  |
3 | test "reverse empty string" { assert_eq(reverse(""), "") }
  |                                                 ^^
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-0.almd:4:48
  in call to reverse()
  hint: Check the function name
  |
4 | test "reverse single char" { assert_eq(reverse("a"), "a") }
  |                                                ^^^
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-0.almd:5:42
  in call to reverse()
  hint: Check the function name
  |
5 | test "reverse hello" { assert_eq(reverse("hello"), "olleh") }
  |                                          ^^^^^^^
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-0.almd:6:54
  in call to reverse()
  hint: Check the function name
  |
6 | test "reverse racecar is itself" { assert_eq(reverse("racecar"), "racecar") }
  |                                                      ^^^^^^^^^
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-0.almd:7:42
  in call to reverse()
  hint: Check the function name
  |
7 | test "reverse abcde" { assert_eq(reverse("abcde"), "edcba") }
  |                                          ^^^^^^^

5 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-1.almd:3:49
  in call to reverse()
  hint: Check the function name
  |
3 | test "reverse empty string" { assert_eq(reverse(""), "") }
  |                                                 ^^
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-1.almd:4:48
  in call to reverse()
  hint: Check the function name
  |
4 | test "reverse single char" { assert_eq(reverse("a"), "a") }
  |                                                ^^^
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-1.almd:5:42
  in call to reverse()
  hint: Check the function name
  |
5 | test "reverse hello" { assert_eq(reverse("hello"), "olleh") }
  |                                          ^^^^^^^
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-1.almd:6:54
  in call to reverse()
  hint: Check the function name
  |
6 | test "reverse racecar is itself" { assert_eq(reverse("racecar"), "racecar") }
  |                                                      ^^^^^^^^^
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-1.almd:7:42
  in call to reverse()
  hint: Check the function name
  |
7 | test "reverse abcde" { assert_eq(reverse("abcde"), "edcba") }
  |                                          ^^^^^^^

5 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-2.almd:3:49
  in call to reverse()
  hint: Check the function name
  |
3 | test "reverse empty string" { assert_eq(reverse(""), "") }
  |                                                 ^^
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-2.almd:4:48
  in call to reverse()
  hint: Check the function name
  |
4 | test "reverse single char" { assert_eq(reverse("a"), "a") }
  |                                                ^^^
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-2.almd:5:42
  in call to reverse()
  hint: Check the function name
  |
5 | test "reverse hello" { assert_eq(reverse("hello"), "olleh") }
  |                                          ^^^^^^^
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-2.almd:6:54
  in call to reverse()
  hint: Check the function name
  |
6 | test "reverse racecar is itself" { assert_eq(reverse("racecar"), "racecar") }
  |                                                      ^^^^^^^^^
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-2.almd:7:42
  in call to reverse()
  hint: Check the function name
  |
7 | test "reverse abcde" { assert_eq(reverse("abcde"), "edcba") }
  |                                          ^^^^^^^

5 error(s) found
Compile error for /tmp/dojo-string-reverse-2.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-3.almd:3:49
  in call to reverse()
  hint: Check the function name
  |
3 | test "reverse empty string" { assert_eq(reverse(""), "") }
  |                                                 ^^
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-3.almd:4:48
  in call to reverse()
  hint: Check the function name
  |
4 | test "reverse single char" { assert_eq(reverse("a"), "a") }
  |                                                ^^^
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-3.almd:5:42
  in call to reverse()
  hint: Check the function name
  |
5 | test "reverse hello" { assert_eq(reverse("hello"), "olleh") }
  |                                          ^^^^^^^
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-3.almd:6:54
  in call to reverse()
  hint: Check the function name
  |
6 | test "reverse racecar is itself" { assert_eq(reverse("racecar"), "racecar") }
  |                                                      ^^^^^^^^^
error[E002]: undefined function 'reverse'
  --> /tmp/dojo-string-reverse-3.almd:7:42
  in call to reverse()
  hint: Check the function name
  |
7 | test "reverse abcde" { assert_eq(reverse("abcde"), "edcba") }
  |                                          ^^^^^^^

5 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
