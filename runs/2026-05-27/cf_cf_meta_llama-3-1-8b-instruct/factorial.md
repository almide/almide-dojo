# factorial

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn factorial(n: Int) -> Int = 
  match n {
    0 => 1
    _ => n * factorial(n - 1)
  }
```
