# binary-search

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 1

## Final code

```almide
fn binary_search_loop(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] =
  let mid = lo + (hi - lo) / 2
  let val = option.unwrap_or(list.get(xs, mid), target + 1)
  if lo > hi then
    none
  else if val == target then
    some(mid)
  else if val < target then
    binary_search_loop(xs, target, mid + 1, hi)
  else
    binary_search_loop(xs, target, lo, mid - 1)

fn binary_search(xs: List[Int], target: Int) -> Option[Int] =
  binary_search_loop(xs, target, 0, list.len(xs) - 1)
```
