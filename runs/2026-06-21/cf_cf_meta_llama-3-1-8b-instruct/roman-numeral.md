# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String {
  let (thousands, remainder) = (n / 1000, n % 1000)
  let (hundreds, remainder) = (remainder / 100, remainder % 100)
  let (tens, remainder) = (remainder / 10, remainder % 10)
  let (ones, _) = (remainder / 1, remainder % 1)

  let roman_values = [
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
    (1, "I"),
  ]

  let result = (
    (if thousands > 0 { string.repeat("M", thousands) } else { "" })
    + (if hundreds > 0 { string.repeat("C", hundreds) } else { "" })
      + (if tens > 0 { string.repeat("X", tens) } else {
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Missing '=' before function body at line 1:31
  --> /tmp/dojo-roman-numeral-0.almd:1:31
  hint: Almide requires '=' before the body. Write: fn to_roman(...) -> Type = { ... }
  |
1 | fn to_roman(n: Int) -> String {
  |                               ^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (thousands, remainder) = (n / 1000, n % 1000)
  let (hundreds, remainder) = (remainder / 100, remainder % 100)
  let (tens, remainder) = (remainder / 10, remainder % 10)
  let (ones, _) = (remainder / 1, remainder % 1)

  let roman_values = [
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
    (1, "I"),
  ]

  let result = (
    (if thousands > 0 { string.repeat("M", thousands) } else { "" })
    + (if hundreds > 0 { string.repeat("C", hundreds) } else { "" })
      + (if tens > 0 { string.repeat("X", tens) } else
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected expression at line 23:17 (got Newline '')
  --> /tmp/dojo-roman-numeral-1.almd:23:17
   |
23 |   let result = (
   |                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:57 (got Else 'else')
  --> /tmp/dojo-roman-numeral-1.almd:24:57
   |
24 |     (if thousands > 0 { string.repeat("M", thousands) } else { "" })
   |                                                         ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:20:9
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
20 |     (1, "I"),
   |         ^^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (thousands, remainder) = (n / 1000, n % 1000)
  let (hundreds, remainder) = (remainder / 100, remainder % 100)
  let (tens, remainder) = (remainder / 10, remainder % 10)
  let (ones, _) = (remainder / 1, remainder % 1)

  let roman_values = [
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
    (1, "I"),
  ]

  let result = (
    (if thousands > 0 { string.repeat("M", thousands) } else { "" })
    + (if hundreds > 0 { string.repeat("C", hundreds) } else { "" })
    + (if tens > 0 { string.repeat("X", tens) } else
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 23:17 (got Newline '')
  --> /tmp/dojo-roman-numeral-2.almd:23:17
   |
23 |   let result = (
   |                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:57 (got Else 'else')
  --> /tmp/dojo-roman-numeral-2.almd:24:57
   |
24 |     (if thousands > 0 { string.repeat("M", thousands) } else { "" })
   |                                                         ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:20:9
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
20 |     (1, "I"),
   |         ^^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (thousands, remainder) = (n / 1000, n % 1000)
  let (hundreds, remainder) = (remainder / 100, remainder % 100)
  let (tens, remainder) = (remainder / 10, remainder % 10)
  let (ones, _) = (remainder / 1, remainder % 1)

  let roman_values = [
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
    (1, "I"),
  ]

  let result = (
    (if thousands > 0 { string.repeat("M", thousands) } else { "" })
    + (if hundreds > 0 { string.repeat("C", hundreds) } else { "" })
    + (if tens > 0 { string.repeat("X", tens) } else
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 23:17 (got Newline '')
  --> /tmp/dojo-roman-numeral-3.almd:23:17
   |
23 |   let result = (
   |                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:57 (got Else 'else')
  --> /tmp/dojo-roman-numeral-3.almd:24:57
   |
24 |     (if thousands > 0 { string.repeat("M", thousands) } else { "" })
   |                                                         ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:20:9
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
20 |     (1, "I"),
   |         ^^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
