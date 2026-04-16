# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  let pairs = list.zip(values, symbols)
  let rec helper(n: Int, pairs: List[(Int, String)], acc: String) -> String = 
    if list.is_empty(pairs) then acc
    else 
      let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
      let count = int.div(n, value)
      let rest = int.sub(n, int.mul(count, value))
      let rest_pairs = list.drop(pairs, 1)
      if count > 0 then 
        helper(rest, rest_pairs, acc + string.repeat(symbol, count))
      else 
        helper(n, rest_pairs, acc)
  in helper(n, pairs, "")
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
5 |   let rec helper(n: Int, pairs: List[(Int, String)], acc: String) -> String =
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:8:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
  |       ^^^
error: Expected expression at line 16:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-0.almd:16:3
   |
16 |   in helper(n, pairs, "")
   |   ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:9:30
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
9 |       let count = int.div(n, value)
  |                              ^^^^^
error[E002]: undefined function 'int.div'
  --> /tmp/dojo-roman-numeral-0.almd:9:30
  in call to int.div()
  hint: Did you mean `int.min`?
  try:
      // int.div(...)  →  int.min(...)
      int.min(...)
  |
9 |       let count = int.div(n, value)
  |                              ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:10:44
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
   |
10 |       let rest = int.sub(n, int.mul(count, value))
   |                                            ^^^^^
error[E002]: undefined function 'int.mul'
  --> /tmp/dojo-roman-numeral-0.almd:10:44
  in call to int.mul()
  hint: Did you mean `int.max`?
  try:
      // int.mul(...)  →  int.max(...)
      int.max(...)
   |
10 |       let rest = int.sub(n, int.mul(count, value))
   |                                            ^^^^^
error[E002]: undefined function 'int.sub'
  --> /tmp/dojo-roman-numeral-0.almd:10:44
  in call to int.sub()
  hint: No function 'sub' in module 'int'. See docs/CHEATSHEET.md for available functions
   |
10 |       let rest = int.sub(n, int.mul(count, value))
   |                                            ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:13:34
  in variable acc
  hint: Check the variable name
   |
13 |         helper(rest, rest_pairs, acc + string.repeat(symbol, count))
   |                                  ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:13:54
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
13 |         helper(rest, rest_pairs, acc + string.repeat(symbol, count))
   |                                                      ^^^^^^
error[E002]: undefined function 'helper'
  --> /tmp/dojo-roman-numeral-0.almd:13:62
  in call to helper()
  hint: Check the function name
   |
13 |         helper(rest, rest_pairs, acc + string.repeat(symbol, count))
   |                                                              ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:15:31
  in variable acc
  hint: Check the variable name
   |
15 |         helper(n, rest_pairs, acc)
   |                               ^^^
error[E002]: undefined function 'helper'
  --> /tmp/dojo-roman-numeral-0.almd:15:31
  in call to helper()
  hint: Check the function name
   |
15 |         helper(n, rest_pairs, acc)
   |                               ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:15:31
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
15 |         helper(n, rest_pairs, acc)
   |                               ^^^

14 error(s) found
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
  fn helper(n: Int, pairs: List[(Int, String)], acc: String) -> String = 
    if list.is_empty(pairs) then 
      acc
    else 
      let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
      let count = int.div(n, value)
      let rest = int.sub(n, int.mul(count, value))
      let rest_pairs = list.drop(pairs, 1)
      if count > 0 then 
        helper(rest, rest_pairs, acc + string.repeat(symbol, count))
      else 
        helper(n, rest_pairs, acc)
  in 
    helper(n, pairs, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:9:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |       let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
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
  {
    let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    let pairs = list.zip(values, symbols)
    fn helper(n: Int, pairs: List[(Int, String)], acc: String) -> String = 
      if list.is_empty(pairs) then 
        acc
      else 
        let (value, symbol) = list.first(pairs) 
        let count = int.div(n, value)
        let rest = int.sub(n, int.mul(count, value))
        let rest_pairs = list.drop(pairs, 1)
        if count > 0 then 
          helper(rest, rest_pairs, acc + string.repeat(symbol, count))
        else 
          helper(n, rest_pairs, acc)
    helper(n, pairs, "")
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 6:5 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-2.almd:6:5
  |
6 |     fn helper(n: Int, pairs: List[(Int, String)], acc: String) -> String =
  |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:10:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |         let (value, symbol) = list.first(pairs)
   |         ^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:11:32
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
   |
11 |         let count = int.div(n, value)
   |                                ^^^^^
error[E002]: undefined function 'int.div'
  --> /tmp/dojo-roman-numeral-2.almd:11:32
  in call to int.div()
  hint: Did you mean `int.min`?
  try:
      // int.div(...)  →  int.min(...)
      int.min(...)
   |
11 |         let count = int.div(n, value)
   |                                ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:12:46
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
   |
12 |         let rest = int.sub(n, int.mul(count, value))
   |                                              ^^^^^
error[E002]: undefined function 'int.mul'
  --> /tmp/dojo-roman-numeral-2.almd:12:46
  in call to int.mul()
  hint: Did you mean `int.max`?
  try:
      // int.mul(...)  →  int.max(...)
      int.max(...)
   |
12 |         let rest = int.sub(n, int.mul(count, value))
   |                                              ^^^^^
error[E002]: undefined function 'int.sub'
  --> /tmp/dojo-roman-numeral-2.almd:12:46
  in call to int.sub()
  hint: No function 'sub' in module 'int'. See docs/CHEATSHEET.md for available functions
   |
12 |         let rest = int.sub(n, int.mul(count, value))
   |                                              ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:15:36
  in variable acc
  hint: Check the variable name
   |
15 |           helper(rest, rest_pairs, acc + string.repeat(symbol, count))
   |                                    ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:15:56
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
15 |           helper(rest, rest_pairs, acc + string.repeat(symbol, count))
   |                                                        ^^^^^^
error[E002]: undefined function 'helper'
  --> /tmp/dojo-roman-numeral-2.almd:15:64
  in call to helper()
  hint: Check the function name
   |
15 |           helper(rest, rest_pairs, acc + string.repeat(symbol, count))
   |                                                                ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:17:33
  in variable acc
  hint: Check the variable name
   |
17 |           helper(n, rest_pairs, acc)
   |                                 ^^^
error[E002]: undefined function 'helper'
  --> /tmp/dojo-roman-numeral-2.almd:17:33
  in call to helper()
  hint: Check the function name
   |
17 |           helper(n, rest_pairs, acc)
   |                                 ^^^
error[E002]: undefined function 'helper'
  --> /tmp/dojo-roman-numeral-2.almd:18:22
  in call to helper()
  hint: Check the function name
   |
18 |     helper(n, pairs, "")
   |                      ^^

13 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  {
    let values = list.repeat(1000, 1) + [900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    let pairs = list.zip(values, symbols)
    let rec helper(n: Int, pairs: List[(Int, String)], acc: String) -> String = 
      if list.is_empty(pairs) then 
        acc
      else 
        let first_pair = list.first(pairs) |> option.unwrap_or((0, ""))
        let (value, symbol) = first_pair
        let count = int.div(n, value)
        let rest = n - count * value
        let rest_pairs = list.drop(pairs, 1)
        if count > 0 then 
          helper(rest, rest_pairs, acc + string.repeat(symbol, count))
        else 
          helper(n, rest_pairs, acc)
    helper
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-3.almd:6:9
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
6 |     let rec helper(n: Int, pairs: List[(Int, String)], acc: String) -> String =
  |         ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:10:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |         let first_pair = list.first(pairs) |> option.unwrap_or((0, ""))
   |         ^^^
error: Expected expression at line 21:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-3.almd:21:1
   |
21 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error[E003]: undefined variable 'first_pair'
  --> /tmp/dojo-roman-numeral-3.almd:11:31
  in variable first_pair
  hint: Check the variable name
   |
11 |         let (value, symbol) = first_pair
   |                               ^^^^^^^^^^
error[E002]: undefined function 'int.div'
  --> /tmp/dojo-roman-numeral-3.almd:12:32
  in call to int.div()
  hint: Did you mean `int.min`?
  try:
      // int.div(...)  →  int.min(...)
      int.min(...)
   |
12 |         let count = int.div(n, value)
   |                                ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:16:36
  in variable acc
  hint: Check the variable name
   |
16 |           helper(rest, rest_pairs, acc + string.repeat(symbol, count))
   |                                    ^^^
error[E002]: undefined function 'helper'
  --> /tmp/dojo-roman-numeral-3.almd:16:64
  in call to helper()
  hint: Check the function name
   |
16 |           helper(rest, rest_pairs, acc + string.repeat(symbol, count))
   |                                                                ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:18:33
  in variable acc
  hint: Check the variable name
   |
18 |           helper(n, rest_pairs, acc)
   |                                 ^^^
error[E002]: undefined function 'helper'
  --> /tmp/dojo-roman-numeral-3.almd:18:33
  in call to helper()
  hint: Check the function name
   |
18 |           helper(n, rest_pairs, acc)
   |                                 ^^^
error[E003]: undefined variable 'helper'
  --> /tmp/dojo-roman-numeral-3.almd:19:5
  in variable helper
  hint: Check the variable name
   |
19 |     helper
   |     ^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:19:5
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
19 |     helper
   |     ^^^^^^

11 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
