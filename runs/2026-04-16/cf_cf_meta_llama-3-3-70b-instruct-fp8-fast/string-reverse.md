# string-reverse

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn reverse(s: String) -> String = 
  list.fold(string.chars(s), "", (acc, ch) => ch + acc)
```
