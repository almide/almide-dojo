# roman-numeral

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 1

## Final code

```almide
fn thousands(n: Int) -> String =
  if n >= 3000 then "MMM"
  else if n >= 2000 then "MM"
  else if n >= 1000 then "M"
  else ""

fn hundreds(n: Int) -> String =
  match (n / 100) % 10 {
    9 => "CM", 8 => "DCCC", 7 => "DCC", 6 => "DC",
    5 => "D", 4 => "CD", 3 => "CCC", 2 => "CC", 1 => "C", _ => ""
  }

fn tens(n: Int) -> String =
  match (n / 10) % 10 {
    9 => "XC", 8 => "LXXX", 7 => "LXX", 6 => "LX",
    5 => "L", 4 => "XL", 3 => "XXX", 2 => "XX", 1 => "X", _ => ""
  }

fn ones(n: Int) -> String =
  match n % 10 {
    9 => "IX", 8 => "VIII", 7 => "VII", 6 => "VI",
    5 => "V", 4 => "IV", 3 => "III", 2 => "II", 1 => "I", _ => ""
  }

fn to_roman(n: Int) -> String =
  thousands(n) + hundreds(n) + tens(n) + ones(n)
```
