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
    clean = (string.to_lower) >> ((s) => list.filter(string.chars(s), (c) => not(string.is_whitespace(c))))
    sorted_chars = (s) => list.sort(clean(s))
  in 
    sorted_chars(a) == sorted_chars(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:5:3
  |
5 |   in
  |   ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:4:43
  in call to clean()
  hint: Check the function name
  |
4 |     sorted_chars = (s) => list.sort(clean(s))
  |                                           ^
error[E002]: undefined function 'sorted_chars'
  --> /tmp/dojo-anagram-check-0.almd:6:18
  in call to sorted_chars()
  hint: Did you mean `string.chars`?
  try:
      // sorted_chars(...)  →  string.chars(...)
      string.chars(...)
  |
6 |     sorted_chars(a) == sorted_chars(b)
  |                  ^
error[E002]: undefined function 'sorted_chars'
  --> /tmp/dojo-anagram-check-0.almd:6:37
  in call to sorted_chars()
  hint: Did you mean `string.chars`?
  try:
      // sorted_chars(...)  →  string.chars(...)
      string.chars(...)
  |
6 |     sorted_chars(a) == sorted_chars(b)
  |                                     ^

5 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let 
    clean_a = list.filter(string.chars(string.to_lower(a)), (c) => not(string.is_whitespace(c)))
    clean_b = list.filter(string.chars(string.to_lower(b)), (c) => not(string.is_whitespace(c)))
  in 
    list.sort(clean_a) == list.sort(clean_b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-anagram-check-1.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-anagram-check-1.almd:5:3
  |
5 |   in
  |   ^
error[E003]: undefined variable 'clean_a'
  --> /tmp/dojo-anagram-check-1.almd:6:15
  in variable clean_a
  hint: Check the variable name
  |
6 |     list.sort(clean_a) == list.sort(clean_b)
  |               ^^^^^^^
error[E003]: undefined variable 'clean_b'
  --> /tmp/dojo-anagram-check-1.almd:6:37
  in variable clean_b
  hint: Check the variable name
  |
6 |     list.sort(clean_a) == list.sort(clean_b)
  |                                     ^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(list.filter(string.chars(string.to_lower(a)), (c) => not(string.is_whitespace(c)))) == 
  list.sort(list.filter(string.chars(string.to_lower(b)), (c) => not(string.is_whitespace(c))))
```
