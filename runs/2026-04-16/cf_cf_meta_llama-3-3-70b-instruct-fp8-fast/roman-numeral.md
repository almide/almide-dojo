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
  let f = (acc: String, val: Int, sym: String) -> 
    if val <= n then 
      let count = int.clamp(n / val, 0, n / val)
      let rest = n - count * val
      list.repeat(sym, count) + f(acc, rest, "")
    else acc
  let result = list.fold(pairs, "", (acc, (val, sym)) => f(acc, val, sym))
  string.trim(result)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Expected ')' to close parenthesized expression opened at line 5:11
  --> /tmp/dojo-roman-numeral-0.almd:5:15
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
5 |   let f = (acc: String, val: Int, sym: String) ->
  |           --------------- '(' opened here
  |
5 |   let f = (acc: String, val: Int, sym: String) ->
  |               ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let count = int.clamp(n / val, 0, n / val)
  |       ^^^
error: Expected expression at line 10:5 (got Else 'else')
  --> /tmp/dojo-roman-numeral-0.almd:10:5
   |
10 |     else acc
   |     ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-0.almd:8:22
  in variable count
  hint: Check the variable name
  |
8 |       let rest = n - count * val
  |                      ^^^^^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-roman-numeral-0.almd:8:30
  in variable val
  hint: Check the variable name
  |
8 |       let rest = n - count * val
  |                              ^^^
error[E003]: undefined variable 'sym'
  --> /tmp/dojo-roman-numeral-0.almd:9:19
  in variable sym
  hint: Check the variable name
  |
9 |       list.repeat(sym, count) + f(acc, rest, "")
  |                   ^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-0.almd:9:24
  in variable count
  hint: Check the variable name
  |
9 |       list.repeat(sym, count) + f(acc, rest, "")
  |                        ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:9:35
  in variable acc
  hint: Check the variable name
  |
9 |       list.repeat(sym, count) + f(acc, rest, "")
  |                                   ^^^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-0.almd:9:46
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
  |
9 |       list.repeat(sym, count) + f(acc, rest, "")
  |                                              ^^
error[E003]: undefined variable 'sym'
  --> /tmp/dojo-roman-numeral-0.almd:11:70
  in variable sym
  hint: Check the variable name
   |
11 |   let result = list.fold(pairs, "", (acc, (val, sym)) => f(acc, val, sym))
   |                                                                      ^^^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-0.almd:11:70
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
   |
11 |   let result = list.fold(pairs, "", (acc, (val, sym)) => f(acc, val, sym))
   |                                                                      ^^^

11 error(s) found
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
  let f = (acc: String, pair: (Int, String)) -> 
    if pair.0 <= n then 
      let count = n / pair.0
      let rest = n - count * pair.0
      list.repeat(pair.1, count) + f(acc, (rest, ""))
    else acc
  let result = list.fold(pairs, "", (acc, pair) => 
    if pair.0 <= n then 
      let count = n / pair.0
      let rest = n - count * pair.0
      list.repeat(pair.1, count) + f(acc, (rest, ""))
    else acc)
  result
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected ')' to close parenthesized expression opened at line 5:11
  --> /tmp/dojo-roman-numeral-1.almd:5:15
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
5 |   let f = (acc: String, pair: (Int, String)) ->
  |           --------------- '(' opened here
  |
5 |   let f = (acc: String, pair: (Int, String)) ->
  |               ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let count = n / pair.0
  |       ^^^
error: Expected expression at line 10:5 (got Else 'else')
  --> /tmp/dojo-roman-numeral-1.almd:10:5
   |
10 |     else acc
   |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:13:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |       let count = n / pair.0
   |       ^^^
error: Expected expression at line 16:5 (got Else 'else')
  --> /tmp/dojo-roman-numeral-1.almd:16:5
   |
16 |     else acc)
   |     ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-1.almd:8:22
  in variable count
  hint: Check the variable name
  |
8 |       let rest = n - count * pair.0
  |                      ^^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-1.almd:8:30
  in variable pair
  hint: Did you mean `pairs`?
  try:
      // pair  →  pairs
      pairs
  |
8 |       let rest = n - count * pair.0
  |                              ^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-1.almd:9:19
  in variable pair
  hint: Did you mean `pairs`?
  try:
      // pair  →  pairs
      pairs
  |
9 |       list.repeat(pair.1, count) + f(acc, (rest, ""))
  |                   ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-1.almd:9:27
  in variable count
  hint: Check the variable name
  |
9 |       list.repeat(pair.1, count) + f(acc, (rest, ""))
  |                           ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:9:38
  in variable acc
  hint: Check the variable name
  |
9 |       list.repeat(pair.1, count) + f(acc, (rest, ""))
  |                                      ^^^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-1.almd:9:50
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
  |
9 |       list.repeat(pair.1, count) + f(acc, (rest, ""))
  |                                                  ^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-1.almd:14:22
  in variable count
  hint: Check the variable name
   |
14 |       let rest = n - count * pair.0
   |                      ^^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-1.almd:14:30
  in variable pair
  hint: Did you mean `pairs`?
  try:
      // pair  →  pairs
      pairs
   |
14 |       let rest = n - count * pair.0
   |                              ^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-1.almd:15:19
  in variable pair
  hint: Did you mean `pairs`?
  try:
      // pair  →  pairs
      pairs
   |
15 |       list.repeat(pair.1, count) + f(acc, (rest, ""))
   |                   ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-1.almd:15:27
  in variable count
  hint: Check the variable name
   |
15 |       list.repeat(pair.1, count) + f(acc, (rest, ""))
   |                           ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:15:38
  in variable acc
  hint: Check the variable name
   |
15 |       list.repeat(pair.1, count) + f(acc, (rest, ""))
   |                                      ^^^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-1.almd:15:50
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
   |
15 |       list.repeat(pair.1, count) + f(acc, (rest, ""))
   |                                                  ^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-1.almd:17:3
  in variable result
  hint: Did you mean `rest`?
  try:
      // result  →  rest
      rest
   |
17 |   result
   |   ^^^^^^

18 error(s) found
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
  list.fold(pairs, "", (acc, pair) => 
    if pair.0 <= n then 
      let count = n / pair.0
      let rest = n - count * pair.0
      list.repeat(pair.1, count) + acc
    else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let count = n / pair.0
  |       ^^^
error: Expected expression at line 10:5 (got Else 'else')
  --> /tmp/dojo-roman-numeral-2.almd:10:5
   |
10 |     else acc)
   |     ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:8:22
  in variable count
  hint: Check the variable name
  |
8 |       let rest = n - count * pair.0
  |                      ^^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-2.almd:8:30
  in variable pair
  hint: Did you mean `pairs`?
  try:
      // pair  →  pairs
      pairs
  |
8 |       let rest = n - count * pair.0
  |                              ^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-2.almd:9:19
  in variable pair
  hint: Did you mean `pairs`?
  try:
      // pair  →  pairs
      pairs
  |
9 |       list.repeat(pair.1, count) + acc
  |                   ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:9:27
  in variable count
  hint: Check the variable name
  |
9 |       list.repeat(pair.1, count) + acc
  |                           ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:9:36
  in variable acc
  hint: Check the variable name
  |
9 |       list.repeat(pair.1, count) + acc
  |                                    ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:9:36
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
9 |       list.repeat(pair.1, count) + acc
  |                                    ^^^

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
  list.fold(pairs, (n, ""), (pair, (rest, acc)) => 
    if pair.0 <= rest then 
      let count = rest / pair.0
      let new_rest = rest - count * pair.0
      (new_rest, list.repeat(pair.1, count) + acc)
    else (rest, acc)).1
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let count = rest / pair.0
  |       ^^^
error: Expected expression at line 10:5 (got Else 'else')
  --> /tmp/dojo-roman-numeral-3.almd:10:5
   |
10 |     else (rest, acc)).1
   |     ^
error[E003]: undefined variable 'rest'
  --> /tmp/dojo-roman-numeral-3.almd:8:22
  in variable rest
  hint: Check the variable name
  |
8 |       let new_rest = rest - count * pair.0
  |                      ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:8:29
  in variable count
  hint: Check the variable name
  |
8 |       let new_rest = rest - count * pair.0
  |                             ^^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-3.almd:8:37
  in variable pair
  hint: Did you mean `pairs`?
  try:
      // pair  →  pairs
      pairs
  |
8 |       let new_rest = rest - count * pair.0
  |                                     ^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-3.almd:9:30
  in variable pair
  hint: Did you mean `pairs`?
  try:
      // pair  →  pairs
      pairs
  |
9 |       (new_rest, list.repeat(pair.1, count) + acc)
  |                              ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:9:38
  in variable count
  hint: Check the variable name
  |
9 |       (new_rest, list.repeat(pair.1, count) + acc)
  |                                      ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:9:47
  in variable acc
  hint: Check the variable name
  |
9 |       (new_rest, list.repeat(pair.1, count) + acc)
  |                                               ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:9:47
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
9 |       (new_rest, list.repeat(pair.1, count) + acc)
  |                                               ^^^

9 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
