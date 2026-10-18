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
  let pairs = list.zip(values, symbols)
  in
  list.fold(pairs, "", (acc, (value, symbol)) => 
    let count = int.clamp(n / value, 0, n / value)
    in
    acc + string.repeat(symbol, count)
  ) |> string.trim
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:7:5
  in let-in
  here: let count = int.clamp(n / value, 0, n / value)
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |     let count = int.clamp(n / value, 0, n / value)
  |     ^^^
error: Expected expression at line 10:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-0.almd:10:3
  here: ) |> string.trim
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |   ) |> string.trim
   |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:9:5
  in variable acc
  here: acc + string.repeat(symbol, count)
  hint: Check the variable name
  |
9 |     acc + string.repeat(symbol, count)
  |     ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:9:25
  in variable symbol
  here: acc + string.repeat(symbol, count)
  hint: Did you mean `symbols`?
  try:
      symbols
  |
9 |     acc + string.repeat(symbol, count)
  |                         ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-0.almd:9:33
  in variable count
  here: acc + string.repeat(symbol, count)
  hint: Did you mean `map.count`?
  try:
      map.count
  |
9 |     acc + string.repeat(symbol, count)
  |                                 ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:9:33
  in fn 'to_roman'
  here: acc + string.repeat(symbol, count)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
9 |     acc + string.repeat(symbol, count)
  |                                 ^^^^^

6 error(s) found
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
  in
  list.fold(pairs, "", (acc, pair) => 
    let value = pair.0
    let symbol = pair.1
    let count = n / value
    let new_n = n - count * value
    in
    acc + string.repeat(symbol, count)
  )
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:7:5
  in let-in
  here: let value = pair.0
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |     let value = pair.0
  |     ^^^
error: Expected expression at line 13:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:13:3
  here: )
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |   )
   |   ^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-1.almd:8:18
  in variable pair
  here: let symbol = pair.1
  hint: Did you mean `pairs`?
  try:
      pairs
  |
8 |     let symbol = pair.1
  |                  ^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:9:21
  in variable value
  here: let count = n / value
  hint: Did you mean `values`?
  try:
      values
  |
9 |     let count = n / value
  |                     ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:10:29
  in variable value
  here: let new_n = n - count * value
  hint: Did you mean `values`?
  try:
      values
   |
10 |     let new_n = n - count * value
   |                             ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:12:5
  in variable acc
  here: acc + string.repeat(symbol, count)
  hint: Check the variable name
   |
12 |     acc + string.repeat(symbol, count)
   |     ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:12:33
  in fn 'to_roman'
  here: acc + string.repeat(symbol, count)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
12 |     acc + string.repeat(symbol, count)
   |                                 ^^^^^

7 error(s) found
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
  in
  list.fold(pairs, "", (acc, (value, symbol)) => 
    let count = n / value
    let new_n = n - count * value
    in
    acc + string.repeat(symbol, count)
  )
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:7:5
  in let-in
  here: let count = n / value
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |     let count = n / value
  |     ^^^
error: Expected expression at line 11:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-2.almd:11:3
  here: )
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |   )
   |   ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:8:21
  in variable count
  here: let new_n = n - count * value
  hint: Did you mean `map.count`?
  try:
      map.count
  |
8 |     let new_n = n - count * value
  |                     ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:8:29
  in variable value
  here: let new_n = n - count * value
  hint: Did you mean `values`?
  try:
      values
  |
8 |     let new_n = n - count * value
  |                             ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:10:5
  in variable acc
  here: acc + string.repeat(symbol, count)
  hint: Check the variable name
   |
10 |     acc + string.repeat(symbol, count)
   |     ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:10:25
  in variable symbol
  here: acc + string.repeat(symbol, count)
  hint: Did you mean `symbols`?
  try:
      symbols
   |
10 |     acc + string.repeat(symbol, count)
   |                         ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:10:33
  in variable count
  here: acc + string.repeat(symbol, count)
  hint: Did you mean `map.count`?
  try:
      map.count
   |
10 |     acc + string.repeat(symbol, count)
   |                                 ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:10:33
  in fn 'to_roman'
  here: acc + string.repeat(symbol, count)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
10 |     acc + string.repeat(symbol, count)
   |                                 ^^^^^

8 error(s) found
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
  let pairs = list.zip(values, symbols)
  in
  list.fold(pairs, (n, ""), (acc, (value, symbol)) => 
    let count = acc.0 / value
    let new_n = acc.0 - count * value
    in
    (new_n, acc.1 + string.repeat(symbol, count))
  ).1
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:7:5
  in let-in
  here: let count = acc.0 / value
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |     let count = acc.0 / value
  |     ^^^
error: Expected expression at line 11:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-3.almd:11:3
  here: ).1
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |   ).1
   |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:8:17
  in variable acc
  here: let new_n = acc.0 - count * value
  hint: Check the variable name
  |
8 |     let new_n = acc.0 - count * value
  |                 ^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:8:25
  in variable count
  here: let new_n = acc.0 - count * value
  hint: Did you mean `map.count`?
  try:
      map.count
  |
8 |     let new_n = acc.0 - count * value
  |                         ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:8:33
  in variable value
  here: let new_n = acc.0 - count * value
  hint: Did you mean `values`?
  try:
      values
  |
8 |     let new_n = acc.0 - count * value
  |                                 ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:10:13
  in variable acc
  here: (new_n, acc.1 + string.repeat(symbol, count))
  hint: Check the variable name
   |
10 |     (new_n, acc.1 + string.repeat(symbol, count))
   |             ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:10:35
  in variable symbol
  here: (new_n, acc.1 + string.repeat(symbol, count))
  hint: Did you mean `symbols`?
  try:
      symbols
   |
10 |     (new_n, acc.1 + string.repeat(symbol, count))
   |                                   ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:10:43
  in variable count
  here: (new_n, acc.1 + string.repeat(symbol, count))
  hint: Did you mean `map.count`?
  try:
      map.count
   |
10 |     (new_n, acc.1 + string.repeat(symbol, count))
   |                                           ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:10:43
  in fn 'to_roman'
  here: (new_n, acc.1 + string.repeat(symbol, count))
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
10 |     (new_n, acc.1 + string.repeat(symbol, count))
   |                                           ^^^^^
error[E025]: cannot infer a concrete type for this expression (type (Unknown, Unknown))
  --> /tmp/dojo-roman-numeral-3.almd:10:5
  in this expression with an unconstrained type
  here: (new_n, acc.1 + string.repeat(symbol, count))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: (Int, Int) = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
10 |     (new_n, acc.1 + string.repeat(symbol, count))
   |     ^

10 error(s) found
FAILED: /tmp/dojo-roman-numeral-3.almd
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
