# anagram-check

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let lower_a = string.to_lower(a)
  let lower_b = string.to_lower(b)
  let chars_a = string.chars(lower_a) |> list.filter((x) => not string.is_whitespace(x))
  let chars_b = string.chars(lower_b) |> list.filter((x) => not string.is_whitespace(x))
  list.sort(chars_a) == list.sort(chars_b)
```
