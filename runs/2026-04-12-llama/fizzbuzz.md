# fizzbuzz

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 0

## Final code

```almide
fn fizzbuzz(n: Int) -> String =
  if n % 15 == 0 then "FizzBuzz"
  else if n % 3 == 0 then "Fizz"
  else if n % 5 == 0 then "Buzz"
  else int.to_string(n)
```
