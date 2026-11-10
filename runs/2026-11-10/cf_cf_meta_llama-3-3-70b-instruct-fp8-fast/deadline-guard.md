# deadline-guard

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
effect fn within_deadline(n: Int) -> Int = 
  fan.timeout(duration.s(2)) { 
    compute_work(n) 
  } ?? 0

fn compute_work(n: Int) -> Int = 
  n * n + 1
```
