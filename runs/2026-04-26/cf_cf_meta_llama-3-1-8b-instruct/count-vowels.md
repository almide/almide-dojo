# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.count(string.chars(s), fn(c) => match c {
    "a" => true
    "e" => true
    "i" => true
    "o" => true
    "u" => true
    _ => false
  })
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: Expected expression at line 2:31 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-0.almd:2:31
  |
2 |   list.count(string.chars(s), fn(c) => match c {
  |                               ^
error: Expected function name at line 2:33 (got LParen '(')
  --> /tmp/dojo-count-vowels-0.almd:2:33
  |
2 |   list.count(string.chars(s), fn(c) => match c {
  |                                 ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn count_vowels(s: String) -> Int = 
  list.count(string.chars(s), (c) => match c {
    "a" => true
    "e" => true
    "i" => true
    "o" => true
    "u" => true
    _ => false
  })
```
