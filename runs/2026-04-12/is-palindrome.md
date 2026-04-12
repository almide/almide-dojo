# is-palindrome

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0

## Final code

```almide
fn is_palindrome(s: String) -> Bool =
  s == string.reverse(s)
```
