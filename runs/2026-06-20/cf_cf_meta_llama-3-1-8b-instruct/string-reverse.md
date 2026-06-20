# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  string.from_chars(chars |> list.reverse)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-string-reverse-0.almd:3:21
  in call to string.from_chars()
  hint: Did you mean `string.from_bytes`?
  try:
      // string.from_chars(...)  →  string.from_bytes(...)
      string.from_bytes(...)
  |
3 |   string.from_chars(chars |> list.reverse)
  |                     ^^^^^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  string.from_bytes(chars |> list.reverse |> list.to_bytes)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E002]: undefined function 'list.to_bytes'
  --> /tmp/dojo-string-reverse-1.almd:3:21
  in call to list.to_bytes()
  hint: No function 'to_bytes' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
3 |   string.from_bytes(chars |> list.reverse |> list.to_bytes)
  |                     ^^^^^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  string.from_bytes(chars |> list.map(string.from_codepoint) |> list.reverse)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error[E005]: argument 'f' expects fn(String) -> B but got fn(Int) -> String
  --> /tmp/dojo-string-reverse-2.almd:3:45
  in call to list.map()
  hint: Fix the argument type
  |
3 |   string.from_bytes(chars |> list.map(string.from_codepoint) |> list.reverse)
  |                                             ^
error[E001]: type mismatch in call to list.map(): expected fn(String) -> B but got fn(Int) -> String
  --> /tmp/dojo-string-reverse-2.almd:3:45
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |   string.from_bytes(chars |> list.map(string.from_codepoint) |> list.reverse)
  |                                             ^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-2.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  string.from_codepoints(chars |> list.map(string.codepoint) |> list.reverse)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error[E002]: undefined function 'string.from_codepoints'
  --> /tmp/dojo-string-reverse-3.almd:3:50
  in call to string.from_codepoints()
  hint: Did you mean `string.from_codepoint`?
  try:
      // string.from_codepoints(...)  →  string.from_codepoint(...)
      string.from_codepoint(...)
  |
3 |   string.from_codepoints(chars |> list.map(string.codepoint) |> list.reverse)
  |                                                  ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
