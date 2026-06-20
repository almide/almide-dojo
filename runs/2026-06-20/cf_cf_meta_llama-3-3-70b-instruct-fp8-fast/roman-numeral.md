# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let 
    values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    pairs = list.zip(values, symbols)
  in 
    list.fold(pairs, "", (acc, (value, symbol)) => 
      if n >= value 
      then acc + string.repeat(symbol, n / value)
      else acc) 
    |> string.trim
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-roman-numeral-0.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 6:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-0.almd:6:3
  |
6 |   in
  |   ^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-0.almd:5:22
  in variable values
  hint: Check the variable name
  |
5 |     pairs = list.zip(values, symbols)
  |                      ^^^^^^
error[E003]: undefined variable 'symbols'
  --> /tmp/dojo-roman-numeral-0.almd:5:30
  in variable symbols
  hint: Check the variable name
  |
5 |     pairs = list.zip(values, symbols)
  |                              ^^^^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-roman-numeral-0.almd:7:15
  in variable pairs
  hint: Check the variable name
  |
7 |     list.fold(pairs, "", (acc, (value, symbol)) =>
  |               ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:9:32
  in variable symbol
  hint: Check the variable name
  |
9 |       then acc + string.repeat(symbol, n / value)
  |                                ^^^^^^

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
    list.fold(pairs, "", (acc, (value, symbol)) => 
      if n >= value 
      then acc + string.repeat(symbol, n / value)
      else acc) 
    |> string.trim
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:8:32
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
8 |       then acc + string.repeat(symbol, n / value)
  |                                ^^^^^^
error[E005]: argument 'f' expects fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-1.almd:9:12
  in call to list.fold()
  hint: Fix the argument type
  |
9 |       else acc)
  |            ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-1.almd:9:12
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
9 |       else acc)
  |            ^^^

3 error(s) found
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
      if n >= value 
      then acc + string.repeat(symbol, n / value)
      else acc) 
    |> string.trim 
    |> (x) => x
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:8:32
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
8 |       then acc + string.repeat(symbol, n / value)
  |                                ^^^^^^
error[E005]: argument 'f' expects fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-2.almd:9:12
  in call to list.fold()
  hint: Fix the argument type
  |
9 |       else acc)
  |            ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-2.almd:9:12
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
9 |       else acc)
  |            ^^^

3 error(s) found
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
    list.fold(pairs, "", (acc, (value, symbol)) => 
      if n >= value 
      then acc + string.repeat(symbol, n / value)
      else acc) 
    |> (x) => x
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:8:32
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
8 |       then acc + string.repeat(symbol, n / value)
  |                                ^^^^^^
error[E005]: argument 'f' expects fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-3.almd:9:12
  in call to list.fold()
  hint: Fix the argument type
  |
9 |       else acc)
  |            ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-3.almd:9:12
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
9 |       else acc)
  |            ^^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
