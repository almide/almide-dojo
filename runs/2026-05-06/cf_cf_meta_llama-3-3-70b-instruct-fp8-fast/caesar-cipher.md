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
    shifted_chars =
      string
      .chars(text)
      .map((c) =>
        let
          codepoint = string.codepoint(c)
        in
        if codepoint >= 97 and codepoint <= 122 then
          let
            shifted_codepoint = (codepoint - 97 + shift_amount) % 26 + 97
          in
          string.from_codepoint(shifted_codepoint)
        else
          c
      )
  in
  string.join(shifted_chars, "")

fn decrypt(text: String, shift: Int) -> String =
  let
    shift_amount = shift % 26
    shifted_chars =
      string
      .chars(text)
      .map((c) =>
        let
          codepoint = string.codepoint(c)
        in
        if codepoint >= 97 and codepoint <= 122 then
          let
            shifted_codepoint = (codepoint - 97 - shift_amount + 26) % 26 + 97
          in
          string.from_codepoint(shifted_codepoint)
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
error: Expected expression at line 6:7 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-0.almd:6:7
  |
6 |       .chars(text)
  |       ^
error: Expected identifier at line 8:12 (got Newline '')
  --> /tmp/dojo-caesar-cipher-0.almd:8:12
  |
8 |         let
  |            ^
error: Expected expression at line 10:9 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:10:9
   |
10 |         in
   |         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:12:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |           let
   |           ^^^
error: Expected expression at line 14:11 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:14:11
   |
14 |           in
   |           ^
error: Expected expression at line 16:9 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:16:9
   |
16 |         else
   |         ^
error: Expected expression at line 18:7 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-0.almd:18:7
   |
18 |       )
   |       ^
error: Expected identifier at line 23:6 (got Newline '')
  --> /tmp/dojo-caesar-cipher-0.almd:23:6
   |
23 |   let
   |      ^
error: Expected expression at line 27:7 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-0.almd:27:7
   |
27 |       .chars(text)
   |       ^
error: Expected identifier at line 29:12 (got Newline '')
  --> /tmp/dojo-caesar-cipher-0.almd:29:12
   |
29 |         let
   |            ^
error: Expected expression at line 31:9 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:31:9
   |
31 |         in
   |         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:33:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
33 |           let
   |           ^^^
error: Expected expression at line 35:11 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:35:11
   |
35 |           in
   |           ^
error: Expected expression at line 37:9 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:37:9
   |
37 |         else
   |         ^
error[E003]: undefined variable 'string'
  --> /tmp/dojo-caesar-cipher-0.almd:5:7
  in variable string
  hint: Check the variable name
  |
5 |       string
  |       ^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:9:40
  in variable c
  hint: Check the variable name
  |
9 |           codepoint = string.codepoint(c)
  |                                        ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:13:34
  in variable codepoint
  hint: Check the variable name
   |
13 |             shifted_codepoint = (codepoint - 97 + shift_amount) % 26 + 97
   |                                  ^^^^^^^^^
error[E003]: undefined variable 'shift_amount'
  --> /tmp/dojo-caesar-cipher-0.almd:13:51
  in variable shift_amount
  hint: Check the variable name
   |
13 |             shifted_codepoint = (codepoint - 97 + shift_amount) % 26 + 97
   |                                                   ^^^^^^^^^^^^
error[E003]: undefined variable 'shifted_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:15:33
  in variable shifted_codepoint
  hint: Did you mean `string.codepoint`?
  try:
      // shifted_codepoint  →  string.codepoint
      string.codepoint
   |
15 |           string.from_codepoint(shifted_codepoint)
   |                                 ^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:17:11
  in variable c
  hint: Check the variable name
   |
17 |           c
   |           ^
error[E003]: undefined variable 'shifted_chars'
  --> /tmp/dojo-caesar-cipher-0.almd:20:15
  in variable shifted_chars
  hint: Check the variable name
   |
20 |   string.join(shifted_chars, "")
   |               ^^^^^^^^^^^^^
error[E003]: undefined variable 'string'
  --> /tmp/dojo-caesar-cipher-0.almd:26:7
  in variable string
  hint: Check the variable name
   |
26 |       string
   |       ^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:30:40
  in variable c
  hint: Check the variable name
   |
30 |           codepoint = string.codepoint(c)
   |                                        ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:34:34
  in variable codepoint
  hint: Check the variable name
   |
34 |             shifted_codepoint = (codepoint - 97 - shift_amount + 26) % 26 + 97
   |                                  ^^^^^^^^^
error[E003]: undefined variable 'shift_amount'
  --> /tmp/dojo-caesar-cipher-0.almd:34:51
  in variable shift_amount
  hint: Check the variable name
   |
34 |             shifted_codepoint = (codepoint - 97 - shift_amount + 26) % 26 + 97
   |                                                   ^^^^^^^^^^^^
error[E003]: undefined variable 'shifted_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:36:33
  in variable shifted_codepoint
  hint: Did you mean `string.codepoint`?
  try:
      // shifted_codepoint  →  string.codepoint
      string.codepoint
   |
36 |           string.from_codepoint(shifted_codepoint)
   |                                 ^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:38:11
  in variable c
  hint: Check the variable name
   |
38 |           c
   |           ^

28 error(s) found
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
          string.from_codepoint(
            (string.codepoint(c) |> option.unwrap_or(0) - 97 + shift % 26) % 26 + 97
          )
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
          string.from_codepoint(
            (string.codepoint(c) |> option.unwrap_or(0) - 97 - shift % 26 + 26) % 26 + 97
          )
        else 
          c
    ), 
    ""
  )
```
