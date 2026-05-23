# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let pairs = list.of(
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
  )
  in
  let rec loop(n: Int, pairs: List[(Int, String)], acc: String) -> String = 
    if list.is_empty(pairs) then acc
    else 
      let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
      in
      if n >= value then 
        loop(n - value, pairs, acc + symbol)
      else 
        loop(n, list.drop(pairs, 1), acc)
  in
  loop(n, pairs, "")
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
18 |   let rec loop(n: Int, pairs: List[(Int, String)], acc: String) -> String =
   |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:21:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
21 |       let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
   |       ^^^
error: 'loop' is not valid in Almide at line 24:9
  --> /tmp/dojo-roman-numeral-0.almd:24:9
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
24 |         loop(n - value, pairs, acc + symbol)
   |         ^
error: 'loop' is not valid in Almide at line 26:9
  --> /tmp/dojo-roman-numeral-0.almd:26:9
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
26 |         loop(n, list.drop(pairs, 1), acc)
   |         ^
error: 'loop' is not valid in Almide at line 28:3
  --> /tmp/dojo-roman-numeral-0.almd:28:3
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
28 |   loop(n, pairs, "")
   |   ^
error[E002]: undefined function 'list.of'
  --> /tmp/dojo-roman-numeral-0.almd:15:9
  in call to list.of()
  hint: Did you mean `list.pop`?
  try:
      // list.of(...)  →  list.pop(...)
      list.pop(...)
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

7 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let pairs = [
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
  fn loop(n: Int, pairs: List[(Int, String)], acc: String) -> String = 
    if list.is_empty(pairs) then acc
    else 
      let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
      in
      if n >= value then 
        loop(n - value, pairs, acc + symbol)
      else 
        loop(n, list.drop(pairs, 1), acc)
  in
  loop(n, pairs, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:21:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
21 |       let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
   |       ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:15:9
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let pairs = ...` (a statement, returns Unit).
      // Add `pairs` as the trailing expression so the fn returns String:
      //
      //   let pairs = <computation>
      //   pairs                         // <-- add this line
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
  {
    let pairs = [
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
    let loop = (n: Int, pairs: List[(Int, String)], acc: String) -> String = 
      if list.is_empty(pairs) then acc
      else 
        let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
        in
        if n >= value then 
          loop(n - value, pairs, acc + symbol)
        else 
          loop(n, list.drop(pairs, 1), acc)
    in
    loop(n, pairs, "")
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected ')' to close parenthesized expression opened at line 18:16
  --> /tmp/dojo-roman-numeral-2.almd:18:18
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
18 |     let loop = (n: Int, pairs: List[(Int, String)], acc: String) -> String =
   |                --------------- '(' opened here
   |
18 |     let loop = (n: Int, pairs: List[(Int, String)], acc: String) -> String =
   |                  ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:21:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
21 |         let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
   |         ^^^
error: 'loop' is not valid in Almide at line 24:11
  --> /tmp/dojo-roman-numeral-2.almd:24:11
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
24 |           loop(n - value, pairs, acc + symbol)
   |           ^
error: 'loop' is not valid in Almide at line 26:11
  --> /tmp/dojo-roman-numeral-2.almd:26:11
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
26 |           loop(n, list.drop(pairs, 1), acc)
   |           ^
error: 'loop' is not valid in Almide at line 28:5
  --> /tmp/dojo-roman-numeral-2.almd:28:5
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
28 |     loop(n, pairs, "")
   |     ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:16:11
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
16 |       (1, "I")
   |           ^^^

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  {
    let pairs = list.from_list([
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
    let rec loop = (n: Int, pairs: List[(Int, String)], acc: String) -> String = 
      if list.is_empty(pairs) then acc
      else 
        let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
        in
        if n >= value then 
          loop(n - value, pairs, acc + symbol)
        else 
          loop(n, list.drop(pairs, 1), acc)
    in
    loop(n, pairs, "")
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-3.almd:18:9
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
   |
18 |     let rec loop = (n: Int, pairs: List[(Int, String)], acc: String) -> String =
   |         ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:21:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
21 |         let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
   |         ^^^
error: 'loop' is not valid in Almide at line 24:11
  --> /tmp/dojo-roman-numeral-3.almd:24:11
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
24 |           loop(n - value, pairs, acc + symbol)
   |           ^
error: 'loop' is not valid in Almide at line 26:11
  --> /tmp/dojo-roman-numeral-3.almd:26:11
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
26 |           loop(n, list.drop(pairs, 1), acc)
   |           ^
error: 'loop' is not valid in Almide at line 28:5
  --> /tmp/dojo-roman-numeral-3.almd:28:5
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
28 |     loop(n, pairs, "")
   |     ^
error[E002]: undefined function 'list.from_list'
  --> /tmp/dojo-roman-numeral-3.almd:16:11
  in call to list.from_list()
  hint: No function 'from_list' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
16 |       (1, "I")
   |           ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:16:11
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
16 |       (1, "I")
   |           ^^^

7 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
