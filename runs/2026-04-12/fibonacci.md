# fibonacci

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1

## Final code

```almide
fn fibonacci(n: Int) -> Int = 
  if n == 0 then 0
  else if n == 1 then 1
  else fibonacci(n - 1) + fibonacci(n - 2)
```
