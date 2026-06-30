# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let symbols = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I"),
  ]
  let roman = List.fold(symbols, "", (acc, (value, symbol)) => {
    while n >= value {
      acc + symbol
      n = n - value
    }
    acc
  })
  roman
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:19:13
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
19 |       acc + symbol
   |             ^^^^^^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-roman-numeral-0.almd:20:15
  in n = ...
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
   |
20 |       n = n - value
   |               ^^^^^
error[E001]: type mismatch in method call: expected List but got fn(List[(Int, String)], String, fn(?0, Int) -> ?0) -> String
  --> /tmp/dojo-roman-numeral-0.almd:17:15
  in method call
  hint: Fix the expression type or change the expected type
   |
17 |   let roman = List.fold(symbols, "", (acc, (value, symbol)) => {
   |               ^^^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let symbols = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I"),
  ]
  let roman = List.fold(symbols, "", (acc, pair) => {
    let (value, symbol) = pair
    while n >= value {
      acc + symbol
      n = n - value
    }
    acc
  })
  roman
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-roman-numeral-1.almd:21:15
  in n = ...
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
   |
21 |       n = n - value
   |               ^^^^^
error[E001]: type mismatch in method call: expected List but got fn(List[(Int, String)], String, fn(?0, (Int, ?3)) -> ?0) -> String
  --> /tmp/dojo-roman-numeral-1.almd:17:15
  in method call
  hint: Fix the expression type or change the expected type
   |
17 |   let roman = List.fold(symbols, "", (acc, pair) => {
   |               ^^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let symbols = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I"),
  ]
  let roman = List.fold(symbols, "", (acc, pair) => {
    let (value, symbol) = pair
    let n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })
  roman
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error[E009]: cannot reassign immutable binding 'n_'
  --> /tmp/dojo-roman-numeral-2.almd:22:17
  in n_ = ...
  hint: Use 'var n_ = ...' instead of 'let n_ = ...' to declare a mutable variable
  try:
      // let n_ = ...  →  var n_ = ...
      var n_ = <initial value>
   |
19 |     let n_ = n
   |     ------------------ 'n_' declared here
...
22 |       n_ = n_ - value
   |                 ^^^^^
error[E001]: type mismatch in method call: expected List but got fn(List[(Int, String)], String, fn(?0, (Int, ?3)) -> ?0) -> String
  --> /tmp/dojo-roman-numeral-2.almd:17:15
  in method call
  hint: Fix the expression type or change the expected type
   |
17 |   let roman = List.fold(symbols, "", (acc, pair) => {
   |               ^^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let symbols = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I"),
  ]
  let roman = List.fold(symbols, "", (acc, pair) => {
    let (value, symbol) = pair
    let mut n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })
  roman
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'let mut' is not valid in Almide at line 19:9
  --> /tmp/dojo-roman-numeral-3.almd:19:9
  hint: Use 'var' for mutable variables. Example: var x = 0
   |
19 |     let mut n_ = n
   |         ^
error[E003]: undefined variable 'n_'
  --> /tmp/dojo-roman-numeral-3.almd:20:11
  in variable n_
  hint: Did you mean `n`?
  try:
      // n_  →  n
      n
   |
20 |     while n_ >= value {
   |           ^^
error[E003]: undefined variable 'n_'
  --> /tmp/dojo-roman-numeral-3.almd:22:12
  in variable n_
  hint: Did you mean `n`?
  try:
      // n_  →  n
      n
   |
22 |       n_ = n_ - value
   |            ^^
error[E001]: type mismatch in method call: expected List but got fn(List[(Int, String)], String, fn(?0, (Unknown, ?3)) -> ?0) -> String
  --> /tmp/dojo-roman-numeral-3.almd:17:15
  in method call
  hint: Fix the expression type or change the expected type
   |
17 |   let roman = List.fold(symbols, "", (acc, pair) => {
   |               ^^^^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
