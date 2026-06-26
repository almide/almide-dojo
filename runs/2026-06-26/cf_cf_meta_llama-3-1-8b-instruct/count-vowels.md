# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int =
  list.len(list.filter(string.chars(s), (c) => string.is_lower(c) && string.contains("aeiou", c)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: '&&' is not valid in Almide at line 2:67
  --> /tmp/dojo-count-vowels-0.almd:2:67
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
2 |   list.len(list.filter(string.chars(s), (c) => string.is_lower(c) && string.contains("aeiou", c)))
  |                                                                   ^

1 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn count_vowels(s: String) -> Int =
  list.len(list.filter(string.chars(s), (c) => string.is_lower(c) and string.contains("aeiou", c)))
```
