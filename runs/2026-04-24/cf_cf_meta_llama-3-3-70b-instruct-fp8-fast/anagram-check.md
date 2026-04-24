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
    lower_a = string.to_lower(a)
    lower_b = string.to_lower(b)
    chars_a = string.chars(lower_a) |> list.filter((x) => x != " ")
    chars_b = string.chars(lower_b) |> list.filter((x) => x != " ")
  in 
    list.sort(chars_a) == list.sort(chars_b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 7:3 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:7:3
  |
7 |   in
  |   ^
error[E003]: undefined variable 'lower_a'
  --> /tmp/dojo-anagram-check-0.almd:5:28
  in variable lower_a
  hint: Check the variable name
  |
5 |     chars_a = string.chars(lower_a) |> list.filter((x) => x != " ")
  |                            ^^^^^^^
error[E003]: undefined variable 'lower_b'
  --> /tmp/dojo-anagram-check-0.almd:6:28
  in variable lower_b
  hint: Check the variable name
  |
6 |     chars_b = string.chars(lower_b) |> list.filter((x) => x != " ")
  |                            ^^^^^^^
error[E003]: undefined variable 'chars_a'
  --> /tmp/dojo-anagram-check-0.almd:8:15
  in variable chars_a
  hint: Check the variable name
  |
8 |     list.sort(chars_a) == list.sort(chars_b)
  |               ^^^^^^^
error[E003]: undefined variable 'chars_b'
  --> /tmp/dojo-anagram-check-0.almd:8:37
  in variable chars_b
  hint: Check the variable name
  |
8 |     list.sort(chars_a) == list.sort(chars_b)
  |                                     ^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  string.to_lower(a) 
  |> (x) => string.chars(x) 
  |> (chars_a) => list.filter((x) => x != " ", chars_a) 
  |> (chars_a) => list.sort(chars_a) 
  == string.to_lower(b) 
  |> (x) => string.chars(x) 
  |> (chars_b) => list.filter((x) => x != " ", chars_b) 
  |> (chars_b) => list.sort(chars_b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:4:48
  in call to list.filter()
  hint: Fix the argument type
  |
4 |   |> (chars_a) => list.filter((x) => x != " ", chars_a)
  |                                                ^^^^^^^
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:8:48
  in call to list.filter()
  hint: Fix the argument type
  |
8 |   |> (chars_b) => list.filter((x) => x != " ", chars_b)
  |                                                ^^^^^^^
error[E001]: type mismatch in call to list.filter(): expected List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:4:48
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
4 |   |> (chars_a) => list.filter((x) => x != " ", chars_a)
  |                                                ^^^^^^^
error[E001]: type mismatch in call to list.filter(): expected List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:8:48
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
8 |   |> (chars_b) => list.filter((x) => x != " ", chars_b)
  |                                                ^^^^^^^
error[E001]: type mismatch in pipe call: expected fn(fn(A) -> Bool) -> List[?11] but got fn(List[String]) -> List[?5]
  --> /tmp/dojo-anagram-check-1.almd:9:29
  in pipe call
  hint: Fix the expression type or change the expected type
  |
9 |   |> (chars_b) => list.sort(chars_b)
  |                             ^^^^^^^
error[E001]: type mismatch in pipe call: expected fn(fn(A) -> Bool) -> Bool but got fn(List[String]) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:9:29
  in pipe call
  hint: Fix the expression type or change the expected type
  |
9 |   |> (chars_b) => list.sort(chars_b)
  |                             ^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let lower_a = string.to_lower(a)
  let lower_b = string.to_lower(b)
  let chars_a = string.chars(lower_a) |> list.filter((x) => x != " ")
  let chars_b = string.chars(lower_b) |> list.filter((x) => x != " ")
  list.sort(chars_a) == list.sort(chars_b)
```
