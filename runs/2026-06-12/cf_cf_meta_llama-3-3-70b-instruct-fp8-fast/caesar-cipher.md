# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  let chars = string.chars(text)
  in string.join(list.map(chars, (c) => 
    if string.is_alpha(c) and string.is_lower(c) then
      let code = string.codepoint(c) |> option.unwrap_or(0)
      in string.from_codepoint((code - 97 + shift) % 26 + 97)
    else
      c
  ), "")

fn decrypt(text: String, shift: Int) -> String = 
  let chars = string.chars(text)
  in string.join(list.map(chars, (c) => 
    if string.is_alpha(c) and string.is_lower(c) then
      let code = string.codepoint(c) |> option.unwrap_or(0)
      in string.from_codepoint((code - 97 - shift + 26) % 26 + 97)
    else
      c
  ), "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:5:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let code = string.codepoint(c) |> option.unwrap_or(0)
  |       ^^^
error: Expected expression at line 7:5 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:7:5
  |
7 |     else
  |     ^
error: Expected expression at line 9:3 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-0.almd:9:3
  |
9 |   ), "")
  |   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:15:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
15 |       let code = string.codepoint(c) |> option.unwrap_or(0)
   |       ^^^
error: Expected expression at line 17:5 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:17:5
   |
17 |     else
   |     ^
error: Expected expression at line 19:3 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-0.almd:19:3
   |
19 |   ), "")
   |   ^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-0.almd:6:30
  in variable code
  hint: Check the variable name
  |
6 |       string.from_codepoint((code - 97 + shift) % 26 + 97)
  |                              ^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:8:7
  in variable c
  hint: Check the variable name
  |
8 |       c
  |       ^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-0.almd:16:30
  in variable code
  hint: Check the variable name
   |
16 |       string.from_codepoint((code - 97 - shift + 26) % 26 + 97)
   |                              ^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:18:7
  in variable c
  hint: Check the variable name
   |
18 |       c
   |       ^
error[E001]: type mismatch in fn 'encrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-0.almd:8:7
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
8 |       c
  |       ^
error[E001]: type mismatch in fn 'decrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-0.almd:18:7
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
18 |       c
   |       ^

12 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.join(list.map(string.chars(text), (c) => 
    if string.is_alpha(c) and string.is_lower(c) then
      string.from_codepoint((string.codepoint(c) |> option.unwrap_or(0) - 97 + shift) % 26 + 97)
    else 
      c
  ), "")

fn decrypt(text: String, shift: Int) -> String = 
  string.join(list.map(string.chars(text), (c) => 
    if string.is_alpha(c) and string.is_lower(c) then
      string.from_codepoint((string.codepoint(c) |> option.unwrap_or(0) - 97 - shift + 26) % 26 + 97)
    else 
      c
  ), "")
```
