# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

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
  ] in
  let rec loop(n: Int, pairs: List[(Int, String)], acc: String) -> String = 
    if list.is_empty(pairs) then acc
    else 
      let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, "")) in
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
  --> /tmp/dojo-roman-numeral-0.almd:17:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
   |
17 |   let rec loop(n: Int, pairs: List[(Int, String)], acc: String) -> String =
   |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:20:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
20 |       let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, "")) in
   |       ^^^
error: 'loop' is not valid in Almide at line 22:9
  --> /tmp/dojo-roman-numeral-0.almd:22:9
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
22 |         loop(n - value, pairs, acc + symbol)
   |         ^
error: 'loop' is not valid in Almide at line 24:9
  --> /tmp/dojo-roman-numeral-0.almd:24:9
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
24 |         loop(n, list.drop(pairs, 1), acc)
   |         ^
error: 'loop' is not valid in Almide at line 26:3
  --> /tmp/dojo-roman-numeral-0.almd:26:3
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
26 |   loop(n, pairs, "")
   |   ^
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
  ] in
  let rec_loop(n: Int, pairs: List[(Int, String)], acc: String) -> String = 
    if list.is_empty(pairs) then acc
    else 
      let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, "")) in
      if n >= value then 
        rec_loop(n - value, pairs, acc + symbol)
      else 
        rec_loop(n, list.drop(pairs, 1), acc)
  in 
  rec_loop(n, pairs, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected Eq at line 17:15 (got LParen '(')
  --> /tmp/dojo-roman-numeral-1.almd:17:15
   |
17 |   let rec_loop(n: Int, pairs: List[(Int, String)], acc: String) -> String =
   |               ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:20:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
20 |       let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, "")) in
   |       ^^^
error: Expected expression at line 25:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-1.almd:25:3
   |
25 |   in
   |   ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:21:15
  in variable value
  hint: Check the variable name
   |
21 |       if n >= value then
   |               ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:22:22
  in variable value
  hint: Check the variable name
   |
22 |         rec_loop(n - value, pairs, acc + symbol)
   |                      ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:22:36
  in variable acc
  hint: Check the variable name
   |
22 |         rec_loop(n - value, pairs, acc + symbol)
   |                                    ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:22:42
  in variable symbol
  hint: Check the variable name
   |
22 |         rec_loop(n - value, pairs, acc + symbol)
   |                                          ^^^^^^
error[E002]: undefined function 'rec_loop'
  --> /tmp/dojo-roman-numeral-1.almd:22:42
  in call to rec_loop()
  hint: Check the function name
   |
22 |         rec_loop(n - value, pairs, acc + symbol)
   |                                          ^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:24:42
  in variable acc
  hint: Check the variable name
   |
24 |         rec_loop(n, list.drop(pairs, 1), acc)
   |                                          ^^^
error[E002]: undefined function 'rec_loop'
  --> /tmp/dojo-roman-numeral-1.almd:24:42
  in call to rec_loop()
  hint: Check the function name
   |
24 |         rec_loop(n, list.drop(pairs, 1), acc)
   |                                          ^^^
error[E002]: undefined function 'rec_loop'
  --> /tmp/dojo-roman-numeral-1.almd:26:22
  in call to rec_loop()
  hint: Check the function name
   |
26 |   rec_loop(n, pairs, "")
   |                      ^^

11 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

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
  ] in
  let rec_loop = (n: Int, pairs: List[(Int, String)], acc: String) => 
    if list.is_empty(pairs) then acc
    else 
      let first_pair = list.first(pairs) |> option.unwrap_or((0, "")) in
      if n >= first_pair.0 then 
        rec_loop(n - first_pair.0, pairs, acc + first_pair.1)
      else 
        rec_loop(n, list.drop(pairs, 1), acc)
  in 
  rec_loop(n, pairs, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:20:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
20 |       let first_pair = list.first(pairs) |> option.unwrap_or((0, "")) in
   |       ^^^
error: Expected expression at line 25:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-2.almd:25:3
   |
25 |   in
   |   ^
error[E003]: undefined variable 'first_pair'
  --> /tmp/dojo-roman-numeral-2.almd:21:15
  in variable first_pair
  hint: Check the variable name
   |
21 |       if n >= first_pair.0 then
   |               ^^^^^^^^^^
error[E003]: undefined variable 'first_pair'
  --> /tmp/dojo-roman-numeral-2.almd:22:22
  in variable first_pair
  hint: Check the variable name
   |
22 |         rec_loop(n - first_pair.0, pairs, acc + first_pair.1)
   |                      ^^^^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:22:43
  in variable acc
  hint: Check the variable name
   |
22 |         rec_loop(n - first_pair.0, pairs, acc + first_pair.1)
   |                                           ^^^
error[E003]: undefined variable 'first_pair'
  --> /tmp/dojo-roman-numeral-2.almd:22:49
  in variable first_pair
  hint: Check the variable name
   |
22 |         rec_loop(n - first_pair.0, pairs, acc + first_pair.1)
   |                                                 ^^^^^^^^^^
error[E002]: undefined function 'rec_loop'
  --> /tmp/dojo-roman-numeral-2.almd:22:49
  in call to rec_loop()
  hint: Check the function name
   |
22 |         rec_loop(n - first_pair.0, pairs, acc + first_pair.1)
   |                                                 ^^^^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:24:42
  in variable acc
  hint: Check the variable name
   |
24 |         rec_loop(n, list.drop(pairs, 1), acc)
   |                                          ^^^
error[E002]: undefined function 'rec_loop'
  --> /tmp/dojo-roman-numeral-2.almd:24:42
  in call to rec_loop()
  hint: Check the function name
   |
24 |         rec_loop(n, list.drop(pairs, 1), acc)
   |                                          ^^^
error[E002]: undefined function 'rec_loop'
  --> /tmp/dojo-roman-numeral-2.almd:26:22
  in call to rec_loop()
  hint: Check the function name
   |
26 |   rec_loop(n, pairs, "")
   |                      ^^

10 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

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
  ] in
  let rec_loop = (n: Int, pairs: List[(Int, String)], acc: String) => 
    if list.is_empty(pairs) then acc
    else 
      let first_pair = list.first(pairs) |> option.unwrap_or((0, "")) in
      if n >= first_pair.0 then 
        rec_loop(n - first_pair.0, pairs, acc + first_pair.1)
      else 
        rec_loop(n, list.drop(pairs, 1), acc)
  in 
  rec_loop(n, pairs, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:20:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
20 |       let first_pair = list.first(pairs) |> option.unwrap_or((0, "")) in
   |       ^^^
error: Expected expression at line 25:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-3.almd:25:3
   |
25 |   in
   |   ^
error[E003]: undefined variable 'first_pair'
  --> /tmp/dojo-roman-numeral-3.almd:21:15
  in variable first_pair
  hint: Check the variable name
   |
21 |       if n >= first_pair.0 then
   |               ^^^^^^^^^^
error[E003]: undefined variable 'first_pair'
  --> /tmp/dojo-roman-numeral-3.almd:22:22
  in variable first_pair
  hint: Check the variable name
   |
22 |         rec_loop(n - first_pair.0, pairs, acc + first_pair.1)
   |                      ^^^^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:22:43
  in variable acc
  hint: Check the variable name
   |
22 |         rec_loop(n - first_pair.0, pairs, acc + first_pair.1)
   |                                           ^^^
error[E003]: undefined variable 'first_pair'
  --> /tmp/dojo-roman-numeral-3.almd:22:49
  in variable first_pair
  hint: Check the variable name
   |
22 |         rec_loop(n - first_pair.0, pairs, acc + first_pair.1)
   |                                                 ^^^^^^^^^^
error[E002]: undefined function 'rec_loop'
  --> /tmp/dojo-roman-numeral-3.almd:22:49
  in call to rec_loop()
  hint: Check the function name
   |
22 |         rec_loop(n - first_pair.0, pairs, acc + first_pair.1)
   |                                                 ^^^^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:24:42
  in variable acc
  hint: Check the variable name
   |
24 |         rec_loop(n, list.drop(pairs, 1), acc)
   |                                          ^^^
error[E002]: undefined function 'rec_loop'
  --> /tmp/dojo-roman-numeral-3.almd:24:42
  in call to rec_loop()
  hint: Check the function name
   |
24 |         rec_loop(n, list.drop(pairs, 1), acc)
   |                                          ^^^
error[E002]: undefined function 'rec_loop'
  --> /tmp/dojo-roman-numeral-3.almd:26:22
  in call to rec_loop()
  hint: Check the function name
   |
26 |   rec_loop(n, pairs, "")
   |                      ^^

10 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
