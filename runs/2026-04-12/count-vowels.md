# count-vowels

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 1

## Final code

```almide
fn count_vowels(s: String) -> Int =
  list.count(string.chars(s), (c) => c == "a" or c == "e" or c == "i" or c == "o" or c == "u")
```
