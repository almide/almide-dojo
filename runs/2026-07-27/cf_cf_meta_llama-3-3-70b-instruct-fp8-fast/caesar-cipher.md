# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  let
    shift_amount = shift % 26
    encrypted_chars =
      string.chars(text)
      |> list.map((c) =>
        if string.is_lower(c) then
          let
            codepoint = string.codepoint(c) |> option.unwrap_or(0)
            new_codepoint = (codepoint - 97 + shift_amount) % 26 + 97
          in
            string.from_codepoint(new_codepoint)
        else
          c
      )
  in
    string.join(encrypted_chars, "")

fn decrypt(text: String, shift: Int) -> String =
  let
    shift_amount = shift % 26
    decrypted_chars =
      string.chars(text)
      |> list.map((c) =>
        if string.is_lower(c) then
          let
            codepoint = string.codepoint(c) |> option.unwrap_or(0)
            new_codepoint = (codepoint - 97 - shift_amount + 26) % 26 + 97
          in
            string.from_codepoint(new_codepoint)
        else
          c
      )
  in
    string.join(decrypted_chars, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-caesar-cipher-0.almd:2:6
  |
2 |   let
  |      ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:8:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |           let
  |           ^^^
error: Expected expression at line 11:11 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:11:11
   |
11 |           in
   |           ^
error: Expected expression at line 13:9 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:13:9
   |
13 |         else
   |         ^
error: Expected expression at line 15:7 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-0.almd:15:7
   |
15 |       )
   |       ^
error: Expected identifier at line 20:6 (got Newline '')
  --> /tmp/dojo-caesar-cipher-0.almd:20:6
   |
20 |   let
   |      ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:26:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
26 |           let
   |           ^^^
error: Expected expression at line 29:11 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:29:11
   |
29 |           in
   |           ^
error: Expected expression at line 31:9 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:31:9
   |
31 |         else
   |         ^
error: Expected expression at line 33:7 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-0.almd:33:7
   |
33 |       )
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:9:42
  in variable c
  hint: Check the variable name
  |
9 |             codepoint = string.codepoint(c) |> option.unwrap_or(0)
  |                                          ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:10:30
  in variable codepoint
  hint: Check the variable name
   |
10 |             new_codepoint = (codepoint - 97 + shift_amount) % 26 + 97
   |                              ^^^^^^^^^
error[E003]: undefined variable 'shift_amount'
  --> /tmp/dojo-caesar-cipher-0.almd:10:47
  in variable shift_amount
  hint: Check the variable name
   |
10 |             new_codepoint = (codepoint - 97 + shift_amount) % 26 + 97
   |                                               ^^^^^^^^^^^^
error[E003]: undefined variable 'new_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:12:35
  in variable new_codepoint
  hint: Check the variable name
   |
12 |             string.from_codepoint(new_codepoint)
   |                                   ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:14:11
  in variable c
  hint: Check the variable name
   |
14 |           c
   |           ^
error[E003]: undefined variable 'encrypted_chars'
  --> /tmp/dojo-caesar-cipher-0.almd:17:17
  in variable encrypted_chars
  hint: Check the variable name
   |
17 |     string.join(encrypted_chars, "")
   |                 ^^^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:27:42
  in variable c
  hint: Check the variable name
   |
27 |             codepoint = string.codepoint(c) |> option.unwrap_or(0)
   |                                          ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:28:30
  in variable codepoint
  hint: Check the variable name
   |
28 |             new_codepoint = (codepoint - 97 - shift_amount + 26) % 26 + 97
   |                              ^^^^^^^^^
error[E003]: undefined variable 'shift_amount'
  --> /tmp/dojo-caesar-cipher-0.almd:28:47
  in variable shift_amount
  hint: Check the variable name
   |
28 |             new_codepoint = (codepoint - 97 - shift_amount + 26) % 26 + 97
   |                                               ^^^^^^^^^^^^
error[E003]: undefined variable 'new_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:30:35
  in variable new_codepoint
  hint: Check the variable name
   |
30 |             string.from_codepoint(new_codepoint)
   |                                   ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:32:11
  in variable c
  hint: Check the variable name
   |
32 |           c
   |           ^
error[E003]: undefined variable 'decrypted_chars'
  --> /tmp/dojo-caesar-cipher-0.almd:35:17
  in variable decrypted_chars
  hint: Check the variable name
   |
35 |     string.join(decrypted_chars, "")
   |                 ^^^^^^^^^^^^^^^

22 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(string.chars(text), (c) =>
      if string.is_lower(c) then
        string.from_codepoint(
          ((string.codepoint(c) |> option.unwrap_or(0) - 97 + shift % 26) % 26) + 97
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
          ((string.codepoint(c) |> option.unwrap_or(0) - 97 - shift % 26 + 26) % 26) + 97
        )
      else
        c
    ),
    ""
  )
```
