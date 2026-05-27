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
        clean = (string.to_lower) >> ((x) => list.filter(string.chars(x), (x) => not(string.is_whitespace(x))))
    in
    list.sort(clean(a)) == list.sort(clean(b))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:9
  |
2 |     let
  |         ^
error: Expected expression at line 4:5 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:4:5
  |
4 |     in
  |     ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:5:21
  in call to clean()
  hint: Check the function name
  |
5 |     list.sort(clean(a)) == list.sort(clean(b))
  |                     ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:5:44
  in call to clean()
  hint: Check the function name
  |
5 |     list.sort(clean(a)) == list.sort(clean(b))
  |                                            ^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let clean = (x) => list.filter(string.chars(string.to_lower(x)), (x) => not(string.is_whitespace(x)))
    in list.sort(clean(a)) == list.sort(clean(b))
```
