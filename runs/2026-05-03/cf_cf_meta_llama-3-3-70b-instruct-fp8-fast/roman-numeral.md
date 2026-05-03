# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
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
    (1, "I")
  ] in
  let rec to_roman_helper(n: Int, values: List[(Int, String)], result: String) -> String = 
    if list.is_empty(values) then 
      result
    else 
      let (value, symbol) = list.first(values) |> option.unwrap_or((0, "")) in
      if n >= value then 
        to_roman_helper(n - value, values, result + symbol)
      else 
        to_roman_helper(n, list.drop(values, 1), result)
  in 
  to_roman_helper(n, roman_values, "")
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
17 |   let rec to_roman_helper(n: Int, values: List[(Int, String)], result: String) -> String =
   |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:21:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
21 |       let (value, symbol) = list.first(values) |> option.unwrap_or((0, "")) in
   |       ^^^
error: Expected expression at line 26:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-0.almd:26:3
   |
26 |   in
   |   ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:22:15
  in variable value
  hint: Check the variable name
   |
22 |       if n >= value then
   |               ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:23:29
  in variable value
  hint: Check the variable name
   |
23 |         to_roman_helper(n - value, values, result + symbol)
   |                             ^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-0.almd:23:36
  in variable values
  hint: Check the variable name
   |
23 |         to_roman_helper(n - value, values, result + symbol)
   |                                    ^^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-0.almd:23:44
  in variable result
  hint: Check the variable name
   |
23 |         to_roman_helper(n - value, values, result + symbol)
   |                                            ^^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:23:53
  in variable symbol
  hint: Check the variable name
   |
23 |         to_roman_helper(n - value, values, result + symbol)
   |                                                     ^^^^^^
error[E002]: undefined function 'to_roman_helper'
  --> /tmp/dojo-roman-numeral-0.almd:23:53
  in call to to_roman_helper()
  hint: Check the function name
   |
23 |         to_roman_helper(n - value, values, result + symbol)
   |                                                     ^^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-0.almd:25:38
  in variable values
  hint: Check the variable name
   |
25 |         to_roman_helper(n, list.drop(values, 1), result)
   |                                      ^^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-0.almd:25:50
  in variable result
  hint: Check the variable name
   |
25 |         to_roman_helper(n, list.drop(values, 1), result)
   |                                                  ^^^^^^
error[E002]: undefined function 'to_roman_helper'
  --> /tmp/dojo-roman-numeral-0.almd:25:50
  in call to to_roman_helper()
  hint: Check the function name
   |
25 |         to_roman_helper(n, list.drop(values, 1), result)
   |                                                  ^^^^^^
error[E002]: undefined function 'to_roman_helper'
  --> /tmp/dojo-roman-numeral-0.almd:27:36
  in call to to_roman_helper()
  hint: Check the function name
   |
27 |   to_roman_helper(n, roman_values, "")
   |                                    ^^

13 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
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
    (1, "I")
  ] in
  fn to_roman_helper(n: Int, values: List[(Int, String)], result: String) -> String = 
    if list.is_empty(values) then 
      result
    else 
      let first_value = list.first(values) in
      let (value, symbol) = first_value |> option.unwrap_or((0, "")) in
      if n >= value then 
        to_roman_helper(n - value, values, result + symbol)
      else 
        to_roman_helper(n, list.drop(values, 1), result)
  in 
  to_roman_helper(n, roman_values, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:21:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
21 |       let first_value = list.first(values) in
   |       ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:15:9
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let roman_values = ...` (a statement, returns Unit).
      // Add `roman_values` as the trailing expression so the fn returns String:
      //
      //   let roman_values = <computation>
      //   roman_values                         // <-- add this line
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
    (1, "I")
  ] 
  in 
  fn to_roman_helper(n: Int, values: List[(Int, String)], result: String) -> String = 
    if list.is_empty(values) then 
      result
    else 
      let first_value = list.first(values) |> option.unwrap_or((0, "")) in
      let (value, symbol) = first_value in
      if n >= value then 
        to_roman_helper(n - value, values, result + symbol)
      else 
        to_roman_helper(n, list.drop(values, 1), result)
  in 
  to_roman_helper(n, roman_values, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:22:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
22 |       let first_value = list.first(values) |> option.unwrap_or((0, "")) in
   |       ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:15:9
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let roman_values = ...` (a statement, returns Unit).
      // Add `roman_values` as the trailing expression so the fn returns String:
      //
      //   let roman_values = <computation>
      //   roman_values                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
   |
15 |     (1, "I")
   |         ^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
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
    (1, "I")
  ] 
  in 
  {
    fn to_roman_helper(n: Int, values: List[(Int, String)], result: String) -> String = 
      if list.is_empty(values) then 
        result
      else 
        let first_value = list.first(values) |> option.unwrap_or((0, "")) in
        let (value, symbol) = first_value in
        if n >= value then 
          to_roman_helper(n - value, values, result + symbol)
        else 
          to_roman_helper(n, list.drop(values, 1), result)
    in 
    to_roman_helper(n, roman_values, "")
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 19:5 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-3.almd:19:5
   |
19 |     fn to_roman_helper(n: Int, values: List[(Int, String)], result: String) -> String =
   |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:23:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
23 |         let first_value = list.first(values) |> option.unwrap_or((0, "")) in
   |         ^^^
error: Expected expression at line 24:43 (got In 'in')
  --> /tmp/dojo-roman-numeral-3.almd:24:43
   |
24 |         let (value, symbol) = first_value in
   |                                           ^
error: Expected expression at line 29:5 (got In 'in')
  --> /tmp/dojo-roman-numeral-3.almd:29:5
   |
29 |     in
   |     ^
error[E003]: undefined variable 'first_value'
  --> /tmp/dojo-roman-numeral-3.almd:24:31
  in variable first_value
  hint: Check the variable name
   |
24 |         let (value, symbol) = first_value in
   |                               ^^^^^^^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-3.almd:26:38
  in variable values
  hint: Did you mean `value`?
  try:
      // values  →  value
      value
   |
26 |           to_roman_helper(n - value, values, result + symbol)
   |                                      ^^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-3.almd:26:46
  in variable result
  hint: Check the variable name
   |
26 |           to_roman_helper(n - value, values, result + symbol)
   |                                              ^^^^^^
error[E002]: undefined function 'to_roman_helper'
  --> /tmp/dojo-roman-numeral-3.almd:26:55
  in call to to_roman_helper()
  hint: Check the function name
   |
26 |           to_roman_helper(n - value, values, result + symbol)
   |                                                       ^^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-3.almd:28:40
  in variable values
  hint: Did you mean `value`?
  try:
      // values  →  value
      value
   |
28 |           to_roman_helper(n, list.drop(values, 1), result)
   |                                        ^^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-3.almd:28:52
  in variable result
  hint: Check the variable name
   |
28 |           to_roman_helper(n, list.drop(values, 1), result)
   |                                                    ^^^^^^
error[E002]: undefined function 'to_roman_helper'
  --> /tmp/dojo-roman-numeral-3.almd:28:52
  in call to to_roman_helper()
  hint: Check the function name
   |
28 |           to_roman_helper(n, list.drop(values, 1), result)
   |                                                    ^^^^^^
error[E002]: undefined function 'to_roman_helper'
  --> /tmp/dojo-roman-numeral-3.almd:30:38
  in call to to_roman_helper()
  hint: Check the function name
   |
30 |     to_roman_helper(n, roman_values, "")
   |                                      ^^

12 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
