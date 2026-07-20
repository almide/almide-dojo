# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (thousands, n) = (n / 1000, n % 1000)
  let (hundreds, n) = (n / 100, n % 100)
  let (tens, n) = (n / 10, n % 10)
  let (ones, n) = (n, n % 1)

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

  let result = [
    if thousands > 0 then (symbols.find_or_none(|(v, _)| v == thousands) |>
      option.map(|(v, s)| string.repeat(s, v))) else ""
  ] + [
    if hundreds > 0 then (symbols.find_or_none(|(v, _
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Expected expression at line 24:49 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-0.almd:24:49
   |
24 |     if thousands > 0 then (symbols.find_or_none(|(v, _)| v == thousands) |>
   |                                                 ^
error: Expected expression at line 25:18 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-0.almd:25:18
   |
25 |       option.map(|(v, s)| string.repeat(s, v))) else ""
   |                  ^
error: Expected expression at line 27:48 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-0.almd:27:48
   |
27 |     if hundreds > 0 then (symbols.find_or_none(|(v, _
   |                                                ^
error: Expected expression at line 29:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-0.almd:29:1
   |
29 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:20:9
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
20 |     (1, "I")
   |         ^^^

5 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (thousands, n) = (n / 1000, n % 1000)
  let (hundreds, n) = (n / 100, n % 100)
  let (tens, n) = (n / 10, n % 10)
  let (ones, n) = (n, n % 1)

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

  let result = [
    if thousands > 0 then symbols.find(|(v, _)| v == thousands).map(|(v, s)| string.repeat(s, v)).unwrap_or("") else "",
    if hundreds > 0 then symbols.find(|(v, _)| v == hundreds).map(|(v, s
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected expression at line 24:40 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-1.almd:24:40
   |
24 |     if thousands > 0 then symbols.find(|(v, _)| v == thousands).map(|(v, s)| string.repeat(s, v)).unwrap_or("") else "",
   |                                        ^
error: Expected expression at line 25:39 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-1.almd:25:39
   |
25 |     if hundreds > 0 then symbols.find(|(v, _)| v == hundreds).map(|(v, s
   |                                       ^
error: Expected expression at line 27:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-1.almd:27:1
   |
27 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
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
20 |     (1, "I")
   |         ^^^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (thousands, n) = (n / 1000, n % 1000)
  let (hundreds, n) = (n / 100, n % 100)
  let (tens, n) = (n / 10, n % 10)
  let (ones, n) = (n, n % 1)

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

  let result = [
    if thousands > 0 then string.repeat(symbols.find(|(v, _)| v == thousands).unwrap().2, thousands) else "",
    if hundreds > 0 then string.repeat(symbols.find(|(v, _)| v == hundreds).unwrap().2, hundreds) else "",
    if
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 24:54 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-2.almd:24:54
   |
24 |     if thousands > 0 then string.repeat(symbols.find(|(v, _)| v == thousands).unwrap().2, thousands) else "",
   |                                                      ^
error: Expected expression at line 25:53 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-2.almd:25:53
   |
25 |     if hundreds > 0 then string.repeat(symbols.find(|(v, _)| v == hundreds).unwrap().2, hundreds) else "",
   |                                                     ^
error: Expected expression at line 28:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-2.almd:28:1
   |
28 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
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
20 |     (1, "I")
   |         ^^^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (thousands, n) = (n / 1000, n % 1000)
  let (hundreds, n) = (n / 100, n % 100)
  let (tens, n) = (n / 10, n % 10)
  let (ones, n) = (n, n % 1)

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

  let result = [
    if thousands > 0 then string.repeat(symbols.find(|(v, _)| v == thousands).unwrap().2, thousands) else "",
    if hundreds > 0 then string.repeat(symbols.find(|(v, _)| v == hundreds).unwrap().2, hundreds) else "",
    if
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 24:54 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-3.almd:24:54
   |
24 |     if thousands > 0 then string.repeat(symbols.find(|(v, _)| v == thousands).unwrap().2, thousands) else "",
   |                                                      ^
error: Expected expression at line 25:53 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-3.almd:25:53
   |
25 |     if hundreds > 0 then string.repeat(symbols.find(|(v, _)| v == hundreds).unwrap().2, hundreds) else "",
   |                                                     ^
error: Expected expression at line 28:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-3.almd:28:1
   |
28 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
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
20 |     (1, "I")
   |         ^^^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
