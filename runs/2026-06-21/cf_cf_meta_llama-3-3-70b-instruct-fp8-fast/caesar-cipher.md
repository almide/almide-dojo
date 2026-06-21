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
    shifted_chars =
      string.chars(text)
      |> list.map((c) =>
        if string.is_lower(c) then
          let
            codepoint = string.codepoint(c) |> option.unwrap_or(0)
            new_codepoint = (codepoint - 97 + shift) % 26 + 97
          in
            string.from_codepoint(new_codepoint) |> option.unwrap_or("")
        else
          c
      )
  in
    string.join(shifted_chars, "")

fn decrypt(text: String, shift: Int) -> String =
  let
    shifted_chars =
      string.chars(text)
      |> list.map((c) =>
        if string.is_lower(c) then
          let
            codepoint = string.codepoint(c) |> option.unwrap_or(0)
            new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
          in
            string.from_codepoint(new_codepoint) |> option.unwrap_or("")
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
  --> /tmp/dojo-caesar-cipher-0.almd:7:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |           let
  |           ^^^
error: Expected expression at line 10:11 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:10:11
   |
10 |           in
   |           ^
error: Expected expression at line 12:9 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:12:9
   |
12 |         else
   |         ^
error: Expected expression at line 14:7 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-0.almd:14:7
   |
14 |       )
   |       ^
error: Expected identifier at line 19:6 (got Newline '')
  --> /tmp/dojo-caesar-cipher-0.almd:19:6
   |
19 |   let
   |      ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:24:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
24 |           let
   |           ^^^
error: Expected expression at line 27:11 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:27:11
   |
27 |           in
   |           ^
error: Expected expression at line 29:9 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:29:9
   |
29 |         else
   |         ^
error: Expected expression at line 31:7 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-0.almd:31:7
   |
31 |       )
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:8:42
  in variable c
  hint: Check the variable name
  |
8 |             codepoint = string.codepoint(c) |> option.unwrap_or(0)
  |                                          ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:9:30
  in variable codepoint
  hint: Check the variable name
  |
9 |             new_codepoint = (codepoint - 97 + shift) % 26 + 97
  |                              ^^^^^^^^^
error[E003]: undefined variable 'new_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:11:35
  in variable new_codepoint
  hint: Check the variable name
   |
11 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                   ^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-caesar-cipher-0.almd:11:70
  in call to option.unwrap_or()
  hint: Fix the argument type
   |
11 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                                                      ^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:13:11
  in variable c
  hint: Check the variable name
   |
13 |           c
   |           ^
error[E003]: undefined variable 'shifted_chars'
  --> /tmp/dojo-caesar-cipher-0.almd:16:17
  in variable shifted_chars
  hint: Check the variable name
   |
16 |     string.join(shifted_chars, "")
   |                 ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:25:42
  in variable c
  hint: Check the variable name
   |
25 |             codepoint = string.codepoint(c) |> option.unwrap_or(0)
   |                                          ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:26:30
  in variable codepoint
  hint: Check the variable name
   |
26 |             new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
   |                              ^^^^^^^^^
error[E003]: undefined variable 'new_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:28:35
  in variable new_codepoint
  hint: Check the variable name
   |
28 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                   ^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-caesar-cipher-0.almd:28:70
  in call to option.unwrap_or()
  hint: Fix the argument type
   |
28 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                                                      ^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:30:11
  in variable c
  hint: Check the variable name
   |
30 |           c
   |           ^
error[E003]: undefined variable 'shifted_chars'
  --> /tmp/dojo-caesar-cipher-0.almd:33:17
  in variable shifted_chars
  hint: Check the variable name
   |
33 |     string.join(shifted_chars, "")
   |                 ^^^^^^^^^^^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[String] but got String
  --> /tmp/dojo-caesar-cipher-0.almd:11:70
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
11 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                                                      ^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[String] but got String
  --> /tmp/dojo-caesar-cipher-0.almd:28:70
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
28 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                                                      ^^

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
    list.map(string.chars(text), (c) => 
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
    list.map(string.chars(text), (c) => 
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
  --> /tmp/dojo-caesar-cipher-1.almd:5:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |         let codepoint = string.codepoint(c) |> option.unwrap_or(0) in
  |         ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:18:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
18 |         let codepoint = string.codepoint(c) |> option.unwrap_or(0) in
   |         ^^^

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
    list.map(string.chars(text), (c) => 
      if string.is_lower(c) then 
        string.from_codepoint(((string.codepoint(c) |> option.unwrap_or(0)) - 97 + shift) % 26 + 97)
      else 
        c
    ), 
    ""
  )

fn decrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(string.chars(text), (c) => 
      if string.is_lower(c) then 
        string.from_codepoint(((string.codepoint(c) |> option.unwrap_or(0)) - 97 - shift + 26) % 26 + 97)
      else 
        c
    ), 
    ""
  )
```
