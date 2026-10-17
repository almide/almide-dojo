# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = {
  let chars = string.chars(s)
  let reversed = list.reverse(chars)
  string.from_chars(reversed)
}
```

**Diagnostic:**

```
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-string-reverse-0.almd:4:3
  in call to string.from_chars()
  here: string.from_chars(reversed)
  hint: Did you mean `string.from_bytes`?
  try:
      string.from_bytes
  |
4 |   string.from_chars(reversed)
  |   ^^^^^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-string-reverse-0.almd
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = {
  let chars = string.chars(s)
  let reversed = list.reverse(chars)
  string.from_bytes(reversed)
}
```

**Diagnostic:**

```
error[E005]: argument 'bytes' expects List[Int] but got List[String]
  --> /tmp/dojo-string-reverse-1.almd:4:21
  in call to string.from_bytes()
  here: string.from_bytes(reversed)
  hint: Fix the argument type
...
4 |   string.from_bytes(reversed)
  |                     ^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-string-reverse-1.almd
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn reverse(s: String) -> String = {
  let chars = string.chars(s)
  let reversed = list.reverse(chars)
  string.from_codepoints(reversed)
}
```

**Diagnostic:**

```
error[E002]: undefined function 'string.from_codepoints'
  --> /tmp/dojo-string-reverse-2.almd:4:3
  in call to string.from_codepoints()
  here: string.from_codepoints(reversed)
  hint: Did you mean `string.from_codepoint`?
  try:
      string.from_codepoint
  |
4 |   string.from_codepoints(reversed)
  |   ^^^^^^^^^^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-string-reverse-2.almd
Compile error for /tmp/dojo-string-reverse-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn reverse(s: String) -> String = {
  let chars = string.chars(s)
  let reversed = list.reverse(chars)
  string.from_codepoint(reversed.first())
}
```

**Diagnostic:**

```
error[E005]: argument 'n' expects Int but got Option[String]
  --> /tmp/dojo-string-reverse-3.almd:4:25
  in call to string.from_codepoint()
  here: string.from_codepoint(reversed.first())
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
4 |   string.from_codepoint(reversed.first())
  |                         ^^^^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-string-reverse-3.almd
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
