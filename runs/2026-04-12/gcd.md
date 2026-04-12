# gcd

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 0

## Final code

```almide
fn gcd(a: Int, b: Int) -> Int =
  if b == 0 then a else gcd(b, a % b)
```
