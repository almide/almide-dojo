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
    shift_letters = (x: String) => 
      if string.is_lower(x) then
        let
          code = string.codepoint(x) |> option.unwrap_or(0)
          new_code = (code - 97 + shift) % 26 + 97
        in
          string.from_codepoint(new_code) |> option.unwrap_or("")
      else
        x
  in
    string.chars(text) 
    |> list.map(shift_letters) 
    |> list.join("", "")

fn decrypt(text: String, shift: Int) -> String = 
  let
    shift_letters = (x: String) => 
      if string.is_lower(x) then
        let
          code = string.codepoint(x) |> option.unwrap_or(0)
          new_code = (code - 97 - shift + 26) % 26 + 97
        in
          string.from_codepoint(new_code) |> option.unwrap_or("")
      else
        x
  in
    string.chars(text) 
    |> list.map(shift_letters) 
    |> list.join("", "")
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
error: Expected expression at line 12:3 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:12:3
   |
12 |   in
   |   ^
error: Expected identifier at line 18:6 (got Newline '')
  --> /tmp/dojo-caesar-cipher-0.almd:18:6
   |
18 |   let
   |      ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:21:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
21 |         let
   |         ^^^
error: Expected expression at line 24:9 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:24:9
   |
24 |         in
   |         ^
error: Expected expression at line 26:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:26:7
   |
26 |       else
   |       ^
error: Expected expression at line 28:3 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:28:3
   |
28 |   in
   |   ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-caesar-cipher-0.almd:6:35
  in variable x
  hint: Check the variable name
  |
6 |           code = string.codepoint(x) |> option.unwrap_or(0)
  |                                   ^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-0.almd:7:23
  in variable code
  hint: Check the variable name
  |
7 |           new_code = (code - 97 + shift) % 26 + 97
  |                       ^^^^
error[E003]: undefined variable 'new_code'
  --> /tmp/dojo-caesar-cipher-0.almd:9:33
  in variable new_code
  hint: Check the variable name
  |
9 |           string.from_codepoint(new_code) |> option.unwrap_or("")
  |                                 ^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-caesar-cipher-0.almd:9:63
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
9 |           string.from_codepoint(new_code) |> option.unwrap_or("")
  |                                                               ^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-caesar-cipher-0.almd:11:9
  in variable x
  hint: Check the variable name
   |
11 |         x
   |         ^
error[E003]: undefined variable 'shift_letters'
  --> /tmp/dojo-caesar-cipher-0.almd:14:17
  in variable shift_letters
  hint: Check the variable name
   |
14 |     |> list.map(shift_letters)
   |                 ^^^^^^^^^^^^^
error[E004]: list.join() expects 2 argument(s) but got 3
  --> /tmp/dojo-caesar-cipher-0.almd:15:22
  in call to list.join()
  hint: Check the number of arguments
  try:
      // list.join() takes 2 arg(s) — you passed 3
      list.join(<xs: List[String]>, <sep: String>)
   |
15 |     |> list.join("", "")
   |                      ^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-caesar-cipher-0.almd:22:35
  in variable x
  hint: Check the variable name
   |
22 |           code = string.codepoint(x) |> option.unwrap_or(0)
   |                                   ^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-0.almd:23:23
  in variable code
  hint: Check the variable name
   |
23 |           new_code = (code - 97 - shift + 26) % 26 + 97
   |                       ^^^^
error[E003]: undefined variable 'new_code'
  --> /tmp/dojo-caesar-cipher-0.almd:25:33
  in variable new_code
  hint: Check the variable name
   |
25 |           string.from_codepoint(new_code) |> option.unwrap_or("")
   |                                 ^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-caesar-cipher-0.almd:25:63
  in call to option.unwrap_or()
  hint: Fix the argument type
   |
25 |           string.from_codepoint(new_code) |> option.unwrap_or("")
   |                                                               ^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-caesar-cipher-0.almd:27:9
  in variable x
  hint: Check the variable name
   |
27 |         x
   |         ^
error[E003]: undefined variable 'shift_letters'
  --> /tmp/dojo-caesar-cipher-0.almd:30:17
  in variable shift_letters
  hint: Check the variable name
   |
30 |     |> list.map(shift_letters)
   |                 ^^^^^^^^^^^^^
error[E004]: list.join() expects 2 argument(s) but got 3
  --> /tmp/dojo-caesar-cipher-0.almd:31:22
  in call to list.join()
  hint: Check the number of arguments
  try:
      // list.join() takes 2 arg(s) — you passed 3
      list.join(<xs: List[String]>, <sep: String>)
   |
31 |     |> list.join("", "")
   |                      ^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[String] but got String
  --> /tmp/dojo-caesar-cipher-0.almd:9:63
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
9 |           string.from_codepoint(new_code) |> option.unwrap_or("")
  |                                                               ^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[String] but got String
  --> /tmp/dojo-caesar-cipher-0.almd:25:63
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
25 |           string.from_codepoint(new_code) |> option.unwrap_or("")
   |                                                               ^^

26 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.chars(text) 
  |> list.map((x: String) => 
    if string.is_lower(x) then
      let 
        code = string.codepoint(x) 
      in 
        string.from_codepoint((code.unwrap_or(0) - 97 + shift) % 26 + 97) 
    else 
      x
  ) 
  |> list.join("")

fn decrypt(text: String, shift: Int) -> String = 
  string.chars(text) 
  |> list.map((x: String) => 
    if string.is_lower(x) then
      let 
        code = string.codepoint(x) 
      in 
        string.from_codepoint((code.unwrap_or(0) - 97 - shift + 26) % 26 + 97) 
    else 
      x
  ) 
  |> list.join("")
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:5:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:18:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
18 |       let
   |       ^^^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.chars(text) 
  |> list.map((x) => 
    if string.is_lower(x) then
      string.from_codepoint((string.codepoint(x).unwrap_or(0) - 97 + shift) % 26 + 97) 
    else 
      x
  ) 
  |> list.join("")

fn decrypt(text: String, shift: Int) -> String = 
  string.chars(text) 
  |> list.map((x) => 
    if string.is_lower(x) then
      string.from_codepoint((string.codepoint(x).unwrap_or(0) - 97 - shift + 26) % 26 + 97) 
    else 
      x
  ) 
  |> list.join("")
```
