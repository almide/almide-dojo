# factorial

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn factorial(n: Int) -> Int = 
  if n == 0 
  then 1 
  else n * factorial(n - 1)
```
