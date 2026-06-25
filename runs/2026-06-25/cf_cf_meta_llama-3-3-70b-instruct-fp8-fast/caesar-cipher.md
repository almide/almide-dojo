# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  let chars = string.chars(text)
  let shifted_chars = list.map(chars, (c) =>
    if string.is_lower(c) then
      let codepoint = string.codepoint(c) |> option.unwrap_or(0)
      let new_codepoint = (codepoint - 97 + shift) % 26 + 97
      string.from_codepoint(new_codepoint) |> option.unwrap_or("")
    else
      c
  )
  string.join(shifted_chars, "")

fn decrypt(text: String, shift: Int) -> String =
  let chars = string.chars(text)
  let shifted_chars = list.map(chars, (c) =>
    if string.is_lower(c) then
      let codepoint = string.codepoint(c) |> option.unwrap_or(0)
      let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
      string.from_codepoint(new_codepoint) |> option.unwrap_or("")
    else
      c
  )
  string.join(shifted_chars, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:5:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let codepoint = string.codepoint(c) |> option.unwrap_or(0)
  |       ^^^
error: Expected expression at line 8:5 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:8:5
  |
8 |     else
  |     ^
error: Expected expression at line 10:3 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-0.almd:10:3
   |
10 |   )
   |   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:17:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
17 |       let codepoint = string.codepoint(c) |> option.unwrap_or(0)
   |       ^^^
error: Expected expression at line 20:5 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:20:5
   |
20 |     else
   |     ^
error: Expected expression at line 22:3 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-0.almd:22:3
   |
22 |   )
   |   ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:6:28
  in variable codepoint
  hint: Check the variable name
  |
6 |       let new_codepoint = (codepoint - 97 + shift) % 26 + 97
  |                            ^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-caesar-cipher-0.almd:7:64
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
7 |       string.from_codepoint(new_codepoint) |> option.unwrap_or("")
  |                                                                ^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:9:7
  in variable c
  hint: Check the variable name
  |
9 |       c
  |       ^
error[E003]: undefined variable 'shifted_chars'
  --> /tmp/dojo-caesar-cipher-0.almd:11:15
  in variable shifted_chars
  hint: Check the variable name
   |
11 |   string.join(shifted_chars, "")
   |               ^^^^^^^^^^^^^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:18:28
  in variable codepoint
  hint: Check the variable name
   |
18 |       let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
   |                            ^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-caesar-cipher-0.almd:19:64
  in call to option.unwrap_or()
  hint: Fix the argument type
   |
19 |       string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                                                ^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:21:7
  in variable c
  hint: Check the variable name
   |
21 |       c
   |       ^
error[E003]: undefined variable 'shifted_chars'
  --> /tmp/dojo-caesar-cipher-0.almd:23:15
  in variable shifted_chars
  hint: Check the variable name
   |
23 |   string.join(shifted_chars, "")
   |               ^^^^^^^^^^^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[String] but got String
  --> /tmp/dojo-caesar-cipher-0.almd:7:64
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
7 |       string.from_codepoint(new_codepoint) |> option.unwrap_or("")
  |                                                                ^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[String] but got String
  --> /tmp/dojo-caesar-cipher-0.almd:19:64
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
19 |       string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                                                ^^

16 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(string.chars(text), (c) =>
      if string.is_lower(c) then
        let codepoint = string.codepoint(c) |> option.unwrap_or(0)
        let new_codepoint = (codepoint - 97 + shift) % 26 + 97
        string.from_codepoint(new_codepoint) |> option.unwrap_or("")
      else
        c
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(string.chars(text), (c) =>
      if string.is_lower(c) then
        let codepoint = string.codepoint(c) |> option.unwrap_or(0)
        let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
        string.from_codepoint(new_codepoint) |> option.unwrap_or("")
      else
        c
    ),
    ""
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:5:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |         let codepoint = string.codepoint(c) |> option.unwrap_or(0)
  |         ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:18:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
18 |         let codepoint = string.codepoint(c) |> option.unwrap_or(0)
   |         ^^^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(string.chars(text), (c) =>
      if string.is_lower(c) then
        string.from_codepoint(
          ((string.codepoint(c) |> option.unwrap_or(0)) - 97 + shift) % 26 + 97
        ) |> option.unwrap_or("")
      else
        c
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(string.chars(text), (c) =>
      if string.is_lower(c) then
        string.from_codepoint(
          ((string.codepoint(c) |> option.unwrap_or(0)) - 97 - shift + 26) % 26 + 97
        ) |> option.unwrap_or("")
      else
        c
    ),
    ""
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-caesar-cipher-2.almd:7:31
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
7 |         ) |> option.unwrap_or("")
  |                               ^^
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-caesar-cipher-2.almd:20:31
  in call to option.unwrap_or()
  hint: Fix the argument type
   |
20 |         ) |> option.unwrap_or("")
   |                               ^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[String] but got String
  --> /tmp/dojo-caesar-cipher-2.almd:7:31
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
7 |         ) |> option.unwrap_or("")
  |                               ^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[String] but got String
  --> /tmp/dojo-caesar-cipher-2.almd:20:31
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
20 |         ) |> option.unwrap_or("")
   |                               ^^

4 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(string.chars(text), (c) =>
      if string.is_lower(c) then
        string.from_codepoint(
          ((string.codepoint(c) |> option.unwrap_or(0)) - 97 + shift) % 26 + 97
        )
      else
        c
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(string.chars(text), (c) =>
      if string.is_lower(c) then
        string.from_codepoint(
          ((string.codepoint(c) |> option.unwrap_or(0)) - 97 - shift + 26) % 26 + 97
        )
      else
        c
    ),
    ""
  )
```
