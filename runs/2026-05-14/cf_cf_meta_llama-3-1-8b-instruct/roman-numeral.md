# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String {
  match n {
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M",
    _ => {
      let (thousands, remainder) = (n / 1000, n % 1000);
      let (hundreds, remainder) = (remainder / 100, remainder % 100);
      let (tens, remainder) = (remainder / 10, remainder % 10);
      let (ones, _) = (remainder, remainder % 1);
      let roman = (match thousands {
        1 => "M",
        _ => ""
      }) + (match hundreds {
        1 => "C",
        2 => "CC",
        3 => "CCC",
        _ => ""
      }) + (match tens {
        1 => "X",
        2
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
  match n {
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M",
    _ => {
      let (thousands, remainder) = (n / 1000, n % 1000);
      let (hundreds, remainder) = (remainder / 100, remainder % 100);
      let (tens, remainder) = (remainder / 10, remainder % 10);
      let (ones, _) = (remainder, remainder % 1);
      let roman = (match thousands {
        1 => "M",
        _ => ""
      }) + (match hundreds {
        1 => "C",
        2 => "CC",
        3 => "CCC",
        _ => ""
      }) + (match tens {
        1 => "X",
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected pattern at line 32:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-1.almd:32:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:1:33
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
1 | fn to_roman(n: Int) -> String = {
  |                                 ^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  match n {
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M",
    _ => {
      let (thousands, remainder) = (n / 1000, n % 1000);
      let (hundreds, remainder) = (remainder / 100, remainder % 100);
      let (tens, remainder) = (remainder / 10, remainder % 10);
      let (ones, _) = (remainder, remainder % 1);
      let roman = (match thousands {
        1 => "M",
        _ => ""
      }) + (match hundreds {
        1 => "C",
        2 => "CC",
        3 => "CCC",
        _ => ""
      }) + (match tens {
        1 => "X",
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected pattern at line 32:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-2.almd:32:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:1:33
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
1 | fn to_roman(n: Int) -> String = {
  |                                 ^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  match n {
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M",
    _ => {
      let (thousands, remainder) = (n / 1000, n % 1000);
      let (hundreds, remainder) = (remainder / 100, remainder % 100);
      let (tens, remainder) = (remainder / 10, remainder % 10);
      let (ones, _) = (remainder, remainder % 1);
      let roman = (match thousands {
        1 => "M",
        _ => ""
      }) + (match hundreds {
        1 => "C",
        2 => "CC",
        3 => "CCC",
        _ => ""
      }) + (match tens {
        1 => "X",
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected pattern at line 32:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-3.almd:32:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:1:33
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
1 | fn to_roman(n: Int) -> String = {
  |                                 ^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
