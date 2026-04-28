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
    clean = (s) => list.filter(string.chars(s), (c) => c != " ")
    sorted = list.sort(clean(string.to_lower(a))) == list.sort(clean(string.to_lower(b)))
  in
    sorted
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:6
  |
2 |   let
  |      ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:5:3
  |
5 |   in
  |   ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:4:46
  in call to clean()
  hint: Check the function name
  |
4 |     sorted = list.sort(clean(string.to_lower(a))) == list.sort(clean(string.to_lower(b)))
  |                                              ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:4:86
  in call to clean()
  hint: Check the function name
  |
4 |     sorted = list.sort(clean(string.to_lower(a))) == list.sort(clean(string.to_lower(b)))
  |                                                                                      ^
error[E003]: undefined variable 'sorted'
  --> /tmp/dojo-anagram-check-0.almd:6:5
  in variable sorted
  hint: Check the variable name
  |
6 |     sorted
  |     ^^^^^^

5 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let clean = (s) => list.filter(string.chars(s), (c) => c != " ")
  in list.sort(clean(string.to_lower(a))) == list.sort(clean(string.to_lower(b)))
```
