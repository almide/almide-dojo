# repeat-string

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0

## Attempts

### Attempt 1 (PASS)

```almide
fn repeat(s: String, n: Int) -> String = 
  if n == 0 then "" else s + repeat(s, n - 1)
```
