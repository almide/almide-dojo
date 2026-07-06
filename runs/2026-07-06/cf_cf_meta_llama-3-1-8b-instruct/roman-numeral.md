# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  let result = 
    list.fold(symbols, "", (acc, (value, symbol)) => 
      if n >= value then 
        acc + symbol + to_roman(n - value) 
      else 
        acc
    )
  result
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:6:15
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
6 |         acc + symbol + to_roman(n - value)
  |               ^^^^^^
error[E005]: argument 'f' expects fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-0.almd:8:9
  in call to list.fold()
  hint: Fix the argument type
  |
8 |         acc
  |         ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-0.almd:8:9
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
8 |         acc
  |         ^^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  list.fold(symbols, "", (acc, (value, symbol)) => 
    if n >= value then 
      acc + symbol + to_roman(n - value) 
    else 
      acc + symbol
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:5:13
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
5 |       acc + symbol + to_roman(n - value)
  |             ^^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:7:13
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
7 |       acc + symbol
  |             ^^^^^^
error[E005]: argument 'f' expects fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-1.almd:7:13
  in call to list.fold()
  hint: Fix the argument type
  |
7 |       acc + symbol
  |             ^^^^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-1.almd:7:13
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
7 |       acc + symbol
  |             ^^^^^^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  list.fold(symbols, "", (acc, (value, symbol)) => 
    if n >= value then 
      acc + symbol + to_roman(n - value) 
    else 
      acc + symbol
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:5:13
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
5 |       acc + symbol + to_roman(n - value)
  |             ^^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:7:13
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
7 |       acc + symbol
  |             ^^^^^^
error[E005]: argument 'f' expects fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-2.almd:7:13
  in call to list.fold()
  hint: Fix the argument type
  |
7 |       acc + symbol
  |             ^^^^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-2.almd:7:13
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
7 |       acc + symbol
  |             ^^^^^^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  list.fold(symbols, "", (acc, (value, symbol)) => 
    if n >= value then 
      acc + symbol + to_roman(n - value) 
    else 
      acc + symbol
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:5:13
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
5 |       acc + symbol + to_roman(n - value)
  |             ^^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:7:13
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
7 |       acc + symbol
  |             ^^^^^^
error[E005]: argument 'f' expects fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-3.almd:7:13
  in call to list.fold()
  hint: Fix the argument type
  |
7 |       acc + symbol
  |             ^^^^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-3.almd:7:13
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
7 |       acc + symbol
  |             ^^^^^^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
