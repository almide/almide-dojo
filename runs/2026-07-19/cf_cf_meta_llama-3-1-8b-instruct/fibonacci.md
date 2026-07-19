# fibonacci

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn fibonacci(n: Int) -> Int = 
  match n {
    0 => 0
    1 => 1
    _ => fibonacci(n - 1) + fibonacci(n - 2)
  }
```
