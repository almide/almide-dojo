# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.count(string.to_list(s), (c) => string.is_lower(c) && string.is_alpha(c) && string.contains("aeiou", c))
```

**Diagnostic:**

```
error: '&&' is not valid in Almide
  --> /tmp/dojo-count-vowels-0.almd:2:59
  in operator
  here: list.count(string.to_list(s), (c) => string.is_lower(c) && string.is_alpha(c) && string.contains("aeiou", c))
  hint: Use 'and' for logical AND. Example: if a and b then ...
  try:
      a and b
  |
2 |   list.count(string.to_list(s), (c) => string.is_lower(c) && string.is_alpha(c) && string.contains("aeiou", c))
  |                                                           ^^
error: '&&' is not valid in Almide
  --> /tmp/dojo-count-vowels-0.almd:2:81
  in operator
  here: list.count(string.to_list(s), (c) => string.is_lower(c) && string.is_alpha(c) && string.contains("aeiou", c))
  hint: Use 'and' for logical AND. Example: if a and b then ...
  try:
      a and b
  |
2 |   list.count(string.to_list(s), (c) => string.is_lower(c) && string.is_alpha(c) && string.contains("aeiou", c))
  |                                                                                 ^^

2 error(s) found
FAILED: /tmp/dojo-count-vowels-0.almd
  parse error: '&&' is not valid in Almide
  parse error: '&&' is not valid in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-count-vowels-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn count_vowels(s: String) -> Int = 
  list.count(string.to_list(s), (c) => string.is_lower(c) and string.is_alpha(c) and string.contains("aeiou", c))
```
