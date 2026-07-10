# anagram-check

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let
    remove_spaces_and_sort = (string.to_lower >> string.chars >> list.filter((x) => not (string.is_whitespace(x))) >> list.sort)
  in
    remove_spaces_and_sort(a) == remove_spaces_and_sort(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:6
  |
2 |   let
  |      ^
error: Expected expression at line 4:3 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:4:3
  |
4 |   in
  |   ^
error[E004]: list.filter() expects 2 argument(s) but got 1
  --> /tmp/dojo-anagram-check-0.almd:3:111
  in call to list.filter()
  hint: Check the number of arguments
  try:
      // list.filter() takes 2 arg(s) — you passed 1
      list.filter(<xs: List[A]>, <f: fn(A) -> Bool>)
  |
3 |     remove_spaces_and_sort = (string.to_lower >> string.chars >> list.filter((x) => not (string.is_whitespace(x))) >> list.sort)
  |                                                                                                               ^
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-0.almd:3:111
  in call to list.filter()
  hint: Fix the argument type
  |
3 |     remove_spaces_and_sort = (string.to_lower >> string.chars >> list.filter((x) => not (string.is_whitespace(x))) >> list.sort)
  |                                                                                                               ^
error[E002]: undefined function 'remove_spaces_and_sort'
  --> /tmp/dojo-anagram-check-0.almd:5:28
  in call to remove_spaces_and_sort()
  hint: Check the function name
  |
5 |     remove_spaces_and_sort(a) == remove_spaces_and_sort(b)
  |                            ^
error[E002]: undefined function 'remove_spaces_and_sort'
  --> /tmp/dojo-anagram-check-0.almd:5:57
  in call to remove_spaces_and_sort()
  hint: Check the function name
  |
5 |     remove_spaces_and_sort(a) == remove_spaces_and_sort(b)
  |                                                         ^
error[E001]: type mismatch in call to list.filter(): expected List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-0.almd:3:111
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
3 |     remove_spaces_and_sort = (string.to_lower >> string.chars >> list.filter((x) => not (string.is_whitespace(x))) >> list.sort)
  |                                                                                                               ^

7 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let
    a_sorted = string.to_lower(a) |> string.chars |> list.filter((x) => not (string.is_whitespace(x))) |> list.sort
    b_sorted = string.to_lower(b) |> string.chars |> list.filter((x) => not (string.is_whitespace(x))) |> list.sort
  in
    a_sorted == b_sorted
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-anagram-check-1.almd:2:6
  |
2 |   let
  |      ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-anagram-check-1.almd:5:3
  |
5 |   in
  |   ^
error[E003]: undefined variable 'a_sorted'
  --> /tmp/dojo-anagram-check-1.almd:6:5
  in variable a_sorted
  hint: Check the variable name
  |
6 |     a_sorted == b_sorted
  |     ^^^^^^^^
error[E003]: undefined variable 'b_sorted'
  --> /tmp/dojo-anagram-check-1.almd:6:17
  in variable b_sorted
  hint: Check the variable name
  |
6 |     a_sorted == b_sorted
  |                 ^^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let a_sorted = string.to_lower(a) |> string.chars |> list.filter((x) => not (string.is_whitespace(x))) |> list.sort
  let b_sorted = string.to_lower(b) |> string.chars |> list.filter((x) => not (string.is_whitespace(x))) |> list.sort
  in a_sorted == b_sorted
```
