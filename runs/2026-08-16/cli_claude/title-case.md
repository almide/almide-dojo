# title-case

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn title_case(s: String) -> String =
  if string.is_empty(s) then
    ""
  else
    string.split(s, " ")
      |> list.map((word) => string.capitalize(string.to_lower(word)))
      |> string.join(" ")
```
