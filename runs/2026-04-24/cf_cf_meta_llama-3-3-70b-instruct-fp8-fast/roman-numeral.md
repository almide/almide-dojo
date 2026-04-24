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
  let result = list.fold(list.zip(values, symbols), "", (acc, (value, symbol)) => 
    let count = int.div(n, value)
    let rest = int.rem(n, value)
    acc + string.repeat(symbol, count)
  )
  result
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let count = int.div(n, value)
  |     ^^^
error: Expected expression at line 8:3 (got RParen ')')
  --> /tmp/dojo-roman-numeral-0.almd:8:3
  |
8 |   )
  |   ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:6:27
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
6 |     let rest = int.rem(n, value)
  |                           ^^^^^
error[E002]: undefined function 'int.rem'
  --> /tmp/dojo-roman-numeral-0.almd:6:27
  in call to int.rem()
  hint: No function 'rem' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |     let rest = int.rem(n, value)
  |                           ^^^^^
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
  --> /tmp/dojo-roman-numeral-0.almd:9:3
  in variable result
  hint: Did you mean `rest`?
  try:
      // result  →  rest
      rest
  |
9 |   result
  |   ^^^^^^

8 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  list.fold(list.zip([1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1], ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]), "", (acc, (value, symbol)) => 
    let count = int.div(n, value)
    let rest = int.mod(n, value)
    acc + string.repeat(symbol, count)
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:3:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
3 |     let count = int.div(n, value)
  |     ^^^
error: Expected Fn at line 4:23 (got LParen '(')
  --> /tmp/dojo-roman-numeral-1.almd:4:23
  |
4 |     let rest = int.mod(n, value)
  |                       ^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  list.fold(list.zip([1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1], ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]), "", (acc, (value, symbol)) => 
    {
      let count = int.div(n, value);
      let rest = int.mod(n, value);
      (acc + string.repeat(symbol, count), rest)
    } |> (x) => x.0
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected name at line 5:22 (got Mod 'mod')
  --> /tmp/dojo-roman-numeral-2.almd:5:22
  |
5 |       let rest = int.mod(n, value);
  |                      ^
error[E002]: undefined function 'int.div'
  --> /tmp/dojo-roman-numeral-2.almd:4:30
  in call to int.div()
  hint: Did you mean `int.min`?
  try:
      // int.div(...)  →  int.min(...)
      int.min(...)
  |
4 |       let count = int.div(n, value);
  |                              ^^^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  list.fold(list.zip([1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1], ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]), (n, ""), (acc, (value, symbol)) => 
    {
      let count = n / value;
      let rest = n % value;
      (acc.0 + string.repeat(symbol, count), rest)
    } |> (x) => x.0
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected ')' to close function call opened at line 2:12
  --> /tmp/dojo-roman-numeral-3.almd:9:1
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   list.fold(list.zip([1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1], ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]), (n, ""), (acc, (value, symbol)) =>
  |            --------------- '(' opened here
...
9 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
  | ^^^^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
