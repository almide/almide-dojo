# is-palindrome

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn is_palindrome(s: String) -> Bool = 
  string.chars(s) == string.chars(s) |> list.reverse
```
