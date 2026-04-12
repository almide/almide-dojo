# clamp

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 0

## Final code

```almide
fn clamp(value: Int, low: Int, high: Int) -> Int =
  if value < low then low
  else if value > high then high
  else value
```
