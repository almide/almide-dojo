# gcd

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn gcd(a: Int, b: Int) -> Int = if b == 0 then a else gcd(b, a - (a / b) * b)
```
