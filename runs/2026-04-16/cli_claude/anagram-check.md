# anagram-check

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let na = string.chars(string.to_lower(a)) |> list.filter((c) => c != " ") |> list.sort
  let nb = string.chars(string.to_lower(b)) |> list.filter((c) => c != " ") |> list.sort
  na == nb
```
