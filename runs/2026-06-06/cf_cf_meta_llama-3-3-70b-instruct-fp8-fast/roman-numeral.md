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
      let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
      let count = n / value
      let rest = n % value
      let new_acc = string.repeat(symbol, count) + acc
      loop(rest, list.drop(pairs, 1), new_acc)
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
8 |       let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
  |       ^^^
error: 'loop' is not valid in Almide at line 12:7
  --> /tmp/dojo-roman-numeral-0.almd:12:7
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
12 |       loop(rest, list.drop(pairs, 1), new_acc)
   |       ^
error: 'loop' is not valid in Almide at line 13:3
  --> /tmp/dojo-roman-numeral-0.almd:13:3
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
13 |   loop(n, pairs, "")
   |   ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:9:23
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
9 |       let count = n / value
  |                       ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:10:22
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
   |
10 |       let rest = n % value
   |                      ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:11:35
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
11 |       let new_acc = string.repeat(symbol, count) + acc
   |                                   ^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:11:52
  in variable acc
  hint: Check the variable name
   |
11 |       let new_acc = string.repeat(symbol, count) + acc
   |                                                    ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:11:52
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
11 |       let new_acc = string.repeat(symbol, count) + acc
   |                                                    ^^^

9 error(s) found
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
      let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
      let count = n / value
      let rest = n % value
      let new_acc = string.repeat(symbol, count) + acc
      loop(rest, list.drop(pairs, 1), new_acc)
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
8 |       let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
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
        {
          let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
          let count = n / value
          let rest = n % value
          let new_acc = string.repeat(symbol, count) + acc
          loop(rest, list.drop(pairs, 1), new_acc)
        }
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
error: 'loop' is not valid in Almide at line 14:11
  --> /tmp/dojo-roman-numeral-2.almd:14:11
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
14 |           loop(rest, list.drop(pairs, 1), new_acc)
   |           ^
error: 'loop' is not valid in Almide at line 16:5
  --> /tmp/dojo-roman-numeral-2.almd:16:5
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
16 |     loop(n, pairs, "")
   |     ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:7:36
  in variable acc
  hint: Check the variable name
  |
7 |       if list.is_empty(pairs) then acc
  |                                    ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:13:56
  in variable acc
  hint: Check the variable name
   |
13 |           let new_acc = string.repeat(symbol, count) + acc
   |                                                        ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:13:56
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
13 |           let new_acc = string.repeat(symbol, count) + acc
   |                                                        ^^^

6 error(s) found
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
      {
        let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
        let count = n / value
        let rest = n % value
        let new_acc = string.repeat(symbol, count) + acc
        loop(rest, list.drop(pairs, 1), new_acc)
      }
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
error: 'loop' is not valid in Almide at line 13:9
  --> /tmp/dojo-roman-numeral-3.almd:13:9
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
13 |         loop(rest, list.drop(pairs, 1), new_acc)
   |         ^
error: 'loop' is not valid in Almide at line 15:3
  --> /tmp/dojo-roman-numeral-3.almd:15:3
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
15 |   loop(n, pairs, "")
   |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:6:34
  in variable acc
  hint: Check the variable name
  |
6 |     if list.is_empty(pairs) then acc
  |                                  ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:12:54
  in variable acc
  hint: Check the variable name
   |
12 |         let new_acc = string.repeat(symbol, count) + acc
   |                                                      ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:12:54
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
12 |         let new_acc = string.repeat(symbol, count) + acc
   |                                                      ^^^

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
