# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  let
    shifted_char = (c: String) =>
      if string.is_lower(c) then
        let
          codepoint = string.codepoint(c) |> option.unwrap_or(0)
          new_codepoint = (codepoint - 97 + shift) % 26 + 97
        in
          string.from_codepoint(new_codepoint)
      else
        c

    chars = string.chars(text)
    shifted_chars = list.map(chars, shifted_char)
  in
    list.join(shifted_chars, "")

fn decrypt(text: String, shift: Int) -> String =
  let
    shifted_char = (c: String) =>
      if string.is_lower(c) then
        let
          codepoint = string.codepoint(c) |> option.unwrap_or(0)
          new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
        in
          string.from_codepoint(new_codepoint)
      else
        c

    chars = string.chars(text)
    shifted_chars = list.map(chars, shifted_char)
  in
    list.join(shifted_chars, "")
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
  --> /tmp/dojo-caesar-cipher-0.almd:5:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |         let
  |         ^^^
error: Expected expression at line 8:9 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:8:9
  |
8 |         in
  |         ^
error: Expected expression at line 10:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:10:7
   |
10 |       else
   |       ^
error: Expected expression at line 15:3 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:15:3
   |
15 |   in
   |   ^
error: Expected identifier at line 19:6 (got Newline '')
  --> /tmp/dojo-caesar-cipher-0.almd:19:6
   |
19 |   let
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
error: Expected expression at line 32:3 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:32:3
   |
32 |   in
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:6:40
  in variable c
  hint: Check the variable name
  |
6 |           codepoint = string.codepoint(c) |> option.unwrap_or(0)
  |                                        ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:7:28
  in variable codepoint
  hint: Check the variable name
  |
7 |           new_codepoint = (codepoint - 97 + shift) % 26 + 97
  |                            ^^^^^^^^^
error[E003]: undefined variable 'new_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:9:33
  in variable new_codepoint
  hint: Check the variable name
  |
9 |           string.from_codepoint(new_codepoint)
  |                                 ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:11:9
  in variable c
  hint: Check the variable name
   |
11 |         c
   |         ^
error[E003]: undefined variable 'chars'
  --> /tmp/dojo-caesar-cipher-0.almd:14:30
  in variable chars
  hint: Check the variable name
   |
14 |     shifted_chars = list.map(chars, shifted_char)
   |                              ^^^^^
error[E003]: undefined variable 'shifted_char'
  --> /tmp/dojo-caesar-cipher-0.almd:14:37
  in variable shifted_char
  hint: Check the variable name
   |
14 |     shifted_chars = list.map(chars, shifted_char)
   |                                     ^^^^^^^^^^^^
error[E003]: undefined variable 'shifted_chars'
  --> /tmp/dojo-caesar-cipher-0.almd:16:15
  in variable shifted_chars
  hint: Check the variable name
   |
16 |     list.join(shifted_chars, "")
   |               ^^^^^^^^^^^^^
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
error[E003]: undefined variable 'chars'
  --> /tmp/dojo-caesar-cipher-0.almd:31:30
  in variable chars
  hint: Check the variable name
   |
31 |     shifted_chars = list.map(chars, shifted_char)
   |                              ^^^^^
error[E003]: undefined variable 'shifted_char'
  --> /tmp/dojo-caesar-cipher-0.almd:31:37
  in variable shifted_char
  hint: Check the variable name
   |
31 |     shifted_chars = list.map(chars, shifted_char)
   |                                     ^^^^^^^^^^^^
error[E003]: undefined variable 'shifted_chars'
  --> /tmp/dojo-caesar-cipher-0.almd:33:15
  in variable shifted_chars
  hint: Check the variable name
   |
33 |     list.join(shifted_chars, "")
   |               ^^^^^^^^^^^^^

24 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(
      string.chars(text),
      (c: String) =>
        if string.is_lower(c) then
          let codepoint = string.codepoint(c) |> option.unwrap_or(0) in
          let new_codepoint = (codepoint - 97 + shift) % 26 + 97 in
          string.from_codepoint(new_codepoint)
        else
          c
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(
      string.chars(text),
      (c: String) =>
        if string.is_lower(c) then
          let codepoint = string.codepoint(c) |> option.unwrap_or(0) in
          let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97 in
          string.from_codepoint(new_codepoint)
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
  --> /tmp/dojo-caesar-cipher-1.almd:7:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |           let codepoint = string.codepoint(c) |> option.unwrap_or(0) in
  |           ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:22:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
22 |           let codepoint = string.codepoint(c) |> option.unwrap_or(0) in
   |           ^^^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(
      string.chars(text),
      (c) =>
        if string.is_lower(c) then
          {
            let codepoint = string.codepoint(c) |> option.unwrap_or(0);
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint)
          }
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
        if string.is_lower(c) then
          {
            let codepoint = string.codepoint(c) |> option.unwrap_or(0);
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint)
          }
        else
          c
    ),
    ""
  )
```
