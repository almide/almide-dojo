# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
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
            codepoint = string.codepoint(c) |> option.unwrap_or(0)
            new_codepoint = (codepoint - 97 + shift) % 26 + 97
          in
            string.from_codepoint(new_codepoint) |> option.unwrap_or("")
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
            codepoint = string.codepoint(c) |> option.unwrap_or(0)
            new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
          in
            string.from_codepoint(new_codepoint) |> option.unwrap_or("")
        else
          c
    ),
    ""
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:7:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |           let
  |           ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:24:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
24 |           let
   |           ^^^

2 error(s) found
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
          {
            let codepoint = string.codepoint(c) |> option.unwrap_or(0)
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97
            string.from_codepoint(new_codepoint) |> option.unwrap_or("")
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
            let codepoint = string.codepoint(c) |> option.unwrap_or(0)
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
            string.from_codepoint(new_codepoint) |> option.unwrap_or("")
          }
        else
          c
    ),
    ""
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-caesar-cipher-1.almd:10:70
  in call to option.unwrap_or()
  hint: Fix the argument type
   |
10 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                                                      ^^
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-caesar-cipher-1.almd:27:70
  in call to option.unwrap_or()
  hint: Fix the argument type
   |
27 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                                                      ^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[String] but got String
  --> /tmp/dojo-caesar-cipher-1.almd:10:70
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
10 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                                                      ^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[String] but got String
  --> /tmp/dojo-caesar-cipher-1.almd:27:70
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
27 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                                                      ^^

4 error(s) found
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
            let codepoint = string.codepoint(c) |> option.unwrap_or(0)
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97
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
            let codepoint = string.codepoint(c) |> option.unwrap_or(0)
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
            string.from_codepoint(new_codepoint)
          }
        else
          c
    ),
    ""
  )
```
