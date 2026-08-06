# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(list.filter(string.chars(s), fn(x) => match x { 
    "a" => true, "e" => true, "i" => true, "o" => true, "u" => true, _ => false}))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: Expected expression at line 2:41 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-0.almd:2:41
  |
2 |   list.len(list.filter(string.chars(s), fn(x) => match x {
  |                                         ^
error: Expected function name at line 2:43 (got LParen '(')
  --> /tmp/dojo-count-vowels-0.almd:2:43
  |
2 |   list.len(list.filter(string.chars(s), fn(x) => match x {
  |                                           ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(list.filter(string.chars(s), (x) => match x { 
    "a" => true, "e" => true, "i" => true, "o" => true, "u" => true, _ => false}))
```
