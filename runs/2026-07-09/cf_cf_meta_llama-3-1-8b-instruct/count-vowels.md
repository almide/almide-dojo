# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.filter(string.chars(s), fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u") |> list.len
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: Expected expression at line 2:32 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-0.almd:2:32
  |
2 |   list.filter(string.chars(s), fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u") |> list.len
  |                                ^
error: Expected function name at line 2:34 (got LParen '(')
  --> /tmp/dojo-count-vowels-0.almd:2:34
  |
2 |   list.filter(string.chars(s), fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u") |> list.len
  |                                  ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.filter(string.chars(s), (x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u") |> list.len
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-1.almd
error: '||' is not valid in Almide at line 2:48
  --> /tmp/dojo-count-vowels-1.almd:2:48
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
2 |   list.filter(string.chars(s), (x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u") |> list.len
  |                                                ^

1 error(s) found
Compile error for /tmp/dojo-count-vowels-1.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn count_vowels(s: String) -> Int = 
  list.filter(string.chars(s), (x) => x == "a" or x == "e" or x == "i" or x == "o" or x == "u") |> list.len
```
