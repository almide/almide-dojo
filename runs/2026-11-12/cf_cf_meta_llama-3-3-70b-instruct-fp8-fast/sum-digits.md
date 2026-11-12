# sum-digits

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  let abs_n = int.abs(n)
  in list.fold(
    list.map(
      list.range(0, int.to_string(abs_n) |> string.len),
      (i) => int.parse(string.get(int.to_string(abs_n), i) ?? "") |> result.unwrap_or_else((_) => 0)
    ),
    0,
    (acc, x) => acc + x
  )
```
