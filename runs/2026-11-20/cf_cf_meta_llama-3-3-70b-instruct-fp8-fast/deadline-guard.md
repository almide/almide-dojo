# deadline-guard

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn compute(n: Int) -> Int = n * n + 1

effect fn within_deadline(n: Int) -> Int = 
  fan.timeout(duration.s(2)) { 
    compute(n) 
  } ?? 0
```
