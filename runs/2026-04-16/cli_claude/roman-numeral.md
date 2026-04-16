# roman-numeral

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn roman_build(n: Int, pairs: List[(Int, String)]) -> String =
  match list.first(pairs) {
    none => "",
    some(pair) => {
      let (v, s) = pair
      if n >= v then
        s + roman_build(n - v, pairs)
      else
        roman_build(n, list.drop(pairs, 1))
    }
  }

fn to_roman(n: Int) -> String =
  let pairs = [
    (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"),
    (100, "C"), (90, "XC"), (50, "L"), (40, "XL"),
    (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
  ]
  roman_build(n, pairs)
```
