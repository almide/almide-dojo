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
  let f = (acc, (value, symbol)) => 
    if n >= value then 
      let count = n / value
      let rest = n - count * value
      acc + string.repeat(symbol, count) + f("", (rest, ""))
    else 
      acc
  list.fold(pairs, "", (acc, pair) => f(acc, pair))
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let count = n / value
  |       ^^^
error: Expected expression at line 10:5 (got Else 'else')
  --> /tmp/dojo-roman-numeral-0.almd:10:5
   |
10 |     else
   |     ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-0.almd:8:22
  in variable count
  hint: Check the variable name
  |
8 |       let rest = n - count * value
  |                      ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:8:30
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
8 |       let rest = n - count * value
  |                              ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:9:7
  in variable acc
  hint: Check the variable name
  |
9 |       acc + string.repeat(symbol, count) + f("", (rest, ""))
  |       ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:9:27
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
9 |       acc + string.repeat(symbol, count) + f("", (rest, ""))
  |                           ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-0.almd:9:35
  in variable count
  hint: Check the variable name
  |
9 |       acc + string.repeat(symbol, count) + f("", (rest, ""))
  |                                   ^^^^^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-0.almd:9:57
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
  |
9 |       acc + string.repeat(symbol, count) + f("", (rest, ""))
  |                                                         ^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:11:7
  in variable acc
  hint: Check the variable name
   |
11 |       acc
   |       ^^^
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

10 error(s) found
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
    if n >= value then 
      let count = n / value
      let rest = n - count * value
      acc + string.repeat(symbol, count)
    else 
      acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let count = n / value
  |       ^^^
error: Expected expression at line 10:5 (got Else 'else')
  --> /tmp/dojo-roman-numeral-1.almd:10:5
   |
10 |     else
   |     ^
error: Expected expression at line 11:10 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:11:10
   |
11 |       acc)
   |          ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-1.almd:8:22
  in variable count
  hint: Check the variable name
  |
8 |       let rest = n - count * value
  |                      ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:8:30
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
8 |       let rest = n - count * value
  |                              ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:9:7
  in variable acc
  hint: Check the variable name
  |
9 |       acc + string.repeat(symbol, count)
  |       ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:9:27
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
9 |       acc + string.repeat(symbol, count)
  |                           ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-1.almd:9:35
  in variable count
  hint: Check the variable name
  |
9 |       acc + string.repeat(symbol, count)
  |                                   ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:11:7
  in variable acc
  hint: Check the variable name
   |
11 |       acc)
   |       ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:11:7
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
11 |       acc)
   |       ^^^

10 error(s) found
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
  list.fold(pairs, (n, ""), (acc_n, acc_s, (value, symbol)) => 
    if acc_n >= value then 
      let count = acc_n / value
      let rest = acc_n - count * value
      (rest, acc_s + string.repeat(symbol, count))
    else 
      (acc_n, acc_s))
  |> (x) => x.1
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let count = acc_n / value
  |       ^^^
error: Expected expression at line 10:5 (got Else 'else')
  --> /tmp/dojo-roman-numeral-2.almd:10:5
   |
10 |     else
   |     ^
error[E003]: undefined variable 'acc_n'
  --> /tmp/dojo-roman-numeral-2.almd:8:18
  in variable acc_n
  hint: Check the variable name
  |
8 |       let rest = acc_n - count * value
  |                  ^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:8:26
  in variable count
  hint: Check the variable name
  |
8 |       let rest = acc_n - count * value
  |                          ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:8:34
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
8 |       let rest = acc_n - count * value
  |                                  ^^^^^
error[E003]: undefined variable 'acc_s'
  --> /tmp/dojo-roman-numeral-2.almd:9:14
  in variable acc_s
  hint: Check the variable name
  |
9 |       (rest, acc_s + string.repeat(symbol, count))
  |              ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:9:36
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
9 |       (rest, acc_s + string.repeat(symbol, count))
  |                                    ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:9:44
  in variable count
  hint: Check the variable name
  |
9 |       (rest, acc_s + string.repeat(symbol, count))
  |                                            ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:9:44
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
9 |       (rest, acc_s + string.repeat(symbol, count))
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
  list.fold(pairs, (n, ""), (acc_n, acc_s, (value, symbol)) => 
    if acc_n >= value then 
      let count = acc_n / value
      let rest = acc_n - count * value
      (rest, acc_s + string.repeat(symbol, count))
    else 
      (acc_n, acc_s))
  |> (x) => x.1
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let count = acc_n / value
  |       ^^^
error: Expected expression at line 10:5 (got Else 'else')
  --> /tmp/dojo-roman-numeral-3.almd:10:5
   |
10 |     else
   |     ^
error[E003]: undefined variable 'acc_n'
  --> /tmp/dojo-roman-numeral-3.almd:8:18
  in variable acc_n
  hint: Check the variable name
  |
8 |       let rest = acc_n - count * value
  |                  ^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:8:26
  in variable count
  hint: Check the variable name
  |
8 |       let rest = acc_n - count * value
  |                          ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:8:34
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
8 |       let rest = acc_n - count * value
  |                                  ^^^^^
error[E003]: undefined variable 'acc_s'
  --> /tmp/dojo-roman-numeral-3.almd:9:14
  in variable acc_s
  hint: Check the variable name
  |
9 |       (rest, acc_s + string.repeat(symbol, count))
  |              ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:9:36
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
9 |       (rest, acc_s + string.repeat(symbol, count))
  |                                    ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:9:44
  in variable count
  hint: Check the variable name
  |
9 |       (rest, acc_s + string.repeat(symbol, count))
  |                                            ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:9:44
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
9 |       (rest, acc_s + string.repeat(symbol, count))
  |                                            ^^^^^

9 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
