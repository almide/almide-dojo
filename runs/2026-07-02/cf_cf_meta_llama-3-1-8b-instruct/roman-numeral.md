# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [
    (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"),
    (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
  ]
  in 
    let rec helper(n: Int, acc: String) = 
      if n <= 0 then acc 
      else 
        let (value, symbol) = list.find_first(symbols, (x) => x.0 <= n) 
        in 
          helper(n - value, acc + symbol)
    in 
      helper(n, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-0.almd:7:9
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
7 |     let rec helper(n: Int, acc: String) =
  |         ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:10:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |         let (value, symbol) = list.find_first(symbols, (x) => x.0 <= n)
   |         ^^^
error: Expected expression at line 13:5 (got In 'in')
  --> /tmp/dojo-roman-numeral-0.almd:13:5
   |
13 |     in
   |     ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:12:22
  in variable value
  hint: Check the variable name
   |
12 |           helper(n - value, acc + symbol)
   |                      ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:12:29
  in variable acc
  hint: Check the variable name
   |
12 |           helper(n - value, acc + symbol)
   |                             ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:12:35
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
12 |           helper(n - value, acc + symbol)
   |                                   ^^^^^^
error[E002]: undefined function 'helper'
  --> /tmp/dojo-roman-numeral-0.almd:12:35
  in call to helper()
  hint: Check the function name
   |
12 |           helper(n - value, acc + symbol)
   |                                   ^^^^^^
error[E002]: undefined function 'helper'
  --> /tmp/dojo-roman-numeral-0.almd:14:17
  in call to helper()
  hint: Check the function name
   |
14 |       helper(n, "")
   |                 ^^

8 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [
    (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"),
    (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
  ]
  let rec helper(n: Int, acc: String) = 
    if n <= 0 then acc 
    else 
      let (value, symbol) = list.find_first(symbols, (x) => x.0 <= n) 
      in 
        helper(n - value, acc + symbol)
  helper(n, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-1.almd:6:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
6 |   let rec helper(n: Int, acc: String) =
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:9:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |       let (value, symbol) = list.find_first(symbols, (x) => x.0 <= n)
  |       ^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:11:20
  in variable value
  hint: Check the variable name
   |
11 |         helper(n - value, acc + symbol)
   |                    ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:11:27
  in variable acc
  hint: Check the variable name
   |
11 |         helper(n - value, acc + symbol)
   |                           ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:11:33
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
11 |         helper(n - value, acc + symbol)
   |                                 ^^^^^^
error[E002]: undefined function 'helper'
  --> /tmp/dojo-roman-numeral-1.almd:11:33
  in call to helper()
  hint: Check the function name
   |
11 |         helper(n - value, acc + symbol)
   |                                 ^^^^^^
error[E002]: undefined function 'helper'
  --> /tmp/dojo-roman-numeral-1.almd:12:13
  in call to helper()
  hint: Check the function name
   |
12 |   helper(n, "")
   |             ^^

7 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [
    (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"),
    (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
  ]
  fn helper(n: Int, acc: String) = 
    if n <= 0 then acc 
    else 
      let (value, symbol) = list.find_first(symbols, (x) => x.0 <= n) 
      in 
        helper(n - value, acc + symbol)
  helper(n, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected Arrow at line 6:34 (got Eq '=')
  --> /tmp/dojo-roman-numeral-2.almd:6:34
  hint: Use '->' for return type, not '='. Write: fn name() -> Type = body
  |
6 |   fn helper(n: Int, acc: String) =
  |                                  ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:4:75
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
4 |     (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
  |                                                                           ^^^

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
    (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"),
    (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
  ]
  symbols
  fn helper(n: Int, acc: String) = 
    if n <= 0 then acc 
    else 
      let (value, symbol) = list.find_first(symbols, (x) => x.0 <= n) 
      in 
        helper(n - value, acc + symbol)
  helper(n, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected Arrow at line 7:34 (got Eq '=')
  --> /tmp/dojo-roman-numeral-3.almd:7:34
  hint: Use '->' for return type, not '='. Write: fn name() -> Type = body
  |
7 |   fn helper(n: Int, acc: String) =
  |                                  ^
error[E001]: type mismatch in fn 'to_roman': expected String but got List[(Int, String)]
  --> /tmp/dojo-roman-numeral-3.almd:6:3
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  |
6 |   symbols
  |   ^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
