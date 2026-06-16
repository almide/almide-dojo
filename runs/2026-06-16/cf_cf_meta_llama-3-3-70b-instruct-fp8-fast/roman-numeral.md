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
  let f = (acc: String, x: (Int, String)) -> 
    let (value, symbol) = x
    let count = int.clamp(n / value, 0, n / value)
    let rest = n - count * value
    let repeated = string.repeat(symbol, count)
    if rest == n then acc else repeated + f(acc, (rest, ""))
  let result = list.fold(pairs, "", f)
  result
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Expected ')' to close parenthesized expression opened at line 5:11
  --> /tmp/dojo-roman-numeral-0.almd:5:15
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
5 |   let f = (acc: String, x: (Int, String)) ->
  |           --------------- '(' opened here
  |
5 |   let f = (acc: String, x: (Int, String)) ->
  |               ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-roman-numeral-0.almd:6:27
  in variable x
  hint: Did you mean `n`?
  try:
      // x  →  n
      n
  |
6 |     let (value, symbol) = x
  |                           ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:10:23
  in variable acc
  hint: Check the variable name
   |
10 |     if rest == n then acc else repeated + f(acc, (rest, ""))
   |                       ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:10:45
  in variable acc
  hint: Check the variable name
   |
10 |     if rest == n then acc else repeated + f(acc, (rest, ""))
   |                                             ^^^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-0.almd:10:57
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
   |
10 |     if rest == n then acc else repeated + f(acc, (rest, ""))
   |                                                         ^^
error[E003]: undefined variable 'f'
  --> /tmp/dojo-roman-numeral-0.almd:11:37
  in variable f
  hint: Did you mean `n`?
  try:
      // f  →  n
      n
   |
11 |   let result = list.fold(pairs, "", f)
   |                                     ^

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
  let f = (acc: String, (value, symbol): (Int, String)) -> 
    let count = int.clamp(n / value, 0, n / value)
    let rest = n - count * value
    let repeated = string.repeat(symbol, count)
    if rest == 0 then acc + repeated else f(acc + repeated, list.first(pairs |> list.drop((list.len(pairs) - list.len(pairs |> list.drop_while((x) => x.0 > rest))))) |> option.unwrap_or((0, "")))
  let result = f("", list.first(pairs) |> option.unwrap_or((0, "")))
  result
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected ')' to close parenthesized expression opened at line 5:11
  --> /tmp/dojo-roman-numeral-1.almd:5:15
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
5 |   let f = (acc: String, (value, symbol): (Int, String)) ->
  |           --------------- '(' opened here
  |
5 |   let f = (acc: String, (value, symbol): (Int, String)) ->
  |               ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:6:31
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
6 |     let count = int.clamp(n / value, 0, n / value)
  |                               ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:6:45
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
6 |     let count = int.clamp(n / value, 0, n / value)
  |                                             ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:7:28
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
7 |     let rest = n - count * value
  |                            ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:8:34
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
8 |     let repeated = string.repeat(symbol, count)
  |                                  ^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:9:23
  in variable acc
  hint: Check the variable name
  |
9 |     if rest == 0 then acc + repeated else f(acc + repeated, list.first(pairs |> list.drop((list.len(pairs) - list.len(pairs |> list.drop_while((x) => x.0 > rest))))) |> option.unwrap_or((0, "")))
  |                       ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:9:45
  in variable acc
  hint: Check the variable name
  |
9 |     if rest == 0 then acc + repeated else f(acc + repeated, list.first(pairs |> list.drop((list.len(pairs) - list.len(pairs |> list.drop_while((x) => x.0 > rest))))) |> option.unwrap_or((0, "")))
  |                                             ^^^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-1.almd:9:191
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
  |
9 |     if rest == 0 then acc + repeated else f(acc + repeated, list.first(pairs |> list.drop((list.len(pairs) - list.len(pairs |> list.drop_while((x) => x.0 > rest))))) |> option.unwrap_or((0, "")))
  |                                                                                                                                                                                               ^^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-1.almd:10:64
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
   |
10 |   let result = f("", list.first(pairs) |> option.unwrap_or((0, "")))
   |                                                                ^^

9 error(s) found
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
  let f = (acc: String, pairs: List[(Int, String)]) -> 
    if list.is_empty(pairs) then acc 
    else 
      let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
      let count = n / value
      let rest = n - count * value
      let repeated = string.repeat(symbol, count)
      f(acc + repeated, list.drop(pairs, 1))
  f("", pairs)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected ')' to close parenthesized expression opened at line 5:11
  --> /tmp/dojo-roman-numeral-2.almd:5:15
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
5 |   let f = (acc: String, pairs: List[(Int, String)]) ->
  |           --------------- '(' opened here
  |
5 |   let f = (acc: String, pairs: List[(Int, String)]) ->
  |               ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:8:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
  |       ^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:9:23
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
9 |       let count = n / value
  |                       ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:10:30
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
   |
10 |       let rest = n - count * value
   |                              ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:11:36
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
11 |       let repeated = string.repeat(symbol, count)
   |                                    ^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:12:9
  in variable acc
  hint: Check the variable name
   |
12 |       f(acc + repeated, list.drop(pairs, 1))
   |         ^^^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-2.almd:12:42
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
   |
12 |       f(acc + repeated, list.drop(pairs, 1))
   |                                          ^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-2.almd:13:9
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
   |
13 |   f("", pairs)
   |         ^^^^^

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
  let pairs = list.zip(values, symbols)
  let f = (n: Int, acc: String, pairs: List[(Int, String)]) -> 
    if list.is_empty(pairs) then acc 
    else 
      let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
      let count = n / value
      let rest = n - count * value
      let repeated = string.repeat(symbol, count)
      f(rest, acc + repeated, list.drop(pairs, 1))
  f(n, "", pairs)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected ')' to close parenthesized expression opened at line 5:11
  --> /tmp/dojo-roman-numeral-3.almd:5:13
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
5 |   let f = (n: Int, acc: String, pairs: List[(Int, String)]) ->
  |           --------------- '(' opened here
  |
5 |   let f = (n: Int, acc: String, pairs: List[(Int, String)]) ->
  |             ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:8:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
  |       ^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:9:23
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
9 |       let count = n / value
  |                       ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:10:30
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
   |
10 |       let rest = n - count * value
   |                              ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:11:36
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
11 |       let repeated = string.repeat(symbol, count)
   |                                    ^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:12:15
  in variable acc
  hint: Check the variable name
   |
12 |       f(rest, acc + repeated, list.drop(pairs, 1))
   |               ^^^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-3.almd:12:48
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
   |
12 |       f(rest, acc + repeated, list.drop(pairs, 1))
   |                                                ^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-3.almd:13:12
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
   |
13 |   f(n, "", pairs)
   |            ^^^^^

8 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
