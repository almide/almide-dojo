# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String {
  let (thousands, hundreds, tens, ones) = (n / 1000, (n % 1000) / 100, (n % 100) / 10, n % 10)
  let roman = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I")
  ]
  let result = roman
    .iter()
    .filter(|&(value, _)| value <= thousands || (value <= hundreds && thousands == 0) || (value <= tens && hundreds == 0 && thousands == 0) || value <= ones)
    .map(|&(value, symbol)| (thousands / value) * symbol)
    .collect::<String>()
  if result.len() > 0 && result.chars().last().unwrap() == 'I' {
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Missing '=' before function body at line 1:31
  --> /tmp/dojo-roman-numeral-0.almd:1:31
  hint: Almide requires '=' before the body. Write: fn to_roman(...) -> Type = { ... }

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (thousands, hundreds, tens, ones) = (n / 1000, (n % 1000) / 100, (n % 100) / 10, n % 10)
  let roman = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I")
  ]
  let result = roman
    .iter()
    .filter(|&(value, _)| value <= thousands || (value <= hundreds && thousands == 0) || (value <= tens && hundreds == 0 && thousands == 0) || value <= ones)
    .map(|&(value, symbol)| (thousands / value) * symbol)
    .collect::<String>()
  if result.len() > 0 && result.chars().last().unwrap() == 'I' {
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected expression at line 19:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-1.almd:19:5
error: Expected '}' to close block opened at line 1:33
  --> /tmp/dojo-roman-numeral-1.almd:20:14
  hint: Add '}' or check for a missing delimiter inside the block

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (thousands, hundreds, tens, ones) = (n / 1000, (n % 1000) / 100, (n % 100) / 10, n % 10)
  let roman = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I")
  ]
  let result = roman
    .iter()
    .filter(|&(value, _)| value <= thousands || (value <= hundreds && thousands == 0) || (value <= tens && hundreds == 0 && thousands == 0) || value <= ones)
    .map(|&(value, symbol)| (thousands / value) * symbol)
    .collect::<String>()
  if result.len() > 0 && result.chars().last().unwrap() == 'I' {
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 19:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-2.almd:19:5
error: Expected '}' to close block opened at line 1:33
  --> /tmp/dojo-roman-numeral-2.almd:20:14
  hint: Add '}' or check for a missing delimiter inside the block

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (thousands, hundreds, tens, ones) = (n / 1000, (n % 1000) / 100, (n % 100) / 10, n % 10)
  let roman = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I")
  ]
  let result = roman
    .iter()
    .filter(|&(value, _)| value <= thousands || (value <= hundreds && thousands == 0) || (value <= tens && hundreds == 0 && thousands == 0) || value <= ones)
    .map(|&(value, symbol)| (thousands / value) * symbol)
    .collect::<String>()
  if result.len() > 0 && result.chars().last().unwrap() == 'I' {
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 19:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-3.almd:19:5
error: Expected '}' to close block opened at line 1:33
  --> /tmp/dojo-roman-numeral-3.almd:20:14
  hint: Add '}' or check for a missing delimiter inside the block

```
