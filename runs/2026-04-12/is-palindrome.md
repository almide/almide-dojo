# is-palindrome

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 1

## Final code

```almide
fn is_palindrome(s: String) -> Bool = {
  let cs = string.chars(s);
  cs == list.reverse(cs)
}

```
