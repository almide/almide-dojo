# count-vowels

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1

## Final code

```almide
fn count_vowels(s: String) -> Int = 
  list.count(
    string.chars(s), 
    (c) => c == "a" or c == "e" or c == "i" or c == "o" or c == "u"
  )
```
