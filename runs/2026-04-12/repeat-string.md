# repeat-string

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1

## Final code

```almide
fn repeat(s: String, n: Int) -> String = 
  if n == 0 then "" 
  else if n == 1 then s 
  else s + repeat(s, n - 1)
```
