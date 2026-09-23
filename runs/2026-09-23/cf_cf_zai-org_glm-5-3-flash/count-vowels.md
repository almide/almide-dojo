# count-vowels

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **state**: `measured`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn count_vowels(s: String) -> Int =
  list.count(string.chars(s), (c) => list.contains(["a", "e", "i", "o", "u"], c))
```
