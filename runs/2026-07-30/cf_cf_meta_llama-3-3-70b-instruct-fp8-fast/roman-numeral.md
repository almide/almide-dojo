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
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  let rec loop(n: Int, i: Int, acc: String) -> String = 
    if i >= list.len(values) then acc
    else 
      let count = int.clamp(n / values[i], 0, n)
      let count = n / values[i]
      loop(n - count * values[i], i + 1, acc + string.repeat(symbols[i], count))
  loop(n, 0, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-0.almd:4:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
4 |   let rec loop(n: Int, i: Int, acc: String) -> String =
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let count = int.clamp(n / values[i], 0, n)
  |       ^^^
error: 'loop' is not valid in Almide at line 9:7
  --> /tmp/dojo-roman-numeral-0.almd:9:7
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
  |
9 |       loop(n - count * values[i], i + 1, acc + string.repeat(symbols[i], count))
  |       ^
error: 'loop' is not valid in Almide at line 10:3
  --> /tmp/dojo-roman-numeral-0.almd:10:3
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
10 |   loop(n, 0, "")
   |   ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:8:30
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
8 |       let count = n / values[i]
  |                              ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:8:30
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
8 |       let count = n / values[i]
  |                              ^

6 error(s) found
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
  fn loop(n: Int, i: Int, acc: String) -> String = 
    if i >= list.len(values) then acc
    else 
      let count = n / values[i]
      loop(n - count * values[i], i + 1, acc + string.repeat(symbols[i], count))
  loop(n, 0, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let count = n / values[i]
  |       ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:3:84
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
3 |   let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  |                                                                                    ^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let values = list.from_list([(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")])
  fn loop(n: Int, i: Int, acc: String) -> String = 
    if i >= list.len(values) then acc
    else 
      let count = n / list.first(list.get(values, i) |> option.unwrap_or((0, ""))).1
      loop(n - count * list.first(list.get(values, i) |> option.unwrap_or((0, ""))).1, i + 1, acc + string.repeat(list.first(list.get(values, i) |> option.unwrap_or((0, ""))).2, count))
  loop(n, 0, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:6:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |       let count = n / list.first(list.get(values, i) |> option.unwrap_or((0, ""))).1
  |       ^^^
error[E002]: undefined function 'list.from_list'
  --> /tmp/dojo-roman-numeral-2.almd:2:177
  in call to list.from_list()
  hint: No function 'from_list' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   let values = list.from_list([(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")])
  |                                                                                                                                                                                 ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:2:177
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let values = ...` (a statement, returns Unit).
      // Add `values` as the trailing expression so the fn returns String:
      //
      //   let values = <computation>
      //   values                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
  |
2 |   let values = list.from_list([(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")])
  |                                                                                                                                                                                 ^^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let values = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  fn loop(n: Int, i: Int, acc: String) -> String = 
    if i >= list.len(values) then acc
    else 
      let count = n / list.first(list.get(values, i) |> option.unwrap_or((0, ""))).1
      loop(n - count * list.first(list.get(values, i) |> option.unwrap_or((0, ""))).1, i + 1, acc + string.repeat(list.first(list.get(values, i) |> option.unwrap_or((0, ""))).2, count))
  loop(n, 0, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:6:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |       let count = n / list.first(list.get(values, i) |> option.unwrap_or((0, ""))).1
  |       ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:2:162
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let values = ...` (a statement, returns Unit).
      // Add `values` as the trailing expression so the fn returns String:
      //
      //   let values = <computation>
      //   values                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
  |
2 |   let values = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  |                                                                                                                                                                  ^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
