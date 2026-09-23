# roman-numeral

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **state**: `measured`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn to_roman(n: Int) -> String =
  let thousands = ["", "M", "MM", "MMM"]
  let hundreds = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
  let tens = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
  let ones = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
  let rem = n % 1000
  let rem2 = rem % 100
  let th = option.unwrap_or(list.get(thousands, n / 1000), "")
  let h = option.unwrap_or(list.get(hundreds, rem / 100), "")
  let t = option.unwrap_or(list.get(tens, rem2 / 10), "")
  let o = option.unwrap_or(list.get(ones, rem2 % 10), "")
  th + h + t + o
```
