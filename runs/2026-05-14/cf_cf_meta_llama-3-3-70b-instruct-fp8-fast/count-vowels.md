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
    vowels = list.filter(chars, (c) => 
      list.contains(["a", "e", "i", "o", "u"], c))
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
  --> /tmp/dojo-count-vowels-0.almd:4:26
  in variable chars
  hint: Check the variable name
  |
4 |     vowels = list.filter(chars, (c) =>
  |                          ^^^^^
error[E003]: undefined variable 'vowels'
  --> /tmp/dojo-count-vowels-0.almd:7:12
  in variable vowels
  hint: Check the variable name
  |
7 |   list.len(vowels)
  |            ^^^^^^

4 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn count_vowels(s: String) -> Int =
  let chars = string.chars(s)
  let vowels = list.filter(chars, (c) => list.contains(["a", "e", "i", "o", "u"], c))
  in list.len(vowels)
```
