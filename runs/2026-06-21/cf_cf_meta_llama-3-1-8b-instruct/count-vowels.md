# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.count(string.chars(s), (c) => string.is_lower(c) && string.is_in(c, "aeiou"))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: '&&' is not valid in Almide at line 2:57
  --> /tmp/dojo-count-vowels-0.almd:2:57
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
2 |   list.count(string.chars(s), (c) => string.is_lower(c) && string.is_in(c, "aeiou"))
  |                                                         ^

1 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.count(string.chars(s), (c) => string.is_lower(c) and string.is_in(c, "aeiou"))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-1.almd
error[E002]: undefined function 'string.is_in'
  --> /tmp/dojo-count-vowels-1.almd:2:77
  in call to string.is_in()
  hint: No function 'is_in' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
2 |   list.count(string.chars(s), (c) => string.is_lower(c) and string.is_in(c, "aeiou"))
  |                                                                             ^^^^^^^

1 error(s) found
Compile error for /tmp/dojo-count-vowels-1.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn count_vowels(s: String) -> Int = 
  list.count(string.chars(s), (c) => string.is_lower(c) and c == "a" or c == "e" or c == "i" or c == "o" or c == "u")
```
