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
  let result = list.fold(
    list.zip(values, symbols), 
    "", 
    (acc, (x, y)) => 
      let count = int.div(n, x)
      let n = int.mod(n, x)
      acc + string.repeat(y, count)
  )
  result
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:8:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let count = int.div(n, x)
  |       ^^^
error: Expected name at line 9:19 (got Mod 'mod')
  --> /tmp/dojo-roman-numeral-0.almd:9:19
  |
9 |       let n = int.mod(n, x)
  |                   ^
error: Expected expression at line 11:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-0.almd:11:3
   |
11 |   )
   |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:10:7
  in variable acc
  hint: Check the variable name
   |
10 |       acc + string.repeat(y, count)
   |       ^^^
error[E003]: undefined variable 'y'
  --> /tmp/dojo-roman-numeral-0.almd:10:27
  in variable y
  hint: Did you mean `n`?
  try:
      // y  →  n
      n
   |
10 |       acc + string.repeat(y, count)
   |                           ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-0.almd:10:30
  in variable count
  hint: Check the variable name
   |
10 |       acc + string.repeat(y, count)
   |                              ^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-0.almd:12:3
  in variable result
  hint: Check the variable name
   |
12 |   result
   |   ^^^^^^

7 error(s) found
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
  list.fold(
    list.zip(values, symbols), 
    "", 
    (acc, pair) => 
      let count = int.div(n, pair.0)
      let remaining = int.mod(n, pair.0)
      acc + string.repeat(pair.1, count)
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:8:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let count = int.div(n, pair.0)
  |       ^^^
error: Expected name at line 9:27 (got Mod 'mod')
  --> /tmp/dojo-roman-numeral-1.almd:9:27
  |
9 |       let remaining = int.mod(n, pair.0)
  |                           ^
error: Expected expression at line 11:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:11:3
   |
11 |   )
   |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:10:7
  in variable acc
  hint: Check the variable name
   |
10 |       acc + string.repeat(pair.1, count)
   |       ^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-1.almd:10:27
  in variable pair
  hint: Did you mean `panic`?
  try:
      // pair  →  panic
      panic
   |
10 |       acc + string.repeat(pair.1, count)
   |                           ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-1.almd:10:35
  in variable count
  hint: Check the variable name
   |
10 |       acc + string.repeat(pair.1, count)
   |                                   ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:10:35
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
10 |       acc + string.repeat(pair.1, count)
   |                                   ^^^^^

7 error(s) found
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
  list.fold(
    list.zip(values, symbols), 
    "", 
    (acc, (value, symbol)) => 
      let count = int.div(n, value)
      let remaining = int.rem(n, value)
      acc + string.repeat(symbol, count)
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:8:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let count = int.div(n, value)
  |       ^^^
error: Expected expression at line 11:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-2.almd:11:3
   |
11 |   )
   |   ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:9:34
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
9 |       let remaining = int.rem(n, value)
  |                                  ^^^^^
error[E002]: undefined function 'int.rem'
  --> /tmp/dojo-roman-numeral-2.almd:9:34
  in call to int.rem()
  hint: No function 'rem' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
9 |       let remaining = int.rem(n, value)
  |                                  ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:10:7
  in variable acc
  hint: Check the variable name
   |
10 |       acc + string.repeat(symbol, count)
   |       ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:10:27
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
10 |       acc + string.repeat(symbol, count)
   |                           ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:10:35
  in variable count
  hint: Check the variable name
   |
10 |       acc + string.repeat(symbol, count)
   |                                   ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:10:35
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
10 |       acc + string.repeat(symbol, count)
   |                                   ^^^^^

8 error(s) found
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
  let result = list.fold(
    list.zip(values, symbols), 
    "", 
    (acc, (value, symbol)) => 
      let count = int.div(n, value)
      let remaining = int.div(n, value) * value
      let n = n - remaining
      acc + string.repeat(symbol, count)
  )
  result
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:8:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let count = int.div(n, value)
  |       ^^^
error: Expected expression at line 12:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-3.almd:12:3
   |
12 |   )
   |   ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:9:34
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
9 |       let remaining = int.div(n, value) * value
  |                                  ^^^^^
error[E002]: undefined function 'int.div'
  --> /tmp/dojo-roman-numeral-3.almd:9:34
  in call to int.div()
  hint: Did you mean `int.min`?
  try:
      // int.div(...)  →  int.min(...)
      int.min(...)
  |
9 |       let remaining = int.div(n, value) * value
  |                                  ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:9:43
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
9 |       let remaining = int.div(n, value) * value
  |                                           ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:11:7
  in variable acc
  hint: Check the variable name
   |
11 |       acc + string.repeat(symbol, count)
   |       ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:11:27
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
11 |       acc + string.repeat(symbol, count)
   |                           ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:11:35
  in variable count
  hint: Check the variable name
   |
11 |       acc + string.repeat(symbol, count)
   |                                   ^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-3.almd:13:3
  in variable result
  hint: Check the variable name
   |
13 |   result
   |   ^^^^^^

9 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
