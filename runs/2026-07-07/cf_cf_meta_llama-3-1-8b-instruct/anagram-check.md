# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let lower_a = string.to_lower(a)
  let lower_b = string.to_lower(b)
  let a_chars = string.chars(lower_a)
  let b_chars = string.chars(lower_b)
  let a_no_spaces = list.filter(a_chars, (x) => not (string.is_whitespace(x)))
  let b_no_spaces = list.filter(b_chars, (x) => not (string.is_whitespace(x)))
  list.sort(a_no_spaces) == list.sort(b_no_spaces)
```
