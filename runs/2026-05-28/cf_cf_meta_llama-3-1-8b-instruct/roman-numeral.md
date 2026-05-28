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

  let symbols = [
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

  let result = symbols
    .filter(|(value, _)| value <= n)
    .map(|(value, symbol)| {
      let count = (n / value).min(3)
      (count, symbol)
    })
    .fold(String::new(), |acc, (count, symbol)| {
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

  let symbols = [
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

  let result = symbols
    .filter(|(value, _)| value < n)
    .map(|(value, symbol)| {
      let count = (n / value).min(3)
      (count, symbol)
    })
    .fold(String::new(), |acc, (count, symbol)|
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected expression at line 24:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-1.almd:24:5
   |
24 |     .filter(|(value, _)| value < n)
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 28:6 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:28:6
   |
28 |     })
   |      ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:26:24
  in variable value
  hint: Check the variable name
   |
26 |       let count = (n / value).min(3)
   |                        ^^^^^
error[E002]: undefined method 'min' on int
  --> /tmp/dojo-roman-numeral-1.almd:26:24
  in method call .min()
  hint: Almide doesn't use method-call syntax. Write `int.max(x)` (or `x |> int.max`). Method syntax `x.min()` is not supported.
  try:
      // x.min()  →  int.max(x)
      int.max(x)
   |
26 |       let count = (n / value).min(3)
   |                        ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:27:15
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
27 |       (count, symbol)
   |               ^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got (Unknown, Unknown)
  --> /tmp/dojo-roman-numeral-1.almd:27:15
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
   |
27 |       (count, symbol)
   |               ^^^^^^

6 error(s) found
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

  let symbols = [
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

  let result = symbols
    .filter(|(value, _)| value <= n)
    .map(|(value, symbol)| {
      let count = (n / value).min(3)
      (count, symbol)
    })
    .fold(String::new(), |acc, (count, symbol)|
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 24:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-2.almd:24:5
   |
24 |     .filter(|(value, _)| value <= n)
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 28:6 (got RParen ')')
  --> /tmp/dojo-roman-numeral-2.almd:28:6
   |
28 |     })
   |      ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:26:24
  in variable value
  hint: Check the variable name
   |
26 |       let count = (n / value).min(3)
   |                        ^^^^^
error[E002]: undefined method 'min' on int
  --> /tmp/dojo-roman-numeral-2.almd:26:24
  in method call .min()
  hint: Almide doesn't use method-call syntax. Write `int.max(x)` (or `x |> int.max`). Method syntax `x.min()` is not supported.
  try:
      // x.min()  →  int.max(x)
      int.max(x)
   |
26 |       let count = (n / value).min(3)
   |                        ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:27:15
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
27 |       (count, symbol)
   |               ^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got (Unknown, Unknown)
  --> /tmp/dojo-roman-numeral-2.almd:27:15
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
   |
27 |       (count, symbol)
   |               ^^^^^^

6 error(s) found
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

  let symbols = [
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

  let result = symbols
    .filter(|(value, _)| value <= n)
    .map(|(value, symbol)| {
      let count = (n / value).min(3)
      (count, symbol)
    })
    .fold(String::new(), |acc, (count, symbol)|
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 24:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-3.almd:24:5
   |
24 |     .filter(|(value, _)| value <= n)
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 28:6 (got RParen ')')
  --> /tmp/dojo-roman-numeral-3.almd:28:6
   |
28 |     })
   |      ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:26:24
  in variable value
  hint: Check the variable name
   |
26 |       let count = (n / value).min(3)
   |                        ^^^^^
error[E002]: undefined method 'min' on int
  --> /tmp/dojo-roman-numeral-3.almd:26:24
  in method call .min()
  hint: Almide doesn't use method-call syntax. Write `int.max(x)` (or `x |> int.max`). Method syntax `x.min()` is not supported.
  try:
      // x.min()  →  int.max(x)
      int.max(x)
   |
26 |       let count = (n / value).min(3)
   |                        ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:27:15
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
27 |       (count, symbol)
   |               ^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got (Unknown, Unknown)
  --> /tmp/dojo-roman-numeral-3.almd:27:15
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
   |
27 |       (count, symbol)
   |               ^^^^^^

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
