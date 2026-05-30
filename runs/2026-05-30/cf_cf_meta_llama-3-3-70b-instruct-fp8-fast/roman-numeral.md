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
  let values = list.from_list([1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1])
  let symbols = list.from_list(["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"])
  let pairs = list.zip(values, symbols)
  in
  let rec loop(n: Int, pairs: List[(Int, String)], result: String) -> String = 
    if list.is_empty(pairs) then result
    else 
      let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
      let count = n / value
      let new_n = n % value
      let new_result = string.repeat(symbol, count) + result
      let new_pairs = list.drop(pairs, 1)
      in loop(new_n, new_pairs, new_result)
  in loop(n, pairs, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-0.almd:6:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
6 |   let rec loop(n: Int, pairs: List[(Int, String)], result: String) -> String =
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:9:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |       let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
  |       ^^^
error: 'loop' is not valid in Almide at line 14:7
  --> /tmp/dojo-roman-numeral-0.almd:14:7
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
14 |       loop(new_n, new_pairs, new_result)
   |       ^
error[E002]: undefined function 'list.from_list'
  --> /tmp/dojo-roman-numeral-0.almd:2:83
  in call to list.from_list()
  hint: No function 'from_list' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   let values = list.from_list([1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1])
  |                                                                                   ^
error[E002]: undefined function 'list.from_list'
  --> /tmp/dojo-roman-numeral-0.almd:3:99
  in call to list.from_list()
  hint: No function 'from_list' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
3 |   let symbols = list.from_list(["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"])
  |                                                                                                   ^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:10:23
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
   |
10 |       let count = n / value
   |                       ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:11:23
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
   |
11 |       let new_n = n % value
   |                       ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:12:38
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
12 |       let new_result = string.repeat(symbol, count) + result
   |                                      ^^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-0.almd:12:55
  in variable result
  hint: Check the variable name
   |
12 |       let new_result = string.repeat(symbol, count) + result
   |                                                       ^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:13:40
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
13 |       let new_pairs = list.drop(pairs, 1)
   |                                        ^

10 error(s) found
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
  in 
  loop(n, pairs, "")

fn loop(n: Int, pairs: List[(Int, String)], result: String) -> String = 
  if list.is_empty(pairs) then result
  else 
    let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
    let count = n / value
    let new_n = n % value
    let new_result = string.repeat(symbol, count) + result
    let new_pairs = list.drop(pairs, 1)
    in loop(new_n, new_pairs, new_result)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'loop' is not valid in Almide at line 6:3
  --> /tmp/dojo-roman-numeral-1.almd:6:3
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
  |
6 |   loop(n, pairs, "")
  |   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:11:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |     let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
   |     ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:4:32
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
4 |   let pairs = list.zip(values, symbols)
  |                                ^^^^^^^

3 error(s) found
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
  in 
  loop(n, pairs, "")

fn loop(n: Int, pairs: List[(Int, String)], result: String) -> String = 
  if list.is_empty(pairs) then 
    result
  else 
    let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
    let count = n / value
    let new_n = n % value
    let new_result = string.repeat(symbol, count) + result
    let new_pairs = list.drop(pairs, 1)
    in 
    loop(new_n, new_pairs, new_result)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'loop' is not valid in Almide at line 6:3
  --> /tmp/dojo-roman-numeral-2.almd:6:3
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
  |
6 |   loop(n, pairs, "")
  |   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:12:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |     let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
   |     ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:4:32
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
4 |   let pairs = list.zip(values, symbols)
  |                                ^^^^^^^

3 error(s) found
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
  in 
  loop(n, pairs, "")

fn loop(n: Int, pairs: List[(Int, String)], result: String) -> String = 
  if list.is_empty(pairs) then 
    result
  else 
    {
      let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
      let count = n / value
      let new_n = n % value
      let new_result = string.repeat(symbol, count) + result
      let new_pairs = list.drop(pairs, 1)
      loop(new_n, new_pairs, new_result)
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'loop' is not valid in Almide at line 6:3
  --> /tmp/dojo-roman-numeral-3.almd:6:3
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
  |
6 |   loop(n, pairs, "")
  |   ^
error: 'loop' is not valid in Almide at line 18:7
  --> /tmp/dojo-roman-numeral-3.almd:18:7
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
18 |       loop(new_n, new_pairs, new_result)
   |       ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:4:32
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
4 |   let pairs = list.zip(values, symbols)
  |                                ^^^^^^^
error[E001]: type mismatch in if branches: expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:17:40
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce String. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: String) -> String = if cond then step(<update>) else x
   |
17 |       let new_pairs = list.drop(pairs, 1)
   |                                        ^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
