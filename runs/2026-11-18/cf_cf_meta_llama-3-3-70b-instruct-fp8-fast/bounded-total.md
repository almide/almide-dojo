# bounded-total

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
effect fn safe_total(xs: List[Int]) -> Int = 
  fan.bounded(compute.ms(100)) { 
    sum_list(xs, 0, list.len(xs)) 
  } ?? -1

fn sum_list(xs: List[Int], acc: Int, i: Int) -> Int = 
  if i == 0 then acc 
  else sum_list(xs, acc + list.get(xs, i - 1) ?? 0, i - 1)
```
