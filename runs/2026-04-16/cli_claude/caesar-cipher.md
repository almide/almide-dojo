# caesar-cipher

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn shift_char(c: String, shift: Int) -> String = match string.codepoint(c) {
  some(n) => if n >= 97 then if n <= 122 then string.from_codepoint(97 + (((n - 97) + shift) % 26 + 26) % 26) else c else c,
  none => c
}

fn encrypt(text: String, shift: Int) -> String =
  string.chars(text)
  |> list.map((c) => shift_char(c, ((shift % 26) + 26) % 26))
  |> list.join("")

fn decrypt(text: String, shift: Int) -> String =
  string.chars(text)
  |> list.map((c) => shift_char(c, ((-shift % 26) + 26) % 26))
  |> list.join("")
```
