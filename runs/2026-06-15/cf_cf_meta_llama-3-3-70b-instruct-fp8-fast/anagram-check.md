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
    clean_and_sort = (s) => 
      string.chars(s) 
      |> list.filter((ch) => not(string.is_whitespace(ch))) 
      |> list.map((ch) => string.to_lower(ch)) 
      |> list.sort
  in 
    clean_and_sort(a) == clean_and_sort(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 8:3 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:8:3
  |
8 |   in
  |   ^
error[E002]: undefined function 'clean_and_sort'
  --> /tmp/dojo-anagram-check-0.almd:9:20
  in call to clean_and_sort()
  hint: Check the function name
  |
9 |     clean_and_sort(a) == clean_and_sort(b)
  |                    ^
error[E002]: undefined function 'clean_and_sort'
  --> /tmp/dojo-anagram-check-0.almd:9:41
  in call to clean_and_sort()
  hint: Check the function name
  |
9 |     clean_and_sort(a) == clean_and_sort(b)
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
  let clean_and_sort = (s) => 
    string.chars(s) 
    |> list.filter((ch) => not(string.is_whitespace(ch))) 
    |> list.map((ch) => string.to_lower(ch)) 
    |> list.sort
  in clean_and_sort(a) == clean_and_sort(b)
```
