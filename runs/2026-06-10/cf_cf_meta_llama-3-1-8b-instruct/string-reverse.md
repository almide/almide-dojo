# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String {
  let chars = string.chars(s)
  let reversed = list.reverse(chars)
  string.from_chars(reversed)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error: Missing '=' before function body at line 1:33
  --> /tmp/dojo-string-reverse-0.almd:1:33
  hint: Almide requires '=' before the body. Write: fn reverse(...) -> Type = { ... }
  |
1 | fn reverse(s: String) -> String {
  |                                 ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = {
  let chars = string.chars(s)
  let reversed = list.reverse(chars)
  string.from_chars(reversed)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-string-reverse-1.almd:4:21
  in call to string.from_chars()
  hint: Did you mean `string.from_bytes`?
  try:
      // string.from_chars(...)  →  string.from_bytes(...)
      string.from_bytes(...)
  |
4 |   string.from_chars(reversed)
  |                     ^^^^^^^^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn reverse(s: String) -> String = {
  let chars = string.chars(s)
  let reversed = list.reverse(chars)
  string.from_bytes(list.to_bytes(reversed))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error[E002]: undefined function 'list.to_bytes'
  --> /tmp/dojo-string-reverse-2.almd:4:35
  in call to list.to_bytes()
  hint: No function 'to_bytes' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
4 |   string.from_bytes(list.to_bytes(reversed))
  |                                   ^^^^^^^^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-2.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn reverse(s: String) -> String = {
  let chars = string.chars(s)
  let reversed = list.reverse(chars)
  string.from_codepoints(list.to_list(reversed))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error[E002]: undefined function 'list.to_list'
  --> /tmp/dojo-string-reverse-3.almd:4:39
  in call to list.to_list()
  hint: No function 'to_list' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
4 |   string.from_codepoints(list.to_list(reversed))
  |                                       ^^^^^^^^
error[E002]: undefined function 'string.from_codepoints'
  --> /tmp/dojo-string-reverse-3.almd:4:39
  in call to string.from_codepoints()
  hint: Did you mean `string.from_codepoint`?
  try:
      // string.from_codepoints(...)  →  string.from_codepoint(...)
      string.from_codepoint(...)
  |
4 |   string.from_codepoints(list.to_list(reversed))
  |                                       ^^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
