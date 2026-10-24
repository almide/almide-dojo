# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  let rec loop(n: Int, i: Int, acc: String) -> String = 
    if n == 0 then acc
    else if i >= list.len(values) then acc
    else if n >= list.get(values, i) then 
      loop(n - list.get(values, i), i, acc + list.get(symbols, i))
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
error: Expected expression at line 10:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-0.almd:10:3
  here: in loop(n, 0, "")
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |   in loop(n, 0, "")
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
  --> /tmp/dojo-roman-numeral-0.almd:6:13
  in variable i
  here: else if i >= list.len(values) then acc
  hint: Did you mean `n`?
  try:
      n
  |
6 |     else if i >= list.len(values) then acc
  |             ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:6:40
  in variable acc
  here: else if i >= list.len(values) then acc
  hint: Check the variable name
  |
6 |     else if i >= list.len(values) then acc
  |                                        ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:7:35
  in variable i
  here: else if n >= list.get(values, i) then
  hint: Did you mean `n`?
  try:
      n
  |
7 |     else if n >= list.get(values, i) then
  |                                   ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:8:33
  in variable i
  here: loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  hint: Did you mean `n`?
  try:
      n
  |
8 |       loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  |                                 ^
error: operator '-' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-roman-numeral-0.almd:8:33
  in operator -
  here: loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  hint: Use numeric types (Int or Float)
  |
8 |       loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  |                                 ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:8:37
  in variable i
  here: loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  hint: Did you mean `n`?
  try:
      n
  |
8 |       loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  |                                     ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:8:40
  in variable acc
  here: loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  hint: Check the variable name
  |
8 |       loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  |                                        ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:8:64
  in variable i
  here: loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  hint: Did you mean `n`?
  try:
      n
  |
8 |       loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  |                                                                ^
error: operator '+' requires numeric, String, or List types but got Unknown and Option[String]
  --> /tmp/dojo-roman-numeral-0.almd:8:64
  in operator +
  here: loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  hint: Use + with numeric types, String, or List
  |
8 |       loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  |                                                                ^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-roman-numeral-0.almd:8:7
  in call to loop()
  here: loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  hint: Check the function name
  |
8 |       loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  |       ^^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:9:18
  in variable i
  here: else loop(n, i + 1, acc)
  hint: Did you mean `n`?
  try:
      n
  |
9 |     else loop(n, i + 1, acc)
  |                  ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:9:25
  in variable acc
  here: else loop(n, i + 1, acc)
  hint: Check the variable name
  |
9 |     else loop(n, i + 1, acc)
  |                         ^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-roman-numeral-0.almd:9:10
  in call to loop()
  here: else loop(n, i + 1, acc)
  hint: Check the function name
  |
9 |     else loop(n, i + 1, acc)
  |          ^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:9:25
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
9 |     else loop(n, i + 1, acc)
  |                         ^^^

17 error(s) found
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
  fn loop(n: Int, i: Int, acc: String) -> String = 
    if n == 0 then acc
    else if i >= list.len(values) then acc
    else if n >= list.get(values, i) |> option.unwrap_or(0) then 
      loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
    else loop(n, i + 1, acc)
  in loop(n, 0, "")
```

**Diagnostic:**

```
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 10:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-1.almd:10:3
  here: in loop(n, 0, "")
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |   in loop(n, 0, "")
   |   ^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-1.almd:6:27
  in variable values
  here: else if i >= list.len(values) then acc
  hint: Did you mean `map.values`?
  try:
      map.values
  |
6 |     else if i >= list.len(values) then acc
  |                           ^^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-1.almd:7:27
  in variable values
  here: else if n >= list.get(values, i) |> option.unwrap_or(0) then
  hint: Did you mean `map.values`?
  try:
      map.values
  |
7 |     else if n >= list.get(values, i) |> option.unwrap_or(0) then
  |                           ^^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-1.almd:8:25
  in variable values
  here: loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  hint: Did you mean `map.values`?
  try:
      map.values
  |
8 |       loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                         ^^^^^^
error: operator '-' requires numeric types but got Int and Option[?2]
  --> /tmp/dojo-roman-numeral-1.almd:8:33
  in operator -
  here: loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  hint: Use numeric types (Int or Float)
  |
8 |       loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                 ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-roman-numeral-1.almd:8:56
  in call to option.unwrap_or()
  here: loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
...
8 |       loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                        ^
error[E003]: undefined variable 'symbols'
  --> /tmp/dojo-roman-numeral-1.almd:8:78
  in variable symbols
  here: loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  hint: Check the variable name
  |
8 |       loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                              ^^^^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[?3]
  --> /tmp/dojo-roman-numeral-1.almd:8:87
  in operator +
  here: loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  hint: Use + with numeric types, String, or List
  |
8 |       loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                                       ^
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-roman-numeral-1.almd:8:110
  in call to option.unwrap_or()
  here: loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  hint: nothing to unwrap — the value is already String. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
...
8 |       loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                                                              ^^
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
error[E025]: cannot infer a concrete type for this expression (type Option[?2])
  --> /tmp/dojo-roman-numeral-1.almd:8:16
  in this expression with an unconstrained type
  here: loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
8 |       loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                ^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?3])
  --> /tmp/dojo-roman-numeral-1.almd:8:69
  in this expression with an unconstrained type
  here: loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
8 |       loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                     ^^^^^^^^^^^^^^^^^^^^

12 error(s) found
FAILED: /tmp/dojo-roman-numeral-1.almd
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let values = list.repeat(1000, 1) + list.repeat(900, 1) + list.repeat(500, 1) + list.repeat(400, 1) + list.repeat(100, 1) + list.repeat(90, 1) + list.repeat(50, 1) + list.repeat(40, 1) + list.repeat(10, 1) + list.repeat(9, 1) + list.repeat(5, 1) + list.repeat(4, 1) + list.repeat(1, 1)
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  fn loop(n: Int, i: Int, acc: String) -> String = 
    if n == 0 then acc
    else if i >= list.len(values) then acc
    else if n >= list.get(values, i) |> option.unwrap_or(0) then 
      loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
    else loop(n, i + 1, acc)
  in loop(n, 0, "")
```

**Diagnostic:**

```
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 10:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-2.almd:10:3
  here: in loop(n, 0, "")
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |   in loop(n, 0, "")
   |   ^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-2.almd:6:27
  in variable values
  here: else if i >= list.len(values) then acc
  hint: Did you mean `map.values`?
  try:
      map.values
  |
6 |     else if i >= list.len(values) then acc
  |                           ^^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-2.almd:7:27
  in variable values
  here: else if n >= list.get(values, i) |> option.unwrap_or(0) then
  hint: Did you mean `map.values`?
  try:
      map.values
  |
7 |     else if n >= list.get(values, i) |> option.unwrap_or(0) then
  |                           ^^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-2.almd:8:25
  in variable values
  here: loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  hint: Did you mean `map.values`?
  try:
      map.values
  |
8 |       loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                         ^^^^^^
error: operator '-' requires numeric types but got Int and Option[?2]
  --> /tmp/dojo-roman-numeral-2.almd:8:33
  in operator -
  here: loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  hint: Use numeric types (Int or Float)
  |
8 |       loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                 ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-roman-numeral-2.almd:8:56
  in call to option.unwrap_or()
  here: loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
...
8 |       loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                        ^
error[E003]: undefined variable 'symbols'
  --> /tmp/dojo-roman-numeral-2.almd:8:78
  in variable symbols
  here: loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  hint: Check the variable name
  |
8 |       loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                              ^^^^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[?3]
  --> /tmp/dojo-roman-numeral-2.almd:8:87
  in operator +
  here: loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  hint: Use + with numeric types, String, or List
  |
8 |       loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                                       ^
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-roman-numeral-2.almd:8:110
  in call to option.unwrap_or()
  here: loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  hint: nothing to unwrap — the value is already String. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
...
8 |       loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                                                              ^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:3:84
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
error[E025]: cannot infer a concrete type for this expression (type Option[?2])
  --> /tmp/dojo-roman-numeral-2.almd:8:16
  in this expression with an unconstrained type
  here: loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
8 |       loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                ^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?3])
  --> /tmp/dojo-roman-numeral-2.almd:8:69
  in this expression with an unconstrained type
  here: loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
8 |       loop(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                     ^^^^^^^^^^^^^^^^^^^^

12 error(s) found
FAILED: /tmp/dojo-roman-numeral-2.almd
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
    else if i >= list.len(values) then acc
    else if n >= list.get(values, i) then 
      loop(n - list.get(values, i), i, acc + list.get(symbols, i))
    else loop(n, i + 1, acc)
  in loop(n, 0, "")
```

**Diagnostic:**

```
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 10:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-3.almd:10:3
  here: in loop(n, 0, "")
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |   in loop(n, 0, "")
   |   ^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-3.almd:6:27
  in variable values
  here: else if i >= list.len(values) then acc
  hint: Did you mean `map.values`?
  try:
      map.values
  |
6 |     else if i >= list.len(values) then acc
  |                           ^^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-3.almd:7:27
  in variable values
  here: else if n >= list.get(values, i) then
  hint: Did you mean `map.values`?
  try:
      map.values
  |
7 |     else if n >= list.get(values, i) then
  |                           ^^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-3.almd:8:25
  in variable values
  here: loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  hint: Did you mean `map.values`?
  try:
      map.values
  |
8 |       loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  |                         ^^^^^^
error: operator '-' requires numeric types but got Int and Option[?2]
  --> /tmp/dojo-roman-numeral-3.almd:8:33
  in operator -
  here: loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  hint: Use numeric types (Int or Float)
  |
8 |       loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  |                                 ^
error[E003]: undefined variable 'symbols'
  --> /tmp/dojo-roman-numeral-3.almd:8:55
  in variable symbols
  here: loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  hint: Check the variable name
  |
8 |       loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  |                                                       ^^^^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[?3]
  --> /tmp/dojo-roman-numeral-3.almd:8:64
  in operator +
  here: loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  hint: Use + with numeric types, String, or List
  |
8 |       loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  |                                                                ^
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
error[E025]: cannot infer a concrete type for this expression (type Option[?1])
  --> /tmp/dojo-roman-numeral-3.almd:7:18
  in this expression with an unconstrained type
  here: else if n >= list.get(values, i) then
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
7 |     else if n >= list.get(values, i) then
  |                  ^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?2])
  --> /tmp/dojo-roman-numeral-3.almd:8:16
  in this expression with an unconstrained type
  here: loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
8 |       loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  |                ^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?3])
  --> /tmp/dojo-roman-numeral-3.almd:8:46
  in this expression with an unconstrained type
  here: loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
8 |       loop(n - list.get(values, i), i, acc + list.get(symbols, i))
  |                                              ^^^^^^^^^^^^^^^^^^^^

11 error(s) found
FAILED: /tmp/dojo-roman-numeral-3.almd
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
