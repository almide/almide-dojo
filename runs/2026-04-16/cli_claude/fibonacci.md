# fibonacci

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn fib_helper(n: Int, a: Int, b: Int) -> Int =
  if n == 0 then a
  else fib_helper(n - 1, b, a + b)

fn fibonacci(n: Int) -> Int = fib_helper(n, 0, 1)
```
