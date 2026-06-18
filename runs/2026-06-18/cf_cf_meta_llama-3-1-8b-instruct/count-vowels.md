# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(string.chars(s) |> list.filter(fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u"))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: Expected expression at line 2:43 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-0.almd:2:43
  |
2 |   list.len(string.chars(s) |> list.filter(fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u"))
  |                                           ^
error: Expected function name at line 2:45 (got LParen '(')
  --> /tmp/dojo-count-vowels-0.almd:2:45
  |
2 |   list.len(string.chars(s) |> list.filter(fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u"))
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
  list.len(string.chars(s) |> list.filter(fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u"))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-1.almd
error: Expected expression at line 2:43 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-1.almd:2:43
  |
2 |   list.len(string.chars(s) |> list.filter(fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u"))
  |                                           ^
error: Expected function name at line 2:45 (got LParen '(')
  --> /tmp/dojo-count-vowels-1.almd:2:45
  |
2 |   list.len(string.chars(s) |> list.filter(fn(x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u"))
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
  list.len(string.chars(s) |> list.filter(x => x == "a" || x == "e" || x == "i" || x == "o" || x == "u"))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-2.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-count-vowels-2.almd:2:45
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   list.len(string.chars(s) |> list.filter(x => x == "a" || x == "e" || x == "i" || x == "o" || x == "u"))
  |                                             ^^

1 error(s) found
Compile error for /tmp/dojo-count-vowels-2.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.len(string.chars(s) |> list.filter((x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u"))
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-3.almd
error: '||' is not valid in Almide at line 2:59
  --> /tmp/dojo-count-vowels-3.almd:2:59
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
2 |   list.len(string.chars(s) |> list.filter((x) => x == "a" || x == "e" || x == "i" || x == "o" || x == "u"))
  |                                                           ^

1 error(s) found
Compile error for /tmp/dojo-count-vowels-3.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-3.almd

1/1 test file(s) failed

```
