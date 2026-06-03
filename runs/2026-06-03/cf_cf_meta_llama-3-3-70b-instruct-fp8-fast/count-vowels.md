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
    is_vowel = (x) => list.contains(["a", "e", "i", "o", "u"], x)
    vowels = list.filter(chars, is_vowel)
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
error: Expected expression at line 6:3 (got In 'in')
  --> /tmp/dojo-count-vowels-0.almd:6:3
  |
6 |   in
  |   ^
error[E003]: undefined variable 'chars'
  --> /tmp/dojo-count-vowels-0.almd:5:26
  in variable chars
  hint: Check the variable name
  |
5 |     vowels = list.filter(chars, is_vowel)
  |                          ^^^^^
error[E003]: undefined variable 'is_vowel'
  --> /tmp/dojo-count-vowels-0.almd:5:33
  in variable is_vowel
  hint: Check the variable name
  |
5 |     vowels = list.filter(chars, is_vowel)
  |                                 ^^^^^^^^
error[E003]: undefined variable 'vowels'
  --> /tmp/dojo-count-vowels-0.almd:7:14
  in variable vowels
  hint: Check the variable name
  |
7 |     list.len(vowels)
  |              ^^^^^^

5 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn count_vowels(s: String) -> Int =
  string.chars(s) 
  |> list.count((x) => list.contains(["a", "e", "i", "o", "u"], x))
```
