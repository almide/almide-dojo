# factorial

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn factorial(n: Int) -> Int = 
  if n == 0 then 1
  else n * factorial(n - 1)
```
