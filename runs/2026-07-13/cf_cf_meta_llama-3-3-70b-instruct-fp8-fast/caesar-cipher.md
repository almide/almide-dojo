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
    shift_lowercase = (shift % 26)
    encrypted_chars = 
      string.chars(text) 
      |> list.map((c) => 
        if string.is_lower(c) then
          let
            codepoint = string.codepoint(c) |> option.unwrap_or(0)
            new_codepoint = ((codepoint - 97 + shift_lowercase) % 26) + 97
          in
            string.from_codepoint(new_codepoint) |> option.unwrap_or("")
        else
          c
      )
  in
    string.join(encrypted_chars, "")

fn decrypt(text: String, shift: Int) -> String =
  let
    shift_lowercase = (shift % 26)
    decrypted_chars = 
      string.chars(text) 
      |> list.map((c) => 
        if string.is_lower(c) then
          let
            codepoint = string.codepoint(c) |> option.unwrap_or(0)
            new_codepoint = ((codepoint - 97 - shift_lowercase + 26) % 26) + 97
          in
            string.from_codepoint(new_codepoint) |> option.unwrap_or("")
        else
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
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:9:42
  in variable c
  hint: Check the variable name
  |
9 |             codepoint = string.codepoint(c) |> option.unwrap_or(0)
  |                                          ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:10:31
  in variable codepoint
  hint: Check the variable name
   |
10 |             new_codepoint = ((codepoint - 97 + shift_lowercase) % 26) + 97
   |                               ^^^^^^^^^
error[E003]: undefined variable 'shift_lowercase'
  --> /tmp/dojo-caesar-cipher-0.almd:10:48
  in variable shift_lowercase
  hint: Check the variable name
   |
10 |             new_codepoint = ((codepoint - 97 + shift_lowercase) % 26) + 97
   |                                                ^^^^^^^^^^^^^^^
error[E003]: undefined variable 'new_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:12:35
  in variable new_codepoint
  hint: Check the variable name
   |
12 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                   ^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-caesar-cipher-0.almd:12:70
  in call to option.unwrap_or()
  hint: Fix the argument type
   |
12 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                                                      ^^
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
  --> /tmp/dojo-caesar-cipher-0.almd:28:31
  in variable codepoint
  hint: Check the variable name
   |
28 |             new_codepoint = ((codepoint - 97 - shift_lowercase + 26) % 26) + 97
   |                               ^^^^^^^^^
error[E003]: undefined variable 'shift_lowercase'
  --> /tmp/dojo-caesar-cipher-0.almd:28:48
  in variable shift_lowercase
  hint: Check the variable name
   |
28 |             new_codepoint = ((codepoint - 97 - shift_lowercase + 26) % 26) + 97
   |                                                ^^^^^^^^^^^^^^^
error[E003]: undefined variable 'new_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:30:35
  in variable new_codepoint
  hint: Check the variable name
   |
30 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                   ^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-caesar-cipher-0.almd:30:70
  in call to option.unwrap_or()
  hint: Fix the argument type
   |
30 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                                                      ^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[String] but got String
  --> /tmp/dojo-caesar-cipher-0.almd:12:70
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
12 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                                                      ^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[String] but got String
  --> /tmp/dojo-caesar-cipher-0.almd:30:70
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
30 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                                                      ^^
error[E001]: type mismatch in fn 'decrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-0.almd:30:70
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
30 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
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
    list.map(
      string.chars(text),
      (c) =>
        if string.is_lower(c) then
          let codepoint = string.codepoint(c) |> option.unwrap_or(0)
          in string.from_codepoint(((codepoint - 97 + (shift % 26)) % 26) + 97)
        else c
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(
      string.chars(text),
      (c) =>
        if string.is_lower(c) then
          let codepoint = string.codepoint(c) |> option.unwrap_or(0)
          in string.from_codepoint(((codepoint - 97 - (shift % 26) + 26) % 26) + 97)
        else c
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
7 |           let codepoint = string.codepoint(c) |> option.unwrap_or(0)
  |           ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:20:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
20 |           let codepoint = string.codepoint(c) |> option.unwrap_or(0)
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
          string.from_codepoint(((string.codepoint(c) |> option.unwrap_or(0) - 97 + (shift % 26)) % 26) + 97)
        else c
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(
      string.chars(text),
      (c) =>
        if string.is_lower(c) then
          string.from_codepoint(((string.codepoint(c) |> option.unwrap_or(0) - 97 - (shift % 26) + 26) % 26) + 97)
        else c
    ),
    ""
  )
```
