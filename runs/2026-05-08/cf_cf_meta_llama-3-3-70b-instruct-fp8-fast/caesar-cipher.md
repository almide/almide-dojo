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
    shift = shift % 26
    encrypted_chars =
      string.chars(text)
      |> list.map((c) =>
        let
          codepoint = string.codepoint(c)
        in
        if codepoint >= 97 and codepoint <= 122 then
          let
            new_codepoint = (codepoint - 97 + shift) % 26 + 97
          in
          string.from_codepoint(new_codepoint)
        else
          c
      )
  in
  list.fold(encrypted_chars, "", (acc, c) => acc + c)

fn decrypt(text: String, shift: Int) -> String =
  let
    shift = shift % 26
    decrypted_chars =
      string.chars(text)
      |> list.map((c) =>
        let
          codepoint = string.codepoint(c)
        in
        if codepoint >= 97 and codepoint <= 122 then
          let
            new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
          in
          string.from_codepoint(new_codepoint)
        else
          c
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
  --> /tmp/dojo-caesar-cipher-0.almd:7:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |         let
  |         ^^^
error: Expected expression at line 9:9 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:9:9
  |
9 |         in
  |         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:11:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |           let
   |           ^^^
error: Expected expression at line 13:11 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:13:11
   |
13 |           in
   |           ^
error: Expected expression at line 15:9 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:15:9
   |
15 |         else
   |         ^
error: Expected expression at line 17:7 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-0.almd:17:7
   |
17 |       )
   |       ^
error: Expected identifier at line 22:6 (got Newline '')
  --> /tmp/dojo-caesar-cipher-0.almd:22:6
   |
22 |   let
   |      ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:27:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
27 |         let
   |         ^^^
error: Expected expression at line 29:9 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:29:9
   |
29 |         in
   |         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:31:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
31 |           let
   |           ^^^
error: Expected expression at line 33:11 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:33:11
   |
33 |           in
   |           ^
error: Expected expression at line 35:9 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:35:9
   |
35 |         else
   |         ^
error[E009]: cannot reassign immutable binding 'shift'
  --> /tmp/dojo-caesar-cipher-0.almd:3:21
  in shift = ...
  hint: 'shift' is a function parameter (immutable). Use a local copy: var shift_ = shift
  try:
      // 'shift' is a parameter — make a mutable copy:
      var shift_ = shift
      // ...then reassign shift_ instead of shift
  |
3 |     shift = shift % 26
  |                     ^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:8:40
  in variable c
  hint: Check the variable name
  |
8 |           codepoint = string.codepoint(c)
  |                                        ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:12:30
  in variable codepoint
  hint: Check the variable name
   |
12 |             new_codepoint = (codepoint - 97 + shift) % 26 + 97
   |                              ^^^^^^^^^
error[E003]: undefined variable 'new_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:14:33
  in variable new_codepoint
  hint: Check the variable name
   |
14 |           string.from_codepoint(new_codepoint)
   |                                 ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:16:11
  in variable c
  hint: Check the variable name
   |
16 |           c
   |           ^
error[E003]: undefined variable 'encrypted_chars'
  --> /tmp/dojo-caesar-cipher-0.almd:19:13
  in variable encrypted_chars
  hint: Check the variable name
   |
19 |   list.fold(encrypted_chars, "", (acc, c) => acc + c)
   |             ^^^^^^^^^^^^^^^
error[E009]: cannot reassign immutable binding 'shift'
  --> /tmp/dojo-caesar-cipher-0.almd:23:21
  in shift = ...
  hint: 'shift' is a function parameter (immutable). Use a local copy: var shift_ = shift
  try:
      // 'shift' is a parameter — make a mutable copy:
      var shift_ = shift
      // ...then reassign shift_ instead of shift
   |
23 |     shift = shift % 26
   |                     ^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:28:40
  in variable c
  hint: Check the variable name
   |
28 |           codepoint = string.codepoint(c)
   |                                        ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:32:30
  in variable codepoint
  hint: Check the variable name
   |
32 |             new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
   |                              ^^^^^^^^^
error[E003]: undefined variable 'new_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:34:33
  in variable new_codepoint
  hint: Check the variable name
   |
34 |           string.from_codepoint(new_codepoint)
   |                                 ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:36:11
  in variable c
  hint: Check the variable name
   |
36 |           c
   |           ^

24 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(
      string.chars(text),
      (c) =>
        if string.codepoint(c) >= some(97) and string.codepoint(c) <= some(122) then
          string.from_codepoint((string.codepoint(c) |> option.unwrap_or(0) - 97 + shift % 26) % 26 + 97)
        else
          c
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(
      string.chars(text),
      (c) =>
        if string.codepoint(c) >= some(97) and string.codepoint(c) <= some(122) then
          string.from_codepoint((string.codepoint(c) |> option.unwrap_or(0) - 97 - shift % 26 + 26) % 26 + 97)
        else
          c
    ),
    ""
  )
```
