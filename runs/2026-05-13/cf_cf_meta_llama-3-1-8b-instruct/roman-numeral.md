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

  let result = [
    if thousands > 0 { (thousands, "M") } else { (0, "") },
    if hundreds > 0 { (hundreds, "C") } else { (0, "") },
    if tens > 0 { (tens, "X") } else {
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

  let result = [
    if thousands > 0 { (thousands, "M") } else { (0, "") },
    if hundreds > 0 { (hundreds, "C") } else { (0, "") },
    if tens > 0 { (tens, "X") } else
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected Then at line 24:22 (got LBrace '{')
  --> /tmp/dojo-roman-numeral-1.almd:24:22
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
24 |     if thousands > 0 { (thousands, "M") } else { (0, "") },
   |                      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:43 (got Else 'else')
  --> /tmp/dojo-roman-numeral-1.almd:24:43
   |
24 |     if thousands > 0 { (thousands, "M") } else { (0, "") },
   |                                           ^
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
    if thousands > 0 then "M" * thousands else "",
    if hundreds > 0 then "C" * hundreds else "",
    if tens > 0 then "X" * tens else "",
    if ones > 0 then "I" * ones else ""
  ]

  let
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected identifier at line 30:6 (got Newline '')
  --> /tmp/dojo-roman-numeral-2.almd:30:6
   |
30 |   let
   |      ^
error: Expected expression at line 32:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-2.almd:32:1
   |
32 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error: operator '*' requires numeric types but got String and Int
  --> /tmp/dojo-roman-numeral-2.almd:24:33
  in operator *
  hint: Use numeric types (Int or Float)
   |
24 |     if thousands > 0 then "M" * thousands else "",
   |                                 ^^^^^^^^^
error: operator '*' requires numeric types but got String and Int
  --> /tmp/dojo-roman-numeral-2.almd:25:32
  in operator *
  hint: Use numeric types (Int or Float)
   |
25 |     if hundreds > 0 then "C" * hundreds else "",
   |                                ^^^^^^^^
error: operator '*' requires numeric types but got String and Int
  --> /tmp/dojo-roman-numeral-2.almd:26:28
  in operator *
  hint: Use numeric types (Int or Float)
   |
26 |     if tens > 0 then "X" * tens else "",
   |                            ^^^^
error: operator '*' requires numeric types but got String and Int
  --> /tmp/dojo-roman-numeral-2.almd:27:28
  in operator *
  hint: Use numeric types (Int or Float)
   |
27 |     if ones > 0 then "I" * ones else ""
   |                            ^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:27:38
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
27 |     if ones > 0 then "I" * ones else ""
   |                                      ^^

7 error(s) found
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

  let result = [
    if thousands > 0 then "M" * thousands else "",
    if hundreds > 0 then "C" * hundreds else "",
    if tens > 0 then "X" * tens else "",
    if ones > 0 then "I" * ones else ""
  ]

  let
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected identifier at line 30:6 (got Newline '')
  --> /tmp/dojo-roman-numeral-3.almd:30:6
   |
30 |   let
   |      ^
error: Expected expression at line 32:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-3.almd:32:1
   |
32 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error: operator '*' requires numeric types but got String and Int
  --> /tmp/dojo-roman-numeral-3.almd:24:33
  in operator *
  hint: Use numeric types (Int or Float)
   |
24 |     if thousands > 0 then "M" * thousands else "",
   |                                 ^^^^^^^^^
error: operator '*' requires numeric types but got String and Int
  --> /tmp/dojo-roman-numeral-3.almd:25:32
  in operator *
  hint: Use numeric types (Int or Float)
   |
25 |     if hundreds > 0 then "C" * hundreds else "",
   |                                ^^^^^^^^
error: operator '*' requires numeric types but got String and Int
  --> /tmp/dojo-roman-numeral-3.almd:26:28
  in operator *
  hint: Use numeric types (Int or Float)
   |
26 |     if tens > 0 then "X" * tens else "",
   |                            ^^^^
error: operator '*' requires numeric types but got String and Int
  --> /tmp/dojo-roman-numeral-3.almd:27:28
  in operator *
  hint: Use numeric types (Int or Float)
   |
27 |     if ones > 0 then "I" * ones else ""
   |                            ^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:27:38
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
27 |     if ones > 0 then "I" * ones else ""
   |                                      ^^

7 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
