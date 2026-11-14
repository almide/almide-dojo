# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  let chars = string.to_list(text)
  in string.join(list.map(chars, (c) => 
    if string.is_lower(c) then 
      let code = string.to_codepoint(c) ?? 0
      in string.from_codepoint((code - 97 + shift) % 26 + 97) ?? c
    else c
  ), "")

fn decrypt(text: String, shift: Int) -> String = 
  let chars = string.to_list(text)
  in string.join(list.map(chars, (c) => 
    if string.is_lower(c) then 
      let code = string.to_codepoint(c) ?? 0
      in string.from_codepoint((code - 97 - shift + 26) % 26 + 97) ?? c
    else c
  ), "")
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:5:7
  in let-in
  here: let code = string.to_codepoint(c) ?? 0
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let code = string.to_codepoint(c) ?? 0
  |       ^^^
error: Expected expression at line 7:5 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:7:5
  here: else c
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |     else c
  |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:14:7
  in let-in
  here: let code = string.to_codepoint(c) ?? 0
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
14 |       let code = string.to_codepoint(c) ?? 0
   |       ^^^
error: Expected expression at line 16:5 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:16:5
  here: else c
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |     else c
   |     ^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-0.almd:6:30
  in variable code
  here: string.from_codepoint((code - 97 + shift) % 26 + 97) ?? c
  hint: Check the variable name
  |
6 |       string.from_codepoint((code - 97 + shift) % 26 + 97) ?? c
  |                              ^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:6:63
  in variable c
  here: string.from_codepoint((code - 97 + shift) % 26 + 97) ?? c
  hint: Check the variable name
  |
6 |       string.from_codepoint((code - 97 + shift) % 26 + 97) ?? c
  |                                                               ^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-0.almd:15:30
  in variable code
  here: string.from_codepoint((code - 97 - shift + 26) % 26 + 97) ?? c
  hint: Check the variable name
   |
15 |       string.from_codepoint((code - 97 - shift + 26) % 26 + 97) ?? c
   |                              ^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:15:68
  in variable c
  here: string.from_codepoint((code - 97 - shift + 26) % 26 + 97) ?? c
  hint: Check the variable name
   |
15 |       string.from_codepoint((code - 97 - shift + 26) % 26 + 97) ?? c
   |                                                                    ^
error[E001]: type mismatch in fn 'encrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-0.almd:6:63
  in fn 'encrypt'
  here: string.from_codepoint((code - 97 + shift) % 26 + 97) ?? c
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
6 |       string.from_codepoint((code - 97 + shift) % 26 + 97) ?? c
  |                                                               ^
error[E001]: type mismatch in fn 'decrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-0.almd:15:68
  in fn 'decrypt'
  here: string.from_codepoint((code - 97 - shift + 26) % 26 + 97) ?? c
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
15 |       string.from_codepoint((code - 97 - shift + 26) % 26 + 97) ?? c
   |                                                                    ^

10 error(s) found
FAILED: /tmp/dojo-caesar-cipher-0.almd
  parse error: 'let' is not an expression in Almide
  parse error: Expected expression at line 7:5 (got Else 'else')
  parse error: 'let' is not an expression in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-caesar-cipher-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.join(list.map(string.to_list(text), (c) => 
    if string.is_lower(c) then 
      string.from_codepoint(((string.to_codepoint(c) ?? 0) - 97 + shift) % 26 + 97) ?? c
    else c
  ), "")

fn decrypt(text: String, shift: Int) -> String = 
  string.join(list.map(string.to_list(text), (c) => 
    if string.is_lower(c) then 
      string.from_codepoint(((string.to_codepoint(c) ?? 0) - 97 - shift + 26) % 26 + 97) ?? c
    else c
  ), "")
```

**Diagnostic:**

```
error[E002]: undefined function 'string.join'
  --> /tmp/dojo-caesar-cipher-1.almd:2:3
  in call to string.join()
  here: string.join(list.map(string.to_list(text), (c) =>
  hint: `string.join` was removed at dialect epoch 15: rewrite as `list.join(xs, sep)`: the list is the receiver (R-string-01)
  |
2 |   string.join(list.map(string.to_list(text), (c) =>
  |   ^^^^^^^^^^^
error[E002]: undefined function 'string.join'
  --> /tmp/dojo-caesar-cipher-1.almd:9:3
  in call to string.join()
  here: string.join(list.map(string.to_list(text), (c) =>
  hint: `string.join` was removed at dialect epoch 15: rewrite as `list.join(xs, sep)`: the list is the receiver (R-string-01)
  |
9 |   string.join(list.map(string.to_list(text), (c) =>
  |   ^^^^^^^^^^^

2 error(s) found
FAILED: /tmp/dojo-caesar-cipher-1.almd
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  list.join(list.map(string.to_list(text), (c) => 
    if string.is_lower(c) then 
      string.from_codepoint(((string.to_codepoint(c) ?? 0) - 97 + shift) % 26 + 97) ?? c
    else c
  ), "")

fn decrypt(text: String, shift: Int) -> String = 
  list.join(list.map(string.to_list(text), (c) => 
    if string.is_lower(c) then 
      string.from_codepoint(((string.to_codepoint(c) ?? 0) - 97 - shift + 26) % 26 + 97) ?? c
    else c
  ), "")
```
