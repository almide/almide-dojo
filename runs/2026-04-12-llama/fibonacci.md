# fibonacci

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0

## Final code

```almide
fn fibonacci(n: Int) -> Int = 
  match n {
    0 => 0,
    1 => 1,
    _ => fibonacci(n - 1) + fibonacci(n - 2)
  }
```
