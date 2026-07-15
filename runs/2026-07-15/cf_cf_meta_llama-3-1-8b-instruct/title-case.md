# title-case

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String = 
  string.join(
    string.map(
      string.split(s, " "),
      fn(word) => string.capitalize(string.to_lower(word))
    ),
    " "
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-0.almd
error: Expected expression at line 5:7 (got Fn 'fn')
  --> /tmp/dojo-title-case-0.almd:5:7
  |
5 |       fn(word) => string.capitalize(string.to_lower(word))
  |       ^
error: Expected function name at line 5:9 (got LParen '(')
  --> /tmp/dojo-title-case-0.almd:5:9
  |
5 |       fn(word) => string.capitalize(string.to_lower(word))
  |         ^

2 error(s) found
Compile error for /tmp/dojo-title-case-0.almd:
compile failed
FAILED: /tmp/dojo-title-case-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn title_case(s: String) -> String = 
  string.join(
    string.map(
      string.split(s, " "),
      (word) => string.capitalize(string.to_lower(word))
    ),
    " "
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-1.almd
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-title-case-1.almd:5:51
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
5 |       (word) => string.capitalize(string.to_lower(word))
  |                                                   ^^^^

1 error(s) found
Compile error for /tmp/dojo-title-case-1.almd:
compile failed
FAILED: /tmp/dojo-title-case-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn title_case(s: String) -> String = 
  string.join(
    list.map(
      string.split(s, " "),
      (word) => string.capitalize(string.to_lower(word))
    ),
    " "
  )
```
