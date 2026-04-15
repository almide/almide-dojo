# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let a_chars = string.to_lower(a) |> string.chars |> list.filter((c) => c != ' ')
  let b_chars = string.to_lower(b) |> string.chars |> list.filter((c) => c != ' ')
  list.sort(a_chars) == list.sort(b_chars)
```
