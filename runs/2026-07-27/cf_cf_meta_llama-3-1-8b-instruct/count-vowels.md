# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(string.chars(s) |>
            list.filter(fn(c) => list.contains(['a', 'e', 'i', 'o', 'u'], c) || false))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: Expected expression at line 3:25 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-0.almd:3:25
  |
3 |             list.filter(fn(c) => list.contains(['a', 'e', 'i', 'o', 'u'], c) || false))
  |                         ^
error: Expected function name at line 3:27 (got LParen '(')
  --> /tmp/dojo-count-vowels-0.almd:3:27
  |
3 |             list.filter(fn(c) => list.contains(['a', 'e', 'i', 'o', 'u'], c) || false))
  |                           ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(string.chars(s) |> 
           list.filter(fn(c) => list.contains(['a', 'e', 'i', 'o', 'u'], c)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-1.almd
error: Expected expression at line 3:24 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-1.almd:3:24
  |
3 |            list.filter(fn(c) => list.contains(['a', 'e', 'i', 'o', 'u'], c)))
  |                        ^
error: Expected function name at line 3:26 (got LParen '(')
  --> /tmp/dojo-count-vowels-1.almd:3:26
  |
3 |            list.filter(fn(c) => list.contains(['a', 'e', 'i', 'o', 'u'], c)))
  |                          ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-1.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(string.chars(s) |> list.filter((c) => list.contains(['a', 'e', 'i', 'o', 'u'], c)))
```
