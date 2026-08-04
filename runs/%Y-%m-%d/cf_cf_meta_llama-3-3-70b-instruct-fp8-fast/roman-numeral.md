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
  let rec loop(n: Int, i: Int) -> String = 
    if n == 0 then "" 
    else if n >= values[i] then symbols[i] + loop(n - values[i], i)
    else loop(n, i + 1)
  in loop(n, 0)
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
4 |   let rec loop(n: Int, i: Int) -> String =
  |       ^^^
error: 'loop' is not valid in Almide at line 6:46
  --> /tmp/dojo-roman-numeral-0.almd:6:46
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
  |
6 |     else if n >= values[i] then symbols[i] + loop(n - values[i], i)
  |                                              ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:3:84
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
3 |   let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  |                                                                                    ^^^

3 error(s) found
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
  fn loop(n: Int, i: Int) -> String = 
    if n == 0 then "" 
    else if n >= values[i] then symbols[i] + loop(n - values[i], i)
    else if i < list.len(values) - 1 then loop(n, i + 1)
    else ""
  in loop(n, 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'loop' is not valid in Almide at line 6:46
  --> /tmp/dojo-roman-numeral-1.almd:6:46
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
  |
6 |     else if n >= values[i] then symbols[i] + loop(n - values[i], i)
  |                                              ^
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
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  let rec loop(n: Int, i: Int) -> String = 
    if n == 0 then "" 
    else if n >= values[i] then symbols[i] + loop(n - values[i], i)
    else if i < list.len(values) - 1 then loop(n, i + 1)
    else ""
  in loop(n, 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-2.almd:4:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
4 |   let rec loop(n: Int, i: Int) -> String =
  |       ^^^
error: 'loop' is not valid in Almide at line 6:46
  --> /tmp/dojo-roman-numeral-2.almd:6:46
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
  |
6 |     else if n >= values[i] then symbols[i] + loop(n - values[i], i)
  |                                              ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:3:84
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
3 |   let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  |                                                                                    ^^^

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
  fn loop(n: Int, i: Int) -> String = 
    if n == 0 then "" 
    else if n >= values[i] then symbols[i] + loop(n - values[i], i)
    else if i < list.len(values) - 1 then loop(n, i + 1)
    else ""
  in loop(n, 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'loop' is not valid in Almide at line 6:46
  --> /tmp/dojo-roman-numeral-3.almd:6:46
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
  |
6 |     else if n >= values[i] then symbols[i] + loop(n - values[i], i)
  |                                              ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:3:84
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
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
