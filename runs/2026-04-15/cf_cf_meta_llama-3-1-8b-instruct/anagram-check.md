# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let a = string.to_lower(a)
  let b = string.to_lower(b)
  let a_chars = list.filter(string.chars(a), (c) => c != ' ')
  let b_chars = list.filter(string.chars(b), (c) => c != ' ')
  list.sort(a_chars) == list.sort(b_chars)
```
