# partition-list

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0

## Final code

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) =
  list.fold(xs, ([], []), (acc, x) =>
    if predicate(x)
    then ((acc.0 + [x]), acc.1)
    else (acc.0, acc.1 + [x])
  )
```
