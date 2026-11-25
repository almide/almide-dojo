# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.join(list.map(string.to_list(text), (c) => 
    if string.is_lower(c) then 
      string.from_codepoint((string.to_codepoint(c) ?? 0) - 97 + shift) % 26 + 97 ?? ""
    else c
  ))

fn decrypt(text: String, shift: Int) -> String = 
  string.join(list.map(string.to_list(text), (c) => 
    if string.is_lower(c) then 
      string.from_codepoint((string.to_codepoint(c) ?? 0) - 97 - shift + 26) % 26 + 97 ?? ""
    else c
  ))
```

**Diagnostic:**

```
error: operator '%' requires numeric types but got Option[String] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:4:75
  in operator %
  here: string.from_codepoint((string.to_codepoint(c) ?? 0) - 97 + shift) % 26 + 97 ?? ""
  hint: Use numeric types (Int or Float)
  |
4 |       string.from_codepoint((string.to_codepoint(c) ?? 0) - 97 + shift) % 26 + 97 ?? ""
  |                                                                           ^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-caesar-cipher-0.almd:4:86
  in operator ??
  here: string.from_codepoint((string.to_codepoint(c) ?? 0) - 97 + shift) % 26 + 97 ?? ""
  hint: Use '??' only on Option[T] or Result[T, E] values
  |
4 |       string.from_codepoint((string.to_codepoint(c) ?? 0) - 97 + shift) % 26 + 97 ?? ""
  |                                                                                      ^^
error: operator '+' requires numeric, String, or List types but got Option[String] and String
  --> /tmp/dojo-caesar-cipher-0.almd:4:86
  in operator +
  here: string.from_codepoint((string.to_codepoint(c) ?? 0) - 97 + shift) % 26 + 97 ?? ""
  hint: Use + with numeric types, String, List, or Bytes
  |
4 |       string.from_codepoint((string.to_codepoint(c) ?? 0) - 97 + shift) % 26 + 97 ?? ""
  |                                                                                      ^^
error[E002]: undefined function 'string.join'
  --> /tmp/dojo-caesar-cipher-0.almd:2:3
  in call to string.join()
  here: string.join(list.map(string.to_list(text), (c) =>
  hint: `string.join` was removed at dialect epoch 15: rewrite as `list.join(xs, sep)`: the list is the receiver (R-string-01)
  |
2 |   string.join(list.map(string.to_list(text), (c) =>
  |   ^^^^^^^^^^^
error: operator '%' requires numeric types but got Option[String] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:11:80
  in operator %
  here: string.from_codepoint((string.to_codepoint(c) ?? 0) - 97 - shift + 26) % 26 + 97 ?? ""
  hint: Use numeric types (Int or Float)
   |
11 |       string.from_codepoint((string.to_codepoint(c) ?? 0) - 97 - shift + 26) % 26 + 97 ?? ""
   |                                                                                ^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-caesar-cipher-0.almd:11:91
  in operator ??
  here: string.from_codepoint((string.to_codepoint(c) ?? 0) - 97 - shift + 26) % 26 + 97 ?? ""
  hint: Use '??' only on Option[T] or Result[T, E] values
   |
11 |       string.from_codepoint((string.to_codepoint(c) ?? 0) - 97 - shift + 26) % 26 + 97 ?? ""
   |                                                                                           ^^
error: operator '+' requires numeric, String, or List types but got Option[String] and String
  --> /tmp/dojo-caesar-cipher-0.almd:11:91
  in operator +
  here: string.from_codepoint((string.to_codepoint(c) ?? 0) - 97 - shift + 26) % 26 + 97 ?? ""
  hint: Use + with numeric types, String, List, or Bytes
   |
11 |       string.from_codepoint((string.to_codepoint(c) ?? 0) - 97 - shift + 26) % 26 + 97 ?? ""
   |                                                                                           ^^
error[E002]: undefined function 'string.join'
  --> /tmp/dojo-caesar-cipher-0.almd:9:3
  in call to string.join()
  here: string.join(list.map(string.to_list(text), (c) =>
  hint: `string.join` was removed at dialect epoch 15: rewrite as `list.join(xs, sep)`: the list is the receiver (R-string-01)
  |
9 |   string.join(list.map(string.to_list(text), (c) =>
  |   ^^^^^^^^^^^
error[E001]: type mismatch in if branches: expected Option[String] but got String — the `then` branch at line 4 fixed the type to Option[String]
  --> /tmp/dojo-caesar-cipher-0.almd:5:10
  in if branches
  here: else c
  hint: Both branches of `if/then/else` must have the same type
  |
5 |     else c
  |          ^
error[E001]: type mismatch in if branches: expected Option[String] but got String — the `then` branch at line 11 fixed the type to Option[String]
  --> /tmp/dojo-caesar-cipher-0.almd:12:10
  in if branches
  here: else c
  hint: Both branches of `if/then/else` must have the same type
   |
12 |     else c
   |          ^

10 error(s) found
FAILED: /tmp/dojo-caesar-cipher-0.almd
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  list.join(list.map(string.to_list(text), (c) => 
    if string.is_lower(c) then 
      string.from_codepoint(((string.to_codepoint(c) ?? 0) - 97 + shift) % 26 + 97) ?? ""
    else 
      some(c)
  ), "")

fn decrypt(text: String, shift: Int) -> String = 
  list.join(list.map(string.to_list(text), (c) => 
    if string.is_lower(c) then 
      string.from_codepoint(((string.to_codepoint(c) ?? 0) - 97 - shift + 26) % 26 + 97) ?? ""
    else 
      some(c)
  ), "")
```

**Diagnostic:**

```
error[E001]: type mismatch in if branches: expected String but got Option[String] — the `then` branch at line 4 fixed the type to String
  --> /tmp/dojo-caesar-cipher-1.almd:6:7
  in if branches
  here: some(c)
  hint: Both branches of `if/then/else` must have the same type
  |
6 |       some(c)
  |       ^^^^
error[E001]: type mismatch in if branches: expected String but got Option[String] — the `then` branch at line 12 fixed the type to String
  --> /tmp/dojo-caesar-cipher-1.almd:14:7
  in if branches
  here: some(c)
  hint: Both branches of `if/then/else` must have the same type
   |
14 |       some(c)
   |       ^^^^

2 error(s) found
FAILED: /tmp/dojo-caesar-cipher-1.almd
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  list.join(list.map(string.to_list(text), (c) => 
    if string.is_lower(c) then 
      string.from_codepoint(((string.to_codepoint(c) ?? 0) - 97 + shift) % 26 + 97) ?? ""
    else 
      c
  ), "")

fn decrypt(text: String, shift: Int) -> String = 
  list.join(list.map(string.to_list(text), (c) => 
    if string.is_lower(c) then 
      string.from_codepoint(((string.to_codepoint(c) ?? 0) - 97 - shift + 26) % 26 + 97) ?? ""
    else 
      c
  ), "")
```
