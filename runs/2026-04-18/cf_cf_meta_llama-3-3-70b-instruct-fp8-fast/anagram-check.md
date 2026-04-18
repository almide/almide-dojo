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
  let a_chars = list.filter(string.chars(a_lower), (x) => not string.is_whitespace(x))
  let b_chars = list.filter(string.chars(b_lower), (x) => not string.is_whitespace(x))
  list.sort(a_chars) == list.sort(b_chars)
```
