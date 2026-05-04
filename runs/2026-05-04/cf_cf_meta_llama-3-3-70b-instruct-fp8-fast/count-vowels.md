# count-vowels

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int =
  let
    chars = string.chars(s)
    vowels = list.filter(chars, (x) => string.contains("aeiou", x))
  in
    list.len(vowels)
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-count-vowels-0.almd:2:6
  |
2 |   let
  |      ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-count-vowels-0.almd:5:3
  |
5 |   in
  |   ^
error[E003]: undefined variable 'chars'
  --> /tmp/dojo-count-vowels-0.almd:4:26
  in variable chars
  hint: Check the variable name
  |
4 |     vowels = list.filter(chars, (x) => string.contains("aeiou", x))
  |                          ^^^^^
error[E003]: undefined variable 'vowels'
  --> /tmp/dojo-count-vowels-0.almd:6:14
  in variable vowels
  hint: Check the variable name
  |
6 |     list.len(vowels)
  |              ^^^^^^

4 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(list.filter(string.chars(s), (x) => string.contains("aeiou", x)))
```
