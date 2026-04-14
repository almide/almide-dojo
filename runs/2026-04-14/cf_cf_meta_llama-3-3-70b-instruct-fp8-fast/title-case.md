# title-case

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2

## Attempts

### Attempt 1 (FAIL)

```almide
def title_case(s: String): String = 
  string.join(
    string.split(s, " ").map(word => string.capitalize(string.to_lower(word))), 
    " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-0.almd
error: 'def' is not a keyword in Almide at line 1:1
  --> /tmp/dojo-title-case-0.almd:1:1
  hint: Use 'fn name(...) -> Type = expr' or 'effect fn name(...) -> Result[T, E] = expr'.
  |
1 | def title_case(s: String): String =
  | ^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-0.almd:6:48
  in call to title_case()
  hint: Check the function name
  |
6 | test "title_case empty" { assert_eq(title_case(""), "") }
  |                                                ^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-0.almd:7:54
  in call to title_case()
  hint: Check the function name
  |
7 | test "title_case single word" { assert_eq(title_case("hello"), "Hello") }
  |                                                      ^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-0.almd:8:52
  in call to title_case()
  hint: Check the function name
  |
8 | test "title_case two words" { assert_eq(title_case("hello world"), "Hello World") }
  |                                                    ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-0.almd:9:57
  in call to title_case()
  hint: Check the function name
  |
9 | test "title_case already titled" { assert_eq(title_case("Hello World"), "Hello World") }
  |                                                         ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-0.almd:10:52
  in call to title_case()
  hint: Check the function name
   |
10 | test "title_case all upper" { assert_eq(title_case("HELLO WORLD"), "Hello World") }
   |                                                    ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-0.almd:11:48
  in call to title_case()
  hint: Check the function name
   |
11 | test "title_case mixed" { assert_eq(title_case("hELLO wORLD"), "Hello World") }
   |                                                ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-0.almd:12:60
  in call to title_case()
  hint: Check the function name
   |
12 | test "title_case single char words" { assert_eq(title_case("a b c"), "A B C") }
   |                                                            ^^^^^^^

8 error(s) found
Compile error for /tmp/dojo-title-case-0.almd:
compile failed
FAILED: /tmp/dojo-title-case-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn title_case(s: String) -> String = 
  string.join(
    string.split(s, " ").map(word => string.capitalize(string.to_lower(word))), 
    " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-1.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-title-case-1.almd:3:35
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
3 |     string.split(s, " ").map(word => string.capitalize(string.to_lower(word))),
  |                                   ^^
error: Lambda parameter must be wrapped in parentheses at line 3:35
  --> /tmp/dojo-title-case-1.almd:3:35
  |
3 |     string.split(s, " ").map(word => string.capitalize(string.to_lower(word))),
  |                                   ^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-1.almd:6:48
  in call to title_case()
  hint: Check the function name
  |
6 | test "title_case empty" { assert_eq(title_case(""), "") }
  |                                                ^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-1.almd:7:54
  in call to title_case()
  hint: Check the function name
  |
7 | test "title_case single word" { assert_eq(title_case("hello"), "Hello") }
  |                                                      ^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-1.almd:8:52
  in call to title_case()
  hint: Check the function name
  |
8 | test "title_case two words" { assert_eq(title_case("hello world"), "Hello World") }
  |                                                    ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-1.almd:9:57
  in call to title_case()
  hint: Check the function name
  |
9 | test "title_case already titled" { assert_eq(title_case("Hello World"), "Hello World") }
  |                                                         ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-1.almd:10:52
  in call to title_case()
  hint: Check the function name
   |
10 | test "title_case all upper" { assert_eq(title_case("HELLO WORLD"), "Hello World") }
   |                                                    ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-1.almd:11:48
  in call to title_case()
  hint: Check the function name
   |
11 | test "title_case mixed" { assert_eq(title_case("hELLO wORLD"), "Hello World") }
   |                                                ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /tmp/dojo-title-case-1.almd:12:60
  in call to title_case()
  hint: Check the function name
   |
12 | test "title_case single char words" { assert_eq(title_case("a b c"), "A B C") }
   |                                                            ^^^^^^^

9 error(s) found
Compile error for /tmp/dojo-title-case-1.almd:
compile failed
FAILED: /tmp/dojo-title-case-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn title_case(s: String) -> String = 
  string.join(
    string.split(s, " ").map((word) => string.capitalize(string.to_lower(word))), 
    " ")
```
