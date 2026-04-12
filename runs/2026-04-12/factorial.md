# factorial

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 0

## Final code

```almide
fn factorial(n: Int) -> Int =
  if n == 0 then 1 else n * factorial(n - 1)
```
