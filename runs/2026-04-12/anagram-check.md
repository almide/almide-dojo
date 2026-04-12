# anagram-check

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 1

## Final code

```almide
fn is_anagram(a: String, b: String) -> Bool =
  list.sort(list.filter(string.chars(string.to_lower(a)), (c) => c != " ")) == list.sort(list.filter(string.chars(string.to_lower(b)), (c) => c != " "))
```
