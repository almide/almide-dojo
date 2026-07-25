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
  list.fold(pairs, "", (acc, (val, sym)) => 
    let count = int.clamp(n / val, 0, n / val)
    in
    acc + string.repeat(sym, count)
  ) |> (n) => 
    if n == 0 then "" else n
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:7:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |     let count = int.clamp(n / val, 0, n / val)
  |     ^^^
error: Expected expression at line 10:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-0.almd:10:3
   |
10 |   ) |> (n) =>
   |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:9:5
  in variable acc
  hint: Check the variable name
  |
9 |     acc + string.repeat(sym, count)
  |     ^^^
error[E003]: undefined variable 'sym'
  --> /tmp/dojo-roman-numeral-0.almd:9:25
  in variable sym
  hint: Check the variable name
  |
9 |     acc + string.repeat(sym, count)
  |                         ^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-0.almd:9:30
  in variable count
  hint: Check the variable name
  |
9 |     acc + string.repeat(sym, count)
  |                              ^^^^^
error[E001]: type mismatch in if branches: expected String but got Int
  --> /tmp/dojo-roman-numeral-0.almd:11:28
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or use `int.to_string(x)` to convert Int to String
   |
11 |     if n == 0 then "" else n
   |                            ^

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
  list.fold(pairs, "", (acc, (val, sym)) => 
    let count = n / val
    let n_new = n - count * val
    in
    acc + string.repeat(sym, count)
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
7 |     let count = n / val
  |     ^^^
error: Expected expression at line 11:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:11:3
   |
11 |   )
   |   ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-1.almd:8:21
  in variable count
  hint: Check the variable name
  |
8 |     let n_new = n - count * val
  |                     ^^^^^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-roman-numeral-1.almd:8:29
  in variable val
  hint: Check the variable name
  |
8 |     let n_new = n - count * val
  |                             ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:10:5
  in variable acc
  hint: Check the variable name
   |
10 |     acc + string.repeat(sym, count)
   |     ^^^
error[E003]: undefined variable 'sym'
  --> /tmp/dojo-roman-numeral-1.almd:10:25
  in variable sym
  hint: Check the variable name
   |
10 |     acc + string.repeat(sym, count)
   |                         ^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-1.almd:10:30
  in variable count
  hint: Check the variable name
   |
10 |     acc + string.repeat(sym, count)
   |                              ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:10:30
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
10 |     acc + string.repeat(sym, count)
   |                              ^^^^^

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
  list.fold(pairs, (n, ""), (acc, (val_, sym)) => 
    let count = acc.0 / val_
    let n_new = acc.0 - count * val_
    in
    (n_new, acc.1 + string.repeat(sym, count))
  ).1
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:7:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |     let count = acc.0 / val_
  |     ^^^
error: Expected expression at line 11:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-2.almd:11:3
   |
11 |   ).1
   |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:8:17
  in variable acc
  hint: Check the variable name
  |
8 |     let n_new = acc.0 - count * val_
  |                 ^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:8:25
  in variable count
  hint: Check the variable name
  |
8 |     let n_new = acc.0 - count * val_
  |                         ^^^^^
error[E003]: undefined variable 'val_'
  --> /tmp/dojo-roman-numeral-2.almd:8:33
  in variable val_
  hint: Check the variable name
  |
8 |     let n_new = acc.0 - count * val_
  |                                 ^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:10:13
  in variable acc
  hint: Check the variable name
   |
10 |     (n_new, acc.1 + string.repeat(sym, count))
   |             ^^^
error[E003]: undefined variable 'sym'
  --> /tmp/dojo-roman-numeral-2.almd:10:35
  in variable sym
  hint: Check the variable name
   |
10 |     (n_new, acc.1 + string.repeat(sym, count))
   |                                   ^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:10:40
  in variable count
  hint: Check the variable name
   |
10 |     (n_new, acc.1 + string.repeat(sym, count))
   |                                        ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:10:40
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
10 |     (n_new, acc.1 + string.repeat(sym, count))
   |                                        ^^^^^

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
  in
  list.fold(pairs, (n, ""), (acc, pair) => 
    let val_ = pair.0
    let sym = pair.1
    let count = acc.0 / val_
    let n_new = acc.0 - count * val_
    in
    (n_new, acc.1 + string.repeat(sym, count))
  ).1
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:7:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |     let val_ = pair.0
  |     ^^^
error: Expected expression at line 13:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-3.almd:13:3
   |
13 |   ).1
   |   ^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-3.almd:8:15
  in variable pair
  hint: Did you mean `pairs`?
  try:
      // pair  →  pairs
      pairs
  |
8 |     let sym = pair.1
  |               ^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:9:17
  in variable acc
  hint: Check the variable name
  |
9 |     let count = acc.0 / val_
  |                 ^^^
error[E003]: undefined variable 'val_'
  --> /tmp/dojo-roman-numeral-3.almd:9:25
  in variable val_
  hint: Check the variable name
  |
9 |     let count = acc.0 / val_
  |                         ^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:10:17
  in variable acc
  hint: Check the variable name
   |
10 |     let n_new = acc.0 - count * val_
   |                 ^^^
error[E003]: undefined variable 'val_'
  --> /tmp/dojo-roman-numeral-3.almd:10:33
  in variable val_
  hint: Check the variable name
   |
10 |     let n_new = acc.0 - count * val_
   |                                 ^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:12:13
  in variable acc
  hint: Check the variable name
   |
12 |     (n_new, acc.1 + string.repeat(sym, count))
   |             ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:12:40
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
12 |     (n_new, acc.1 + string.repeat(sym, count))
   |                                        ^^^^^

9 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
