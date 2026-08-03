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
  let rec loop(n: Int, values: List[(Int, String)], result: String) -> String = 
    if n == 0 then result
    else if list.is_empty(values) then result
    else 
      let (value, symbol) = list.first(values) |> option.unwrap_or((0, "")) in
      let count = n / value in
      let new_result = string.repeat(symbol, count) + result in
      let new_n = n - count * value in
      let new_values = list.drop(values, 1) in
      loop(new_n, new_values, new_result)
  in loop(n, roman_values
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
17 |   let rec loop(n: Int, values: List[(Int, String)], result: String) -> String =
   |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:21:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
21 |       let (value, symbol) = list.first(values) |> option.unwrap_or((0, "")) in
   |       ^^^
error: 'loop' is not valid in Almide at line 26:7
  --> /tmp/dojo-roman-numeral-0.almd:26:7
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
26 |       loop(new_n, new_values, new_result)
   |       ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:22:23
  in variable value
  hint: Check the variable name
   |
22 |       let count = n / value
   |                       ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:23:38
  in variable symbol
  hint: Check the variable name
   |
23 |       let new_result = string.repeat(symbol, count) + result
   |                                      ^^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-0.almd:23:55
  in variable result
  hint: Check the variable name
   |
23 |       let new_result = string.repeat(symbol, count) + result
   |                                                       ^^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:24:31
  in variable value
  hint: Check the variable name
   |
24 |       let new_n = n - count * value
   |                               ^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-0.almd:25:34
  in variable values
  hint: Check the variable name
   |
25 |       let new_values = list.drop(values, 1)
   |                                  ^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:25:42
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
25 |       let new_values = list.drop(values, 1)
   |                                          ^

9 error(s) found
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
  fn loop(n: Int, values: List[(Int, String)], result: String) -> String = 
    if n == 0 then result
    else if list.is_empty(values) then result
    else 
      let first_value = list.first(values) in
      let (value, symbol) = first_value |> option.unwrap_or((0, "")) in
      let count = n / value in
      let new_result = string.repeat(symbol, count) + result in
      let new_n = n - count * value in
      let new_values = list.drop(values, 1) in
      loop(new_n, new_values, new_result)
  in loop
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
  ] in
  {
    fn loop(n: Int, values: List[(Int, String)], result: String) -> String = 
      if n == 0 then result
      else if list.is_empty(values) then result
      else 
        let first_value = list.first(values) |> option.unwrap_or((0, "")) in
        let (value, symbol) = first_value in
        let count = n / value in
        let new_result = string.repeat(symbol, count) + result in
        let new_n = n - count * value in
        let new_values = list.drop(values, 1) in
        loop(new_n, new_values, new_result)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 18:5 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-2.almd:18:5
   |
18 |     fn loop(n: Int, values: List[(Int, String)], result: String) -> String =
   |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:22:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
22 |         let first_value = list.first(values) |> option.unwrap_or((0, "")) in
   |         ^^^
error: Expected expression at line 23:43 (got In 'in')
  --> /tmp/dojo-roman-numeral-2.almd:23:43
   |
23 |         let (value, symbol) = first_value in
   |                                           ^
error: 'loop' is not valid in Almide at line 28:9
  --> /tmp/dojo-roman-numeral-2.almd:28:9
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
28 |         loop(new_n, new_values, new_result)
   |         ^
error: Expected expression at line 30:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-2.almd:30:1
   |
30 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error[E003]: undefined variable 'first_value'
  --> /tmp/dojo-roman-numeral-2.almd:23:31
  in variable first_value
  hint: Check the variable name
   |
23 |         let (value, symbol) = first_value in
   |                               ^^^^^^^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-2.almd:25:57
  in variable result
  hint: Check the variable name
   |
25 |         let new_result = string.repeat(symbol, count) + result
   |                                                         ^^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-2.almd:27:36
  in variable values
  hint: Did you mean `value`?
  try:
      // values  →  value
      value
   |
27 |         let new_values = list.drop(values, 1)
   |                                    ^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:27:44
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
27 |         let new_values = list.drop(values, 1)
   |                                            ^

9 error(s) found
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
  ] in
  list.fold(roman_values, "", (acc, (value, symbol)) => 
    let count = n / value in
    if count > 0 then string.repeat(symbol, count) + acc
    else acc
  ) 
  |> (x) => if n == 0 then x else x + to_roman(n - list.first(roman_values) |> option.unwrap_or((0, "")) |> (x) => x.0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:18:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
18 |     let count = n / value
   |     ^^^
error: Expected expression at line 21:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-3.almd:21:3
   |
21 |   )
   |   ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:19:8
  in variable count
  hint: Check the variable name
   |
19 |     if count > 0 then string.repeat(symbol, count) + acc
   |        ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:19:37
  in variable symbol
  hint: Check the variable name
   |
19 |     if count > 0 then string.repeat(symbol, count) + acc
   |                                     ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:19:45
  in variable count
  hint: Check the variable name
   |
19 |     if count > 0 then string.repeat(symbol, count) + acc
   |                                             ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:19:54
  in variable acc
  hint: Check the variable name
   |
19 |     if count > 0 then string.repeat(symbol, count) + acc
   |                                                      ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:20:10
  in variable acc
  hint: Check the variable name
   |
20 |     else acc
   |          ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:20:10
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
20 |     else acc
   |          ^^^

8 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
