# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

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
  list.count(string.chars(s), fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-1.almd
error: Expected expression at line 2:31 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-1.almd:2:31
  |
2 |   list.count(string.chars(s), fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
  |                               ^
error: Expected function name at line 2:33 (got LParen '(')
  --> /tmp/dojo-count-vowels-1.almd:2:33
  |
2 |   list.count(string.chars(s), fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
  |                                 ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-1.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.count(string.chars(s), fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-2.almd
error: Expected expression at line 2:31 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-2.almd:2:31
  |
2 |   list.count(string.chars(s), fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
  |                               ^
error: Expected function name at line 2:33 (got LParen '(')
  --> /tmp/dojo-count-vowels-2.almd:2:33
  |
2 |   list.count(string.chars(s), fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
  |                                 ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-2.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.count(string.chars(s), fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-3.almd
error: Expected expression at line 2:31 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-3.almd:2:31
  |
2 |   list.count(string.chars(s), fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
  |                               ^
error: Expected function name at line 2:33 (got LParen '(')
  --> /tmp/dojo-count-vowels-3.almd:2:33
  |
2 |   list.count(string.chars(s), fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
  |                                 ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-3.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-3.almd

1/1 test file(s) failed

```
