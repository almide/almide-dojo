# title-case

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String = 
  string.join(
    string.map(
      string.split(s, " "),
      fn(word: String) -> String = 
        string.capitalize(word)
    ),
    " "
  )
```

**Diagnostic:**

```
error: Expected expression at line 5:7 (got Fn 'fn')
  --> /tmp/dojo-title-case-0.almd:5:7
  here: fn(word: String) -> String =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |       fn(word: String) -> String =
  |       ^
error: Expected function name at line 5:9 (got LParen '(')
  --> /tmp/dojo-title-case-0.almd:5:9
  here: fn(word: String) -> String =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |       fn(word: String) -> String =
  |         ^

2 error(s) found
FAILED: /tmp/dojo-title-case-0.almd
Compile error for /tmp/dojo-title-case-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn title_case(s: String) -> String = 
  string.join(
    string.map(
      string.split(s, " "),
      (word: String) => string.capitalize(word)
    ),
    " "
  )
```

**Diagnostic:**

```
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-title-case-1.almd:5:43
  in call to string.map()
  here: (word: String) => string.capitalize(word)
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
5 |       (word: String) => string.capitalize(word)
  |                                           ^^^^

1 error(s) found
FAILED: /tmp/dojo-title-case-1.almd
Compile error for /tmp/dojo-title-case-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn title_case(s: String) -> String = 
  string.join(
    list.map(
      string.split(s, " "),
      (word: String) => string.capitalize(word)
    ),
    " "
  )
```

**Diagnostic:**

```
FAILED: /tmp/dojo-title-case-2.almd
  test: title_case all upper
  at:   /tmp/dojo-title-case-2.almd:14
  expected: "Hello World"
  found:    "HELLO WORLD"
  test: title_case mixed
  at:   /tmp/dojo-title-case-2.almd:15
  expected: "Hello World"
  found:    "HELLO WORLD"

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn title_case(s: String) -> String = 
  string.join(
    list.map(
      string.split(s, " "),
      (word: String) => string.to_lower(string.capitalize(word))
    ),
    " "
  )
```

**Diagnostic:**

```
FAILED: /tmp/dojo-title-case-3.almd
  test: title_case single word
  at:   /tmp/dojo-title-case-3.almd:11
  expected: "Hello"
  found:    "hello"
  test: title_case two words
  at:   /tmp/dojo-title-case-3.almd:12
  expected: "Hello World"
  found:    "hello world"
  test: title_case already titled
  at:   /tmp/dojo-title-case-3.almd:13
  expected: "Hello World"
  found:    "hello world"
  test: title_case all upper
  at:   /tmp/dojo-title-case-3.almd:14
  expected: "Hello World"
  found:    "hello world"
  test: title_case mixed
  at:   /tmp/dojo-title-case-3.almd:15
  expected: "Hello World"
  found:    "hello world"
  test: title_case single char words
  at:   /tmp/dojo-title-case-3.almd:16
  expected: "A B C"
  found:    "a b c"

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
