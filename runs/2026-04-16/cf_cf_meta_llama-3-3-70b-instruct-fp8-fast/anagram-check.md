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
    clean = (string.to_lower >> string.chars >> list.filter((x) => not (string.is_whitespace(x))))
    sorted_a = clean(a) |> list.sort
    sorted_b = clean(b) |> list.sort
  in
  sorted_a == sorted_b
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:6
  |
2 |   let
  |      ^
error: Expected expression at line 6:3 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:6:3
  |
6 |   in
  |   ^
error[E004]: list.filter() expects 2 argument(s) but got 1
  --> /tmp/dojo-anagram-check-0.almd:3:94
  in call to list.filter()
  hint: Check the number of arguments
  try:
      // list.filter() takes 2 arg(s) — you passed 1
      list.filter(<xs: List[A]>, <f: fn(A) -> Bool>)
  |
3 |     clean = (string.to_lower >> string.chars >> list.filter((x) => not (string.is_whitespace(x))))
  |                                                                                              ^
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-0.almd:3:94
  in call to list.filter()
  hint: Fix the argument type
  |
3 |     clean = (string.to_lower >> string.chars >> list.filter((x) => not (string.is_whitespace(x))))
  |                                                                                              ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:4:22
  in call to clean()
  hint: Check the function name
  |
4 |     sorted_a = clean(a) |> list.sort
  |                      ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:5:22
  in call to clean()
  hint: Check the function name
  |
5 |     sorted_b = clean(b) |> list.sort
  |                      ^
error[E003]: undefined variable 'sorted_a'
  --> /tmp/dojo-anagram-check-0.almd:7:3
  in variable sorted_a
  hint: Check the variable name
  |
7 |   sorted_a == sorted_b
  |   ^^^^^^^^
error[E003]: undefined variable 'sorted_b'
  --> /tmp/dojo-anagram-check-0.almd:7:15
  in variable sorted_b
  hint: Check the variable name
  |
7 |   sorted_a == sorted_b
  |               ^^^^^^^^
error[E001]: type mismatch in call to list.filter(): expected List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-0.almd:3:94
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
3 |     clean = (string.to_lower >> string.chars >> list.filter((x) => not (string.is_whitespace(x))))
  |                                                                                              ^

9 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let clean = (string.to_lower >> (string.chars >> list.filter((x) => not (string.is_whitespace(x)))))
  in
  (clean(a) |> list.sort) == (clean(b) |> list.sort)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error[E004]: list.filter() expects 2 argument(s) but got 1
  --> /tmp/dojo-anagram-check-1.almd:2:97
  in call to list.filter()
  hint: Check the number of arguments
  try:
      // list.filter() takes 2 arg(s) — you passed 1
      list.filter(<xs: List[A]>, <f: fn(A) -> Bool>)
  |
2 |   let clean = (string.to_lower >> (string.chars >> list.filter((x) => not (string.is_whitespace(x)))))
  |                                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:2:97
  in call to list.filter()
  hint: Fix the argument type
  |
2 |   let clean = (string.to_lower >> (string.chars >> list.filter((x) => not (string.is_whitespace(x)))))
  |                                                                                                 ^
error[E001]: type mismatch in call to list.filter(): expected List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:2:97
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
2 |   let clean = (string.to_lower >> (string.chars >> list.filter((x) => not (string.is_whitespace(x)))))
  |                                                                                                 ^

3 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let clean = (string.to_lower >> (string.chars >> (xs) => list.filter(xs, (x) => not (string.is_whitespace(x)))))
  in
  (clean(a) |> list.sort) == (clean(b) |> list.sort)
```
