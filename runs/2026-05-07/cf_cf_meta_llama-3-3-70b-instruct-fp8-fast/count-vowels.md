# count-vowels

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn count_vowels(s: String) -> Int =
  let chars = string.chars(s)
  let vowels = ['a', 'e', 'i', 'o', 'u']
  list.count(chars, (x) => list.contains(vowels, x))
```
