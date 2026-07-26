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
    clean = (string.to_lower >> (string.chars >> list.filter((x) => x != " "))
  in
  list.sort(clean(a)) == list.sort(clean(b))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:6
  |
2 |   let
  |      ^
error: Expected ')' to close parenthesized expression opened at line 3:13
  --> /tmp/dojo-anagram-check-0.almd:3:79
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
3 |     clean = (string.to_lower >> (string.chars >> list.filter((x) => x != " "))
  |             --------------- '(' opened here
  |
3 |     clean = (string.to_lower >> (string.chars >> list.filter((x) => x != " "))
  |                                                                               ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:5:19
  in call to clean()
  hint: Check the function name
  |
5 |   list.sort(clean(a)) == list.sort(clean(b))
  |                   ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:5:42
  in call to clean()
  hint: Check the function name
  |
5 |   list.sort(clean(a)) == list.sort(clean(b))
  |                                          ^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let clean = (x) => list.sort(list.filter(string.chars(string.to_lower(x)), (y) => y != " "))
  in clean(a) == clean(b)
```
