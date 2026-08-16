# fibonacci

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn fibonacci(n: Int) -> Int =
  if n < 2 then n
  else
    list.range(0, n)
      |> list.fold((0, 1), (acc, _) => (acc.1, acc.0 + acc.1))
      |> (p) => p.0
```
