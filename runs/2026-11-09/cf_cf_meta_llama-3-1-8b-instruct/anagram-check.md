# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.to_list(string.to_lower(a))) == 
  list.sort(string.to_list(string.to_lower(b)))
```

**Diagnostic:**

```
FAILED: /tmp/dojo-anagram-check-0.almd
  test: anagram with spaces
  at:   /tmp/dojo-anagram-check-0.almd:8
  expected: true
  found:    false

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.to_list(string.to_lower(a))) == 
  list.sort(string.to_list(string.to_lower(b)).filter(x => x != " ")))
```

**Diagnostic:**

```
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-anagram-check-1.almd:3:57
  in lambda syntax
  here: list.sort(string.to_list(string.to_lower(b)).filter(x => x != " ")))
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
3 |   list.sort(string.to_list(string.to_lower(b)).filter(x => x != " ")))
  |                                                         ^^
error: Lambda parameter must be wrapped in parentheses at line 3:57
  --> /tmp/dojo-anagram-check-1.almd:3:57
  here: list.sort(string.to_list(string.to_lower(b)).filter(x => x != " ")))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   list.sort(string.to_list(string.to_lower(b)).filter(x => x != " ")))
  |                                                         ^

2 error(s) found
FAILED: /tmp/dojo-anagram-check-1.almd
  parse error: Lambda parameter must be wrapped in parentheses
  parse error: Lambda parameter must be wrapped in parentheses at line 3:57
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-anagram-check-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.to_list(string.to_lower(a))) == 
  list.sort(string.to_list(string.to_lower(b)).filter((x) => x != " ")))
```

**Diagnostic:**

```
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 3:72 (got RParen ')')
  --> /tmp/dojo-anagram-check-2.almd:3:72
  here: list.sort(string.to_list(string.to_lower(b)).filter((x) => x != " ")))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   list.sort(string.to_list(string.to_lower(b)).filter((x) => x != " ")))
  |                                                                        ^

1 error(s) found
FAILED: /tmp/dojo-anagram-check-2.almd
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 3:72 (got RParen ')')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-anagram-check-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(string.to_list(string.to_lower(a))) == 
  list.sort(string.to_list(string.to_lower(b)).filter((x) => x != " ")))
```

**Diagnostic:**

```
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 3:72 (got RParen ')')
  --> /tmp/dojo-anagram-check-3.almd:3:72
  here: list.sort(string.to_list(string.to_lower(b)).filter((x) => x != " ")))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   list.sort(string.to_list(string.to_lower(b)).filter((x) => x != " ")))
  |                                                                        ^

1 error(s) found
FAILED: /tmp/dojo-anagram-check-3.almd
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 3:72 (got RParen ')')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-anagram-check-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
