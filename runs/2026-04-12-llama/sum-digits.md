# sum-digits

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1

## Final code

```almide
fn sum_digits(n: Int) -> Int = {
    var abs_n = int.abs(n);
    var sum = 0;
    var num = abs_n;
    while num > 0 {
        sum = sum + (num % 10);
        num = num / 10;
    }
    sum
}
```
