# anagram-check

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let 
        clean = (string.to_lower >> (string.chars >> list.filter((x) => x != " "))
        sorted_a = list.sort(clean(a))
        sorted_b = list.sort(clean(b))
    in 
        sorted_a == sorted_b
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:9
  |
2 |     let
  |         ^
error: Expected ')' to close parenthesized expression opened at line 3:17
  --> /tmp/dojo-anagram-check-0.almd:3:83
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
3 |         clean = (string.to_lower >> (string.chars >> list.filter((x) => x != " "))
  |                 --------------- '(' opened here
  |
3 |         clean = (string.to_lower >> (string.chars >> list.filter((x) => x != " "))
  |                                                                                   ^
error: Expected expression at line 6:5 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:6:5
  |
6 |     in
  |     ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:4:36
  in call to clean()
  hint: Check the function name
  |
4 |         sorted_a = list.sort(clean(a))
  |                                    ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:5:36
  in call to clean()
  hint: Check the function name
  |
5 |         sorted_b = list.sort(clean(b))
  |                                    ^
error[E003]: undefined variable 'sorted_a'
  --> /tmp/dojo-anagram-check-0.almd:7:9
  in variable sorted_a
  hint: Check the variable name
  |
7 |         sorted_a == sorted_b
  |         ^^^^^^^^
error[E003]: undefined variable 'sorted_b'
  --> /tmp/dojo-anagram-check-0.almd:7:21
  in variable sorted_b
  hint: Check the variable name
  |
7 |         sorted_a == sorted_b
  |                     ^^^^^^^^

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
        clean_s = (string.to_lower >> (string.chars >> (list.filter((x) => x != " "))))
        sorted_a = clean_s(a) |> list.sort
        sorted_b = clean_s(b) |> list.sort
    in 
        sorted_a == sorted_b
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-anagram-check-1.almd:2:9
  |
2 |     let
  |         ^
error: Expected expression at line 6:5 (got In 'in')
  --> /tmp/dojo-anagram-check-1.almd:6:5
  |
6 |     in
  |     ^
error[E004]: list.filter() expects 2 argument(s) but got 1
  --> /tmp/dojo-anagram-check-1.almd:3:81
  in call to list.filter()
  hint: Check the number of arguments
  try:
      // list.filter() takes 2 arg(s) — you passed 1
      list.filter(<xs: List[A]>, <f: fn(A) -> Bool>)
  |
3 |         clean_s = (string.to_lower >> (string.chars >> (list.filter((x) => x != " "))))
  |                                                                                 ^^^
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:3:81
  in call to list.filter()
  hint: Fix the argument type
  |
3 |         clean_s = (string.to_lower >> (string.chars >> (list.filter((x) => x != " "))))
  |                                                                                 ^^^
error[E002]: undefined function 'clean_s'
  --> /tmp/dojo-anagram-check-1.almd:4:28
  in call to clean_s()
  hint: Check the function name
  |
4 |         sorted_a = clean_s(a) |> list.sort
  |                            ^
error[E002]: undefined function 'clean_s'
  --> /tmp/dojo-anagram-check-1.almd:5:28
  in call to clean_s()
  hint: Check the function name
  |
5 |         sorted_b = clean_s(b) |> list.sort
  |                            ^
error[E003]: undefined variable 'sorted_a'
  --> /tmp/dojo-anagram-check-1.almd:7:9
  in variable sorted_a
  hint: Check the variable name
  |
7 |         sorted_a == sorted_b
  |         ^^^^^^^^
error[E003]: undefined variable 'sorted_b'
  --> /tmp/dojo-anagram-check-1.almd:7:21
  in variable sorted_b
  hint: Check the variable name
  |
7 |         sorted_a == sorted_b
  |                     ^^^^^^^^
error[E001]: type mismatch in call to list.filter(): expected List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:3:81
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
3 |         clean_s = (string.to_lower >> (string.chars >> (list.filter((x) => x != " "))))
  |                                                                                 ^^^

9 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let 
        clean_s = (x) => string.to_lower(x) |> string.chars |> list.filter((x) => x != " ")
        sorted_a = clean_s(a) |> list.sort
        sorted_b = clean_s(b) |> list.sort
    in 
        sorted_a == sorted_b
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-anagram-check-2.almd:2:9
  |
2 |     let
  |         ^
error: Expected expression at line 6:5 (got In 'in')
  --> /tmp/dojo-anagram-check-2.almd:6:5
  |
6 |     in
  |     ^
error[E002]: undefined function 'clean_s'
  --> /tmp/dojo-anagram-check-2.almd:4:28
  in call to clean_s()
  hint: Check the function name
  |
4 |         sorted_a = clean_s(a) |> list.sort
  |                            ^
error[E002]: undefined function 'clean_s'
  --> /tmp/dojo-anagram-check-2.almd:5:28
  in call to clean_s()
  hint: Check the function name
  |
5 |         sorted_b = clean_s(b) |> list.sort
  |                            ^
error[E003]: undefined variable 'sorted_a'
  --> /tmp/dojo-anagram-check-2.almd:7:9
  in variable sorted_a
  hint: Check the variable name
  |
7 |         sorted_a == sorted_b
  |         ^^^^^^^^
error[E003]: undefined variable 'sorted_b'
  --> /tmp/dojo-anagram-check-2.almd:7:21
  in variable sorted_b
  hint: Check the variable name
  |
7 |         sorted_a == sorted_b
  |                     ^^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let clean_s = (x) => string.to_lower(x) |> string.chars |> list.filter((x) => x != " ")
    let sorted_a = clean_s(a) |> list.sort
    let sorted_b = clean_s(b) |> list.sort
    in sorted_a == sorted_b
```
