# balanced-parens

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
Compiling /tmp/dojo-balanced-parens-0.almd
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-0.almd:3:47
  in call to is_balanced()
  hint: Check the function name
  |
3 | test "balanced empty" { assert_eq(is_balanced(""), true) }
  |                                               ^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-0.almd:4:55
  in call to is_balanced()
  hint: Check the function name
  |
4 | test "balanced simple parens" { assert_eq(is_balanced("()"), true) }
  |                                                       ^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-0.almd:5:48
  in call to is_balanced()
  hint: Check the function name
  |
5 | test "balanced nested" { assert_eq(is_balanced("([{}])"), true) }
  |                                                ^^^^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-0.almd:6:52
  in call to is_balanced()
  hint: Check the function name
  |
6 | test "balanced sequential" { assert_eq(is_balanced("()[]{}"), true) }
  |                                                    ^^^^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-0.almd:7:51
  in call to is_balanced()
  hint: Check the function name
  |
7 | test "balanced with text" { assert_eq(is_balanced("fn foo(x: Int) -> { x }"), true) }
  |                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-0.almd:8:49
  in call to is_balanced()
  hint: Check the function name
  |
8 | test "unbalanced cross" { assert_eq(is_balanced("([)]"), false) }
  |                                                 ^^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-0.almd:9:48
  in call to is_balanced()
  hint: Check the function name
  |
9 | test "unbalanced open" { assert_eq(is_balanced("("), false) }
  |                                                ^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-0.almd:10:49
  in call to is_balanced()
  hint: Check the function name
   |
10 | test "unbalanced close" { assert_eq(is_balanced(")"), false) }
   |                                                 ^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-0.almd:11:55
  in call to is_balanced()
  hint: Check the function name
   |
11 | test "unbalanced extra close" { assert_eq(is_balanced("())"), false) }
   |                                                       ^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-0.almd:12:52
  in call to is_balanced()
  hint: Check the function name
   |
12 | test "unbalanced mismatch" { assert_eq(is_balanced("(]"), false) }
   |                                                    ^^^^

10 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-1.almd:3:47
  in call to is_balanced()
  hint: Check the function name
  |
3 | test "balanced empty" { assert_eq(is_balanced(""), true) }
  |                                               ^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-1.almd:4:55
  in call to is_balanced()
  hint: Check the function name
  |
4 | test "balanced simple parens" { assert_eq(is_balanced("()"), true) }
  |                                                       ^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-1.almd:5:48
  in call to is_balanced()
  hint: Check the function name
  |
5 | test "balanced nested" { assert_eq(is_balanced("([{}])"), true) }
  |                                                ^^^^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-1.almd:6:52
  in call to is_balanced()
  hint: Check the function name
  |
6 | test "balanced sequential" { assert_eq(is_balanced("()[]{}"), true) }
  |                                                    ^^^^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-1.almd:7:51
  in call to is_balanced()
  hint: Check the function name
  |
7 | test "balanced with text" { assert_eq(is_balanced("fn foo(x: Int) -> { x }"), true) }
  |                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-1.almd:8:49
  in call to is_balanced()
  hint: Check the function name
  |
8 | test "unbalanced cross" { assert_eq(is_balanced("([)]"), false) }
  |                                                 ^^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-1.almd:9:48
  in call to is_balanced()
  hint: Check the function name
  |
9 | test "unbalanced open" { assert_eq(is_balanced("("), false) }
  |                                                ^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-1.almd:10:49
  in call to is_balanced()
  hint: Check the function name
   |
10 | test "unbalanced close" { assert_eq(is_balanced(")"), false) }
   |                                                 ^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-1.almd:11:55
  in call to is_balanced()
  hint: Check the function name
   |
11 | test "unbalanced extra close" { assert_eq(is_balanced("())"), false) }
   |                                                       ^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-1.almd:12:52
  in call to is_balanced()
  hint: Check the function name
   |
12 | test "unbalanced mismatch" { assert_eq(is_balanced("(]"), false) }
   |                                                    ^^^^

10 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-2.almd:3:47
  in call to is_balanced()
  hint: Check the function name
  |
3 | test "balanced empty" { assert_eq(is_balanced(""), true) }
  |                                               ^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-2.almd:4:55
  in call to is_balanced()
  hint: Check the function name
  |
4 | test "balanced simple parens" { assert_eq(is_balanced("()"), true) }
  |                                                       ^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-2.almd:5:48
  in call to is_balanced()
  hint: Check the function name
  |
5 | test "balanced nested" { assert_eq(is_balanced("([{}])"), true) }
  |                                                ^^^^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-2.almd:6:52
  in call to is_balanced()
  hint: Check the function name
  |
6 | test "balanced sequential" { assert_eq(is_balanced("()[]{}"), true) }
  |                                                    ^^^^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-2.almd:7:51
  in call to is_balanced()
  hint: Check the function name
  |
7 | test "balanced with text" { assert_eq(is_balanced("fn foo(x: Int) -> { x }"), true) }
  |                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-2.almd:8:49
  in call to is_balanced()
  hint: Check the function name
  |
8 | test "unbalanced cross" { assert_eq(is_balanced("([)]"), false) }
  |                                                 ^^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-2.almd:9:48
  in call to is_balanced()
  hint: Check the function name
  |
9 | test "unbalanced open" { assert_eq(is_balanced("("), false) }
  |                                                ^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-2.almd:10:49
  in call to is_balanced()
  hint: Check the function name
   |
10 | test "unbalanced close" { assert_eq(is_balanced(")"), false) }
   |                                                 ^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-2.almd:11:55
  in call to is_balanced()
  hint: Check the function name
   |
11 | test "unbalanced extra close" { assert_eq(is_balanced("())"), false) }
   |                                                       ^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-2.almd:12:52
  in call to is_balanced()
  hint: Check the function name
   |
12 | test "unbalanced mismatch" { assert_eq(is_balanced("(]"), false) }
   |                                                    ^^^^

10 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-3.almd:3:47
  in call to is_balanced()
  hint: Check the function name
  |
3 | test "balanced empty" { assert_eq(is_balanced(""), true) }
  |                                               ^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-3.almd:4:55
  in call to is_balanced()
  hint: Check the function name
  |
4 | test "balanced simple parens" { assert_eq(is_balanced("()"), true) }
  |                                                       ^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-3.almd:5:48
  in call to is_balanced()
  hint: Check the function name
  |
5 | test "balanced nested" { assert_eq(is_balanced("([{}])"), true) }
  |                                                ^^^^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-3.almd:6:52
  in call to is_balanced()
  hint: Check the function name
  |
6 | test "balanced sequential" { assert_eq(is_balanced("()[]{}"), true) }
  |                                                    ^^^^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-3.almd:7:51
  in call to is_balanced()
  hint: Check the function name
  |
7 | test "balanced with text" { assert_eq(is_balanced("fn foo(x: Int) -> { x }"), true) }
  |                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-3.almd:8:49
  in call to is_balanced()
  hint: Check the function name
  |
8 | test "unbalanced cross" { assert_eq(is_balanced("([)]"), false) }
  |                                                 ^^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-3.almd:9:48
  in call to is_balanced()
  hint: Check the function name
  |
9 | test "unbalanced open" { assert_eq(is_balanced("("), false) }
  |                                                ^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-3.almd:10:49
  in call to is_balanced()
  hint: Check the function name
   |
10 | test "unbalanced close" { assert_eq(is_balanced(")"), false) }
   |                                                 ^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-3.almd:11:55
  in call to is_balanced()
  hint: Check the function name
   |
11 | test "unbalanced extra close" { assert_eq(is_balanced("())"), false) }
   |                                                       ^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-3.almd:12:52
  in call to is_balanced()
  hint: Check the function name
   |
12 | test "unbalanced mismatch" { assert_eq(is_balanced("(]"), false) }
   |                                                    ^^^^

10 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
