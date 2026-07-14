# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let roman_numerals = [
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
  ] in
  let rec to_roman_rec(n: Int, numerals: List[(Int, String)], result: String) -> String = 
    if list.is_empty(numerals) then result
    else 
      let (value, symbol) = list.first(numerals) |> option.unwrap_or((0, "")) in
      if n >= value then 
        to_roman_rec(n - value, numerals, result + symbol)
      else 
        to_roman_rec(n, list.drop(numerals, 1), result)
  in 
  to_roman_rec(n, roman_numerals, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-0.almd:17:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
   |
17 |   let rec to_roman_rec(n: Int, numerals: List[(Int, String)], result: String) -> String =
   |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:20:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
20 |       let (value, symbol) = list.first(numerals) |> option.unwrap_or((0, "")) in
   |       ^^^
error: Expected expression at line 25:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-0.almd:25:3
   |
25 |   in
   |   ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:21:15
  in variable value
  hint: Check the variable name
   |
21 |       if n >= value then
   |               ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:22:26
  in variable value
  hint: Check the variable name
   |
22 |         to_roman_rec(n - value, numerals, result + symbol)
   |                          ^^^^^
error[E003]: undefined variable 'numerals'
  --> /tmp/dojo-roman-numeral-0.almd:22:33
  in variable numerals
  hint: Check the variable name
   |
22 |         to_roman_rec(n - value, numerals, result + symbol)
   |                                 ^^^^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-0.almd:22:43
  in variable result
  hint: Check the variable name
   |
22 |         to_roman_rec(n - value, numerals, result + symbol)
   |                                           ^^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:22:52
  in variable symbol
  hint: Check the variable name
   |
22 |         to_roman_rec(n - value, numerals, result + symbol)
   |                                                    ^^^^^^
error[E002]: undefined function 'to_roman_rec'
  --> /tmp/dojo-roman-numeral-0.almd:22:52
  in call to to_roman_rec()
  hint: Did you mean `to_roman`?
  try:
      // to_roman_rec(...)  →  to_roman(...)
      to_roman(...)
   |
22 |         to_roman_rec(n - value, numerals, result + symbol)
   |                                                    ^^^^^^
error[E003]: undefined variable 'numerals'
  --> /tmp/dojo-roman-numeral-0.almd:24:35
  in variable numerals
  hint: Check the variable name
   |
24 |         to_roman_rec(n, list.drop(numerals, 1), result)
   |                                   ^^^^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-0.almd:24:49
  in variable result
  hint: Check the variable name
   |
24 |         to_roman_rec(n, list.drop(numerals, 1), result)
   |                                                 ^^^^^^
error[E002]: undefined function 'to_roman_rec'
  --> /tmp/dojo-roman-numeral-0.almd:24:49
  in call to to_roman_rec()
  hint: Did you mean `to_roman`?
  try:
      // to_roman_rec(...)  →  to_roman(...)
      to_roman(...)
   |
24 |         to_roman_rec(n, list.drop(numerals, 1), result)
   |                                                 ^^^^^^
error[E002]: undefined function 'to_roman_rec'
  --> /tmp/dojo-roman-numeral-0.almd:26:35
  in call to to_roman_rec()
  hint: Did you mean `to_roman`?
  try:
      // to_roman_rec(...)  →  to_roman(...)
      to_roman(...)
   |
26 |   to_roman_rec(n, roman_numerals, "")
   |                                   ^^

13 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let roman_numerals = [
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
  ] in
  fn to_roman_rec(n: Int, numerals: List[(Int, String)], result: String) -> String = 
    if list.is_empty(numerals) then result
    else 
      let first = list.first(numerals) in
      let (value, symbol) = option.unwrap_or(first, (0, "")) in
      if n >= value then 
        to_roman_rec(n - value, numerals, result + symbol)
      else 
        to_roman_rec(n, list.drop(numerals, 1), result)
  in 
  to_roman_rec(n, roman_numerals, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:20:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
20 |       let first = list.first(numerals) in
   |       ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:15:9
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let roman_numerals = ...` (a statement, returns Unit).
      // Add `roman_numerals` as the trailing expression so the fn returns String:
      //
      //   let roman_numerals = <computation>
      //   roman_numerals                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
   |
15 |     (1, "I")
   |         ^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let roman_numerals = [
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
  in 
  {
    fn to_roman_rec(n: Int, numerals: List[(Int, String)], result: String) -> String = 
      if list.is_empty(numerals) then result
      else 
        {
          let first = list.first(numerals) in
          let (value, symbol) = option.unwrap_or(first, (0, "")) in
          if n >= value then 
            to_roman_rec(n - value, numerals, result + symbol)
          else 
            to_roman_rec(n, list.drop(numerals, 1), result)
        }
    in 
    to_roman_rec(n, roman_numerals, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 19:5 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-2.almd:19:5
   |
19 |     fn to_roman_rec(n: Int, numerals: List[(Int, String)], result: String) -> String =
   |     ^
error: Expected expression at line 24:66 (got In 'in')
  --> /tmp/dojo-roman-numeral-2.almd:24:66
   |
24 |           let (value, symbol) = option.unwrap_or(first, (0, "")) in
   |                                                                  ^
error: Expected expression at line 30:5 (got In 'in')
  --> /tmp/dojo-roman-numeral-2.almd:30:5
   |
30 |     in
   |     ^
error: Expected expression at line 33:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-2.almd:33:1
   |
33 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error[E003]: undefined variable 'numerals'
  --> /tmp/dojo-roman-numeral-2.almd:20:24
  in variable numerals
  hint: Check the variable name
   |
20 |       if list.is_empty(numerals) then result
   |                        ^^^^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-2.almd:20:39
  in variable result
  hint: Check the variable name
   |
20 |       if list.is_empty(numerals) then result
   |                                       ^^^^^^
error[E003]: undefined variable 'numerals'
  --> /tmp/dojo-roman-numeral-2.almd:23:34
  in variable numerals
  hint: Check the variable name
   |
23 |           let first = list.first(numerals)
   |                                  ^^^^^^^^
error[E003]: undefined variable 'numerals'
  --> /tmp/dojo-roman-numeral-2.almd:26:37
  in variable numerals
  hint: Check the variable name
   |
26 |             to_roman_rec(n - value, numerals, result + symbol)
   |                                     ^^^^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-2.almd:26:47
  in variable result
  hint: Check the variable name
   |
26 |             to_roman_rec(n - value, numerals, result + symbol)
   |                                               ^^^^^^
error[E002]: undefined function 'to_roman_rec'
  --> /tmp/dojo-roman-numeral-2.almd:26:56
  in call to to_roman_rec()
  hint: Did you mean `to_roman`?
  try:
      // to_roman_rec(...)  →  to_roman(...)
      to_roman(...)
   |
26 |             to_roman_rec(n - value, numerals, result + symbol)
   |                                                        ^^^^^^
error[E003]: undefined variable 'numerals'
  --> /tmp/dojo-roman-numeral-2.almd:28:39
  in variable numerals
  hint: Check the variable name
   |
28 |             to_roman_rec(n, list.drop(numerals, 1), result)
   |                                       ^^^^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-2.almd:28:53
  in variable result
  hint: Check the variable name
   |
28 |             to_roman_rec(n, list.drop(numerals, 1), result)
   |                                                     ^^^^^^
error[E002]: undefined function 'to_roman_rec'
  --> /tmp/dojo-roman-numeral-2.almd:28:53
  in call to to_roman_rec()
  hint: Did you mean `to_roman`?
  try:
      // to_roman_rec(...)  →  to_roman(...)
      to_roman(...)
   |
28 |             to_roman_rec(n, list.drop(numerals, 1), result)
   |                                                     ^^^^^^
error[E002]: undefined function 'to_roman_rec'
  --> /tmp/dojo-roman-numeral-2.almd:31:37
  in call to to_roman_rec()
  hint: Did you mean `to_roman`?
  try:
      // to_roman_rec(...)  →  to_roman(...)
      to_roman(...)
   |
31 |     to_roman_rec(n, roman_numerals, "")
   |                                     ^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:31:37
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
31 |     to_roman_rec(n, roman_numerals, "")
   |                                     ^^

15 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let roman_numerals = [
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
  in 
  let rec to_roman_rec(n: Int, numerals: List[(Int, String)], result: String) -> String = 
    if list.is_empty(numerals) then result
    else 
      let first = list.first(numerals) in
      let (value, symbol) = option.unwrap_or(first, (0, "")) in
      if n >= value then 
        to_roman_rec(n - value, numerals, result + symbol)
      else 
        to_roman_rec(n, list.drop(numerals, 1), result)
  in 
  to_roman_rec(n, roman_numerals, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-3.almd:18:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
   |
18 |   let rec to_roman_rec(n: Int, numerals: List[(Int, String)], result: String) -> String =
   |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:21:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
21 |       let first = list.first(numerals) in
   |       ^^^
error: Expected expression at line 22:62 (got In 'in')
  --> /tmp/dojo-roman-numeral-3.almd:22:62
   |
22 |       let (value, symbol) = option.unwrap_or(first, (0, "")) in
   |                                                              ^
error: Expected expression at line 27:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-3.almd:27:3
   |
27 |   in
   |   ^
error[E003]: undefined variable 'first'
  --> /tmp/dojo-roman-numeral-3.almd:22:46
  in variable first
  hint: Check the variable name
   |
22 |       let (value, symbol) = option.unwrap_or(first, (0, "")) in
   |                                              ^^^^^
error[E003]: undefined variable 'numerals'
  --> /tmp/dojo-roman-numeral-3.almd:24:33
  in variable numerals
  hint: Check the variable name
   |
24 |         to_roman_rec(n - value, numerals, result + symbol)
   |                                 ^^^^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-3.almd:24:43
  in variable result
  hint: Check the variable name
   |
24 |         to_roman_rec(n - value, numerals, result + symbol)
   |                                           ^^^^^^
error[E002]: undefined function 'to_roman_rec'
  --> /tmp/dojo-roman-numeral-3.almd:24:52
  in call to to_roman_rec()
  hint: Did you mean `to_roman`?
  try:
      // to_roman_rec(...)  →  to_roman(...)
      to_roman(...)
   |
24 |         to_roman_rec(n - value, numerals, result + symbol)
   |                                                    ^^^^^^
error[E003]: undefined variable 'numerals'
  --> /tmp/dojo-roman-numeral-3.almd:26:35
  in variable numerals
  hint: Check the variable name
   |
26 |         to_roman_rec(n, list.drop(numerals, 1), result)
   |                                   ^^^^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-3.almd:26:49
  in variable result
  hint: Check the variable name
   |
26 |         to_roman_rec(n, list.drop(numerals, 1), result)
   |                                                 ^^^^^^
error[E002]: undefined function 'to_roman_rec'
  --> /tmp/dojo-roman-numeral-3.almd:26:49
  in call to to_roman_rec()
  hint: Did you mean `to_roman`?
  try:
      // to_roman_rec(...)  →  to_roman(...)
      to_roman(...)
   |
26 |         to_roman_rec(n, list.drop(numerals, 1), result)
   |                                                 ^^^^^^
error[E002]: undefined function 'to_roman_rec'
  --> /tmp/dojo-roman-numeral-3.almd:28:35
  in call to to_roman_rec()
  hint: Did you mean `to_roman`?
  try:
      // to_roman_rec(...)  →  to_roman(...)
      to_roman(...)
   |
28 |   to_roman_rec(n, roman_numerals, "")
   |                                   ^^

12 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
