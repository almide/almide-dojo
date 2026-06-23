# title-case

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String = 
  string.join(
    string.map(
      string.split(s, " "),
      fn(word) => string.capitalize(word)
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
5 |       fn(word) => string.capitalize(word)
  |       ^
error: Expected function name at line 5:9 (got LParen '(')
  --> /tmp/dojo-title-case-0.almd:5:9
  |
5 |       fn(word) => string.capitalize(word)
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
      (word) => string.capitalize(word)
    ),
    " "
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-1.almd
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-title-case-1.almd:5:35
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
5 |       (word) => string.capitalize(word)
  |                                   ^^^^

1 error(s) found
Compile error for /tmp/dojo-title-case-1.almd:
compile failed
FAILED: /tmp/dojo-title-case-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn title_case(s: String) -> String = 
  string.join(
    list.map(
      string.split(s, " "),
      (word) => string.capitalize(word)
    ),
    " "
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-2.almd
FAILED: /tmp/dojo-title-case-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn title_case(s: String) -> String = 
  string.join(
    list.map(
      string.split(s, " "),
      (word) => string.to_lower(word) + string.capitalize(string.first(word)))
    ),
    " "
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 6:6 (got Comma ',')
  --> /tmp/dojo-title-case-3.almd:6:6
  |
6 |     ),
  |      ^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-title-case-3.almd:5:72
  in call to string.capitalize()
  hint: Fix the argument type
  |
5 |       (word) => string.to_lower(word) + string.capitalize(string.first(word)))
  |                                                                        ^^^^
error[E004]: string.join() expects 2 argument(s) but got 1
  --> /tmp/dojo-title-case-3.almd:5:72
  in call to string.join()
  hint: Check the number of arguments
  try:
      // string.join() takes 2 arg(s) — you passed 1
      string.join(<list: List[String]>, <sep: String>)
  |
5 |       (word) => string.to_lower(word) + string.capitalize(string.first(word)))
  |                                                                        ^^^^
error[E001]: type mismatch in call to string.capitalize(): expected String but got Option[String]
  --> /tmp/dojo-title-case-3.almd:5:72
  in call to string.capitalize()
  hint: Fix the expression type or change the expected type
  |
5 |       (word) => string.to_lower(word) + string.capitalize(string.first(word)))
  |                                                                        ^^^^

4 error(s) found
Compile error for /tmp/dojo-title-case-3.almd:
compile failed
FAILED: /tmp/dojo-title-case-3.almd

1/1 test file(s) failed

```
