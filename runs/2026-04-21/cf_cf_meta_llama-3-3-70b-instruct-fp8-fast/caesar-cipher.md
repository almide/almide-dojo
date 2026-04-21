# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(
      string.chars(text),
      (c) =>
        if string.is_lower(c) then
          string.from_codepoint(
            ((string.codepoint(c) |> option.unwrap_or(0) - 97 + shift) % 26) + 97
          )
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
          string.from_codepoint(
            ((string.codepoint(c) |> option.unwrap_or(0) - 97 - shift + 26) % 26) + 97
          )
        else c
    ),
    ""
  )
```
