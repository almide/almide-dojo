# fizzbuzz

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 0

## Final code

```almide
fn fizzbuzz(n: Int) -> String = match (n % 15, n % 3, n % 5) {
  (0, _, _) => "FizzBuzz",
  (_, 0, _) => "Fizz",
  (_, _, 0) => "Buzz",
  _ => int.to_string(n)
}

```
