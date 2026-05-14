# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(string.chars(s), fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: Expected expression at line 2:29 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-0.almd:2:29
  |
2 |   list.len(string.chars(s), fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
  |                             ^
error: Expected function name at line 2:31 (got LParen '(')
  --> /tmp/dojo-count-vowels-0.almd:2:31
  |
2 |   list.len(string.chars(s), fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
  |                               ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(string.chars(s), (x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-1.almd
error: '||' is not valid in Almide at line 2:45
  --> /tmp/dojo-count-vowels-1.almd:2:45
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
2 |   list.len(string.chars(s), (x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u")
  |                                             ^

1 error(s) found
Compile error for /tmp/dojo-count-vowels-1.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(string.chars(s), (x) => x == "a" or x == "e" or x == "i" or x == "o" or x == "u")
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-2.almd
error[E004]: list.len() expects 1 argument(s) but got 2
  --> /tmp/dojo-count-vowels-2.almd:2:89
  in call to list.len()
  hint: Check the number of arguments
  try:
      // list.len() takes 1 arg(s) — you passed 2
      list.len(<xs: List[A]>)
  |
2 |   list.len(string.chars(s), (x) => x == "a" or x == "e" or x == "i" or x == "o" or x == "u")
  |                                                                                         ^^^

1 error(s) found
Compile error for /tmp/dojo-count-vowels-2.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn count_vowels(s: String) -> Int = 
  list.count(string.chars(s), (x) => x == "a" or x == "e" or x == "i" or x == "o" or x == "u")
```
