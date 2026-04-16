# clamp

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn clamp(value: Int, low: Int, high: Int) -> Int =
  if value < low
  then low
  else if value > high
  then high
  else value
```
