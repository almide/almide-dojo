# sum-digits

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 2

## Final code

```almide
fn sum_digits(n: Int) -> Int = {
  var remaining = int.abs(n)
  var acc = 0
  while remaining > 0 {
    acc = acc + remaining % 10
    remaining = remaining / 10
  }
  acc
}
```
