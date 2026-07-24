# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E013`

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = {
  let chars = string.chars(s)
  let rev = list.reverse(chars)
  string.from_chars(rev)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-string-reverse-0.almd:4:21
  in call to string.from_chars()
  hint: Did you mean `string.from_bytes`?
  try:
      // string.from_chars(...)  →  string.from_bytes(...)
      string.from_bytes(...)
  |
4 |   string.from_chars(rev)
  |                     ^^^

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
  let rev = list.reverse(chars)
  string.from_bytes(rev)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E005]: argument 'bytes' expects List[Int] but got List[String]
  --> /tmp/dojo-string-reverse-1.almd:4:21
  in call to string.from_bytes()
  hint: Fix the argument type
  |
4 |   string.from_bytes(rev)
  |                     ^^^
error[E001]: type mismatch in call to string.from_bytes(): expected List[Int] but got List[String]
  --> /tmp/dojo-string-reverse-1.almd:4:21
  in call to string.from_bytes()
  hint: Fix the expression type or change the expected type
  |
4 |   string.from_bytes(rev)
  |                     ^^^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn reverse(s: String) -> String = {
  let chars = string.chars(s)
  let rev = list.reverse(chars)
  string.from_codepoints(rev)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error[E002]: undefined function 'string.from_codepoints'
  --> /tmp/dojo-string-reverse-2.almd:4:26
  in call to string.from_codepoints()
  hint: Did you mean `string.from_codepoint`?
  try:
      // string.from_codepoints(...)  →  string.from_codepoint(...)
      string.from_codepoint(...)
  |
4 |   string.from_codepoints(rev)
  |                          ^^^

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
  let rev = list.reverse(chars)
  string.from_codepoint(rev.head)
  let rest = list.drop(rev, 1)
  string.join(rest, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error[E013]: no field 'head' on list
  --> /tmp/dojo-string-reverse-3.almd:4:25
  in field access .head
  hint: Almide values have no fields — use the `list` stdlib module. No method-call or field-access syntax is supported.
  try:
      list.first(xs)  // returns Option[T]
  |
4 |   string.from_codepoint(rev.head)
  |                         ^^^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
