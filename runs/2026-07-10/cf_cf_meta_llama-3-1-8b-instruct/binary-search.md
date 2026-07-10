# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  match list.binary_search(xs, target) {
    some(i) => some(i)
    none => none
  }
}
```
