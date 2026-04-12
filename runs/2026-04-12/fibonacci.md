# fibonacci

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 0

## Final code

```almide
fn fibonacci(n: Int) -> Int =
  if n == 0 then 0
  else if n == 1 then 1
  else fibonacci(n - 1) + fibonacci(n - 2)
```
