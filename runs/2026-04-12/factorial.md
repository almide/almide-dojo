# factorial

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 0

## Final code

```almide
fn factorial(n: Int) -> Int =
  match n {
    0 => 1,
    _ => n * factorial(n - 1),
  }

```
