# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

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
  ]
  in
    let rec loop(n: Int, numerals: List[(Int, String)], result: String) -> String = 
      if n == 0 then result
      else
        let (value, symbol) = list.first(numerals) |> option.unwrap_or((0, ""))
        in
          if n >= value then loop(n - value, numerals, result + symbol)
          else loop(n, list.drop(numerals, 1), result)
    in
      loop(n, roman_numerals, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-0.almd:18:9
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
   |
18 |     let rec loop(n: Int, numerals: List[(Int, String)], result: String) -> String =
   |         ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:21:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
21 |         let (value, symbol) = list.first(numerals) |> option.unwrap_or((0, ""))
   |         ^^^
error: 'loop' is not valid in Almide at line 23:30
  --> /tmp/dojo-roman-numeral-0.almd:23:30
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
23 |           if n >= value then loop(n - value, numerals, result + symbol)
   |                              ^
error: 'loop' is not valid in Almide at line 26:7
  --> /tmp/dojo-roman-numeral-0.almd:26:7
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
26 |       loop(n, roman_numerals, "")
   |       ^
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

5 error(s) found
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
  ]
  in
    fn loop(n: Int, numerals: List[(Int, String)], result: String) -> String = 
      if n == 0 then result
      else
        let (value, symbol) = list.first(numerals) |> option.unwrap_or((0, ""))
        in
          if n >= value then loop(n - value, numerals, result + symbol)
          else loop(n, list.drop(numerals, 1), result)
    in
      loop(n, roman_numerals, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:21:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
21 |         let (value, symbol) = list.first(numerals) |> option.unwrap_or((0, ""))
   |         ^^^
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
    fn loop(n: Int, numerals: List[(Int, String)], result: String) -> String = 
      if n == 0 then result
      else
        let first = list.first(numerals) |> option.unwrap_or((0, ""))
        in
          if n >= first.0 then loop(n - first.0, numerals, result + first.1)
          else loop(n, list.drop(numerals, 1), result)
    loop(n, roman_numerals, "")
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 19:5 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-2.almd:19:5
   |
19 |     fn loop(n: Int, numerals: List[(Int, String)], result: String) -> String =
   |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:22:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
22 |         let first = list.first(numerals) |> option.unwrap_or((0, ""))
   |         ^^^
error: 'loop' is not valid in Almide at line 24:32
  --> /tmp/dojo-roman-numeral-2.almd:24:32
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
24 |           if n >= first.0 then loop(n - first.0, numerals, result + first.1)
   |                                ^
error: 'loop' is not valid in Almide at line 26:5
  --> /tmp/dojo-roman-numeral-2.almd:26:5
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
26 |     loop(n, roman_numerals, "")
   |     ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:18:3
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
18 |   {
   |   ^

5 error(s) found
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
  list.fold(roman_numerals, (n, ""), (acc, x) => 
    if acc.0 == 0 then acc.1
    else if acc.0 >= x.0 then list.fold(list.range(0, acc.0 / x.0), (acc.0, acc.1), (a, b) => (a.0 - x.0, a.1 + x.1))
    else list.fold(list.range(0, 1), acc, (a, b) => (a.0, a.1)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error[E001]: type mismatch in fn 'to_roman': expected String but got (Int, String)
  --> /tmp/dojo-roman-numeral-3.almd:21:59
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
   |
21 |     else list.fold(list.range(0, 1), acc, (a, b) => (a.0, a.1)))
   |                                                           ^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
