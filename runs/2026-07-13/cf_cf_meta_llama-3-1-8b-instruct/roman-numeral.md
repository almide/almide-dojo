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
    _ =>
      let (thousands, rest) = list.split_at(list.range(1, n + 1), 1000);
      let (hundreds, tens_and_ones) = list.split_at(rest, 100);
      let (tens, ones) = list.split_at(tens_and_ones, 10);
      let ones_str = match ones {
        1 => "I",
        4 => "IV",
        5 => "V",
        9 => "IX",
        _ => int.to_string(ones),
      };
      let tens_str = match tens {
        1 => "X",
        4 => "XL",
        5 => "L",
        9
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
    _ =>
      let (thousands, rest) = list.split_at(list.range(1, n + 1), 1000);
      let (hundreds, tens_and_ones) = list.split_at(rest, 100);
      let (tens, ones) = list.split_at(tens_and_ones, 10);
      let ones_str = match ones {
        1 => "I",
        4 => "IV",
        5 => "V",
        9 => "IX",
        _ => int.to_string(ones),
      };
      let tens_str = match tens {
        1 => "X",
        4 => "XL",
        5 => "L",
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:17:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
17 |       let (thousands, rest) = list.split_at(list.range(1, n + 1), 1000);
   |       ^^^
error: Expected pattern at line 32:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-1.almd:32:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error[E003]: undefined variable 'rest'
  --> /tmp/dojo-roman-numeral-1.almd:18:53
  in variable rest
  hint: Check the variable name
   |
18 |       let (hundreds, tens_and_ones) = list.split_at(rest, 100);
   |                                                     ^^^^
error[E005]: argument 'n' expects Int but got List[?0]
  --> /tmp/dojo-roman-numeral-1.almd:25:28
  in call to int.to_string()
  hint: Fix the argument type
   |
25 |         _ => int.to_string(ones),
   |                            ^^^^
error[E001]: type mismatch in call to int.to_string(): expected Int but got List[?0]
  --> /tmp/dojo-roman-numeral-1.almd:25:28
  in call to int.to_string()
  hint: Fix the expression type or change the expected type
   |
25 |         _ => int.to_string(ones),
   |                            ^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:25:28
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
25 |         _ => int.to_string(ones),
   |                            ^^^^

6 error(s) found
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
    _ =>
      let thousands = list.drop(list.range(1, n + 1), 999);
      let rest = list.drop(list.range(1, n + 1), 1000);
      let hundreds = list.drop(rest, 99);
      let tens_and_ones = list.drop(rest, 100);
      let tens = list.drop(tens_and_ones, 9);
      let ones = list.drop(tens_and_ones, 10);
      let ones_str = match ones {
        1 => "I",
        4 => "IV",
        5 => "V",
        9 => "IX",
        _ => int.to_string(list.first(ones)),
      };
      let
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:17:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
17 |       let thousands = list.drop(list.range(1, n + 1), 999);
   |       ^^^
error: Expected identifier at line 30:10 (got Newline '')
  --> /tmp/dojo-roman-numeral-2.almd:30:10
   |
30 |       let
   |          ^
error: Expected expression at line 32:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-2.almd:32:1
   |
32 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-roman-numeral-2.almd:28:39
  in call to int.to_string()
  hint: Fix the argument type
   |
28 |         _ => int.to_string(list.first(ones)),
   |                                       ^^^^
error[E001]: type mismatch in call to int.to_string(): expected Int but got Option[Int]
  --> /tmp/dojo-roman-numeral-2.almd:28:39
  in call to int.to_string()
  hint: Fix the expression type or change the expected type
   |
28 |         _ => int.to_string(list.first(ones)),
   |                                       ^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:28:39
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
28 |         _ => int.to_string(list.first(ones)),
   |                                       ^^^^

6 error(s) found
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
    _ =>
      let thousands = list.drop(list.range(1, n + 1), 999);
      let rest = list.drop(list.range(1, n + 1), 1000);
      let hundreds = list.drop(rest, 99);
      let tens_and_ones = list.drop(rest, 100);
      let tens = list.drop(tens_and_ones, 9);
      let ones = list.drop(tens_and_ones, 10);
      let ones_str = match ones {
        some(1) => "I",
        some(4) => "IV",
        some(5) => "V",
        some(9) => "IX",
        _ => int.to_string(list
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:17:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
17 |       let thousands = list.drop(list.range(1, n + 1), 999);
   |       ^^^
error: Expected ')' to close function call opened at line 28:27
  --> /tmp/dojo-roman-numeral-3.almd:30:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
28 |         _ => int.to_string(list
   |                           --------------- '(' opened here
...
30 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:22:43
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
22 |       let ones = list.drop(tens_and_ones, 10);
   |                                           ^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
