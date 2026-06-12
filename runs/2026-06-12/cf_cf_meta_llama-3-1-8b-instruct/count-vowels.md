# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn count_vowels(s: String) -> Int = 
  list.count(string.chars(s), (c) => list.contains(["a", "e", "i", "o", "u"], c))
```
