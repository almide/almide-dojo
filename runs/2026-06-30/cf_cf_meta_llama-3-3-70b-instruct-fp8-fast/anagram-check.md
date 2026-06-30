# anagram-check

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let a_lower = string.to_lower(a)
  let b_lower = string.to_lower(b)
  let a_chars = string.chars(a_lower) |> list.filter((x) => x != " ")
  let b_chars = string.chars(b_lower) |> list.filter((x) => x != " ")
  let a_sorted = list.sort(a_chars)
  let b_sorted = list.sort(b_chars)
  a_sorted == b_sorted
```
