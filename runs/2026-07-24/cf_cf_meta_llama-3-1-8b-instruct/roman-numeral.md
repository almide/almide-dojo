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
    n if n >= 1000 => "M" + to_roman(n - 1000),
    n if n >= 900 => "CM" + to_roman(n - 900),
    n if n >= 500 => "D" + to_roman(n - 500),
    n if n >= 400 => "CD" + to_roman(n - 400),
    n if n >= 100 => "C" + to_roman(n - 100),
    n if n >= 90 => "XC" + to_roman(n - 90),
    n if n >= 50 => "L" + to_roman(n - 50),
    n if n >= 40 => "XL" + to_roman(n - 40),
    n if n >= 10 => "X" + to_roman(n - 10),
    n if n >= 9 => "IX" + to_roman(n - 9),
    n if n >= 5 => "V" + to_roman(n - 5),
    n if n >= 4 => "IV" + to_roman(n - 4
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
    n if n >= 1000 => "M" + to_roman(n - 1000),
    n if n >= 900 => "CM" + to_roman(n - 900),
    n if n >= 500 => "D" + to_roman(n - 500),
    n if n >= 400 => "CD" + to_roman(n - 400),
    n if n >= 100 => "C" + to_roman(n - 100),
    n if n >= 90 => "XC" + to_roman(n - 90),
    n if n >= 50 => "L" + to_roman(n - 50),
    n if n >= 40 => "XL" + to_roman(n - 40),
    n if n >= 10 => "X" + to_roman(n - 10),
    n if n >= 9 => "IX" + to_roman(n - 9),
    n if n >= 5 => "V" + to_roman(n - 5),
    n if n >= 4 => "IV" + to_roman(n -
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected expression at line 16:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-1.almd:16:1
   |
16 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
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
    n if n >= 1000 => "M" + to_roman(n - 1000),
    n if n >= 900 => "CM" + to_roman(n - 900),
    n if n >= 500 => "D" + to_roman(n - 500),
    n if n >= 400 => "CD" + to_roman(n - 400),
    n if n >= 100 => "C" + to_roman(n - 100),
    n if n >= 90 => "XC" + to_roman(n - 90),
    n if n >= 50 => "L" + to_roman(n - 50),
    n if n >= 40 => "XL" + to_roman(n - 40),
    n if n >= 10 => "X" + to_roman(n - 10),
    n if n >= 9 => "IX" + to_roman(n - 9),
    n if n >= 5 => "V" + to_roman(n - 5),
    n if n >= 4 => "IV" + to_roman(n -
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 16:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-2.almd:16:1
   |
16 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
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
    n if n >= 1000 => "M" + to_roman(n - 1000),
    n if n >= 900 => "CM" + to_roman(n - 900),
    n if n >= 500 => "D" + to_roman(n - 500),
    n if n >= 400 => "CD" + to_roman(n - 400),
    n if n >= 100 => "C" + to_roman(n - 100),
    n if n >= 90 => "XC" + to_roman(n - 90),
    n if n >= 50 => "L" + to_roman(n - 50),
    n if n >= 40 => "XL" + to_roman(n - 40),
    n if n >= 10 => "X" + to_roman(n - 10),
    n if n >= 9 => "IX" + to_roman(n - 9),
    n if n >= 5 => "V" + to_roman(n - 5),
    n if n >= 4 => "IV" + to_roman(n -
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 16:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-3.almd:16:1
   |
16 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
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
