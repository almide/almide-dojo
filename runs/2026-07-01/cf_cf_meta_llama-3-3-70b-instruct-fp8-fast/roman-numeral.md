# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  let pairs = list.zip(values, symbols)
  let rec loop(n: Int, pairs: List[(Int, String)], acc: String) -> String =
    if list.is_empty(pairs) then acc
    else 
      let (val, sym) = list.first(pairs) |> option.unwrap_or((0, ""))
      let rest = list.drop(pairs, 1)
      let count = int.clamp(n / val, 0, n)
      let str = string.repeat(sym, count)
      loop(n - count * val, rest, acc + str)
  loop(n, pairs, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-0.almd:5:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
5 |   let rec loop(n: Int, pairs: List[(Int, String)], acc: String) -> String =
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:8:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let (val, sym) = list.first(pairs) |> option.unwrap_or((0, ""))
  |       ^^^
error: 'loop' is not valid in Almide at line 12:7
  --> /tmp/dojo-roman-numeral-0.almd:12:7
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
12 |       loop(n - count * val, rest, acc + str)
   |       ^
error: 'loop' is not valid in Almide at line 13:3
  --> /tmp/dojo-roman-numeral-0.almd:13:3
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
13 |   loop(n, pairs, "")
   |   ^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-roman-numeral-0.almd:10:33
  in variable val
  hint: Check the variable name
   |
10 |       let count = int.clamp(n / val, 0, n)
   |                                 ^^^
error[E003]: undefined variable 'sym'
  --> /tmp/dojo-roman-numeral-0.almd:11:31
  in variable sym
  hint: Check the variable name
   |
11 |       let str = string.repeat(sym, count)
   |                               ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:11:36
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
11 |       let str = string.repeat(sym, count)
   |                                    ^^^^^

7 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  let pairs = list.zip(values, symbols)
  fn loop(n: Int, pairs: List[(Int, String)], acc: String) -> String =
    if list.is_empty(pairs) then acc
    else 
      let first_pair = list.first(pairs) |> option.unwrap_or((0, ""))
      let value = first_pair.0
      let symbol = first_pair.1
      let rest = list.drop(pairs, 1)
      let count = n / value
      let str = string.repeat(symbol, count)
      loop(n - count * value, rest, acc + str)
  loop(n, pairs, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:8:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let first_pair = list.first(pairs) |> option.unwrap_or((0, ""))
  |       ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:4:32
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
4 |   let pairs = list.zip(values, symbols)
  |                                ^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  let pairs = list.zip(values, symbols)
  {
    fn loop(n: Int, pairs: List[(Int, String)], acc: String) -> String =
      if list.is_empty(pairs) then acc
      else 
        let first_pair = list.first(pairs) |> option.unwrap_or((0, ""))
        let value = first_pair.0
        let symbol = first_pair.1
        let rest = list.drop(pairs, 1)
        let count = n / value
        let str = string.repeat(symbol, count)
        loop(n - count * value, rest, acc + str)
    loop(n, pairs, "")
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 6:5 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-2.almd:6:5
  |
6 |     fn loop(n: Int, pairs: List[(Int, String)], acc: String) -> String =
  |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:9:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |         let first_pair = list.first(pairs) |> option.unwrap_or((0, ""))
  |         ^^^
error: 'loop' is not valid in Almide at line 15:9
  --> /tmp/dojo-roman-numeral-2.almd:15:9
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
15 |         loop(n - count * value, rest, acc + str)
   |         ^
error: 'loop' is not valid in Almide at line 16:5
  --> /tmp/dojo-roman-numeral-2.almd:16:5
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
16 |     loop(n, pairs, "")
   |     ^
error[E003]: undefined variable 'first_pair'
  --> /tmp/dojo-roman-numeral-2.almd:10:21
  in variable first_pair
  hint: Check the variable name
   |
10 |         let value = first_pair.0
   |                     ^^^^^^^^^^
error[E003]: undefined variable 'first_pair'
  --> /tmp/dojo-roman-numeral-2.almd:11:22
  in variable first_pair
  hint: Check the variable name
   |
11 |         let symbol = first_pair.1
   |                      ^^^^^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:14:41
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
14 |         let str = string.repeat(symbol, count)
   |                                         ^^^^^

7 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  let pairs = list.zip(values, symbols)
  let rec loop(n: Int, pairs: List[(Int, String)], acc: String) -> String =
    if list.is_empty(pairs) then acc
    else 
      let first_pair = list.first(pairs) |> option.unwrap_or((0, ""))
      let value = first_pair.0
      let symbol = first_pair.1
      let rest = list.drop(pairs, 1)
      let count = n / value
      let str = string.repeat(symbol, count)
      loop(n - count * value, rest, acc + str)
  loop(n, pairs, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-3.almd:5:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
5 |   let rec loop(n: Int, pairs: List[(Int, String)], acc: String) -> String =
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:8:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let first_pair = list.first(pairs) |> option.unwrap_or((0, ""))
  |       ^^^
error: 'loop' is not valid in Almide at line 14:7
  --> /tmp/dojo-roman-numeral-3.almd:14:7
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
14 |       loop(n - count * value, rest, acc + str)
   |       ^
error: 'loop' is not valid in Almide at line 15:3
  --> /tmp/dojo-roman-numeral-3.almd:15:3
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
15 |   loop(n, pairs, "")
   |   ^
error[E003]: undefined variable 'first_pair'
  --> /tmp/dojo-roman-numeral-3.almd:9:19
  in variable first_pair
  hint: Check the variable name
  |
9 |       let value = first_pair.0
  |                   ^^^^^^^^^^
error[E003]: undefined variable 'first_pair'
  --> /tmp/dojo-roman-numeral-3.almd:10:20
  in variable first_pair
  hint: Check the variable name
   |
10 |       let symbol = first_pair.1
   |                    ^^^^^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:13:39
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
13 |       let str = string.repeat(symbol, count)
   |                                       ^^^^^

7 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
