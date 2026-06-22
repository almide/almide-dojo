# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let 
    values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  in
    let 
      f = (acc: String, n: Int, i: Int) -> String = 
        if n == 0 then 
          acc
        else if i >= list.len(values) then 
          acc
        else if n >= list.first(values |> list.drop(i)) then 
          f(acc + list.first(symbols |> list.drop(i)), n - list.first(values |> list.drop(i)), i)
        else 
          f(acc, n, i + 1)
    in 
      f("", n, 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-roman-numeral-0.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-0.almd:5:3
  |
5 |   in
  |   ^
error: Expected identifier at line 6:9 (got Newline '')
  --> /tmp/dojo-roman-numeral-0.almd:6:9
  |
6 |     let
  |         ^
error: Expected ')' to close parenthesized expression opened at line 7:11
  --> /tmp/dojo-roman-numeral-0.almd:7:15
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
7 |       f = (acc: String, n: Int, i: Int) -> String =
  |           --------------- '(' opened here
  |
7 |       f = (acc: String, n: Int, i: Int) -> String =
  |               ^
error: Expected expression at line 16:5 (got In 'in')
  --> /tmp/dojo-roman-numeral-0.almd:16:5
   |
16 |     in
   |     ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:9:11
  in variable acc
  hint: Check the variable name
  |
9 |           acc
  |           ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:10:17
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
   |
10 |         else if i >= list.len(values) then
   |                 ^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-0.almd:10:31
  in variable values
  hint: Check the variable name
   |
10 |         else if i >= list.len(values) then
   |                               ^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:11:11
  in variable acc
  hint: Check the variable name
   |
11 |           acc
   |           ^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-0.almd:12:33
  in variable values
  hint: Check the variable name
   |
12 |         else if n >= list.first(values |> list.drop(i)) then
   |                                 ^^^^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:12:53
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
   |
12 |         else if n >= list.first(values |> list.drop(i)) then
   |                                                     ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:13:13
  in variable acc
  hint: Check the variable name
   |
13 |           f(acc + list.first(symbols |> list.drop(i)), n - list.first(values |> list.drop(i)), i)
   |             ^^^
error[E003]: undefined variable 'symbols'
  --> /tmp/dojo-roman-numeral-0.almd:13:30
  in variable symbols
  hint: Check the variable name
   |
13 |           f(acc + list.first(symbols |> list.drop(i)), n - list.first(values |> list.drop(i)), i)
   |                              ^^^^^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:13:51
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
   |
13 |           f(acc + list.first(symbols |> list.drop(i)), n - list.first(values |> list.drop(i)), i)
   |                                                   ^
error: operator '+' requires numeric, String, or List types but got Unknown and Option[?2]
  --> /tmp/dojo-roman-numeral-0.almd:13:51
  in operator +
  hint: Use + with numeric types, String, or List
   |
13 |           f(acc + list.first(symbols |> list.drop(i)), n - list.first(values |> list.drop(i)), i)
   |                                                   ^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-0.almd:13:71
  in variable values
  hint: Check the variable name
   |
13 |           f(acc + list.first(symbols |> list.drop(i)), n - list.first(values |> list.drop(i)), i)
   |                                                                       ^^^^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:13:91
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
   |
13 |           f(acc + list.first(symbols |> list.drop(i)), n - list.first(values |> list.drop(i)), i)
   |                                                                                           ^
error: operator '-' requires numeric types but got Int and Option[?3]
  --> /tmp/dojo-roman-numeral-0.almd:13:91
  in operator -
  hint: Use numeric types (Int or Float)
   |
13 |           f(acc + list.first(symbols |> list.drop(i)), n - list.first(values |> list.drop(i)), i)
   |                                                                                           ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:13:96
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
   |
13 |           f(acc + list.first(symbols |> list.drop(i)), n - list.first(values |> list.drop(i)), i)
   |                                                                                                ^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-0.almd:13:96
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
   |
13 |           f(acc + list.first(symbols |> list.drop(i)), n - list.first(values |> list.drop(i)), i)
   |                                                                                                ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-0.almd:15:13
  in variable acc
  hint: Check the variable name
   |
15 |           f(acc, n, i + 1)
   |             ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:15:21
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
   |
15 |           f(acc, n, i + 1)
   |                     ^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-0.almd:15:25
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
   |
15 |           f(acc, n, i + 1)
   |                         ^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-0.almd:17:16
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
   |
17 |       f("", n, 0)
   |                ^

24 error(s) found
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
  let f = (acc: String, n: Int, i: Int) -> String = 
    if n == 0 then 
      acc
    else if i >= list.len(values) then 
      acc
    else if n >= list.get_or(values, i, 0) then 
      f(acc + list.get_or(symbols, i, ""), n - list.get_or(values, i, 0), i)
    else 
      f(acc, n, i + 1)
  in 
    f("", n, 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected ')' to close parenthesized expression opened at line 4:11
  --> /tmp/dojo-roman-numeral-1.almd:4:15
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
4 |   let f = (acc: String, n: Int, i: Int) -> String =
  |           --------------- '(' opened here
  |
4 |   let f = (acc: String, n: Int, i: Int) -> String =
  |               ^
error: Expected expression at line 13:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-1.almd:13:3
   |
13 |   in
   |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:6:7
  in variable acc
  hint: Check the variable name
  |
6 |       acc
  |       ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-1.almd:7:13
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
7 |     else if i >= list.len(values) then
  |             ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:8:7
  in variable acc
  hint: Check the variable name
  |
8 |       acc
  |       ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-1.almd:9:38
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
9 |     else if n >= list.get_or(values, i, 0) then
  |                                      ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:10:9
  in variable acc
  hint: Check the variable name
   |
10 |       f(acc + list.get_or(symbols, i, ""), n - list.get_or(values, i, 0), i)
   |         ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-1.almd:10:36
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
   |
10 |       f(acc + list.get_or(symbols, i, ""), n - list.get_or(values, i, 0), i)
   |                                    ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-1.almd:10:68
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
   |
10 |       f(acc + list.get_or(symbols, i, ""), n - list.get_or(values, i, 0), i)
   |                                                                    ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-1.almd:10:75
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
   |
10 |       f(acc + list.get_or(symbols, i, ""), n - list.get_or(values, i, 0), i)
   |                                                                           ^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-1.almd:10:75
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
   |
10 |       f(acc + list.get_or(symbols, i, ""), n - list.get_or(values, i, 0), i)
   |                                                                           ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:12:9
  in variable acc
  hint: Check the variable name
   |
12 |       f(acc, n, i + 1)
   |         ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-1.almd:12:17
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
   |
12 |       f(acc, n, i + 1)
   |                 ^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-1.almd:12:21
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
   |
12 |       f(acc, n, i + 1)
   |                     ^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-1.almd:14:14
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
   |
14 |     f("", n, 0)
   |              ^

15 error(s) found
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
  let rec f = (acc: String, n: Int, i: Int) -> String = 
    if n == 0 then 
      acc
    else if i >= list.len(values) then 
      acc
    else if n >= list.get_or(values, i, 0) then 
      f(acc + list.get_or(symbols, i, ""), n - list.get_or(values, i, 0), i)
    else 
      f(acc, n, i + 1)
  in 
    f("", n, 0)
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
4 |   let rec f = (acc: String, n: Int, i: Int) -> String =
  |       ^^^
error: Expected expression at line 13:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-2.almd:13:3
   |
13 |   in
   |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:6:7
  in variable acc
  hint: Check the variable name
  |
6 |       acc
  |       ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-2.almd:7:13
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
7 |     else if i >= list.len(values) then
  |             ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:8:7
  in variable acc
  hint: Check the variable name
  |
8 |       acc
  |       ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-2.almd:9:38
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
  |
9 |     else if n >= list.get_or(values, i, 0) then
  |                                      ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:10:9
  in variable acc
  hint: Check the variable name
   |
10 |       f(acc + list.get_or(symbols, i, ""), n - list.get_or(values, i, 0), i)
   |         ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-2.almd:10:36
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
   |
10 |       f(acc + list.get_or(symbols, i, ""), n - list.get_or(values, i, 0), i)
   |                                    ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-2.almd:10:68
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
   |
10 |       f(acc + list.get_or(symbols, i, ""), n - list.get_or(values, i, 0), i)
   |                                                                    ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-2.almd:10:75
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
   |
10 |       f(acc + list.get_or(symbols, i, ""), n - list.get_or(values, i, 0), i)
   |                                                                           ^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-2.almd:10:75
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
   |
10 |       f(acc + list.get_or(symbols, i, ""), n - list.get_or(values, i, 0), i)
   |                                                                           ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:12:9
  in variable acc
  hint: Check the variable name
   |
12 |       f(acc, n, i + 1)
   |         ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-2.almd:12:17
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
   |
12 |       f(acc, n, i + 1)
   |                 ^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-2.almd:12:21
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
   |
12 |       f(acc, n, i + 1)
   |                     ^
error[E002]: undefined function 'f'
  --> /tmp/dojo-roman-numeral-2.almd:14:14
  in call to f()
  hint: Did you mean `n`?
  try:
      // f(...)  →  n(...)
      n(...)
   |
14 |     f("", n, 0)
   |              ^

15 error(s) found
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
  fn f(acc: String, n: Int, i: Int) -> String = 
    if n == 0 then 
      acc
    else if i >= list.len(values) then 
      acc
    else if n >= list.get_or(values, i, 0) then 
      f(acc + list.get_or(symbols, i, ""), n - list.get_or(values, i, 0), i)
    else 
      f(acc, n, i + 1)
  in 
    f("", n, 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-3.almd:13:3
   |
13 |   in
   |   ^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-3.almd:7:27
  in variable values
  hint: Check the variable name
  |
7 |     else if i >= list.len(values) then
  |                           ^^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-3.almd:9:30
  in variable values
  hint: Check the variable name
  |
9 |     else if n >= list.get_or(values, i, 0) then
  |                              ^^^^^^
error[E003]: undefined variable 'symbols'
  --> /tmp/dojo-roman-numeral-3.almd:10:27
  in variable symbols
  hint: Check the variable name
   |
10 |       f(acc + list.get_or(symbols, i, ""), n - list.get_or(values, i, 0), i)
   |                           ^^^^^^^
error[E003]: undefined variable 'values'
  --> /tmp/dojo-roman-numeral-3.almd:10:60
  in variable values
  hint: Check the variable name
   |
10 |       f(acc + list.get_or(symbols, i, ""), n - list.get_or(values, i, 0), i)
   |                                                            ^^^^^^
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

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
