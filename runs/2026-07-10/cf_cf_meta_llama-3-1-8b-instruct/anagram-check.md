# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool {
    let a_chars = string.chars(a)
    let b_chars = string.chars(b)
    let a_chars_no_spaces = list.filter(a_chars, (x) => not(string.is_whitespace(x)))
    let b_chars_no_spaces = list.filter(b_chars, (x) => not(string.is_whitespace(x)))
    let a_chars_lower = list.map(a_chars_no_spaces, (x) => string.to_lower(x))
    let b_chars_lower = list.map(b_chars_no_spaces, (x) => string.to_lower(x))
    list.sort(a_chars_lower) == list.sort(b_chars_lower)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Missing '=' before function body at line 1:45
  --> /tmp/dojo-anagram-check-0.almd:1:45
  hint: Almide requires '=' before the body. Write: fn is_anagram(...) -> Type = { ... }
  |
1 | fn is_anagram(a: String, b: String) -> Bool {
  |                                             ^

1 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
    let a_chars = string.chars(a)
    let b_chars = string.chars(b)
    let a_chars_no_spaces = list.filter(a_chars, (x) => not(string.is_whitespace(x)))
    let b_chars_no_spaces = list.filter(b_chars, (x) => not(string.is_whitespace(x)))
    let a_chars_lower = list.map(a_chars_no_spaces, (x) => string.to_lower(x))
    let b_chars_lower = list.map(b_chars_no_spaces, (x) => string.to_lower(x))
    list.sort(a_chars_lower) == list.sort(b_chars_lower)
}
```
