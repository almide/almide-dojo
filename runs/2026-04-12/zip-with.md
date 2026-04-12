# zip-with

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 0

## Final code

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  list.zip(xs, ys).map((pair) => f(pair.0, pair.1))
```
