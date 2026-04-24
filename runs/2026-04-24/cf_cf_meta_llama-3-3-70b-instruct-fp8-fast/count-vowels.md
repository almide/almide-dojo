# count-vowels

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int =
  let chars = string.chars(s)
  let vowels = list.filter(chars, (ch) =>
    string.len(ch) == 1 &&
    (ch == "a" || ch == "e" || ch == "i" || ch == "o" || ch == "u")
  )
  list.len(vowels)
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: '&&' is not valid in Almide at line 4:25
  --> /tmp/dojo-count-vowels-0.almd:4:25
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |     string.len(ch) == 1 &&
  |                         ^
error[E003]: undefined variable 'vowels'
  --> /tmp/dojo-count-vowels-0.almd:7:12
  in variable vowels
  hint: Check the variable name
  |
7 |   list.len(vowels)
  |            ^^^^^^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn count_vowels(s: String) -> Int =
  let chars = string.chars(s)
  in list.count(chars, (ch) =>
    ch == "a" or ch == "e" or ch == "i" or ch == "o" or ch == "u"
  )
```
