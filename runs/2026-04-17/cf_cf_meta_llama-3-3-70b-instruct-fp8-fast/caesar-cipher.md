# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
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
          let code = option.unwrap_or(string.codepoint(c), 0) in
          string.from_codepoint(((code - 97 + shift) % 26) + 97)
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
          let code = option.unwrap_or(string.codepoint(c), 0) in
          string.from_codepoint(((code - 97 - shift + 26) % 26) + 97)
        else c
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
7 |           let code = option.unwrap_or(string.codepoint(c), 0) in
  |           ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:20:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
20 |           let code = option.unwrap_or(string.codepoint(c), 0) in
   |           ^^^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text), 
      (c) => 
        if string.is_lower(c) then
          string.from_codepoint(((option.unwrap_or(string.codepoint(c), 0) - 97 + shift) % 26) + 97)
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
          string.from_codepoint(((option.unwrap_or(string.codepoint(c), 0) - 97 - shift + 26) % 26) + 97)
        else c
    ), 
    ""
  )
```
