# remove-duplicates

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn remove_duplicates(xs: List[Int]) -> List[Int] = 
    list.fold(xs, [], (acc, x) => 
        if list.contains(acc, x) then acc 
        else acc + [x])
```
