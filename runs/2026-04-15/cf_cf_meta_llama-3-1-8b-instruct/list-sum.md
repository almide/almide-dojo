# list-sum

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn list_sum(xs: List[Int]) -> Int = xs.fold(0, (acc, x) => acc + x)
```
