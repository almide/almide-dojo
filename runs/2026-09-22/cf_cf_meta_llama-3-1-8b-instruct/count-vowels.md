# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn count_vowels(s: String) -> Int = {
  let chars = string.chars(s)
  list.count(chars, (c: String) => list.contains(string.chars("aeiou"), c))
}
```
