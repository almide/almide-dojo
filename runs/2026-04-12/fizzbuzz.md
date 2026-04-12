# fizzbuzz

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0

## Final code

```almide
fn fizzbuzz(n: Int) -> String = 
  match (n % 3 == 0, n % 5 == 0) {
    (true, true) => "FizzBuzz",
    (true, false) => "Fizz",
    (false, true) => "Buzz",
    (false, false) => int.to_string(n)
  }
```
