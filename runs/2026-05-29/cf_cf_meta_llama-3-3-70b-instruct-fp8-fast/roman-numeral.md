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
  let f = (acc, (val, sym)) => 
    if n >= val 
    then let count = n / val
         let repeated = string.repeat(sym, count)
         repeated + acc
    else acc
  list.fold(pairs, "", f)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:7:10
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |     then let count = n / val
  |          ^^^
error: Expected expression at line 10:5 (got Else 'else')
  --> /tmp/dojo-roman-numeral-0.almd:10:5
   |
10 |     else acc
   |     ^
error[E003]: undefined variable 'sym'
  --> /tmp/dojo-roman-numeral-0.almd:8:39
  in variable sym
  hint: Check the variable name
  |
8 |          let repeated = string.repeat(sym, count)
  |                                       ^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-0.almd:8:44
  in variable count
  hint: Check the variable name
  |
8 |          let repeated = string.repeat(sym, count)
  |                                            ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:9:21
  in variable acc
  hint: Check the variable name
  |
9 |          repeated + acc
  |                     ^^^
error[E003]: undefined variable 'f'
  --> /tmp/dojo-roman-numeral-0.almd:11:24
  in variable f
  hint: Did you mean `n`?
  try:
      // f  →  n
      n
   |
11 |   list.fold(pairs, "", f)
   |                        ^

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
  let f = (acc, (val, sym)) => 
    if n >= val 
    then 
      let count = n / val
      let repeated = string.repeat(sym, count)
      repeated + acc
    else acc
  in list.fold(pairs, "", f)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:8:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let count = n / val
  |       ^^^
error: Expected expression at line 11:5 (got Else 'else')
  --> /tmp/dojo-roman-numeral-1.almd:11:5
   |
11 |     else acc
   |     ^
error[E003]: undefined variable 'sym'
  --> /tmp/dojo-roman-numeral-1.almd:9:36
  in variable sym
  hint: Check the variable name
  |
9 |       let repeated = string.repeat(sym, count)
  |                                    ^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-1.almd:9:41
  in variable count
  hint: Check the variable name
  |
9 |       let repeated = string.repeat(sym, count)
  |                                         ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:10:18
  in variable acc
  hint: Check the variable name
   |
10 |       repeated + acc
   |                  ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:10:18
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
10 |       repeated + acc
   |                  ^^^

6 error(s) found
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
  let f = (acc, pair) => 
    if n >= pair.0 
    then 
      let count = n / pair.0
      let n_next = n - count * pair.0
      let repeated = string.repeat(pair.1, count)
      repeated + acc
    else acc
  in list.fold(pairs, "", (acc, pair) => f(acc, pair))
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:8:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let count = n / pair.0
  |       ^^^
error: Expected expression at line 12:5 (got Else 'else')
  --> /tmp/dojo-roman-numeral-2.almd:12:5
   |
12 |     else acc
   |     ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:9:24
  in variable count
  hint: Check the variable name
  |
9 |       let n_next = n - count * pair.0
  |                        ^^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-2.almd:9:32
  in variable pair
  hint: Did you mean `pairs`?
  try:
      // pair  →  pairs
      pairs
  |
9 |       let n_next = n - count * pair.0
  |                                ^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-2.almd:10:36
  in variable pair
  hint: Did you mean `pairs`?
  try:
      // pair  →  pairs
      pairs
   |
10 |       let repeated = string.repeat(pair.1, count)
   |                                    ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:10:44
  in variable count
  hint: Check the variable name
   |
10 |       let repeated = string.repeat(pair.1, count)
   |                                            ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:11:18
  in variable acc
  hint: Check the variable name
   |
11 |       repeated + acc
   |                  ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:11:18
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
11 |       repeated + acc
   |                  ^^^

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
  let f = (n, pair, acc) => 
    if n >= pair.0 
    then 
      let count = n / pair.0
      let n_next = n - count * pair.0
      let repeated = string.repeat(pair.1, count)
      f(n_next, pair, repeated + acc)
    else 
      acc
  in 
  list.fold(pairs, (n, ""), (acc, pair) => f(acc.0, pair, acc.1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:8:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let count = n / pair.0
  |       ^^^
error: Expected expression at line 12:5 (got Else 'else')
  --> /tmp/dojo-roman-numeral-3.almd:12:5
   |
12 |     else
   |     ^
error: Expected expression at line 14:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-3.almd:14:3
   |
14 |   in
   |   ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:9:24
  in variable count
  hint: Check the variable name
  |
9 |       let n_next = n - count * pair.0
  |                        ^^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-3.almd:9:32
  in variable pair
  hint: Did you mean `pairs`?
  try:
      // pair  →  pairs
      pairs
  |
9 |       let n_next = n - count * pair.0
  |                                ^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-3.almd:10:36
  in variable pair
  hint: Did you mean `pairs`?
  try:
      // pair  →  pairs
      pairs
   |
10 |       let repeated = string.repeat(pair.1, count)
   |                                    ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:10:44
  in variable count
  hint: Check the variable name
   |
10 |       let repeated = string.repeat(pair.1, count)
   |                                            ^^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-3.almd:11:17
  in variable pair
  hint: Did you mean `pairs`?
  try:
      // pair  →  pairs
      pairs
   |
11 |       f(n_next, pair, repeated + acc)
   |                 ^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:11:34
  in variable acc
  hint: Check the variable name
   |
11 |       f(n_next, pair, repeated + acc)
   |                                  ^^^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-3.almd:11:34
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
   |
11 |       f(n_next, pair, repeated + acc)
   |                                  ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:13:7
  in variable acc
  hint: Check the variable name
   |
13 |       acc
   |       ^^^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-3.almd:15:59
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
   |
15 |   list.fold(pairs, (n, ""), (acc, pair) => f(acc.0, pair, acc.1))
   |                                                           ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got (Int, String)
  --> /tmp/dojo-roman-numeral-3.almd:15:59
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
   |
15 |   list.fold(pairs, (n, ""), (acc, pair) => f(acc.0, pair, acc.1))
   |                                                           ^^^

13 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
