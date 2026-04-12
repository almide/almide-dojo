# clamp

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 0

## Final code

```almide
fn clamp(value: Int, low: Int, high: Int) -> Int =
  match true {
    _ if value < low => low,
    _ if value > high => high,
    _ => value,
  }
```
