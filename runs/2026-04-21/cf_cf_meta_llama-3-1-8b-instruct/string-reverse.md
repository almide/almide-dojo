# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String {
  let chars = string.chars(s)
  let reversed_chars = list.reverse(chars)
  string.from_chars(reversed_chars)
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
  let reversed_chars = list.reverse(chars)
  string.from_chars(reversed_chars)
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
4 |   string.from_chars(reversed_chars)
  |                     ^^^^^^^^^^^^^^

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
  let reversed_chars = list.reverse(chars)
  string.from_bytes(string.to_bytes(string.from_chars(reversed_chars)))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-string-reverse-2.almd:4:55
  in call to string.from_chars()
  hint: Did you mean `string.from_bytes`?
  try:
      // string.from_chars(...)  →  string.from_bytes(...)
      string.from_bytes(...)
  |
4 |   string.from_bytes(string.to_bytes(string.from_chars(reversed_chars)))
  |                                                       ^^^^^^^^^^^^^^

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
  let reversed_chars = list.reverse(chars)
  string.from_bytes(string.to_bytes(reversed_chars))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error[E005]: argument 's' expects String but got List[String]
  --> /tmp/dojo-string-reverse-3.almd:4:37
  in call to string.to_bytes()
  hint: Fix the argument type
  |
4 |   string.from_bytes(string.to_bytes(reversed_chars))
  |                                     ^^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.to_bytes(): expected String but got List[String]
  --> /tmp/dojo-string-reverse-3.almd:4:37
  in call to string.to_bytes()
  hint: Fix the expression type or change the expected type
  |
4 |   string.from_bytes(string.to_bytes(reversed_chars))
  |                                     ^^^^^^^^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
