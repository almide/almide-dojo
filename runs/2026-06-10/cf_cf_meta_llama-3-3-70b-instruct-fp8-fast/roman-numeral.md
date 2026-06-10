# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let roman_values = list.map(
    [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), 
     (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), 
     (5, "V"), (4, "IV"), (1, "I")],
    (x) => x
  )
  in
  let rec convert(n: Int, values: List[(Int, String)]) -> String = 
    if list.is_empty(values) then 
      ""
    else 
      let (value, symbol) = list.first(values) |> option.unwrap_or((0, ""))
      in
      let count = int.clamp(int.div(n, value), 0, int.max_value)
      in
      let rest = int.sub(n, int.mul(count, value))
      in
      string.repeat(symbol, count) + convert(rest, list.drop(values, 1))
  in
  convert(n, roman_values)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-0.almd:9:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
9 |   let rec convert(n: Int, values: List[(Int, String)]) -> String =
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:13:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |       let (value, symbol) = list.first(values) |> option.unwrap_or((0, ""))
   |       ^^^
error: Expected expression at line 20:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-0.almd:20:3
   |
20 |   in
   |   ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:15:40
  in variable value
  hint: Check the variable name
   |
15 |       let count = int.clamp(int.div(n, value), 0, int.max_value)
   |                                        ^^^^^
error[E002]: undefined function 'int.div'
  --> /tmp/dojo-roman-numeral-0.almd:15:40
  in call to int.div()
  hint: Did you mean `int.min`?
  try:
      // int.div(...)  →  int.min(...)
      int.min(...)
   |
15 |       let count = int.clamp(int.div(n, value), 0, int.max_value)
   |                                        ^^^^^
error[E003]: undefined variable 'int'
  --> /tmp/dojo-roman-numeral-0.almd:15:51
  in variable int
  hint: Did you mean `n`?
  try:
      // int  →  n
      n
   |
15 |       let count = int.clamp(int.div(n, value), 0, int.max_value)
   |                                                   ^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:17:44
  in variable value
  hint: Check the variable name
   |
17 |       let rest = int.sub(n, int.mul(count, value))
   |                                            ^^^^^
error[E002]: undefined function 'int.mul'
  --> /tmp/dojo-roman-numeral-0.almd:17:44
  in call to int.mul()
  hint: Did you mean `int.max`?
  try:
      // int.mul(...)  →  int.max(...)
      int.max(...)
   |
17 |       let rest = int.sub(n, int.mul(count, value))
   |                                            ^^^^^
error[E002]: undefined function 'int.sub'
  --> /tmp/dojo-roman-numeral-0.almd:17:44
  in call to int.sub()
  hint: No function 'sub' in module 'int'. See docs/CHEATSHEET.md for available functions
   |
17 |       let rest = int.sub(n, int.mul(count, value))
   |                                            ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:19:21
  in variable symbol
  hint: Check the variable name
   |
19 |       string.repeat(symbol, count) + convert(rest, list.drop(values, 1))
   |                     ^^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-0.almd:19:62
  in variable values
  hint: Check the variable name
   |
19 |       string.repeat(symbol, count) + convert(rest, list.drop(values, 1))
   |                                                              ^^^^^^
error[E002]: undefined function 'convert'
  --> /tmp/dojo-roman-numeral-0.almd:19:70
  in call to convert()
  hint: Check the function name
   |
19 |       string.repeat(symbol, count) + convert(rest, list.drop(values, 1))
   |                                                                      ^
error[E002]: undefined function 'convert'
  --> /tmp/dojo-roman-numeral-0.almd:21:14
  in call to convert()
  hint: Check the function name
   |
21 |   convert(n, roman_values)
   |              ^^^^^^^^^^^^

13 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let roman_values = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), 
                     (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), 
                     (5, "V"), (4, "IV"), (1, "I")]
  in
  fn convert(n: Int, values: List[(Int, String)]) -> String = 
    if list.is_empty(values) then 
      ""
    else 
      let (value, symbol) = list.first(values) |> option.unwrap_or((0, ""))
      in
      let count = int.clamp(n / value, 0, int.max_value)
      in
      let rest = n - count * value
      in
      string.repeat(symbol, count) + convert(rest, list.drop(values, 1))
  in
  convert(n, roman_values)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:10:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |       let (value, symbol) = list.first(values) |> option.unwrap_or((0, ""))
   |       ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:4:47
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
4 |                      (5, "V"), (4, "IV"), (1, "I")]
  |                                               ^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let roman_values = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), 
                     (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), 
                     (5, "V"), (4, "IV"), (1, "I")]
  in
  {
    fn convert(n: Int, values: List[(Int, String)]) -> String = 
      if list.is_empty(values) then 
        ""
      else 
        let (value, symbol) = list.first(values) 
        in
        let count = int.clamp(n / value, 0, int.max_value)
        in
        let rest = n - count * value
        in
        string.repeat(symbol, count) + convert(rest, list.drop(values, 1))
    convert(n, roman_values)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 7:5 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-2.almd:7:5
  |
7 |     fn convert(n: Int, values: List[(Int, String)]) -> String =
  |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:11:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |         let (value, symbol) = list.first(values)
   |         ^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:13:35
  in variable value
  hint: Check the variable name
   |
13 |         let count = int.clamp(n / value, 0, int.max_value)
   |                                   ^^^^^
error[E003]: undefined variable 'int'
  --> /tmp/dojo-roman-numeral-2.almd:13:45
  in variable int
  hint: Did you mean `n`?
  try:
      // int  →  n
      n
   |
13 |         let count = int.clamp(n / value, 0, int.max_value)
   |                                             ^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:15:32
  in variable value
  hint: Check the variable name
   |
15 |         let rest = n - count * value
   |                                ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:17:23
  in variable symbol
  hint: Check the variable name
   |
17 |         string.repeat(symbol, count) + convert(rest, list.drop(values, 1))
   |                       ^^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-2.almd:17:64
  in variable values
  hint: Check the variable name
   |
17 |         string.repeat(symbol, count) + convert(rest, list.drop(values, 1))
   |                                                                ^^^^^^
error[E002]: undefined function 'convert'
  --> /tmp/dojo-roman-numeral-2.almd:17:72
  in call to convert()
  hint: Check the function name
   |
17 |         string.repeat(symbol, count) + convert(rest, list.drop(values, 1))
   |                                                                        ^
error[E002]: undefined function 'convert'
  --> /tmp/dojo-roman-numeral-2.almd:18:16
  in call to convert()
  hint: Check the function name
   |
18 |     convert(n, roman_values)
   |                ^^^^^^^^^^^^

9 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let roman_values = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), 
                     (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), 
                     (5, "V"), (4, "IV"), (1, "I")]
  in
  {
    fn convert(m: Int, values: List[(Int, String)]) -> String = 
      if list.is_empty(values) then 
        ""
      else 
        let first_value = list.first(values) 
        in
        let (value, symbol) = first_value 
        in
        let count = int.clamp(m / value, 0, 3999)
        in
        let rest = m - count * value
        in
        string.repeat(symbol, count) + convert(rest, list.drop(values, 1))
    convert(n, roman_values)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 7:5 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-3.almd:7:5
  |
7 |     fn convert(m: Int, values: List[(Int, String)]) -> String =
  |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:11:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |         let first_value = list.first(values)
   |         ^^^
error: Expected expression at line 14:9 (got In 'in')
  --> /tmp/dojo-roman-numeral-3.almd:14:9
   |
14 |         in
   |         ^
error[E003]: undefined variable 'first_value'
  --> /tmp/dojo-roman-numeral-3.almd:13:31
  in variable first_value
  hint: Check the variable name
   |
13 |         let (value, symbol) = first_value
   |                               ^^^^^^^^^^^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-roman-numeral-3.almd:15:31
  in variable m
  hint: Did you mean `n`?
  try:
      // m  →  n
      n
   |
15 |         let count = int.clamp(m / value, 0, 3999)
   |                               ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-roman-numeral-3.almd:17:20
  in variable m
  hint: Did you mean `n`?
  try:
      // m  →  n
      n
   |
17 |         let rest = m - count * value
   |                    ^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-3.almd:19:64
  in variable values
  hint: Did you mean `value`?
  try:
      // values  →  value
      value
   |
19 |         string.repeat(symbol, count) + convert(rest, list.drop(values, 1))
   |                                                                ^^^^^^
error[E002]: undefined function 'convert'
  --> /tmp/dojo-roman-numeral-3.almd:19:72
  in call to convert()
  hint: Check the function name
   |
19 |         string.repeat(symbol, count) + convert(rest, list.drop(values, 1))
   |                                                                        ^
error[E002]: undefined function 'convert'
  --> /tmp/dojo-roman-numeral-3.almd:20:16
  in call to convert()
  hint: Check the function name
   |
20 |     convert(n, roman_values)
   |                ^^^^^^^^^^^^

9 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
