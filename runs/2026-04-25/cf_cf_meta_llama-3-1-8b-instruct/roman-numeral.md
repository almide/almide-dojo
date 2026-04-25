# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String {
  let (m, d) = (n / 1000, n % 1000)
  let (c, x) = (d / 100, d % 100)
  let (l, i) = (x / 10, x % 10)
  let (v, x) = (x % 10, x % 10)

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
    .map(|(value, symbol)| {
      let count = (m * value) / n
      (count, symbol)
    })
    .filter(|(count, _)| count > 0)
    .map(|(count, symbol)| {
      let symbol = symbol.repeat(count)
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
  let (m, d) = (n / 1000, n % 1000)
  let (c, x) = (d / 100, d % 100)
  let (l, i) = (x / 10, x % 10)
  let (v, x) = (x % 10, x % 10)

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
    .map(|(value, symbol)| {
      let count = (m * value) / n
      (count, symbol)
    })
    .filter(|(count, _)| count > 0)
    .map(|(count, symbol)| {
      let symbol = symbol.repeat(count
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected expression at line 24:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-1.almd:24:5
   |
24 |     .map(|(value, symbol)| {
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 27:6 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:27:6
   |
27 |     })
   |      ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:25:24
  in variable value
  hint: Check the variable name
   |
25 |       let count = (m * value) / n
   |                        ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:26:15
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
26 |       (count, symbol)
   |               ^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got (Int, Unknown)
  --> /tmp/dojo-roman-numeral-1.almd:26:15
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
   |
26 |       (count, symbol)
   |               ^^^^^^

5 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (m, d) = (n / 1000, n % 1000)
  let (c, x) = (d / 100, d % 100)
  let (l, i) = (x / 10, x % 10)

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
    .map(|(value, symbol)| {
      let count = (m * value) / n
      if count > 0 {
        symbol.repeat(count) + result
      } else {
        result
      }
    })
    .filter(|s| s != "")
    .join("")

  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 23:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-2.almd:23:5
   |
23 |     .map(|(value, symbol)| {
   |     ^
error: Expected Then at line 25:20 (got LBrace '{')
  --> /tmp/dojo-roman-numeral-2.almd:25:20
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
25 |       if count > 0 {
   |                    ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 27:9 (got Else 'else')
  --> /tmp/dojo-roman-numeral-2.almd:27:9
   |
27 |       } else {
   |         ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:24:24
  in variable value
  hint: Check the variable name
   |
24 |       let count = (m * value) / n
   |                        ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:26:9
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
26 |         symbol.repeat(count) + result
   |         ^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got List[(Int, String)]
  --> /tmp/dojo-roman-numeral-2.almd:26:32
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
   |
26 |         symbol.repeat(count) + result
   |                                ^^^^^^

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (m, d) = (n / 1000, n % 1000)
  let (c, x) = (d / 100, d % 100)
  let (l, i) = (x / 10, x % 10)

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
    .map(|(value, symbol)| {
      let count = (m * value) / n
      if count > 0 {
        symbol.repeat(count)
      } else {
        ""
      }
    })
    .filter(|s| s != "")
    .join("")

  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 23:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-3.almd:23:5
   |
23 |     .map(|(value, symbol)| {
   |     ^
error: Expected Then at line 25:20 (got LBrace '{')
  --> /tmp/dojo-roman-numeral-3.almd:25:20
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
25 |       if count > 0 {
   |                    ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 27:9 (got Else 'else')
  --> /tmp/dojo-roman-numeral-3.almd:27:9
   |
27 |       } else {
   |         ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:24:24
  in variable value
  hint: Check the variable name
   |
24 |       let count = (m * value) / n
   |                        ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:26:9
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
26 |         symbol.repeat(count)
   |         ^^^^^^

5 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
