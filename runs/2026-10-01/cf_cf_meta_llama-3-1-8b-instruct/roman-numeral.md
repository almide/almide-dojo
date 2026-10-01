# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  in 
    let rec loop(n: Int, acc: String) -> String = 
      match list.find_index(symbols, (fn (x) => x.0 <= n)) do 
        some(i) => 
          let (value, symbol) = list.nth(symbols, i) in 
            loop(n - value, acc + symbol)
        none => acc
      end
    in 
      loop(n, "")
```

**Diagnostic:**

```
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-0.almd:4:9
  in let rec
  here: let rec loop(n: Int, acc: String) -> String =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
4 |     let rec loop(n: Int, acc: String) -> String =
  |         ^^^
error: Expected expression at line 5:39 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-0.almd:5:39
  here: match list.find_index(symbols, (fn (x) => x.0 <= n)) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |       match list.find_index(symbols, (fn (x) => x.0 <= n)) do
  |                                       ^
error: Expected expression at line 7:54 (got In 'in')
  --> /tmp/dojo-roman-numeral-0.almd:7:54
  here: let (value, symbol) = list.nth(symbols, i) in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |           let (value, symbol) = list.nth(symbols, i) in
  |                                                      ^
error: Expected expression at line 9:14 (got FatArrow '=>')
  --> /tmp/dojo-roman-numeral-0.almd:9:14
  here: none => acc
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |         none => acc
  |              ^
error: Expected expression at line 11:5 (got In 'in')
  --> /tmp/dojo-roman-numeral-0.almd:11:5
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |     in
   |     ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:7:51
  in variable i
  here: let (value, symbol) = list.nth(symbols, i) in
  hint: Did you mean `n`?
  try:
      n
  |
7 |           let (value, symbol) = list.nth(symbols, i) in
  |                                                   ^
error[E002]: undefined function 'list.nth'
  --> /tmp/dojo-roman-numeral-0.almd:7:33
  in call to list.nth()
  here: let (value, symbol) = list.nth(symbols, i) in
  hint: No function 'nth' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
7 |           let (value, symbol) = list.nth(symbols, i) in
  |                                 ^^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:8:29
  in variable acc
  here: loop(n - value, acc + symbol)
  hint: Check the variable name
  |
8 |             loop(n - value, acc + symbol)
  |                             ^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-roman-numeral-0.almd:8:13
  in call to loop()
  here: loop(n - value, acc + symbol)
  hint: Check the function name
  |
8 |             loop(n - value, acc + symbol)
  |             ^^^^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-roman-numeral-0.almd:10:7
  in variable end
  here: end
  hint: Did you mean `n`?
  try:
      n
   |
10 |       end
   |       ^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-roman-numeral-0.almd:12:7
  in call to loop()
  here: loop(n, "")
  hint: Check the function name
   |
12 |       loop(n, "")
   |       ^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?0])
  --> /tmp/dojo-roman-numeral-0.almd:9:9
  in this expression with an unconstrained type
  here: none => acc
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
9 |         none => acc
  |         ^^^^

12 error(s) found
FAILED: /tmp/dojo-roman-numeral-0.almd
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  let rec loop(n: Int, acc: String) -> String = 
    match list.find_index(symbols, (fn (x) => x.0 <= n)) do 
      some(i) => 
        let (value, symbol) = list.nth(symbols, i) in 
          loop(n - value, acc + symbol)
      none => acc
    end
  loop(n, "")
```

**Diagnostic:**

```
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-1.almd:3:7
  in let rec
  here: let rec loop(n: Int, acc: String) -> String =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
3 |   let rec loop(n: Int, acc: String) -> String =
  |       ^^^
error: Expected expression at line 4:37 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-1.almd:4:37
  here: match list.find_index(symbols, (fn (x) => x.0 <= n)) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |     match list.find_index(symbols, (fn (x) => x.0 <= n)) do
  |                                     ^
error: Expected expression at line 6:52 (got In 'in')
  --> /tmp/dojo-roman-numeral-1.almd:6:52
  here: let (value, symbol) = list.nth(symbols, i) in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
6 |         let (value, symbol) = list.nth(symbols, i) in
  |                                                    ^
error: Expected expression at line 8:12 (got FatArrow '=>')
  --> /tmp/dojo-roman-numeral-1.almd:8:12
  here: none => acc
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |       none => acc
  |            ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-1.almd:6:49
  in variable i
  here: let (value, symbol) = list.nth(symbols, i) in
  hint: Did you mean `n`?
  try:
      n
  |
6 |         let (value, symbol) = list.nth(symbols, i) in
  |                                                 ^
error[E002]: undefined function 'list.nth'
  --> /tmp/dojo-roman-numeral-1.almd:6:31
  in call to list.nth()
  here: let (value, symbol) = list.nth(symbols, i) in
  hint: No function 'nth' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
6 |         let (value, symbol) = list.nth(symbols, i) in
  |                               ^^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:7:27
  in variable acc
  here: loop(n - value, acc + symbol)
  hint: Check the variable name
  |
7 |           loop(n - value, acc + symbol)
  |                           ^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-roman-numeral-1.almd:7:11
  in call to loop()
  here: loop(n - value, acc + symbol)
  hint: Check the function name
  |
7 |           loop(n - value, acc + symbol)
  |           ^^^^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-roman-numeral-1.almd:9:5
  in variable end
  here: end
  hint: Did you mean `n`?
  try:
      n
  |
9 |     end
  |     ^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-roman-numeral-1.almd:10:3
  in call to loop()
  here: loop(n, "")
  hint: Check the function name
   |
10 |   loop(n, "")
   |   ^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?0])
  --> /tmp/dojo-roman-numeral-1.almd:8:7
  in this expression with an unconstrained type
  here: none => acc
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
8 |       none => acc
  |       ^^^^

11 error(s) found
FAILED: /tmp/dojo-roman-numeral-1.almd
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  fn loop(n: Int, acc: String) -> String = 
    match list.find_index(symbols, (fn (x) => x.0 <= n)) do 
      some(i) => 
        let (value, symbol) = list.nth(symbols, i) in 
          loop(n - value, acc + symbol)
      none => acc
    end
  loop(n, "")
```

**Diagnostic:**

```
error: Expected expression at line 4:37 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-2.almd:4:37
  here: match list.find_index(symbols, (fn (x) => x.0 <= n)) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |     match list.find_index(symbols, (fn (x) => x.0 <= n)) do
  |                                     ^
error: Expected function name at line 4:40 (got LParen '(')
  --> /tmp/dojo-roman-numeral-2.almd:4:40
  here: match list.find_index(symbols, (fn (x) => x.0 <= n)) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |     match list.find_index(symbols, (fn (x) => x.0 <= n)) do
  |                                        ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:2:163
  in fn 'to_roman'
  here: let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
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
2 |   let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  |                                                                                                                                                                   ^^^

3 error(s) found
FAILED: /tmp/dojo-roman-numeral-2.almd
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  fn loop(n: Int, acc: String) -> String = 
    match list.find_index(symbols, (fn (x) => x.0 <= n)) do 
      some(i) => 
        let (value, symbol) = list.nth(symbols, i) in 
          loop(n - value, acc + symbol)
      none => acc
    end
  loop(n, "")
```

**Diagnostic:**

```
error: Expected expression at line 4:37 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-3.almd:4:37
  here: match list.find_index(symbols, (fn (x) => x.0 <= n)) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |     match list.find_index(symbols, (fn (x) => x.0 <= n)) do
  |                                     ^
error: Expected function name at line 4:40 (got LParen '(')
  --> /tmp/dojo-roman-numeral-3.almd:4:40
  here: match list.find_index(symbols, (fn (x) => x.0 <= n)) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |     match list.find_index(symbols, (fn (x) => x.0 <= n)) do
  |                                        ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:2:163
  in fn 'to_roman'
  here: let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
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
2 |   let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  |                                                                                                                                                                   ^^^

3 error(s) found
FAILED: /tmp/dojo-roman-numeral-3.almd
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
