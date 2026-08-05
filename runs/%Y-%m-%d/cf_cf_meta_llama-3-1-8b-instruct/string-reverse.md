# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  let reversed = list.reverse(chars)
  string.join(reversed, "")
```
