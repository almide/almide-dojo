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
  let rec to_roman_acc(n: Int, i: Int, acc: String) -> String = 
    if n == 0 then acc
    else if i >= list.len(values) then acc
    else if n >= list.get(values, i) |> option.unwrap_or(0) then 
      to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
    else to_roman_acc(n, i + 1, acc)
  in to_roman_acc(n, 0, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-0.almd:4:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
4 |   let rec to_roman_acc(n: Int, i: Int, acc: String) -> String =
  |       ^^^
error: Expected expression at line 10:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-0.almd:10:3
   |
10 |   in to_roman_acc(n, 0, "")
   |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:5:20
  in variable acc
  hint: Check the variable name
  |
5 |     if n == 0 then acc
  |                    ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:6:13
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
6 |     else if i >= list.len(values) then acc
  |             ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:6:40
  in variable acc
  hint: Check the variable name
  |
6 |     else if i >= list.len(values) then acc
  |                                        ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:7:35
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
7 |     else if n >= list.get(values, i) |> option.unwrap_or(0) then
  |                                   ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:8:41
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                         ^
error: operator '-' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-roman-numeral-0.almd:8:41
  in operator -
  hint: Use numeric types (Int or Float)
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                         ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-roman-numeral-0.almd:8:64
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:8:68
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                    ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:8:71
  in variable acc
  hint: Check the variable name
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                       ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:8:95
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                                               ^
error: operator '+' requires numeric, String, or List types but got Unknown and Option[String]
  --> /tmp/dojo-roman-numeral-0.almd:8:95
  in operator +
  hint: Use + with numeric types, String, or List
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                                               ^
error[E002]: undefined function 'to_roman_acc'
  --> /tmp/dojo-roman-numeral-0.almd:8:118
  in call to to_roman_acc()
  hint: Did you mean `to_roman`?
  try:
      // to_roman_acc(...)  →  to_roman(...)
      to_roman(...)
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                                                                      ^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:9:26
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
9 |     else to_roman_acc(n, i + 1, acc)
  |                          ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:9:33
  in variable acc
  hint: Check the variable name
  |
9 |     else to_roman_acc(n, i + 1, acc)
  |                                 ^^^
error[E002]: undefined function 'to_roman_acc'
  --> /tmp/dojo-roman-numeral-0.almd:9:33
  in call to to_roman_acc()
  hint: Did you mean `to_roman`?
  try:
      // to_roman_acc(...)  →  to_roman(...)
      to_roman(...)
  |
9 |     else to_roman_acc(n, i + 1, acc)
  |                                 ^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[Int] but got Int
  --> /tmp/dojo-roman-numeral-0.almd:8:64
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:9:33
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
9 |     else to_roman_acc(n, i + 1, acc)
  |                                 ^^^

19 error(s) found
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
  let to_roman_acc(n: Int, i: Int, acc: String) -> String = 
    if n == 0 then acc
    else if i >= list.len(values) then acc
    else if n >= list.get(values, i) |> option.unwrap_or(0) then 
      to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
    else to_roman_acc(n, i + 1, acc)
  in to_roman_acc(n, 0, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected Eq at line 4:19 (got LParen '(')
  --> /tmp/dojo-roman-numeral-1.almd:4:19
  |
4 |   let to_roman_acc(n: Int, i: Int, acc: String) -> String =
  |                   ^
error: Expected expression at line 10:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-1.almd:10:3
   |
10 |   in to_roman_acc(n, 0, "")
   |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:5:20
  in variable acc
  hint: Check the variable name
  |
5 |     if n == 0 then acc
  |                    ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-1.almd:6:13
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
6 |     else if i >= list.len(values) then acc
  |             ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:6:40
  in variable acc
  hint: Check the variable name
  |
6 |     else if i >= list.len(values) then acc
  |                                        ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-1.almd:7:35
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
7 |     else if n >= list.get(values, i) |> option.unwrap_or(0) then
  |                                   ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-1.almd:8:41
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                         ^
error: operator '-' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-roman-numeral-1.almd:8:41
  in operator -
  hint: Use numeric types (Int or Float)
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                         ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-roman-numeral-1.almd:8:64
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-1.almd:8:68
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                    ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:8:71
  in variable acc
  hint: Check the variable name
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                       ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-1.almd:8:95
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                                               ^
error: operator '+' requires numeric, String, or List types but got Unknown and Option[String]
  --> /tmp/dojo-roman-numeral-1.almd:8:95
  in operator +
  hint: Use + with numeric types, String, or List
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                                               ^
error[E002]: undefined function 'to_roman_acc'
  --> /tmp/dojo-roman-numeral-1.almd:8:118
  in call to to_roman_acc()
  hint: Did you mean `to_roman`?
  try:
      // to_roman_acc(...)  →  to_roman(...)
      to_roman(...)
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                                                                      ^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-1.almd:9:26
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
9 |     else to_roman_acc(n, i + 1, acc)
  |                          ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:9:33
  in variable acc
  hint: Check the variable name
  |
9 |     else to_roman_acc(n, i + 1, acc)
  |                                 ^^^
error[E002]: undefined function 'to_roman_acc'
  --> /tmp/dojo-roman-numeral-1.almd:9:33
  in call to to_roman_acc()
  hint: Did you mean `to_roman`?
  try:
      // to_roman_acc(...)  →  to_roman(...)
      to_roman(...)
  |
9 |     else to_roman_acc(n, i + 1, acc)
  |                                 ^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[Int] but got Int
  --> /tmp/dojo-roman-numeral-1.almd:8:64
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:9:33
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
9 |     else to_roman_acc(n, i + 1, acc)
  |                                 ^^^

19 error(s) found
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
  let rec to_roman_acc(n: Int, i: Int, acc: String) -> String = 
    if n == 0 then acc
    else if i >= list.len(values) then acc
    else if n >= list.get(values, i) |> option.unwrap_or(0) then 
      to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
    else to_roman_acc(n, i + 1, acc)
  in to_roman_acc(n, 0, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-2.almd:4:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
4 |   let rec to_roman_acc(n: Int, i: Int, acc: String) -> String =
  |       ^^^
error: Expected expression at line 10:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-2.almd:10:3
   |
10 |   in to_roman_acc(n, 0, "")
   |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:5:20
  in variable acc
  hint: Check the variable name
  |
5 |     if n == 0 then acc
  |                    ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-2.almd:6:13
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
6 |     else if i >= list.len(values) then acc
  |             ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:6:40
  in variable acc
  hint: Check the variable name
  |
6 |     else if i >= list.len(values) then acc
  |                                        ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-2.almd:7:35
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
7 |     else if n >= list.get(values, i) |> option.unwrap_or(0) then
  |                                   ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-2.almd:8:41
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                         ^
error: operator '-' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-roman-numeral-2.almd:8:41
  in operator -
  hint: Use numeric types (Int or Float)
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                         ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-roman-numeral-2.almd:8:64
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-2.almd:8:68
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                    ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:8:71
  in variable acc
  hint: Check the variable name
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                       ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-2.almd:8:95
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                                               ^
error: operator '+' requires numeric, String, or List types but got Unknown and Option[String]
  --> /tmp/dojo-roman-numeral-2.almd:8:95
  in operator +
  hint: Use + with numeric types, String, or List
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                                               ^
error[E002]: undefined function 'to_roman_acc'
  --> /tmp/dojo-roman-numeral-2.almd:8:118
  in call to to_roman_acc()
  hint: Did you mean `to_roman`?
  try:
      // to_roman_acc(...)  →  to_roman(...)
      to_roman(...)
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                                                                      ^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-2.almd:9:26
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
9 |     else to_roman_acc(n, i + 1, acc)
  |                          ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:9:33
  in variable acc
  hint: Check the variable name
  |
9 |     else to_roman_acc(n, i + 1, acc)
  |                                 ^^^
error[E002]: undefined function 'to_roman_acc'
  --> /tmp/dojo-roman-numeral-2.almd:9:33
  in call to to_roman_acc()
  hint: Did you mean `to_roman`?
  try:
      // to_roman_acc(...)  →  to_roman(...)
      to_roman(...)
  |
9 |     else to_roman_acc(n, i + 1, acc)
  |                                 ^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[Int] but got Int
  --> /tmp/dojo-roman-numeral-2.almd:8:64
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:9:33
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
9 |     else to_roman_acc(n, i + 1, acc)
  |                                 ^^^

19 error(s) found
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
  fn to_roman_acc(n: Int, i: Int, acc: String) -> String = 
    if n == 0 then acc
    else if i >= list.len(values) then acc
    else if n >= list.get(values, i) |> option.unwrap_or(0) then 
      to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
    else to_roman_acc(n, i + 1, acc)
  in to_roman_acc(n, 0, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-3.almd:10:3
   |
10 |   in to_roman_acc(n, 0, "")
   |   ^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-3.almd:6:27
  in variable values
  hint: Check the variable name
  |
6 |     else if i >= list.len(values) then acc
  |                           ^^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-3.almd:7:27
  in variable values
  hint: Check the variable name
  |
7 |     else if n >= list.get(values, i) |> option.unwrap_or(0) then
  |                           ^^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-3.almd:8:33
  in variable values
  hint: Check the variable name
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                 ^^^^^^
error: operator '-' requires numeric types but got Int and Option[?2]
  --> /tmp/dojo-roman-numeral-3.almd:8:41
  in operator -
  hint: Use numeric types (Int or Float)
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                         ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-roman-numeral-3.almd:8:64
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                ^
error[E003]: undefined variable 'symbols'
  --> /tmp/dojo-roman-numeral-3.almd:8:86
  in variable symbols
  hint: Check the variable name
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                                      ^^^^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[?3]
  --> /tmp/dojo-roman-numeral-3.almd:8:95
  in operator +
  hint: Use + with numeric types, String, or List
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                                               ^
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-roman-numeral-3.almd:8:118
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                                                                      ^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:3:84
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let symbols = ...` (a statement, returns Unit).
      // Add `symbols` as the trailing expression so the fn returns String:
      //
      //   let symbols = <computation>
      //   symbols                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
  |
3 |   let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  |                                                                                    ^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[Int] but got Int
  --> /tmp/dojo-roman-numeral-3.almd:8:64
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[String] but got String
  --> /tmp/dojo-roman-numeral-3.almd:8:118
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
8 |       to_roman_acc(n - list.get(values, i) |> option.unwrap_or(0), i, acc + list.get(symbols, i) |> option.unwrap_or(""))
  |                                                                                                                      ^^

12 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
