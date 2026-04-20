# fibonacci

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn fibonacci(n: Int) -> Int = 
  if n <= 1 then n else fibonacci(n - 1) + fibonacci(n - 2)
```
