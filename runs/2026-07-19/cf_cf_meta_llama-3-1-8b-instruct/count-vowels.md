# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(list.filter(string.chars(s), fn(c) => string.is_alpha(c) && list.contains(["a", "e", "i", "o", "u"], c))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: Expected expression at line 2:41 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-0.almd:2:41
  |
2 |   list.len(list.filter(string.chars(s), fn(c) => string.is_alpha(c) && list.contains(["a", "e", "i", "o", "u"], c))))
  |                                         ^
error: Expected function name at line 2:43 (got LParen '(')
  --> /tmp/dojo-count-vowels-0.almd:2:43
  |
2 |   list.len(list.filter(string.chars(s), fn(c) => string.is_alpha(c) && list.contains(["a", "e", "i", "o", "u"], c))))
  |                                           ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(list.filter(string.chars(s), (c) => string.is_alpha(c) && list.contains(["a", "e", "i", "o", "u"], c))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-1.almd
error: '&&' is not valid in Almide at line 2:67
  --> /tmp/dojo-count-vowels-1.almd:2:67
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
2 |   list.len(list.filter(string.chars(s), (c) => string.is_alpha(c) && list.contains(["a", "e", "i", "o", "u"], c))))
  |                                                                   ^

1 error(s) found
Compile error for /tmp/dojo-count-vowels-1.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(list.filter(string.chars(s), (c) => string.is_alpha(c) and list.contains(["a", "e", "i", "o", "u"], c))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:116 (got RParen ')')
  --> /tmp/dojo-count-vowels-2.almd:2:116
  |
2 |   list.len(list.filter(string.chars(s), (c) => string.is_alpha(c) and list.contains(["a", "e", "i", "o", "u"], c))))
  |                                                                                                                    ^

1 error(s) found
Compile error for /tmp/dojo-count-vowels-2.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(list.filter(string.chars(s), (c) => list.contains(["a", "e", "i", "o", "u"], c)))
```
