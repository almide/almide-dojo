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
  let f = (acc: String, x: Int) => 
    list.fold(pairs, acc, (acc, (value, symbol)) => 
      if x >= value 
      then acc + string.repeat(symbol, x / value) 
      else acc)
  in list.fold(pairs, "", (acc, _) => acc) |> f(n)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:8:32
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
8 |       then acc + string.repeat(symbol, x / value)
  |                                ^^^^^^
error[E005]: argument 'f' expects fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-0.almd:9:12
  in call to list.fold()
  hint: Fix the argument type
  |
9 |       else acc)
  |            ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-0.almd:9:12
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
9 |       else acc)
  |            ^^^

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
  let f = (acc: String, (value, symbol): (Int, String)) => 
    if n >= value 
    then acc + string.repeat(symbol, n / value) 
    else acc
  in list.fold(pairs, "", f)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected ')' to close lambda parameters opened at line 5:11
  --> /tmp/dojo-roman-numeral-1.almd:5:40
  hint: Add ')' or check for a missing delimiter inside the lambda parameters
  |
5 |   let f = (acc: String, (value, symbol): (Int, String)) =>
  |           --------------- '(' opened here
  |
5 |   let f = (acc: String, (value, symbol): (Int, String)) =>
  |                                        ^
error: Expected expression at line 9:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-1.almd:9:3
  |
9 |   in list.fold(pairs, "", f)
  |   ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:6:13
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
6 |     if n >= value
  |             ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:7:10
  in variable acc
  hint: Check the variable name
  |
7 |     then acc + string.repeat(symbol, n / value)
  |          ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:7:30
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
7 |     then acc + string.repeat(symbol, n / value)
  |                              ^^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:7:42
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
7 |     then acc + string.repeat(symbol, n / value)
  |                                          ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:8:10
  in variable acc
  hint: Check the variable name
  |
8 |     else acc
  |          ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:8:10
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
8 |     else acc
  |          ^^^

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
  let f = (acc: String, pair: (Int, String)) => 
    if n >= pair.0 
    then acc + string.repeat(pair.1, n / pair.0) 
    else acc
  in 
  let result = list.fold(pairs, "", f)
  in result
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let values = list.reverse([1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1])
  let symbols = list.reverse(["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"])
  let pairs = list.zip(values, symbols)
  let f = (acc: (Int, String), pair: (Int, String)) => 
    let count = acc.0 / pair.0
    let new_n = acc.0 - count * pair.0
    let new_acc = acc.1 + string.repeat(pair.1, count)
    (new_n, new_acc)
  in 
  let result = list.fold(pairs, (n, ""), f)
  in result.1
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let count = acc.0 / pair.0
  |     ^^^
error: Expected expression at line 10:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-3.almd:10:3
   |
10 |   in
   |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:7:17
  in variable acc
  hint: Check the variable name
  |
7 |     let new_n = acc.0 - count * pair.0
  |                 ^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:7:25
  in variable count
  hint: Check the variable name
  |
7 |     let new_n = acc.0 - count * pair.0
  |                         ^^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-3.almd:7:33
  in variable pair
  hint: Did you mean `pairs`?
  try:
      // pair  →  pairs
      pairs
  |
7 |     let new_n = acc.0 - count * pair.0
  |                                 ^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:8:19
  in variable acc
  hint: Check the variable name
  |
8 |     let new_acc = acc.1 + string.repeat(pair.1, count)
  |                   ^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-3.almd:8:41
  in variable pair
  hint: Did you mean `pairs`?
  try:
      // pair  →  pairs
      pairs
  |
8 |     let new_acc = acc.1 + string.repeat(pair.1, count)
  |                                         ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:8:49
  in variable count
  hint: Check the variable name
  |
8 |     let new_acc = acc.1 + string.repeat(pair.1, count)
  |                                                 ^^^^^
error[E003]: undefined variable 'f'
  --> /tmp/dojo-roman-numeral-3.almd:11:42
  in variable f
  hint: Did you mean `n`?
  try:
      // f  →  n
      n
   |
11 |   let result = list.fold(pairs, (n, ""), f)
   |                                          ^

9 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
