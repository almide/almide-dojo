# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

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
      let count = int.clamp(n / value, 0, n / value)
      let rest = n - count * value
      let rest_pairs = list.drop(pairs, 1)
      loop(rest, rest_pairs, acc + string.repeat(symbol, count))
  in loop(n, pairs, "")
```

**Diagnostic:**

```
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-0.almd:5:7
  in let rec
  here: let rec loop(n: Int, pairs: List[(Int, String)], acc: String) -> String =
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
  here: let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
  |       ^^^
error: Expected expression at line 13:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-0.almd:13:3
  here: in loop(n, pairs, "")
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |   in loop(n, pairs, "")
   |   ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:9:33
  in variable value
  here: let count = int.clamp(n / value, 0, n / value)
  hint: Did you mean `values`?
  try:
      values
  |
9 |       let count = int.clamp(n / value, 0, n / value)
  |                                 ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:9:47
  in variable value
  here: let count = int.clamp(n / value, 0, n / value)
  hint: Did you mean `values`?
  try:
      values
  |
9 |       let count = int.clamp(n / value, 0, n / value)
  |                                               ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:10:30
  in variable value
  here: let rest = n - count * value
  hint: Did you mean `values`?
  try:
      values
   |
10 |       let rest = n - count * value
   |                              ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:12:30
  in variable acc
  here: loop(rest, rest_pairs, acc + string.repeat(symbol, count))
  hint: Check the variable name
   |
12 |       loop(rest, rest_pairs, acc + string.repeat(symbol, count))
   |                              ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:12:50
  in variable symbol
  here: loop(rest, rest_pairs, acc + string.repeat(symbol, count))
  hint: Did you mean `symbols`?
  try:
      symbols
   |
12 |       loop(rest, rest_pairs, acc + string.repeat(symbol, count))
   |                                                  ^^^^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-roman-numeral-0.almd:12:58
  in call to loop()
  here: loop(rest, rest_pairs, acc + string.repeat(symbol, count))
  hint: Check the function name
   |
12 |       loop(rest, rest_pairs, acc + string.repeat(symbol, count))
   |                                                          ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:12:58
  in fn 'to_roman'
  here: loop(rest, rest_pairs, acc + string.repeat(symbol, count))
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
12 |       loop(rest, rest_pairs, acc + string.repeat(symbol, count))
   |                                                          ^^^^^

10 error(s) found
FAILED: /tmp/dojo-roman-numeral-0.almd
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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
      let count = int.clamp(n / value, 0, n / value)
      let rest = n - count * value
      let rest_pairs = list.drop(pairs, 1)
      loop(rest, rest_pairs, acc + string.repeat(symbol, count))
  in loop(n, pairs, "")
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:8:7
  in let-in
  here: let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
  |       ^^^
error: 'let' is not an expression in Almide at line 8:7
  --> /tmp/dojo-roman-numeral-1.almd:8:7
  here: let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |       let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
  |       ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:4:32
  in fn 'to_roman'
  here: let pairs = list.zip(values, symbols)
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

3 error(s) found
FAILED: /tmp/dojo-roman-numeral-1.almd
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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
          let first_pair = list.first(pairs) |> option.unwrap_or((0, ""))
          let (value, symbol) = first_pair
          let count = int.clamp(n / value, 0, n / value)
          let rest = n - count * value
          let rest_pairs = list.drop(pairs, 1)
          loop(rest, rest_pairs, acc + string.repeat(symbol, count))
        }
    loop(n, pairs, "")
  }
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-roman-numeral-2.almd:6:5
  in nested fn
  here: fn loop(n: Int, pairs: List[(Int, String)], acc: String) -> String =
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
6 |     fn loop(n: Int, pairs: List[(Int, String)], acc: String) -> String =
  |     ^^

1 error(s) found
FAILED: /tmp/dojo-roman-numeral-2.almd
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (PASS)

```almide
fn loop(n: Int, pairs: List[(Int, String)], acc: String) -> String = 
  if list.is_empty(pairs) then acc
  else 
    {
      let first_pair = list.first(pairs) |> option.unwrap_or((0, ""))
      let (value, symbol) = first_pair
      let count = int.clamp(n / value, 0, n / value)
      let rest = n - count * value
      let rest_pairs = list.drop(pairs, 1)
      loop(rest, rest_pairs, acc + string.repeat(symbol, count))
    }

fn to_roman(n: Int) -> String = 
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  let pairs = list.zip(values, symbols)
  loop(n, pairs, "")
```
