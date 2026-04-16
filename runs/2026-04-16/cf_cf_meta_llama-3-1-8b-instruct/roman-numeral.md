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
  let (v, _i) = (i / 1, i % 1)

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

  let roman_str = roman
    .filter(|(value, _)| value > 0)
    .map(|(value, symbol)| {
      let count = (m * value) / value
      let str = String::from_iter((0..count).map(|_| symbol))
      str
    })
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
  let (v, _i) = (i / 1, i % 1)

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

  let roman_str = roman
    .filter(|(value, _)| value > 0)
    .map(|(value, symbol)| {
      let count = (m * value) / value
      let str = String::from_iter((0..count).map(|_| symbol))
      str
    })
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected expression at line 24:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-1.almd:24:5
   |
24 |     .filter(|(value, _)| value > 0)
   |     ^
error: '::' is not valid in Almide at line 27:23
  --> /tmp/dojo-roman-numeral-1.almd:27:23
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
   |
27 |       let str = String::from_iter((0..count).map(|_| symbol))
   |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 29:6 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:29:6
   |
29 |     })
   |      ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:26:24
  in variable value
  hint: Check the variable name
   |
26 |       let count = (m * value) / value
   |                        ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:26:33
  in variable value
  hint: Check the variable name
   |
26 |       let count = (m * value) / value
   |                                 ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got String
  --> /tmp/dojo-roman-numeral-1.almd:28:7
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
   |
28 |       str
   |       ^^^

6 error(s) found
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
  let (v, _i) = (i / 1, i % 1)

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

  let roman_str = roman
    .filter(|pair| pair.0 > 0)
    .map(|pair| {
      let count = (m * pair.0) / pair.0
      let str = string.from_iter((0..count).map(|_| pair.1))
      str
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 24:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-2.almd:24:5
   |
24 |     .filter(|pair| pair.0 > 0)
   |     ^
error: '|x|' closure syntax is not valid in Almide at line 27:49
  --> /tmp/dojo-roman-numeral-2.almd:27:49
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
27 |       let str = string.from_iter((0..count).map(|_| pair.1))
   |                                                 ^
error: Expected expression at line 30:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-2.almd:30:1
   |
30 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-2.almd:26:24
  in variable pair
  hint: Did you mean `panic`?
  try:
      // pair  →  panic
      panic
   |
26 |       let count = (m * pair.0) / pair.0
   |                        ^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-2.almd:26:34
  in variable pair
  hint: Did you mean `panic`?
  try:
      // pair  →  panic
      panic
   |
26 |       let count = (m * pair.0) / pair.0
   |                                  ^^^^
error[E003]: undefined variable 'str'
  --> /tmp/dojo-roman-numeral-2.almd:28:7
  in variable str
  hint: Check the variable name
   |
28 |       str
   |       ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:28:7
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
28 |       str
   |       ^^^

7 error(s) found
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
  let (v, _i) = (i / 1, i % 1)

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

  let roman_str = roman
    .filter(|pair| pair.0 > 0)
    .map(|pair| {
      let count = (m * pair.0) / pair.0
      let str = string.from_iter((0..count).map(|_| pair.1))
      str
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 24:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-3.almd:24:5
   |
24 |     .filter(|pair| pair.0 > 0)
   |     ^
error: '|x|' closure syntax is not valid in Almide at line 27:49
  --> /tmp/dojo-roman-numeral-3.almd:27:49
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
27 |       let str = string.from_iter((0..count).map(|_| pair.1))
   |                                                 ^
error: Expected expression at line 30:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-3.almd:30:1
   |
30 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-3.almd:26:24
  in variable pair
  hint: Did you mean `panic`?
  try:
      // pair  →  panic
      panic
   |
26 |       let count = (m * pair.0) / pair.0
   |                        ^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-3.almd:26:34
  in variable pair
  hint: Did you mean `panic`?
  try:
      // pair  →  panic
      panic
   |
26 |       let count = (m * pair.0) / pair.0
   |                                  ^^^^
error[E003]: undefined variable 'str'
  --> /tmp/dojo-roman-numeral-3.almd:28:7
  in variable str
  hint: Check the variable name
   |
28 |       str
   |       ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:28:7
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
28 |       str
   |       ^^^

7 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
