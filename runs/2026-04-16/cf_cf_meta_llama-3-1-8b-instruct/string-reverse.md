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
  string.from_chars(chars |> list.reverse)
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
  string.from_chars(chars |> list.reverse)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-string-reverse-1.almd:3:21
  in call to string.from_chars()
  hint: Did you mean `string.from_bytes`?
  try:
      // string.from_chars(...)  →  string.from_bytes(...)
      string.from_bytes(...)
  |
3 |   string.from_chars(chars |> list.reverse)
  |                     ^^^^^

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
  string.from_bytes(chars |> list.reverse |> list.to_bytes)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error[E002]: undefined function 'list.to_bytes'
  --> /tmp/dojo-string-reverse-2.almd:3:21
  in call to list.to_bytes()
  hint: No function 'to_bytes' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
3 |   string.from_bytes(chars |> list.reverse |> list.to_bytes)
  |                     ^^^^^

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
  string.from_bytes(chars |> list.reverse |> list.to_list |> string.from_bytes)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error[E002]: undefined function 'list.to_list'
  --> /tmp/dojo-string-reverse-3.almd:3:21
  in call to list.to_list()
  hint: No function 'to_list' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
3 |   string.from_bytes(chars |> list.reverse |> list.to_list |> string.from_bytes)
  |                     ^^^^^
error[E005]: argument 'bytes' expects List[Int] but got String
  --> /tmp/dojo-string-reverse-3.almd:3:21
  in call to string.from_bytes()
  hint: Fix the argument type
  |
3 |   string.from_bytes(chars |> list.reverse |> list.to_list |> string.from_bytes)
  |                     ^^^^^
error[E001]: type mismatch in call to string.from_bytes(): expected List[Int] but got String
  --> /tmp/dojo-string-reverse-3.almd:3:21
  in call to string.from_bytes()
  hint: Fix the expression type or change the expected type
  |
3 |   string.from_bytes(chars |> list.reverse |> list.to_list |> string.from_bytes)
  |                     ^^^^^

3 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
