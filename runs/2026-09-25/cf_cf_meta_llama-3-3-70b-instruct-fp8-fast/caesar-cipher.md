# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text), 
      (c) => 
        if string.is_lower(c) then 
          let 
            code = string.codepoint(c) |> option.unwrap_or(0)
            new_code = (code - 97 + shift) % 26 + 97
          in 
            string.from_codepoint(new_code) 
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
          let 
            code = string.codepoint(c) |> option.unwrap_or(0)
            new_code = (code - 97 - shift + 26) % 26 + 97
          in 
            string.from_codepoint(new_code) 
        else 
          c
    ), 
    ""
  )
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:7:11
  in let-in
  here: let
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |           let
  |           ^^^
error: 'let' is not an expression in Almide at line 7:11
  --> /tmp/dojo-caesar-cipher-0.almd:7:11
  here: let
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |           let
  |           ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:24:11
  in let-in
  here: let
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
24 |           let
   |           ^^^
error: 'let' is not an expression in Almide at line 24:11
  --> /tmp/dojo-caesar-cipher-0.almd:24:11
  here: let
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
24 |           let
   |           ^

4 error(s) found
FAILED: /tmp/dojo-caesar-cipher-0.almd
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text), 
      (c) => 
        if string.is_lower(c) then 
          {
            let code = string.codepoint(c) |> option.unwrap_or(0)
            let new_code = (code - 97 + shift) % 26 + 97
            string.from_codepoint(new_code) 
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
            let code = string.codepoint(c) |> option.unwrap_or(0)
            let new_code = (code - 97 - shift + 26) % 26 + 97
            string.from_codepoint(new_code) 
          } 
        else 
          c
    ), 
    ""
  )
```
