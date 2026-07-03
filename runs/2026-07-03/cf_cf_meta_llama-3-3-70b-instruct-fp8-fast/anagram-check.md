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
        a_chars = string.chars(string.to_lower(a)) |> list.filter((x) => x != " ")
        b_chars = string.chars(string.to_lower(b)) |> list.filter((x) => x != " ")
    in 
        list.sort(a_chars) == list.sort(b_chars)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:9
  |
2 |     let
  |         ^
error: Expected expression at line 5:5 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:5:5
  |
5 |     in
  |     ^
error[E003]: undefined variable 'a_chars'
  --> /tmp/dojo-anagram-check-0.almd:6:19
  in variable a_chars
  hint: Check the variable name
  |
6 |         list.sort(a_chars) == list.sort(b_chars)
  |                   ^^^^^^^
error[E003]: undefined variable 'b_chars'
  --> /tmp/dojo-anagram-check-0.almd:6:41
  in variable b_chars
  hint: Check the variable name
  |
6 |         list.sort(a_chars) == list.sort(b_chars)
  |                                         ^^^^^^^

4 error(s) found
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
    |> (x) => list.filter((y) => y != " ", x)
    |> (a_chars) => 
        string.to_lower(b) 
        |> (x) => string.chars(x) 
        |> (x) => list.filter((y) => y != " ", x)
        |> (b_chars) => list.sort(a_chars) == list.sort(b_chars)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:4:44
  in call to list.filter()
  hint: Fix the argument type
  |
4 |     |> (x) => list.filter((y) => y != " ", x)
  |                                            ^
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:8:48
  in call to list.filter()
  hint: Fix the argument type
  |
8 |         |> (x) => list.filter((y) => y != " ", x)
  |                                                ^
error[E001]: type mismatch in call to list.filter(): expected List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:4:44
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
4 |     |> (x) => list.filter((y) => y != " ", x)
  |                                            ^
error[E001]: type mismatch in call to list.filter(): expected List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:8:48
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
8 |         |> (x) => list.filter((y) => y != " ", x)
  |                                                ^
error[E001]: type mismatch in pipe call: expected fn(fn(A) -> Bool) -> Bool but got fn(List[String]) -> ?13
  --> /tmp/dojo-anagram-check-1.almd:9:57
  in pipe call
  hint: Fix the expression type or change the expected type
  |
9 |         |> (b_chars) => list.sort(a_chars) == list.sort(b_chars)
  |                                                         ^^^^^^^
error[E001]: type mismatch in pipe call: expected fn(fn(A) -> Bool) -> ?13 but got fn(List[String]) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:9:57
  in pipe call
  hint: Fix the expression type or change the expected type
  |
9 |         |> (b_chars) => list.sort(a_chars) == list.sort(b_chars)
  |                                                         ^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let a_lower = string.to_lower(a)
    let a_chars = string.chars(a_lower) |> list.filter((y) => y != " ")
    let b_lower = string.to_lower(b)
    let b_chars = string.chars(b_lower) |> list.filter((y) => y != " ")
    list.sort(a_chars) == list.sort(b_chars)
```
