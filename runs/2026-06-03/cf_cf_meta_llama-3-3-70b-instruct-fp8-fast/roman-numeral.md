# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = list.of_list([
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
  ])
  in
  let rec loop(n: Int, symbols: List[(Int, String)], result: String) -> String = 
    if list.is_empty(symbols) then result
    else 
      let (value, symbol) = list.first(symbols) |> option.unwrap_or((0, ""))
      in
      if n >= value 
      then loop(n - value, symbols, result + symbol)
      else loop(n, list.drop(symbols, 1), result)
  in
  loop(n, symbols, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-0.almd:18:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
   |
18 |   let rec loop(n: Int, symbols: List[(Int, String)], result: String) -> String =
   |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:21:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
21 |       let (value, symbol) = list.first(symbols) |> option.unwrap_or((0, ""))
   |       ^^^
error: 'loop' is not valid in Almide at line 24:12
  --> /tmp/dojo-roman-numeral-0.almd:24:12
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
24 |       then loop(n - value, symbols, result + symbol)
   |            ^
error: 'loop' is not valid in Almide at line 27:3
  --> /tmp/dojo-roman-numeral-0.almd:27:3
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
27 |   loop(n, symbols, "")
   |   ^
error[E002]: undefined function 'list.of_list'
  --> /tmp/dojo-roman-numeral-0.almd:15:9
  in call to list.of_list()
  hint: No function 'of_list' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
15 |     (1, "I")
   |         ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:15:9
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
15 |     (1, "I")
   |         ^^^

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
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
  in
  let rec loop(n: Int, symbols: List[(Int, String)], result: String) -> String = 
    if list.is_empty(symbols) then result
    else 
      let (value, symbol) = list.first(symbols) |> option.unwrap_or((0, ""))
      in
      if n >= value 
      then loop(n - value, symbols, result + symbol)
      else loop(n, list.drop(symbols, 1), result)
  in
  loop(n, symbols, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-1.almd:18:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
   |
18 |   let rec loop(n: Int, symbols: List[(Int, String)], result: String) -> String =
   |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:21:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
21 |       let (value, symbol) = list.first(symbols) |> option.unwrap_or((0, ""))
   |       ^^^
error: 'loop' is not valid in Almide at line 24:12
  --> /tmp/dojo-roman-numeral-1.almd:24:12
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
24 |       then loop(n - value, symbols, result + symbol)
   |            ^
error: 'loop' is not valid in Almide at line 27:3
  --> /tmp/dojo-roman-numeral-1.almd:27:3
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
27 |   loop(n, symbols, "")
   |   ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:15:9
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
15 |     (1, "I")
   |         ^^^

5 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
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
  in
  fn loop(n: Int, symbols: List[(Int, String)], result: String) -> String = 
    if list.is_empty(symbols) then result
    else 
      let (value, symbol) = list.first(symbols) |> option.unwrap_or((0, ""))
      in
      if n >= value 
      then loop(n - value, symbols, result + symbol)
      else loop(n, list.drop(symbols, 1), result)
  in
  loop(n, symbols, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:21:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
21 |       let (value, symbol) = list.first(symbols) |> option.unwrap_or((0, ""))
   |       ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:15:9
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let symbols = ...` (a statement, returns Unit).
      // Add `symbols` as the trailing expression so the fn returns String:
      //
      //   let symbols = <computation>
      //   symbols                         // <-- add this line
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
  in
  {
    fn loop(n: Int, symbols: List[(Int, String)], result: String) -> String = 
      if list.is_empty(symbols) then result
      else 
        {
          let (value, symbol) = list.first(symbols) |> option.unwrap_or((0, ""))
          in
          if n >= value 
          then loop(n - value, symbols, result + symbol)
          else loop(n, list.drop(symbols, 1), result)
        }
    loop(n, symbols, "")
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 19:5 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-3.almd:19:5
   |
19 |     fn loop(n: Int, symbols: List[(Int, String)], result: String) -> String =
   |     ^
error: Expected expression at line 24:11 (got In 'in')
  --> /tmp/dojo-roman-numeral-3.almd:24:11
   |
24 |           in
   |           ^
error: 'loop' is not valid in Almide at line 26:16
  --> /tmp/dojo-roman-numeral-3.almd:26:16
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
26 |           then loop(n - value, symbols, result + symbol)
   |                ^
error: 'loop' is not valid in Almide at line 29:5
  --> /tmp/dojo-roman-numeral-3.almd:29:5
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
29 |     loop(n, symbols, "")
   |     ^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-3.almd:20:38
  in variable result
  hint: Check the variable name
   |
20 |       if list.is_empty(symbols) then result
   |                                      ^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:23:77
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
23 |           let (value, symbol) = list.first(symbols) |> option.unwrap_or((0, ""))
   |                                                                             ^^

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
