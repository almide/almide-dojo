# caesar-cipher

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **state**: `measured`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn shift_char(c: String, shift: Int) -> String =
  match string.codepoint(c) {
    some(cp) =>
      if cp >= 97 then
        if cp <= 122 then
          string.from_codepoint(97 + ((cp - 97 + shift) % 26))
        else
          c
      else
        c
    none => c
  }

fn encrypt(text: String, shift: Int) -> String =
  string.join(list.map(string.chars(text), (c) => shift_char(c, shift)), "")

fn decrypt(text: String, shift: Int) -> String =
  encrypt(text, (26 - (shift % 26)) % 26)
```
