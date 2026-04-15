# fizzbuzz

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn fizzbuzz(n: Int) -> String = 
  if n % 15 == 0 then "FizzBuzz" 
  else if n % 3 == 0 then "Fizz" 
  else if n % 5 == 0 then "Buzz" 
  else int.to_string(n)
```
