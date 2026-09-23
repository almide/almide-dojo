# anagram-check

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **state**: `measured`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool =
  let norm = (s) => list.filter(string.chars(string.to_lower(s)), (c) => c != " ")
  list.sort(norm(a)) == list.sort(norm(b))
```
