# anagram-check

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1

## Final code

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let a_lower = string.to_lower(a);
    let b_lower = string.to_lower(b);
    let a_chars = list.filter(string.chars(a_lower), (c) => c != ' ');
    let b_chars = list.filter(string.chars(b_lower), (c) => c != ' ');
    list.sort(a_chars) == list.sort(b_chars)
```
