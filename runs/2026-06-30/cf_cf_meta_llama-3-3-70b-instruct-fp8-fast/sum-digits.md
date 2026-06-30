# sum-digits

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  let abs_n = int.abs(n)
  in list.fold(list.map(list.range(0, int.to_string(abs_n) |> string.len), (i) => int.parse(string.slice(int.to_string(abs_n), i, i + 1)) |> result.unwrap_or(0)), 0, (acc, x) => acc + x)
```
