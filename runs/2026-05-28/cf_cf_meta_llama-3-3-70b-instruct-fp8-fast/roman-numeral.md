# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E009`

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  let pairs = list.zip(values, symbols)
  let f = (acc, (value, symbol)) => 
    if n >= value 
    then 
      let count = n / value
      let rest = n % value
      acc + string.repeat(symbol, count) + f(acc, (rest, ""))
    else acc
  list.fold(pairs, "", (acc, pair) => f(acc, pair))
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:8:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let count = n / value
  |       ^^^
error: Expected expression at line 11:5 (got Else 'else')
  --> /tmp/dojo-roman-numeral-0.almd:11:5
   |
11 |     else acc
   |     ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:9:22
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
9 |       let rest = n % value
  |                      ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:10:7
  in variable acc
  hint: Check the variable name
   |
10 |       acc + string.repeat(symbol, count) + f(acc, (rest, ""))
   |       ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:10:27
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
10 |       acc + string.repeat(symbol, count) + f(acc, (rest, ""))
   |                           ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-0.almd:10:35
  in variable count
  hint: Check the variable name
   |
10 |       acc + string.repeat(symbol, count) + f(acc, (rest, ""))
   |                                   ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:10:46
  in variable acc
  hint: Check the variable name
   |
10 |       acc + string.repeat(symbol, count) + f(acc, (rest, ""))
   |                                              ^^^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-0.almd:10:58
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
   |
10 |       acc + string.repeat(symbol, count) + f(acc, (rest, ""))
   |                                                          ^^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-0.almd:12:46
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
   |
12 |   list.fold(pairs, "", (acc, pair) => f(acc, pair))
   |                                              ^^^^

9 error(s) found
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
  list.fold(pairs, "", (acc, (value, symbol)) => 
    if n >= value 
    then 
      let count = n / value
      let rest = n % value
      acc + string.repeat(symbol, count)
    else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:8:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let count = n / value
  |       ^^^
error: Expected expression at line 11:5 (got Else 'else')
  --> /tmp/dojo-roman-numeral-1.almd:11:5
   |
11 |     else acc)
   |     ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:9:22
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
9 |       let rest = n % value
  |                      ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:10:7
  in variable acc
  hint: Check the variable name
   |
10 |       acc + string.repeat(symbol, count)
   |       ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:10:27
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
10 |       acc + string.repeat(symbol, count)
   |                           ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-1.almd:10:35
  in variable count
  hint: Check the variable name
   |
10 |       acc + string.repeat(symbol, count)
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
10 |       acc + string.repeat(symbol, count)
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
  list.fold(
    list.zip([1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1], ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]),
    "",
    (acc, (value, symbol)) => 
      if n >= value 
      then 
        let count = n / value
        let rest = n % value
        acc + string.repeat(symbol, count)
      else acc
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:8:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |         let count = n / value
  |         ^^^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  list.fold(
    list.zip([1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1], ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]),
    "",
    (acc, (value, symbol)) => 
      if n >= value 
      then 
        {
          let count = n / value
          let rest = n % value
          { n = rest; acc + string.repeat(symbol, count) }
        }
      else acc
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-roman-numeral-3.almd:11:17
  in n = ...
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
   |
11 |           { n = rest; acc + string.repeat(symbol, count) }
   |                 ^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:11:43
  in variable symbol
  hint: Check the variable name
   |
11 |           { n = rest; acc + string.repeat(symbol, count) }
   |                                           ^^^^^^
error[E005]: argument 'f' expects fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-3.almd:13:12
  in call to list.fold()
  hint: Fix the argument type
   |
13 |       else acc
   |            ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-3.almd:13:12
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
13 |       else acc
   |            ^^^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
