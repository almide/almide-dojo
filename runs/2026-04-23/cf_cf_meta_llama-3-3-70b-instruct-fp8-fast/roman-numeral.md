# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String =
  let values = [
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
  let rec loop(n: Int, values: List[(Int, String)], result: String) -> String =
    if list.is_empty(values) then
      result
    else
      let (value, symbol) = list.first(values) |> option.unwrap_or((0, ""))
      let rest = list.drop(values, 1)
      let count = n / value
      let new_result = string.repeat(symbol, count) + result
      let new_n = n - count * value
      loop(new_n, rest, new_result)
  loop(n, values, "")
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
21 |       let (value, symbol) = list.first(values) |> option.unwrap_or((0, ""))
   |       ^^^
error: 'loop' is not valid in Almide at line 26:7
  --> /tmp/dojo-roman-numeral-0.almd:26:7
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
26 |       loop(new_n, rest, new_result)
   |       ^
error: 'loop' is not valid in Almide at line 27:3
  --> /tmp/dojo-roman-numeral-0.almd:27:3
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
27 |   loop(n, values, "")
   |   ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:23:23
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
   |
23 |       let count = n / value
   |                       ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:24:38
  in variable symbol
  hint: Check the variable name
   |
24 |       let new_result = string.repeat(symbol, count) + result
   |                                      ^^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-0.almd:24:55
  in variable result
  hint: Did you mean `rest`?
  try:
      // result  →  rest
      rest
   |
24 |       let new_result = string.repeat(symbol, count) + result
   |                                                       ^^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:25:31
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
   |
25 |       let new_n = n - count * value
   |                               ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:25:31
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
25 |       let new_n = n - count * value
   |                               ^^^^^

9 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String =
  let values = [
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
  fn loop(n: Int, values: List[(Int, String)], result: String) -> String =
    if list.is_empty(values) then
      result
    else
      let first_value = list.first(values) |> option.unwrap_or((0, ""))
      let rest = list.drop(values, 1)
      let count = n / first_value.0
      let new_result = string.repeat(first_value.1, count) + result
      let new_n = n - count * first_value.0
      loop(new_n, rest, new_result)
  loop(n, values, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:21:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
21 |       let first_value = list.first(values) |> option.unwrap_or((0, ""))
   |       ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:15:9
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let values = ...` (a statement, returns Unit).
      // Add `values` as the trailing expression so the fn returns String:
      //
      //   let values = <computation>
      //   values                         // <-- add this line
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
  let values = [
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
  fn loop(n: Int, values: List[(Int, String)], result: String) -> String =
    if list.is_empty(values) then result
    else 
      let first_value = list.first(values) |> option.unwrap_or((0, ""))
      let rest = list.drop(values, 1)
      let count = n / first_value.0
      let new_result = string.repeat(first_value.1, count) + result
      let new_n = n - count * first_value.0
      in loop(new_n, rest, new_result)
  in loop(n, values, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:21:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
21 |       let first_value = list.first(values) |> option.unwrap_or((0, ""))
   |       ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:15:9
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let values = ...` (a statement, returns Unit).
      // Add `values` as the trailing expression so the fn returns String:
      //
      //   let values = <computation>
      //   values                         // <-- add this line
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
  let values = [
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
    fn loop(n: Int, values: List[(Int, String)], result: String) -> String =
      if list.is_empty(values) then result
      else 
        {
          let first_value = list.first(values) |> option.unwrap_or((0, ""))
          let rest = list.drop(values, 1)
          let count = n / first_value.0
          let new_result = string.repeat(first_value.1, count) + result
          let new_n = n - count * first_value.0
          in loop(new_n, rest, new_result)
        }
    in loop(n, values, "")
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 19:5 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-3.almd:19:5
   |
19 |     fn loop(n: Int, values: List[(Int, String)], result: String) -> String =
   |     ^
error: 'loop' is not valid in Almide at line 28:11
  --> /tmp/dojo-roman-numeral-3.almd:28:11
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
28 |           loop(new_n, rest, new_result)
   |           ^
error: Expected expression at line 30:5 (got In 'in')
  --> /tmp/dojo-roman-numeral-3.almd:30:5
   |
30 |     in loop(n, values, "")
   |     ^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-3.almd:20:37
  in variable result
  hint: Check the variable name
   |
20 |       if list.is_empty(values) then result
   |                                     ^^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-3.almd:26:66
  in variable result
  hint: Did you mean `rest`?
  try:
      // result  →  rest
      rest
   |
26 |           let new_result = string.repeat(first_value.1, count) + result
   |                                                                  ^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:27:35
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
27 |           let new_n = n - count * first_value.0
   |                                   ^^^^^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
