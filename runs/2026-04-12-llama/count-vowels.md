# count-vowels

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2

## Final code

```almide
fn count_vowels(s: String) -> Int = 
    list.count(string.chars(s), (c) => match c {
        "a" => true,
        "e" => true,
        "i" => true,
        "o" => true,
        "u" => true,
        _ => false
    })
```
