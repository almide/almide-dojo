# deadline-guard

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
effect fn within_deadline(n: Int) -> Int = {
  fan.timeout(duration.s(2)) {
    square(n) + 1
  } ?? 0
}

fn square(n: Int) -> Int = n * n
```
