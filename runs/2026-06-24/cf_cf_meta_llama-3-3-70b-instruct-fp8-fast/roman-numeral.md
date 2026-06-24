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
  let pairs = list.zip(values, symbols)
  in 
  list.fold(pairs, "", (acc, (value, symbol)) => 
    if n >= value then 
      acc + string.repeat(symbol, n / value)
    else 
      acc
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:8:27
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
8 |       acc + string.repeat(symbol, n / value)
  |                           ^^^^^^
error[E005]: argument 'f' expects fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-0.almd:10:7
  in call to list.fold()
  hint: Fix the argument type
   |
10 |       acc
   |       ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-0.almd:10:7
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
10 |       acc
   |       ^^^

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
  let pairs = list.zip(values, symbols)
  in 
  list.fold(pairs, "", (acc, pair) => 
    let (value, symbol) = pair
    in 
    if n >= value then 
      acc + string.repeat(symbol, n / value)
    else 
      acc
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:7:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |     let (value, symbol) = pair
  |     ^^^
error: Expected expression at line 13:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:13:3
   |
13 |   )
   |   ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:9:13
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
9 |     if n >= value then
  |             ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:10:7
  in variable acc
  hint: Check the variable name
   |
10 |       acc + string.repeat(symbol, n / value)
   |       ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:10:27
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
10 |       acc + string.repeat(symbol, n / value)
   |                           ^^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:10:39
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
   |
10 |       acc + string.repeat(symbol, n / value)
   |                                       ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:12:7
  in variable acc
  hint: Check the variable name
   |
12 |       acc
   |       ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:12:7
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
12 |       acc
   |       ^^^

8 error(s) found
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
  let pairs = list.zip(values, symbols)
  in 
  list.fold(pairs, "", (acc, (value, symbol)) => 
    if n >= value then 
      acc + string.repeat(symbol, n / value)
    else 
      acc
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:8:27
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
8 |       acc + string.repeat(symbol, n / value)
  |                           ^^^^^^
error[E005]: argument 'f' expects fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-2.almd:10:7
  in call to list.fold()
  hint: Fix the argument type
   |
10 |       acc
   |       ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-2.almd:10:7
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
10 |       acc
   |       ^^^

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
  let pairs = list.zip(values, symbols)
  in 
  list.fold(pairs, "", (acc, pair) => 
    let (value, symbol) = pair
    in 
    if n >= value then 
      acc + string.repeat(symbol, n / value)
    else 
      acc
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:7:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |     let (value, symbol) = pair
  |     ^^^
error: Expected expression at line 13:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-3.almd:13:3
   |
13 |   )
   |   ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:9:13
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
9 |     if n >= value then
  |             ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:10:7
  in variable acc
  hint: Check the variable name
   |
10 |       acc + string.repeat(symbol, n / value)
   |       ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:10:27
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
10 |       acc + string.repeat(symbol, n / value)
   |                           ^^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:10:39
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
   |
10 |       acc + string.repeat(symbol, n / value)
   |                                       ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:12:7
  in variable acc
  hint: Check the variable name
   |
12 |       acc
   |       ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:12:7
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
12 |       acc
   |       ^^^

8 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
