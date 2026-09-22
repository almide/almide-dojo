# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  let reversed = list.reverse(chars)
  string.from_chars(reversed)
```

**Diagnostic:**

```
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-string-reverse-0.almd:4:21
  in call to string.from_chars()
  here: string.from_chars(reversed)
  hint: Did you mean `string.from_bytes`?
  try:
      string.from_bytes
  |
4 |   string.from_chars(reversed)
  |                     ^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-string-reverse-0.almd
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  let reversed = list.reverse(chars)
  string.from_chars(reversed)
```

**Diagnostic:**

```
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-string-reverse-1.almd:4:21
  in call to string.from_chars()
  here: string.from_chars(reversed)
  hint: Did you mean `string.from_bytes`?
  try:
      string.from_bytes
  |
4 |   string.from_chars(reversed)
  |                     ^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-string-reverse-1.almd
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  let reversed = list.reverse(chars)
  string.from_chars(reversed)
```

**Diagnostic:**

```
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-string-reverse-2.almd:4:21
  in call to string.from_chars()
  here: string.from_chars(reversed)
  hint: Did you mean `string.from_bytes`?
  try:
      string.from_bytes
  |
4 |   string.from_chars(reversed)
  |                     ^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-string-reverse-2.almd
Compile error for /tmp/dojo-string-reverse-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  let reversed = list.reverse(chars)
  string.from_chars(reversed)
```

**Diagnostic:**

```
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-string-reverse-3.almd:4:21
  in call to string.from_chars()
  here: string.from_chars(reversed)
  hint: Did you mean `string.from_bytes`?
  try:
      string.from_bytes
  |
4 |   string.from_chars(reversed)
  |                     ^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-string-reverse-3.almd
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
