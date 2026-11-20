# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
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
  let rec loop(n: Int, i: Int, acc: String) -> String = 
    if n == 0 then acc
    else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
    else loop(n, i + 1, acc)
  in loop(n, 0, "")
```

**Diagnostic:**

```
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-0.almd:4:7
  in let rec
  here: let rec loop(n: Int, i: Int, acc: String) -> String =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
4 |   let rec loop(n: Int, i: Int, acc: String) -> String =
  |       ^^^
error: Expected expression at line 8:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-0.almd:8:3
  here: in loop(n, 0, "")
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   in loop(n, 0, "")
  |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:5:20
  in variable acc
  here: if n == 0 then acc
  hint: Check the variable name
  |
5 |     if n == 0 then acc
  |                    ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:6:25
  in variable i
  here: else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  hint: Did you mean `n`?
  try:
      n
  |
6 |     else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  |                         ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:6:49
  in variable i
  here: else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  hint: Did you mean `n`?
  try:
      n
  |
6 |     else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  |                                                 ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:6:53
  in variable i
  here: else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  hint: Did you mean `n`?
  try:
      n
  |
6 |     else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  |                                                     ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:6:56
  in variable acc
  here: else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  hint: Check the variable name
  |
6 |     else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  |                                                        ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:6:70
  in variable i
  here: else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  hint: Did you mean `n`?
  try:
      n
  |
6 |     else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  |                                                                      ^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-roman-numeral-0.almd:6:33
  in call to loop()
  here: else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  hint: Check the function name
  |
6 |     else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  |                                 ^^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:7:18
  in variable i
  here: else loop(n, i + 1, acc)
  hint: Did you mean `n`?
  try:
      n
  |
7 |     else loop(n, i + 1, acc)
  |                  ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:7:25
  in variable acc
  here: else loop(n, i + 1, acc)
  hint: Check the variable name
  |
7 |     else loop(n, i + 1, acc)
  |                         ^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-roman-numeral-0.almd:7:10
  in call to loop()
  here: else loop(n, i + 1, acc)
  hint: Check the function name
  |
7 |     else loop(n, i + 1, acc)
  |          ^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:7:25
  in fn 'to_roman'
  here: else loop(n, i + 1, acc)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
7 |     else loop(n, i + 1, acc)
  |                         ^^^

13 error(s) found
FAILED: /tmp/dojo-roman-numeral-0.almd
  parse error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  parse error: Expected expression at line 8:3 (got In 'in')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-roman-numeral-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  fn loop(n: Int, i: Int, acc: String) -> String = 
    if n == 0 then acc
    else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
    else if i < list.len(values) - 1 then loop(n, i + 1, acc)
    else acc
  in loop(n, 0, "")
```

**Diagnostic:**

```
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-1.almd:9:3
  here: in loop(n, 0, "")
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |   in loop(n, 0, "")
  |   ^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-1.almd:6:18
  in variable values
  here: else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  hint: Did you mean `map.values`?
  try:
      map.values
  |
6 |     else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  |                  ^^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-1.almd:6:42
  in variable values
  here: else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  hint: Did you mean `map.values`?
  try:
      map.values
  |
6 |     else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  |                                          ^^^^^^
error[E003]: undefined variable 'symbols'
  --> /tmp/dojo-roman-numeral-1.almd:6:62
  in variable symbols
  here: else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  hint: Check the variable name
  |
6 |     else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  |                                                              ^^^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-1.almd:7:26
  in variable values
  here: else if i < list.len(values) - 1 then loop(n, i + 1, acc)
  hint: Did you mean `map.values`?
  try:
      map.values
  |
7 |     else if i < list.len(values) - 1 then loop(n, i + 1, acc)
  |                          ^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:3:84
  in fn 'to_roman'
  here: let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
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

6 error(s) found
FAILED: /tmp/dojo-roman-numeral-1.almd
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:3 (got In 'in')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-roman-numeral-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  let rec loop(n: Int, i: Int, acc: String) -> String = 
    if n == 0 then acc
    else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
    else if i < list.len(values) - 1 then loop(n, i + 1, acc)
    else acc
  in loop(n, 0, "")
```

**Diagnostic:**

```
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-2.almd:4:7
  in let rec
  here: let rec loop(n: Int, i: Int, acc: String) -> String =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
4 |   let rec loop(n: Int, i: Int, acc: String) -> String =
  |       ^^^
error: Expected expression at line 9:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-2.almd:9:3
  here: in loop(n, 0, "")
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |   in loop(n, 0, "")
  |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:5:20
  in variable acc
  here: if n == 0 then acc
  hint: Check the variable name
  |
5 |     if n == 0 then acc
  |                    ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-2.almd:6:25
  in variable i
  here: else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  hint: Did you mean `n`?
  try:
      n
  |
6 |     else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  |                         ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-2.almd:6:49
  in variable i
  here: else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  hint: Did you mean `n`?
  try:
      n
  |
6 |     else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  |                                                 ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-2.almd:6:53
  in variable i
  here: else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  hint: Did you mean `n`?
  try:
      n
  |
6 |     else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  |                                                     ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:6:56
  in variable acc
  here: else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  hint: Check the variable name
  |
6 |     else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  |                                                        ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-2.almd:6:70
  in variable i
  here: else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  hint: Did you mean `n`?
  try:
      n
  |
6 |     else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  |                                                                      ^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-roman-numeral-2.almd:6:33
  in call to loop()
  here: else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  hint: Check the function name
  |
6 |     else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  |                                 ^^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-2.almd:7:13
  in variable i
  here: else if i < list.len(values) - 1 then loop(n, i + 1, acc)
  hint: Did you mean `n`?
  try:
      n
  |
7 |     else if i < list.len(values) - 1 then loop(n, i + 1, acc)
  |             ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-2.almd:7:51
  in variable i
  here: else if i < list.len(values) - 1 then loop(n, i + 1, acc)
  hint: Did you mean `n`?
  try:
      n
  |
7 |     else if i < list.len(values) - 1 then loop(n, i + 1, acc)
  |                                                   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:7:58
  in variable acc
  here: else if i < list.len(values) - 1 then loop(n, i + 1, acc)
  hint: Check the variable name
  |
7 |     else if i < list.len(values) - 1 then loop(n, i + 1, acc)
  |                                                          ^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-roman-numeral-2.almd:7:43
  in call to loop()
  here: else if i < list.len(values) - 1 then loop(n, i + 1, acc)
  hint: Check the function name
  |
7 |     else if i < list.len(values) - 1 then loop(n, i + 1, acc)
  |                                           ^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:8:10
  in variable acc
  here: else acc
  hint: Check the variable name
  |
8 |     else acc
  |          ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:8:10
  in fn 'to_roman'
  here: else acc
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
8 |     else acc
  |          ^^^

15 error(s) found
FAILED: /tmp/dojo-roman-numeral-2.almd
  parse error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  parse error: Expected expression at line 9:3 (got In 'in')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-roman-numeral-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  fn loop(n: Int, i: Int, acc: String) -> String = 
    if n == 0 then acc
    else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
    else if i < list.len(values) - 1 then loop(n, i + 1, acc)
    else acc
  loop(n, 0, "")
```

**Diagnostic:**

```
error: 'loop' cannot appear at the top level at line 9:3
  --> /tmp/dojo-roman-numeral-3.almd:9:3
  here: loop(n, 0, "")
  hint: Almide has no top-level loops. Define a function with 'fn' or 'effect fn'.
  |
9 |   loop(n, 0, "")
  |   ^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-3.almd:6:18
  in variable values
  here: else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  hint: Did you mean `map.values`?
  try:
      map.values
  |
6 |     else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  |                  ^^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-3.almd:6:42
  in variable values
  here: else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  hint: Did you mean `map.values`?
  try:
      map.values
  |
6 |     else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  |                                          ^^^^^^
error[E003]: undefined variable 'symbols'
  --> /tmp/dojo-roman-numeral-3.almd:6:62
  in variable symbols
  here: else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  hint: Check the variable name
  |
6 |     else if n >= values[i] then loop(n - values[i], i, acc + symbols[i])
  |                                                              ^^^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-3.almd:7:26
  in variable values
  here: else if i < list.len(values) - 1 then loop(n, i + 1, acc)
  hint: Did you mean `map.values`?
  try:
      map.values
  |
7 |     else if i < list.len(values) - 1 then loop(n, i + 1, acc)
  |                          ^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:3:84
  in fn 'to_roman'
  here: let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
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

6 error(s) found
FAILED: /tmp/dojo-roman-numeral-3.almd
  parse error: 'loop' cannot appear at the top level at line 9:3
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-roman-numeral-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
