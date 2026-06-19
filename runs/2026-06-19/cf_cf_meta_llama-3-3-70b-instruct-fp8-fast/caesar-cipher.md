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
    chars = string.chars(text)
    shifted_chars = list.map(chars, (c) => 
      if string.is_lower(c) then
        let
          codepoint = string.codepoint(c) |> option.unwrap_or(0)
          new_codepoint = (codepoint - 97 + shift) % 26 + 97
        in
          string.from_codepoint(new_codepoint)
      else
        c
    )
  in
    string.join(shifted_chars, "")

fn decrypt(text: String, shift: Int) -> String = 
  let
    chars = string.chars(text)
    shifted_chars = list.map(chars, (c) => 
      if string.is_lower(c) then
        let
          codepoint = string.codepoint(c) |> option.unwrap_or(0)
          new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
        in
          string.from_codepoint(new_codepoint)
      else
        c
    )
  in
    string.join(shifted_chars, "")
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
  --> /tmp/dojo-caesar-cipher-0.almd:6:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |         let
  |         ^^^
error: Expected expression at line 9:9 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:9:9
  |
9 |         in
  |         ^
error: Expected expression at line 11:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:11:7
   |
11 |       else
   |       ^
error: Expected expression at line 13:5 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-0.almd:13:5
   |
13 |     )
   |     ^
error: Expected identifier at line 18:6 (got Newline '')
  --> /tmp/dojo-caesar-cipher-0.almd:18:6
   |
18 |   let
   |      ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:22:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
22 |         let
   |         ^^^
error: Expected expression at line 25:9 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:25:9
   |
25 |         in
   |         ^
error: Expected expression at line 27:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:27:7
   |
27 |       else
   |       ^
error: Expected expression at line 29:5 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-0.almd:29:5
   |
29 |     )
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:7:40
  in variable c
  hint: Check the variable name
  |
7 |           codepoint = string.codepoint(c) |> option.unwrap_or(0)
  |                                        ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:8:28
  in variable codepoint
  hint: Check the variable name
  |
8 |           new_codepoint = (codepoint - 97 + shift) % 26 + 97
  |                            ^^^^^^^^^
error[E003]: undefined variable 'new_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:10:33
  in variable new_codepoint
  hint: Check the variable name
   |
10 |           string.from_codepoint(new_codepoint)
   |                                 ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:12:9
  in variable c
  hint: Check the variable name
   |
12 |         c
   |         ^
error[E003]: undefined variable 'shifted_chars'
  --> /tmp/dojo-caesar-cipher-0.almd:15:17
  in variable shifted_chars
  hint: Check the variable name
   |
15 |     string.join(shifted_chars, "")
   |                 ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:23:40
  in variable c
  hint: Check the variable name
   |
23 |           codepoint = string.codepoint(c) |> option.unwrap_or(0)
   |                                        ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:24:28
  in variable codepoint
  hint: Check the variable name
   |
24 |           new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
   |                            ^^^^^^^^^
error[E003]: undefined variable 'new_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:26:33
  in variable new_codepoint
  hint: Check the variable name
   |
26 |           string.from_codepoint(new_codepoint)
   |                                 ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:28:9
  in variable c
  hint: Check the variable name
   |
28 |         c
   |         ^
error[E003]: undefined variable 'shifted_chars'
  --> /tmp/dojo-caesar-cipher-0.almd:31:17
  in variable shifted_chars
  hint: Check the variable name
   |
31 |     string.join(shifted_chars, "")
   |                 ^^^^^^^^^^^^^

20 error(s) found
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
