# anagram-check

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  list.sort(list.filter(string.chars(string.to_lower(a)), (c) => c != " ")) ==
  list.sort(list.filter(string.chars(string.to_lower(b)), (c) => c != " "))
```
