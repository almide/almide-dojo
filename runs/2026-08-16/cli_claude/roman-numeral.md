# roman-numeral

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn roman_pairs() -> List[(Int, String)] = [
  (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"),
  (100, "C"), (90, "XC"), (50, "L"), (40, "XL"),
  (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
]

fn roman_step(n: Int, val: Int, sym: String, acc: String) -> (Int, String) =
  if n >= val then roman_step(n - val, val, sym, acc + sym) else (n, acc)

fn to_roman(n: Int) -> String =
  list.fold(roman_pairs(), (n, ""), (acc, pair) => roman_step(acc.0, pair.0, pair.1, acc.1)).1
```
