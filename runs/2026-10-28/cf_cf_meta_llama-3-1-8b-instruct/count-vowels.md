# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(list.filter(string.chars(s), (c) => string.is_lower(c) && string.is_alpha(c) && string.contains("aeiou", c)))
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 2:67
  --> /tmp/dojo-count-vowels-0.almd:2:67
  here: list.len(list.filter(string.chars(s), (c) => string.is_lower(c) && string.is_alpha(c) && string.contains("aeiou", c)))
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
2 |   list.len(list.filter(string.chars(s), (c) => string.is_lower(c) && string.is_alpha(c) && string.contains("aeiou", c)))
  |                                                                   ^

1 error(s) found
FAILED: /tmp/dojo-count-vowels-0.almd
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(list.filter(string.chars(s), (c) => string.is_lower(c) && string.is_alpha(c) && string.contains("aeiou", c)))
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 2:67
  --> /tmp/dojo-count-vowels-1.almd:2:67
  here: list.len(list.filter(string.chars(s), (c) => string.is_lower(c) && string.is_alpha(c) && string.contains("aeiou", c)))
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
2 |   list.len(list.filter(string.chars(s), (c) => string.is_lower(c) && string.is_alpha(c) && string.contains("aeiou", c)))
  |                                                                   ^

1 error(s) found
FAILED: /tmp/dojo-count-vowels-1.almd
Compile error for /tmp/dojo-count-vowels-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(list.filter(string.chars(s), (c) => string.is_lower(c) && string.is_alpha(c) && string.contains("aeiou", c)))
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 2:67
  --> /tmp/dojo-count-vowels-2.almd:2:67
  here: list.len(list.filter(string.chars(s), (c) => string.is_lower(c) && string.is_alpha(c) && string.contains("aeiou", c)))
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
2 |   list.len(list.filter(string.chars(s), (c) => string.is_lower(c) && string.is_alpha(c) && string.contains("aeiou", c)))
  |                                                                   ^

1 error(s) found
FAILED: /tmp/dojo-count-vowels-2.almd
Compile error for /tmp/dojo-count-vowels-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (PASS)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(list.filter(string.chars(s), (c) => string.is_lower(c) and string.is_alpha(c) and string.contains("aeiou", c)))
```
