# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.count(string.chars(s), fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: Expected expression at line 2:31 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-0.almd:2:31
  |
2 |   list.count(string.chars(s), fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
  |                               ^
error: Expected function name at line 2:33 (got LParen '(')
  --> /tmp/dojo-count-vowels-0.almd:2:33
  |
2 |   list.count(string.chars(s), fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
  |                                 ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.count(string.chars(s), (x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-1.almd
error: '||' is not valid in Almide at line 2:47
  --> /tmp/dojo-count-vowels-1.almd:2:47
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
2 |   list.count(string.chars(s), (x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
  |                                               ^

1 error(s) found
Compile error for /tmp/dojo-count-vowels-1.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn count_vowels(s: String) -> Int = 
  list.count(string.chars(s), (x) => x == "a" or x == "e" or x == "i" or x == "o" or x == "u")
```
