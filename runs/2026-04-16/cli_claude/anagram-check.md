# anagram-check

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn normalize(s: String) -> List[String] = list.sort(list.filter(string.chars(string.to_lower(s)), (c) => c != " "))

fn is_anagram(a: String, b: String) -> Bool = normalize(a) == normalize(b)
```
