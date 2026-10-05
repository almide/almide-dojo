# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  let pairs = list.zip(values, symbols)
  let rec loop(n: Int, pairs: List[(Int, String)], acc: String) -> String = 
    if n == 0 then acc
    else 
      let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
      let count = int.clamp(n / value, 0, n)
      let new_n = n - count * value
      let new_acc = string.repeat(symbol, count) + acc
      let new_pairs = list.drop(pairs, 1)
      loop(new_n, new_pairs, new_acc)
  loop(n, pairs, "")
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
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:9:33
  in variable value
  here: let count = int.clamp(n / value, 0, n)
  hint: Did you mean `values`?
  try:
      values
  |
9 |       let count = int.clamp(n / value, 0, n)
  |                                 ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:10:31
  in variable value
  here: let new_n = n - count * value
  hint: Did you mean `values`?
  try:
      values
   |
10 |       let new_n = n - count * value
   |                               ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:11:35
  in variable symbol
  here: let new_acc = string.repeat(symbol, count) + acc
  hint: Did you mean `symbols`?
  try:
      symbols
   |
11 |       let new_acc = string.repeat(symbol, count) + acc
   |                                   ^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:11:52
  in variable acc
  here: let new_acc = string.repeat(symbol, count) + acc
  hint: Check the variable name
   |
11 |       let new_acc = string.repeat(symbol, count) + acc
   |                                                    ^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-roman-numeral-0.almd:13:7
  in call to loop()
  here: loop(new_n, new_pairs, new_acc)
  hint: Check the function name
   |
13 |       loop(new_n, new_pairs, new_acc)
   |       ^^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-roman-numeral-0.almd:14:3
  in call to loop()
  here: loop(n, pairs, "")
  hint: Check the function name
   |
14 |   loop(n, pairs, "")
   |   ^^^^

8 error(s) found
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
    if n == 0 then acc
    else 
      let first_pair = list.first(pairs) |> option.unwrap_or((0, ""))
      let count = n / first_pair.0
      let new_n = n - count * first_pair.0
      let new_acc = string.repeat(first_pair.1, count) + acc
      let new_pairs = list.drop(pairs, 1)
      loop(new_n, new_pairs, new_acc)
  loop(n, pairs, "")
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:8:7
  in let-in
  here: let first_pair = list.first(pairs) |> option.unwrap_or((0, ""))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let first_pair = list.first(pairs) |> option.unwrap_or((0, ""))
  |       ^^^
error: 'let' is not an expression in Almide at line 8:7
  --> /tmp/dojo-roman-numeral-1.almd:8:7
  here: let first_pair = list.first(pairs) |> option.unwrap_or((0, ""))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |       let first_pair = list.first(pairs) |> option.unwrap_or((0, ""))
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
      if n == 0 then acc
      else 
        {
          let first_pair = list.first(pairs) |> option.unwrap_or((0, ""))
          let count = n / first_pair.0
          let new_n = n - count * first_pair.0
          let new_acc = string.repeat(first_pair.1, count) + acc
          let new_pairs = list.drop(pairs, 1)
          loop(new_n, new_pairs, new_acc)
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

### Attempt 4 (FAIL)

```almide
fn loop(n: Int, pairs: List[(Int, String)], acc: String) -> String = 
  if n == 0 then acc
  else 
    {
      let first_pair = list.first(pairs) |> option.unwrap_or((0, ""))
      let count = n / first_pair.0
      let new_n = n - count * first_pair.0
      let new_acc = string.repeat(first_pair.1, count) + acc
      let new_pairs = list.drop(pairs, 1)
      loop(new_n, new_pairs, new_acc)
    }

fn to_roman(n: Int) -> String = 
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  let pairs = list.zip(values, symbols)
  loop(n, pairs, "")
```

**Diagnostic:**

```
FAILED: /tmp/dojo-roman-numeral-3.almd
  test: to_roman 14
  at:   /tmp/dojo-roman-numeral-3.almd:59
  expected: "XIV"
  found:    "IVX"
  test: to_roman 42
  at:   /tmp/dojo-roman-numeral-3.almd:63
  expected: "XLII"
  found:    "IIXL"
  test: to_roman 99
  at:   /tmp/dojo-roman-numeral-3.almd:67
  expected: "XCIX"
  found:    "IXXC"
  test: to_roman 399
  at:   /tmp/dojo-roman-numeral-3.almd:71
  expected: "CCCXCIX"
  found:    "IXXCCCC"
  test: to_roman 1994
  at:   /tmp/dojo-roman-numeral-3.almd:79
  expected: "MCMXCIV"
  found:    "IVXCCMM"
  test: to_roman 3999
  at:   /tmp/dojo-roman-numeral-3.almd:83
  expected: "MMMCMXCIX"
  found:    "IXXCCMMMM"

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
