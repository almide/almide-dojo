# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
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
  let pairs = list.zip(values, symbols)
  in
  list.fold(pairs, "", (acc, (value, symbol)) => 
    let count = int.clamp(n / value, 0, n / value)
    in
    acc + string.repeat(symbol, count)
  )
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
  here: )
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |   )
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
  list.fold(pairs, "", (acc, (value, symbol)) => 
    let count = n / value
    in
    acc + string.repeat(symbol, count)
  ) 
  |> (x) => 
    if string.len(x) == 0 then "" 
    else x
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:7:5
  in let-in
  here: let count = n / value
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |     let count = n / value
  |     ^^^
error: Expected expression at line 10:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:10:3
  here: )
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |   )
   |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:9:5
  in variable acc
  here: acc + string.repeat(symbol, count)
  hint: Check the variable name
  |
9 |     acc + string.repeat(symbol, count)
  |     ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:9:25
  in variable symbol
  here: acc + string.repeat(symbol, count)
  hint: Did you mean `symbols`?
  try:
      symbols
  |
9 |     acc + string.repeat(symbol, count)
  |                         ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-1.almd:9:33
  in variable count
  here: acc + string.repeat(symbol, count)
  hint: Did you mean `map.count`?
  try:
      map.count
  |
9 |     acc + string.repeat(symbol, count)
  |                                 ^^^^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-roman-numeral-1.almd:12:19
  in variable x
  here: if string.len(x) == 0 then ""
  hint: Did you mean `n`?
  try:
      n
   |
12 |     if string.len(x) == 0 then ""
   |                   ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-roman-numeral-1.almd:13:10
  in variable x
  here: else x
  hint: Did you mean `n`?
  try:
      n
   |
13 |     else x
   |          ^

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
    in
    { 
      let new_n = n - count * value
      let new_acc = acc + string.repeat(symbol, count)
      in
      new_acc
    }
  ) 
  |> (x) => 
    if string.len(x) == 0 then "" 
    else x
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
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 14:5 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-2.almd:14:5
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |     }
   |     ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:10:23
  in variable count
  here: let new_n = n - count * value
  hint: Did you mean `map.count`?
  try:
      map.count
   |
10 |       let new_n = n - count * value
   |                       ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:10:31
  in variable value
  here: let new_n = n - count * value
  hint: Did you mean `values`?
  try:
      values
   |
10 |       let new_n = n - count * value
   |                               ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:11:21
  in variable acc
  here: let new_acc = acc + string.repeat(symbol, count)
  hint: Check the variable name
   |
11 |       let new_acc = acc + string.repeat(symbol, count)
   |                     ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:11:41
  in variable symbol
  here: let new_acc = acc + string.repeat(symbol, count)
  hint: Did you mean `symbols`?
  try:
      symbols
   |
11 |       let new_acc = acc + string.repeat(symbol, count)
   |                                         ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:11:49
  in variable count
  here: let new_acc = acc + string.repeat(symbol, count)
  hint: Did you mean `map.count`?
  try:
      map.count
   |
11 |       let new_acc = acc + string.repeat(symbol, count)
   |                                                 ^^^^^

7 error(s) found
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
    in
    (acc.0 - count * value, acc.1 + string.repeat(symbol, count))
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
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:4:32
  in fn 'to_roman'
  here: let pairs = list.zip(values, symbols)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
4 |   let pairs = list.zip(values, symbols)
  |                                ^^^^^^^

2 error(s) found
FAILED: /tmp/dojo-roman-numeral-3.almd
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
