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
  let rec aux(n: Int, values: List[Int], symbols: List[String]) -> String = 
    if n == 0 then
      ""
    else if int.len(values) == 0 then
      ""
    else if n >= list.first(values) then
      list.first(symbols) + aux(n - list.first(values), values, symbols)
    else
      aux(n, list.drop(values, 1), list.drop(symbols, 1))
  in aux(n, values, symbols)
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
4 |   let rec aux(n: Int, values: List[Int], symbols: List[String]) -> String =
  |       ^^^
error: Expected expression at line 13:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-0.almd:13:3
   |
13 |   in aux(n, values, symbols)
   |   ^
error[E002]: undefined function 'int.len'
  --> /tmp/dojo-roman-numeral-0.almd:7:21
  in call to int.len()
  hint: Did you mean `int.min`?
  try:
      // int.len(...)  →  int.min(...)
      int.min(...)
  |
7 |     else if int.len(values) == 0 then
  |                     ^^^^^^
error: operator '-' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-roman-numeral-0.almd:10:48
  in operator -
  hint: Use numeric types (Int or Float)
   |
10 |       list.first(symbols) + aux(n - list.first(values), values, symbols)
   |                                                ^^^^^^
error[E002]: undefined function 'aux'
  --> /tmp/dojo-roman-numeral-0.almd:10:65
  in call to aux()
  hint: Check the function name
   |
10 |       list.first(symbols) + aux(n - list.first(values), values, symbols)
   |                                                                 ^^^^^^^
error: operator '+' requires numeric, String, or List types but got Option[String] and Unknown
  --> /tmp/dojo-roman-numeral-0.almd:10:65
  in operator +
  hint: Use + with numeric types, String, or List
   |
10 |       list.first(symbols) + aux(n - list.first(values), values, symbols)
   |                                                                 ^^^^^^^
error[E002]: undefined function 'aux'
  --> /tmp/dojo-roman-numeral-0.almd:12:55
  in call to aux()
  hint: Check the function name
   |
12 |       aux(n, list.drop(values, 1), list.drop(symbols, 1))
   |                                                       ^
error[E001]: type mismatch in if branches: expected String but got Option[String]
  --> /tmp/dojo-roman-numeral-0.almd:12:55
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
12 |       aux(n, list.drop(values, 1), list.drop(symbols, 1))
   |                                                       ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:12:55
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
12 |       aux(n, list.drop(values, 1), list.drop(symbols, 1))
   |                                                       ^

9 error(s) found
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
  fn aux(n: Int, values: List[Int], symbols: List[String]) -> String = 
    if n == 0 then
      ""
    else if list.is_empty(values) then
      ""
    else if n >= list.first(values) then
      list.first(symbols) + aux(n - list.first(values), values, symbols)
    else
      aux(n, list.drop(values, 1), list.drop(symbols, 1))
  in aux(n, values, symbols)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-1.almd:13:3
   |
13 |   in aux(n, values, symbols)
   |   ^
error: operator '-' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-roman-numeral-1.almd:10:48
  in operator -
  hint: Use numeric types (Int or Float)
   |
10 |       list.first(symbols) + aux(n - list.first(values), values, symbols)
   |                                                ^^^^^^
error: operator '+' requires numeric, String, or List types but got Option[String] and String
  --> /tmp/dojo-roman-numeral-1.almd:10:65
  in operator +
  hint: Use + with numeric types, String, or List
   |
10 |       list.first(symbols) + aux(n - list.first(values), values, symbols)
   |                                                                 ^^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:3:84
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
error[E001]: type mismatch in if branches: expected Option[String] but got String
  --> /tmp/dojo-roman-numeral-1.almd:12:55
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
12 |       aux(n, list.drop(values, 1), list.drop(symbols, 1))
   |                                                       ^
error[E001]: type mismatch in if branches: expected String but got Option[String]
  --> /tmp/dojo-roman-numeral-1.almd:12:55
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
12 |       aux(n, list.drop(values, 1), list.drop(symbols, 1))
   |                                                       ^

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
  let aux = (n: Int, values: List[Int], symbols: List[String]) -> String = 
    if n == 0 then
      ""
    else if list.is_empty(values) then
      ""
    else if n >= list.first(values) |> option.unwrap_or(0) then
      list.first(symbols) |> option.unwrap_or("") + aux(n - list.first(values) |> option.unwrap_or(0), list.drop(values, 1), list.drop(symbols, 1))
    else
      aux(n, list.drop(values, 1), list.drop(symbols, 1))
  in aux(n, values, symbols)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected ')' to close parenthesized expression opened at line 4:13
  --> /tmp/dojo-roman-numeral-2.almd:4:15
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
4 |   let aux = (n: Int, values: List[Int], symbols: List[String]) -> String =
  |             --------------- '(' opened here
  |
4 |   let aux = (n: Int, values: List[Int], symbols: List[String]) -> String =
  |               ^
error: Expected expression at line 13:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-2.almd:13:3
   |
13 |   in aux(n, values, symbols)
   |   ^
error: operator '-' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-roman-numeral-2.almd:10:72
  in operator -
  hint: Use numeric types (Int or Float)
   |
10 |       list.first(symbols) |> option.unwrap_or("") + aux(n - list.first(values) |> option.unwrap_or(0), list.drop(values, 1), list.drop(symbols, 1))
   |                                                                        ^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-roman-numeral-2.almd:10:100
  in call to option.unwrap_or()
  hint: Fix the argument type
   |
10 |       list.first(symbols) |> option.unwrap_or("") + aux(n - list.first(values) |> option.unwrap_or(0), list.drop(values, 1), list.drop(symbols, 1))
   |                                                                                                    ^
error[E002]: undefined function 'aux'
  --> /tmp/dojo-roman-numeral-2.almd:10:145
  in call to aux()
  hint: Check the function name
   |
10 |       list.first(symbols) |> option.unwrap_or("") + aux(n - list.first(values) |> option.unwrap_or(0), list.drop(values, 1), list.drop(symbols, 1))
   |                                                                                                                                                 ^
error[E002]: undefined function 'aux'
  --> /tmp/dojo-roman-numeral-2.almd:12:55
  in call to aux()
  hint: Check the function name
   |
12 |       aux(n, list.drop(values, 1), list.drop(symbols, 1))
   |                                                       ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[Int] but got Int
  --> /tmp/dojo-roman-numeral-2.almd:10:100
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
10 |       list.first(symbols) |> option.unwrap_or("") + aux(n - list.first(values) |> option.unwrap_or(0), list.drop(values, 1), list.drop(symbols, 1))
   |                                                                                                    ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:12:55
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
12 |       aux(n, list.drop(values, 1), list.drop(symbols, 1))
   |                                                       ^

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
  let aux = (n: Int, values: List[Int], symbols: List[String]) -> String =
    if n == 0 then
      ""
    else if list.is_empty(values) then
      ""
    else if n >= list.first(values) then
      list.first(symbols) + aux(n - list.first(values), list.drop(values, 1), list.drop(symbols, 1))
    else
      aux(n, list.drop(values, 1), list.drop(symbols, 1))
  in aux(n, values, symbols)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected ')' to close parenthesized expression opened at line 4:13
  --> /tmp/dojo-roman-numeral-3.almd:4:15
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
4 |   let aux = (n: Int, values: List[Int], symbols: List[String]) -> String =
  |             --------------- '(' opened here
  |
4 |   let aux = (n: Int, values: List[Int], symbols: List[String]) -> String =
  |               ^
error: Expected expression at line 13:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-3.almd:13:3
   |
13 |   in aux(n, values, symbols)
   |   ^
error: operator '-' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-roman-numeral-3.almd:10:48
  in operator -
  hint: Use numeric types (Int or Float)
   |
10 |       list.first(symbols) + aux(n - list.first(values), list.drop(values, 1), list.drop(symbols, 1))
   |                                                ^^^^^^
error[E002]: undefined function 'aux'
  --> /tmp/dojo-roman-numeral-3.almd:10:98
  in call to aux()
  hint: Check the function name
   |
10 |       list.first(symbols) + aux(n - list.first(values), list.drop(values, 1), list.drop(symbols, 1))
   |                                                                                                  ^
error: operator '+' requires numeric, String, or List types but got Option[String] and Unknown
  --> /tmp/dojo-roman-numeral-3.almd:10:98
  in operator +
  hint: Use + with numeric types, String, or List
   |
10 |       list.first(symbols) + aux(n - list.first(values), list.drop(values, 1), list.drop(symbols, 1))
   |                                                                                                  ^
error[E002]: undefined function 'aux'
  --> /tmp/dojo-roman-numeral-3.almd:12:55
  in call to aux()
  hint: Check the function name
   |
12 |       aux(n, list.drop(values, 1), list.drop(symbols, 1))
   |                                                       ^
error[E001]: type mismatch in if branches: expected String but got Option[String]
  --> /tmp/dojo-roman-numeral-3.almd:12:55
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
12 |       aux(n, list.drop(values, 1), list.drop(symbols, 1))
   |                                                       ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:12:55
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
12 |       aux(n, list.drop(values, 1), list.drop(symbols, 1))
   |                                                       ^

8 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
