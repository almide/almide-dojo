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
  string.join(list.map(string.to_list(text), (c) => 
    if string.is_lower(c) then 
      string.from_codepoint((string.to_codepoint(c) ?? 0 - 97 + shift) % 26 + 97) ?? ""
    else 
      c
  ))

fn decrypt(text: String, shift: Int) -> String = 
  string.join(list.map(string.to_list(text), (c) => 
    if string.is_lower(c) then 
      string.from_codepoint((string.to_codepoint(c) ?? 0 - 97 - shift + 26) % 26 + 97) ?? ""
    else 
      c
  ))
```

**Diagnostic:**

```
error[E002]: undefined function 'string.join'
  --> /tmp/dojo-caesar-cipher-0.almd:2:3
  in call to string.join()
  here: string.join(list.map(string.to_list(text), (c) =>
  hint: `string.join` was removed at dialect epoch 15: rewrite as `list.join(xs, sep)`: the list is the receiver (R-string-01)
  |
2 |   string.join(list.map(string.to_list(text), (c) =>
  |   ^^^^^^^^^^^
error[E002]: undefined function 'string.join'
  --> /tmp/dojo-caesar-cipher-0.almd:10:3
  in call to string.join()
  here: string.join(list.map(string.to_list(text), (c) =>
  hint: `string.join` was removed at dialect epoch 15: rewrite as `list.join(xs, sep)`: the list is the receiver (R-string-01)
   |
10 |   string.join(list.map(string.to_list(text), (c) =>
   |   ^^^^^^^^^^^

2 error(s) found
FAILED: /tmp/dojo-caesar-cipher-0.almd
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  list.join(list.map(string.to_list(text), (c) => 
    if string.is_lower(c) then 
      string.from_codepoint((string.to_codepoint(c) ?? 0 - 97 + shift) % 26 + 97) ?? ""
    else 
      c
  ), "")

fn decrypt(text: String, shift: Int) -> String = 
  list.join(list.map(string.to_list(text), (c) => 
    if string.is_lower(c) then 
      string.from_codepoint((string.to_codepoint(c) ?? 0 - 97 - shift + 26) % 26 + 97) ?? ""
    else 
      c
  ), "")
```
