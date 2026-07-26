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
  let result = list.fold(pairs, "", (acc, (value, symbol)) => 
    let count = int.clamp(n / value, 0, n)
    acc + string.repeat(symbol, count)
  )
  string.trim(result)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let count = int.clamp(n / value, 0, n)
  |     ^^^
error: Expected expression at line 8:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-0.almd:8:3
  |
8 |   )
  |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:7:5
  in variable acc
  hint: Check the variable name
  |
7 |     acc + string.repeat(symbol, count)
  |     ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:7:25
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
7 |     acc + string.repeat(symbol, count)
  |                         ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-0.almd:7:33
  in variable count
  hint: Check the variable name
  |
7 |     acc + string.repeat(symbol, count)
  |                                 ^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-0.almd:9:15
  in variable result
  hint: Check the variable name
  |
9 |   string.trim(result)
  |               ^^^^^^

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
  list.fold(pairs, "", (acc, (value, symbol)) => 
    let count = n / value
    let n_next = n - count * value
    acc + string.repeat(symbol, count)
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let count = n / value
  |     ^^^
error: Expected expression at line 9:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:9:3
  |
9 |   )
  |   ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-1.almd:7:22
  in variable count
  hint: Check the variable name
  |
7 |     let n_next = n - count * value
  |                      ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:7:30
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
7 |     let n_next = n - count * value
  |                              ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:8:5
  in variable acc
  hint: Check the variable name
  |
8 |     acc + string.repeat(symbol, count)
  |     ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:8:25
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
8 |     acc + string.repeat(symbol, count)
  |                         ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-1.almd:8:33
  in variable count
  hint: Check the variable name
  |
8 |     acc + string.repeat(symbol, count)
  |                                 ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:8:33
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
8 |     acc + string.repeat(symbol, count)
  |                                 ^^^^^

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
  list.fold(pairs, (n, ""), (acc, (value, symbol)) => 
    let count = acc.0 / value
    let n_next = acc.0 - count * value
    (n_next, acc.1 + string.repeat(symbol, count))
  ).1
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let count = acc.0 / value
  |     ^^^
error: Expected expression at line 9:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-2.almd:9:3
  |
9 |   ).1
  |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:7:18
  in variable acc
  hint: Check the variable name
  |
7 |     let n_next = acc.0 - count * value
  |                  ^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:7:26
  in variable count
  hint: Check the variable name
  |
7 |     let n_next = acc.0 - count * value
  |                          ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:7:34
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
7 |     let n_next = acc.0 - count * value
  |                                  ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:8:14
  in variable acc
  hint: Check the variable name
  |
8 |     (n_next, acc.1 + string.repeat(symbol, count))
  |              ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:8:36
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
8 |     (n_next, acc.1 + string.repeat(symbol, count))
  |                                    ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:8:44
  in variable count
  hint: Check the variable name
  |
8 |     (n_next, acc.1 + string.repeat(symbol, count))
  |                                            ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:8:44
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
8 |     (n_next, acc.1 + string.repeat(symbol, count))
  |                                            ^^^^^

9 error(s) found
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
  let result = list.fold(pairs, (n, ""), (acc, pair) => 
    let value = pair.0
    let symbol = pair.1
    let count = acc.0 / value
    let n_next = acc.0 - count * value
    (n_next, acc.1 + string.repeat(symbol, count))
  )
  result.1
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let value = pair.0
  |     ^^^
error: Expected expression at line 11:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-3.almd:11:3
   |
11 |   )
   |   ^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-3.almd:7:18
  in variable pair
  hint: Did you mean `pairs`?
  try:
      // pair  →  pairs
      pairs
  |
7 |     let symbol = pair.1
  |                  ^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:8:17
  in variable acc
  hint: Check the variable name
  |
8 |     let count = acc.0 / value
  |                 ^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:8:25
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
8 |     let count = acc.0 / value
  |                         ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:9:18
  in variable acc
  hint: Check the variable name
  |
9 |     let n_next = acc.0 - count * value
  |                  ^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:9:34
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
9 |     let n_next = acc.0 - count * value
  |                                  ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:10:14
  in variable acc
  hint: Check the variable name
   |
10 |     (n_next, acc.1 + string.repeat(symbol, count))
   |              ^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-3.almd:12:3
  in variable result
  hint: Check the variable name
   |
12 |   result.1
   |   ^^^^^^

9 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
