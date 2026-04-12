# title-case

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-title-case-3.almd
error: Expected ')' to close function call opened at line 2:16
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-title-case-3.almd:4:13
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |     string.join(
  |                --------------- '(' opened here
...
4 |             .map(|word| string.capitalize(string.to_lower(word)))
  |             ^
error: Expected ')' to close function call opened at line 2:16 at line 4:13
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-title-case-3.almd:2:16
  |
2 |     string.join(
  |                ^
error[E002]: undefined function 'title_case'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-title-case-3.almd:8:48
  in call to title_case()
  hint: Check the function name
  |
8 | test "title_case empty" { assert_eq(title_case(""), "") }
  |                                                ^^
error[E002]: undefined function 'title_case'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-title-case-3.almd:9:54
  in call to title_case()
  hint: Check the function name
  |
9 | test "title_case single word" { assert_eq(title_case("hello"), "Hello") }
  |                                                      ^^^^^^^
error[E002]: undefined function 'title_case'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-title-case-3.almd:10:52
  in call to title_case()
  hint: Check the function name
   |
10 | test "title_case two words" { assert_eq(title_case("hello world"), "Hello World") }
   |                                                    ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-title-case-3.almd:11:57
  in call to title_case()
  hint: Check the function name
   |
11 | test "title_case already titled" { assert_eq(title_case("Hello World"), "Hello World") }
   |                                                         ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-title-case-3.almd:12:52
  in call to title_case()
  hint: Check the function name
   |
12 | test "title_case all upper" { assert_eq(title_case("HELLO WORLD"), "Hello World") }
   |                                                    ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-title-case-3.almd:13:48
  in call to title_case()
  hint: Check the function name
   |
13 | test "title_case mixed" { assert_eq(title_case("hELLO wORLD"), "Hello World") }
   |                                                ^^^^^^^^^^^^^
error[E002]: undefined function 'title_case'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-title-case-3.almd:14:60
  in call to title_case()
  hint: Check the function name
   |
14 | test "title_case single char words" { assert_eq(title_case("a b c"), "A B C") }
   |                                                            ^^^^^^^

9 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-title-case-3.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-title-case-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
fn title_case(s: String) -> String = 
    string.join(
        string.split(s, " ")
            .map(|word| string.capitalize(string.to_lower(word)))
            .to_vec(), 
        " ")
```
