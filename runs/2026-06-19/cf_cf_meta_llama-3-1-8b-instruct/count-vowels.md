# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(string.chars(s) |> list.filter(fn(c) => c == "a" || c == "e" || c == "i" || c == "o" || c == "u"))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: Expected expression at line 2:43 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-0.almd:2:43
  |
2 |   list.len(string.chars(s) |> list.filter(fn(c) => c == "a" || c == "e" || c == "i" || c == "o" || c == "u"))
  |                                           ^
error: Expected function name at line 2:45 (got LParen '(')
  --> /tmp/dojo-count-vowels-0.almd:2:45
  |
2 |   list.len(string.chars(s) |> list.filter(fn(c) => c == "a" || c == "e" || c == "i" || c == "o" || c == "u"))
  |                                             ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(string.chars(s) |> list.filter(fn(c) => list.contains(["a", "e", "i", "o", "u"], c)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-1.almd
error: Expected expression at line 2:43 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-1.almd:2:43
  |
2 |   list.len(string.chars(s) |> list.filter(fn(c) => list.contains(["a", "e", "i", "o", "u"], c)))
  |                                           ^
error: Expected function name at line 2:45 (got LParen '(')
  --> /tmp/dojo-count-vowels-1.almd:2:45
  |
2 |   list.len(string.chars(s) |> list.filter(fn(c) => list.contains(["a", "e", "i", "o", "u"], c)))
  |                                             ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-1.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(string.chars(s) |> list.filter(fn(c) => list.contains(["a", "e", "i", "o", "u"], c)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-2.almd
error: Expected expression at line 2:43 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-2.almd:2:43
  |
2 |   list.len(string.chars(s) |> list.filter(fn(c) => list.contains(["a", "e", "i", "o", "u"], c)))
  |                                           ^
error: Expected function name at line 2:45 (got LParen '(')
  --> /tmp/dojo-count-vowels-2.almd:2:45
  |
2 |   list.len(string.chars(s) |> list.filter(fn(c) => list.contains(["a", "e", "i", "o", "u"], c)))
  |                                             ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-2.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(string.chars(s) |> list.filter(fn(c) => list.contains(["a", "e", "i", "o", "u"], c)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-3.almd
error: Expected expression at line 2:43 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-3.almd:2:43
  |
2 |   list.len(string.chars(s) |> list.filter(fn(c) => list.contains(["a", "e", "i", "o", "u"], c)))
  |                                           ^
error: Expected function name at line 2:45 (got LParen '(')
  --> /tmp/dojo-count-vowels-3.almd:2:45
  |
2 |   list.len(string.chars(s) |> list.filter(fn(c) => list.contains(["a", "e", "i", "o", "u"], c)))
  |                                             ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-3.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-3.almd

1/1 test file(s) failed

```
