# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn reverse(s: String) -> String = 
  let xs = string.to_list(s)
  let ys = list.reverse(xs)
  string.from_list(ys)
```
