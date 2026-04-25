# anagram-check

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let a_chars = list.filter(string.chars(string.to_lower(a)), (x) => x != " ")
    let b_chars = list.filter(string.chars(string.to_lower(b)), (x) => x != " ")
    in list.sort(a_chars) == list.sort(b_chars)
```
