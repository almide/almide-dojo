# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) 
  then none 
  else 
    match list.reduce(xs, (a, b) => if a > b then a else b) 
    { 
      some(x) => some(x), 
      none => none 
    }
```
