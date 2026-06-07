# anagram-check

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let
    to_sorted_chars = (s) =>
      string.to_lower(s)
      |> string.chars
      |> list.filter((c) => not(string.is_whitespace(c)))
      |> list.sort
  in
  to_sorted_chars(a) == to_sorted_chars(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:6
  |
2 |   let
  |      ^
error: Expected expression at line 8:3 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:8:3
  |
8 |   in
  |   ^
error[E002]: undefined function 'to_sorted_chars'
  --> /tmp/dojo-anagram-check-0.almd:9:19
  in call to to_sorted_chars()
  hint: Check the function name
  |
9 |   to_sorted_chars(a) == to_sorted_chars(b)
  |                   ^
error[E002]: undefined function 'to_sorted_chars'
  --> /tmp/dojo-anagram-check-0.almd:9:41
  in call to to_sorted_chars()
  hint: Check the function name
  |
9 |   to_sorted_chars(a) == to_sorted_chars(b)
  |                                         ^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let to_sorted_chars = (s) => 
    string.to_lower(s) 
    |> string.chars 
    |> list.filter((c) => not(string.is_whitespace(c))) 
    |> list.sort
  in to_sorted_chars(a) == to_sorted_chars(b)
```
