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
        clean = (s) => 
            string.chars(s) 
            |> list.filter((c) => not(string.is_whitespace(c)))
            |> list.map((c) => string.to_lower(c))
        sorted_chars = (s) => list.sort(clean(s))
    in 
        sorted_chars(a) == sorted_chars(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:9
  |
2 |     let
  |         ^
error: Expected expression at line 8:5 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:8:5
  |
8 |     in
  |     ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:7:47
  in call to clean()
  hint: Check the function name
  |
7 |         sorted_chars = (s) => list.sort(clean(s))
  |                                               ^
error[E002]: undefined function 'sorted_chars'
  --> /tmp/dojo-anagram-check-0.almd:9:22
  in call to sorted_chars()
  hint: Did you mean `string.chars`?
  try:
      // sorted_chars(...)  →  string.chars(...)
      string.chars(...)
  |
9 |         sorted_chars(a) == sorted_chars(b)
  |                      ^
error[E002]: undefined function 'sorted_chars'
  --> /tmp/dojo-anagram-check-0.almd:9:41
  in call to sorted_chars()
  hint: Did you mean `string.chars`?
  try:
      // sorted_chars(...)  →  string.chars(...)
      string.chars(...)
  |
9 |         sorted_chars(a) == sorted_chars(b)
  |                                         ^

5 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let clean = (s) => 
        string.chars(s) 
        |> list.filter((c) => not(string.is_whitespace(c)))
        |> list.map((c) => string.to_lower(c))
    in 
        list.sort(clean(a)) == list.sort(clean(b))
```
