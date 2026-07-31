# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let lower_a = string.to_lower(a)
  let lower_b = string.to_lower(b)
  let chars_a = list.filter(string.chars(lower_a), (x) => x != " ")
  let chars_b = list.filter(string.chars(lower_b), (x) => x != " ")
  list.sort(chars_a) == list.sort(chars_b)
}
```
