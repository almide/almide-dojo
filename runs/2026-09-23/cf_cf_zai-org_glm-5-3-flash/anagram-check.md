# anagram-check

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **state**: `measured`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let ca = string.to_lower(a) |> string.chars |> list.filter((c) => c != " ") |> list.sort
  let cb = string.to_lower(b) |> string.chars |> list.filter((c) => c != " ") |> list.sort
  ca == cb
```
