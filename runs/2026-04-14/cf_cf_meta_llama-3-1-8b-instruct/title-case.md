# title-case

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String {
    let words = s.split(" ").map(|word| string.capitalize(word)).toList();
    string.join(words, " ")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-0.almd
error: Missing '=' before function body at line 1:36
  --> /tmp/dojo-title-case-0.almd:1:36
  hint: Almide requires '=' before the body. Write: fn title_case(...) -> Type = { ... }
  |
1 | fn title_case(s: String) -> String {
  |                                    ^
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
    let words = s.split(" ").map(|word| string.capitalize(word)).toList();
    string.join(words, " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-1.almd
error: '|x|' closure syntax is not valid in Almide at line 2:34
  --> /tmp/dojo-title-case-1.almd:2:34
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |     let words = s.split(" ").map(|word| string.capitalize(word)).toList();
  |                                  ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-title-case-1.almd:3:17
  in variable words
  hint: Check the variable name
  |
3 |     string.join(words, " ")
  |                 ^^^^^

2 error(s) found
Compile error for /tmp/dojo-title-case-1.almd:
compile failed
FAILED: /tmp/dojo-title-case-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn title_case(s: String) -> String = 
    let words = s.split(" ").map((word) => string.capitalize(word)).toList();
    string.join(words, " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-2.almd
error[E001]: type mismatch in method call: expected List[String] but got fn() -> List[String]
  --> /tmp/dojo-title-case-2.almd:2:17
  in method call
  hint: Fix the expression type or change the expected type
  |
2 |     let words = s.split(" ").map((word) => string.capitalize(word)).toList();
  |                 ^

1 error(s) found
Compile error for /tmp/dojo-title-case-2.almd:
compile failed
FAILED: /tmp/dojo-title-case-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn title_case(s: String) -> String = 
    let words = s.split(" ").map((word) => string.capitalize(word)).toList();
    string.join(words, " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-3.almd
error[E001]: type mismatch in method call: expected List[String] but got fn() -> List[String]
  --> /tmp/dojo-title-case-3.almd:2:17
  in method call
  hint: Fix the expression type or change the expected type
  |
2 |     let words = s.split(" ").map((word) => string.capitalize(word)).toList();
  |                 ^

1 error(s) found
Compile error for /tmp/dojo-title-case-3.almd:
compile failed
FAILED: /tmp/dojo-title-case-3.almd

1/1 test file(s) failed

```
