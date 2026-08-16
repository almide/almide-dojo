# caesar-cipher

- **model**: `cli:claude`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn shift_char(c: String, shift: Int) -> String =
  let cp = string.codepoint(c) |> option.unwrap_or(0)
  if cp >= 97 && cp <= 122 then
    string.from_codepoint(97 + ((cp - 97 + (shift % 26) + 26) % 26))
  else
    c

fn encrypt(text: String, shift: Int) -> String =
  string.chars(text)
    |> list.map((c) => shift_char(c, shift % 26))
    |> string.join("")

fn decrypt(text: String, shift: Int) -> String =
  string.chars(text)
    |> list.map((c) => shift_char(c, 26 - (shift % 26)))
    |> string.join("")
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 3:15
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-caesar-cipher-0.almd:3:15
  here: if cp >= 97 && cp <= 122 then
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
3 |   if cp >= 97 && cp <= 122 then
  |               ^
error: Expected expression at line 5:3 (got Else 'else')
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-caesar-cipher-0.almd:5:3
  here: else
  |
5 |   else
  |   ^

2 error(s) found
FAILED: /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-caesar-cipher-0.almd
Compile error for /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-caesar-cipher-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn shift_char(c: String, shift: Int) -> String =
  let cp = string.codepoint(c) |> option.unwrap_or(0)
  if cp >= 97 and cp <= 122 then
    string.from_codepoint(97 + ((cp - 97 + (shift % 26) + 26) % 26))
  else
    c

fn encrypt(text: String, shift: Int) -> String =
  string.chars(text)
    |> list.map((c) => shift_char(c, shift % 26))
    |> string.join("")

fn decrypt(text: String, shift: Int) -> String =
  string.chars(text)
    |> list.map((c) => shift_char(c, 26 - (shift % 26)))
    |> string.join("")
```
