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
      let count = int.clamp(n / value, 0, n)
      let repeated = string.repeat(symbol, count)
      in 
        acc + repeated
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:8:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let count = int.clamp(n / value, 0, n)
  |       ^^^
error: Expected expression at line 12:5 (got RParen ')')
  --> /tmp/dojo-roman-numeral-0.almd:12:5
   |
12 |     )
   |     ^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:9:36
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
9 |       let repeated = string.repeat(symbol, count)
  |                                    ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-0.almd:9:44
  in variable count
  hint: Check the variable name
  |
9 |       let repeated = string.repeat(symbol, count)
  |                                            ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:11:9
  in variable acc
  hint: Check the variable name
   |
11 |         acc + repeated
   |         ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:11:15
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
11 |         acc + repeated
   |               ^^^^^^^^

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
  let pairs = list.zip(values, symbols)
  in 
    list.fold(pairs, "", (acc, pair) => 
      let (value, symbol) = pair
      let count = n / value
      let n = n - count * value
      let repeated = string.repeat(symbol, count)
      in 
        acc + repeated
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let (value, symbol) = pair
  |       ^^^
error: Expected expression at line 13:5 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:13:5
   |
13 |     )
   |     ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:8:23
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
8 |       let count = n / value
  |                       ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:9:27
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
9 |       let n = n - count * value
  |                           ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:10:36
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
10 |       let repeated = string.repeat(symbol, count)
   |                                    ^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:12:9
  in variable acc
  hint: Check the variable name
   |
12 |         acc + repeated
   |         ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:12:15
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
12 |         acc + repeated
   |               ^^^^^^^^

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
  let pairs = list.zip(values, symbols)
  in 
    list.fold(pairs, "", (acc, (value, symbol)) => 
      let count = n / value
      let n_remaining = n - count * value
      let repeated = string.repeat(symbol, count)
      in 
        acc + repeated
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let count = n / value
  |       ^^^
error: Expected expression at line 12:5 (got RParen ')')
  --> /tmp/dojo-roman-numeral-2.almd:12:5
   |
12 |     )
   |     ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:8:29
  in variable count
  hint: Check the variable name
  |
8 |       let n_remaining = n - count * value
  |                             ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:8:37
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
8 |       let n_remaining = n - count * value
  |                                     ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:9:36
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
9 |       let repeated = string.repeat(symbol, count)
  |                                    ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:9:44
  in variable count
  hint: Check the variable name
  |
9 |       let repeated = string.repeat(symbol, count)
  |                                            ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:11:9
  in variable acc
  hint: Check the variable name
   |
11 |         acc + repeated
   |         ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:11:15
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
11 |         acc + repeated
   |               ^^^^^^^^

8 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let values = list.repeat(1000, 1) + [900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  let pairs = list.zip(values, symbols)
  in 
    list.fold(pairs, (n, ""), (acc, (value, symbol)) => 
      let count = acc.0 / value
      let n_remaining = acc.0 - count * value
      let repeated = string.repeat(symbol, count)
      in 
        (n_remaining, acc.1 + repeated)
    ).1
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let count = acc.0 / value
  |       ^^^
error: Expected expression at line 12:5 (got RParen ')')
  --> /tmp/dojo-roman-numeral-3.almd:12:5
   |
12 |     ).1
   |     ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:8:25
  in variable acc
  hint: Check the variable name
  |
8 |       let n_remaining = acc.0 - count * value
  |                         ^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:8:33
  in variable count
  hint: Check the variable name
  |
8 |       let n_remaining = acc.0 - count * value
  |                                 ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:8:41
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
8 |       let n_remaining = acc.0 - count * value
  |                                         ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:9:36
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
9 |       let repeated = string.repeat(symbol, count)
  |                                    ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:9:44
  in variable count
  hint: Check the variable name
  |
9 |       let repeated = string.repeat(symbol, count)
  |                                            ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:11:23
  in variable acc
  hint: Check the variable name
   |
11 |         (n_remaining, acc.1 + repeated)
   |                       ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:11:31
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
11 |         (n_remaining, acc.1 + repeated)
   |                               ^^^^^^^^

9 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
