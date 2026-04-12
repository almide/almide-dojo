# caesar-cipher

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 2

## Final code

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.chars(text).map((c) =>
    match string.codepoint(c) {
      some(cp) =>
        if cp >= 97 and cp <= 122 then
          string.from_codepoint(((cp - 97 + shift) % 26) + 97)
        else
          c,
      none => c
    }
  ).fold("", (acc, c) => acc + c)

fn decrypt(text: String, shift: Int) -> String =
  string.chars(text).map((c) =>
    match string.codepoint(c) {
      some(cp) =>
        if cp >= 97 and cp <= 122 then
          string.from_codepoint(((cp - 97 - shift % 26 + 26) % 26) + 97)
        else
          c,
      none => c
    }
  ).fold("", (acc, c) => acc + c)
```
