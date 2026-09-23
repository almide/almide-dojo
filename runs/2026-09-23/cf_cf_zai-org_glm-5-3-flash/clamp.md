# clamp

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **state**: `measured`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn clamp(value: Int, low: Int, high: Int) -> Int =
  if value < low then low else if value > high then high else value
```
