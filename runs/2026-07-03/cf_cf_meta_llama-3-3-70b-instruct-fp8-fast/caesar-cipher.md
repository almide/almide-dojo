# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  let chars = string.chars(text)
  in string.join(list.map(chars, (c) => 
    if string.is_lower(c) then 
      let code = string.codepoint(c) |> option.unwrap_or(0)
      in string.from_codepoint((code - 97 + shift) % 26 + 97)
    else c), "")

fn decrypt(text: String, shift: Int) -> String = 
  let chars = string.chars(text)
  in string.join(list.map(chars, (c) => 
    if string.is_lower(c) then 
      let code = string.codepoint(c) |> option.unwrap_or(0)
      in string.from_codepoint((code - 97 - shift + 26) % 26 + 97)
    else c), "")
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
7 |     else c), "")
  |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:13:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |       let code = string.codepoint(c) |> option.unwrap_or(0)
   |       ^^^
error: Expected expression at line 15:5 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:15:5
   |
15 |     else c), "")
   |     ^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-0.almd:6:30
  in variable code
  hint: Check the variable name
  |
6 |       string.from_codepoint((code - 97 + shift) % 26 + 97)
  |                              ^^^^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-0.almd:14:30
  in variable code
  hint: Check the variable name
   |
14 |       string.from_codepoint((code - 97 - shift + 26) % 26 + 97)
   |                              ^^^^
error[E001]: type mismatch in fn 'encrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-0.almd:6:56
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
6 |       string.from_codepoint((code - 97 + shift) % 26 + 97)
  |                                                        ^^
error[E001]: type mismatch in fn 'decrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-0.almd:14:61
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
14 |       string.from_codepoint((code - 97 - shift + 26) % 26 + 97)
   |                                                             ^^

8 error(s) found
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
      let code = string.codepoint(c) |> option.unwrap_or(0)
      in { 
        let new_code = (code - 97 + shift) % 26 + 97
        in string.from_codepoint(new_code) 
      }
    else c), "")

fn decrypt(text: String, shift: Int) -> String = 
  string.join(list.map(string.chars(text), (c) => 
    if string.is_lower(c) then 
      let code = string.codepoint(c) |> option.unwrap_or(0)
      in { 
        let new_code = (code - 97 - shift + 26) % 26 + 97
        in string.from_codepoint(new_code) 
      }
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
4 |       let code = string.codepoint(c) |> option.unwrap_or(0)
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:14:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
14 |       let code = string.codepoint(c) |> option.unwrap_or(0)
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
      {
        let code = string.codepoint(c) |> option.unwrap_or(0)
        let new_code = (code - 97 + shift) % 26 + 97
        string.from_codepoint(new_code) 
      }
    else c), "")

fn decrypt(text: String, shift: Int) -> String = 
  string.join(list.map(string.chars(text), (c) => 
    if string.is_lower(c) then 
      {
        let code = string.codepoint(c) |> option.unwrap_or(0)
        let new_code = (code - 97 - shift + 26) % 26 + 97
        string.from_codepoint(new_code) 
      }
    else c), "")
```
