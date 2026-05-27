# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  let result = list.fold(list.zip(values, symbols), "", (acc, (value, symbol)) => 
    let count = int.clamp(n / value, 0, n)
    acc + string.repeat(symbol, count)
  )
  let final_result = string.trim(result)
  final_result
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let count = int.clamp(n / value, 0, n)
  |     ^^^
error: Expected expression at line 7:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-0.almd:7:3
  |
7 |   )
  |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:6:5
  in variable acc
  hint: Check the variable name
  |
6 |     acc + string.repeat(symbol, count)
  |     ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:6:25
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
6 |     acc + string.repeat(symbol, count)
  |                         ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-0.almd:6:33
  in variable count
  hint: Check the variable name
  |
6 |     acc + string.repeat(symbol, count)
  |                                 ^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-0.almd:8:34
  in variable result
  hint: Check the variable name
  |
8 |   let final_result = string.trim(result)
  |                                  ^^^^^^

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
  list.fold(list.zip(values, symbols), "", (acc, (value, symbol)) => 
    let count = n / value
    let n = n - count * value
    acc + string.repeat(symbol, count)
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let count = n / value
  |     ^^^
error: Expected expression at line 8:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:8:3
  |
8 |   )
  |   ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-1.almd:6:17
  in variable count
  hint: Check the variable name
  |
6 |     let n = n - count * value
  |                 ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:6:25
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
6 |     let n = n - count * value
  |                         ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:7:5
  in variable acc
  hint: Check the variable name
  |
7 |     acc + string.repeat(symbol, count)
  |     ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:7:25
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
7 |     acc + string.repeat(symbol, count)
  |                         ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-1.almd:7:33
  in variable count
  hint: Check the variable name
  |
7 |     acc + string.repeat(symbol, count)
  |                                 ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:7:33
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
7 |     acc + string.repeat(symbol, count)
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
  list.fold(list.zip(values, symbols), (n, ""), (acc_n, acc_str, (value, symbol)) => 
    let count = acc_n / value
    (acc_n - count * value, acc_str + string.repeat(symbol, count))
  ).1
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let count = acc_n / value
  |     ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:3:84
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
3 |   let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  |                                                                                    ^^^

2 error(s) found
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
  list.fold(list.zip(values, symbols), (n, ""), (acc_n, acc_str, (value, symbol)) => 
    let count = acc_n / value
    (acc_n - count * value, acc_str + string.repeat(symbol, count))
  ).1
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let count = acc_n / value
  |     ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:3:84
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
3 |   let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  |                                                                                    ^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
