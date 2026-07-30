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
    chars = string.chars(text)
    shifted_chars = list.map(chars, (c) => 
      if string.is_lower(c) then 
        let 
          codepoint = string.codepoint(c) |> option.unwrap_or(0)
          shifted_codepoint = (codepoint - 97 + shift) % 26 + 97
        in string.from_codepoint(shifted_codepoint) 
      else c)
  in string.join(shifted_chars, "")

fn decrypt(text: String, shift: Int) -> String = 
  let 
    chars = string.chars(text)
    shifted_chars = list.map(chars, (c) => 
      if string.is_lower(c) then 
        let 
          codepoint = string.codepoint(c) |> option.unwrap_or(0)
          shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
        in string.from_codepoint(shifted_codepoint) 
      else c)
  in string.join(shifted_chars, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-caesar-cipher-0.almd:2:7
  |
2 |   let
  |       ^
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
9 |         in string.from_codepoint(shifted_codepoint)
  |         ^
error: Expected identifier at line 14:7 (got Newline '')
  --> /tmp/dojo-caesar-cipher-0.almd:14:7
   |
14 |   let
   |       ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:18:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
18 |         let
   |         ^^^
error: Expected expression at line 21:9 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:21:9
   |
21 |         in string.from_codepoint(shifted_codepoint)
   |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:7:40
  in variable c
  hint: Check the variable name
  |
7 |           codepoint = string.codepoint(c) |> option.unwrap_or(0)
  |                                        ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:8:32
  in variable codepoint
  hint: Check the variable name
  |
8 |           shifted_codepoint = (codepoint - 97 + shift) % 26 + 97
  |                                ^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:19:40
  in variable c
  hint: Check the variable name
   |
19 |           codepoint = string.codepoint(c) |> option.unwrap_or(0)
   |                                        ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:20:32
  in variable codepoint
  hint: Check the variable name
   |
20 |           shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
   |                                ^^^^^^^^^
error[E001]: type mismatch in fn 'encrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-0.almd:8:63
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
8 |           shifted_codepoint = (codepoint - 97 + shift) % 26 + 97
  |                                                               ^^
error[E001]: type mismatch in fn 'decrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-0.almd:20:68
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
20 |           shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
   |                                                                    ^^

12 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.join(list.map(string.chars(text), (c) => 
    if string.is_lower(c) then 
      let codepoint = string.codepoint(c) |> option.unwrap_or(0)
      in string.from_codepoint((codepoint - 97 + shift) % 26 + 97) 
    else c), "")

fn decrypt(text: String, shift: Int) -> String = 
  string.join(list.map(string.chars(text), (c) => 
    if string.is_lower(c) then 
      let codepoint = string.codepoint(c) |> option.unwrap_or(0)
      in string.from_codepoint((codepoint - 97 - shift + 26) % 26 + 97) 
    else c), "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:4:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |       let codepoint = string.codepoint(c) |> option.unwrap_or(0)
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:11:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |       let codepoint = string.codepoint(c) |> option.unwrap_or(0)
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
  string.join(list.map(string.chars(text), (c) => 
    if string.is_lower(c) then 
      string.from_codepoint((string.codepoint(c) |> option.unwrap_or(0) - 97 + shift) % 26 + 97) 
    else c), "")

fn decrypt(text: String, shift: Int) -> String = 
  string.join(list.map(string.chars(text), (c) => 
    if string.is_lower(c) then 
      string.from_codepoint((string.codepoint(c) |> option.unwrap_or(0) - 97 - shift + 26) % 26 + 97) 
    else c), "")
```
