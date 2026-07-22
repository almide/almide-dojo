# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I) = (1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
  let (M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I) = (string.from_codepoint(M), string.from_codepoint(CM), string.from_codepoint(D), string.from_codepoint(CD), string.from_codepoint(C), string.from_codepoint(XC), string.from_codepoint(L), string.from_codepoint(XL), string.from_codepoint(X), string.from_codepoint(IX), string.from_codepoint(V), string.from_codepoint(IV), string.from_codepoint(I))
  let (symbols, values) = (list[(String, Int)], list[Int])
  symbols.append([ (M, 1000), (CM, 900), (D, 500), (CD, 400), (C, 100), (XC, 90),
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Expected identifier at line 2:8 (got TypeName 'M')
  --> /tmp/dojo-roman-numeral-0.almd:2:8
  |
2 |   let (M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I) = (1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
  |        ^
error: Expected identifier at line 3:8 (got TypeName 'M')
  --> /tmp/dojo-roman-numeral-0.almd:3:8
  |
3 |   let (M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I) = (string.from_codepoint(M), string.from_codepoint(CM), string.from_codepoint(D), string.from_codepoint(CD), string.from_codepoint(C), string.from_codepoint(XC), string.from_codepoint(L), string.from_codepoint(XL), string.from_codepoint(X), string.from_codepoint(IX), string.from_codepoint(V), string.from_codepoint(IV), string.from_codepoint(I))
  |        ^
error: Expected expression at line 7:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-0.almd:7:1
  |
7 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
  | ^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-roman-numeral-0.almd:4:28
  in variable list
  hint: Check the variable name
  |
4 |   let (symbols, values) = (list[(String, Int)], list[Int])
  |                            ^^^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-roman-numeral-0.almd:4:49
  in variable list
  hint: Check the variable name
  |
4 |   let (symbols, values) = (list[(String, Int)], list[Int])
  |                                                 ^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:4:54
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
4 |   let (symbols, values) = (list[(String, Int)], list[Int])
  |                                                      ^^^

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I) = (1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
  let symbols = list[(String, Int)] = [
    (string.from_codepoint(M), 1000),
    (string.from_codepoint(CM), 900),
    (string.from_codepoint(D), 500),
    (string.from_codepoint(CD), 400),
    (string.from_codepoint(C), 100),
    (string.from_codepoint(XC), 90),
    (string.from_codepoint(L), 50),
    (string.from_codepoint(XL), 40),
    (string.from_codepoint(X), 10),
    (string.from_codepoint(IX), 9),
    (string.from_codepoint(V), 5),
    (string.from_codepoint(IV), 4),
    (string.from_codepoint(I), 1),
  ]
  let result = list[String]
  let i
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected identifier at line 2:8 (got TypeName 'M')
  --> /tmp/dojo-roman-numeral-1.almd:2:8
  |
2 |   let (M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I) = (1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
  |        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-1.almd:3:37
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
3 |   let symbols = list[(String, Int)] = [
  |                                     ^
error: Expected Eq at line 19:8 (got Newline '')
  --> /tmp/dojo-roman-numeral-1.almd:19:8
   |
19 |   let i
   |        ^
error: Expected expression at line 21:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-1.almd:21:1
   |
21 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-roman-numeral-1.almd:3:17
  in variable list
  hint: Check the variable name
  |
3 |   let symbols = list[(String, Int)] = [
  |                 ^^^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-roman-numeral-1.almd:18:16
  in variable list
  hint: Check the variable name
   |
18 |   let result = list[String]
   |                ^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:18:21
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
18 |   let result = list[String]
   |                     ^^^^^^

7 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I) = (1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
  let symbols = [
    (string.from_codepoint(M), 1000),
    (string.from_codepoint(CM), 900),
    (string.from_codepoint(D), 500),
    (string.from_codepoint(CD), 400),
    (string.from_codepoint(C), 100),
    (string.from_codepoint(XC), 90),
    (string.from_codepoint(L), 50),
    (string.from_codepoint(XL), 40),
    (string.from_codepoint(X), 10),
    (string.from_codepoint(IX), 9),
    (string.from_codepoint(V), 5),
    (string.from_codepoint(IV), 4),
    (string.from_codepoint(I), 1),
  ]
  let result = ""
  let i = 0
  while n >
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected identifier at line 2:8 (got TypeName 'M')
  --> /tmp/dojo-roman-numeral-2.almd:2:8
  |
2 |   let (M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I) = (1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
  |        ^
error: Expected expression at line 22:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-2.almd:22:1
   |
22 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error[E005]: argument 'n' expects Int but got M
  --> /tmp/dojo-roman-numeral-2.almd:4:28
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
4 |     (string.from_codepoint(M), 1000),
  |                            ^
error[E005]: argument 'n' expects Int but got CM
  --> /tmp/dojo-roman-numeral-2.almd:5:28
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
5 |     (string.from_codepoint(CM), 900),
  |                            ^^
error[E005]: argument 'n' expects Int but got D
  --> /tmp/dojo-roman-numeral-2.almd:6:28
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
6 |     (string.from_codepoint(D), 500),
  |                            ^
error[E005]: argument 'n' expects Int but got CD
  --> /tmp/dojo-roman-numeral-2.almd:7:28
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |     (string.from_codepoint(CD), 400),
  |                            ^^
error[E005]: argument 'n' expects Int but got C
  --> /tmp/dojo-roman-numeral-2.almd:8:28
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
8 |     (string.from_codepoint(C), 100),
  |                            ^
error[E005]: argument 'n' expects Int but got XC
  --> /tmp/dojo-roman-numeral-2.almd:9:28
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
9 |     (string.from_codepoint(XC), 90),
  |                            ^^
error[E005]: argument 'n' expects Int but got L
  --> /tmp/dojo-roman-numeral-2.almd:10:28
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
10 |     (string.from_codepoint(L), 50),
   |                            ^
error[E005]: argument 'n' expects Int but got XL
  --> /tmp/dojo-roman-numeral-2.almd:11:28
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
11 |     (string.from_codepoint(XL), 40),
   |                            ^^
error[E005]: argument 'n' expects Int but got X
  --> /tmp/dojo-roman-numeral-2.almd:12:28
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
12 |     (string.from_codepoint(X), 10),
   |                            ^
error[E005]: argument 'n' expects Int but got IX
  --> /tmp/dojo-roman-numeral-2.almd:13:28
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
13 |     (string.from_codepoint(IX), 9),
   |                            ^^
error[E005]: argument 'n' expects Int but got V
  --> /tmp/dojo-roman-numeral-2.almd:14:28
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
14 |     (string.from_codepoint(V), 5),
   |                            ^
error[E005]: argument 'n' expects Int but got IV
  --> /tmp/dojo-roman-numeral-2.almd:15:28
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
15 |     (string.from_codepoint(IV), 4),
   |                            ^^
error[E005]: argument 'n' expects Int but got I
  --> /tmp/dojo-roman-numeral-2.almd:16:28
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
16 |     (string.from_codepoint(I), 1),
   |                            ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got M
  --> /tmp/dojo-roman-numeral-2.almd:4:28
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
4 |     (string.from_codepoint(M), 1000),
  |                            ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got CM
  --> /tmp/dojo-roman-numeral-2.almd:5:28
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
5 |     (string.from_codepoint(CM), 900),
  |                            ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got D
  --> /tmp/dojo-roman-numeral-2.almd:6:28
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
6 |     (string.from_codepoint(D), 500),
  |                            ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got CD
  --> /tmp/dojo-roman-numeral-2.almd:7:28
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |     (string.from_codepoint(CD), 400),
  |                            ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got C
  --> /tmp/dojo-roman-numeral-2.almd:8:28
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
8 |     (string.from_codepoint(C), 100),
  |                            ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got XC
  --> /tmp/dojo-roman-numeral-2.almd:9:28
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
9 |     (string.from_codepoint(XC), 90),
  |                            ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got L
  --> /tmp/dojo-roman-numeral-2.almd:10:28
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
10 |     (string.from_codepoint(L), 50),
   |                            ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got XL
  --> /tmp/dojo-roman-numeral-2.almd:11:28
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
11 |     (string.from_codepoint(XL), 40),
   |                            ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got X
  --> /tmp/dojo-roman-numeral-2.almd:12:28
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
12 |     (string.from_codepoint(X), 10),
   |                            ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got IX
  --> /tmp/dojo-roman-numeral-2.almd:13:28
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
13 |     (string.from_codepoint(IX), 9),
   |                            ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got V
  --> /tmp/dojo-roman-numeral-2.almd:14:28
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
14 |     (string.from_codepoint(V), 5),
   |                            ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got IV
  --> /tmp/dojo-roman-numeral-2.almd:15:28
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
15 |     (string.from_codepoint(IV), 4),
   |                            ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got I
  --> /tmp/dojo-roman-numeral-2.almd:16:28
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
16 |     (string.from_codepoint(I), 1),
   |                            ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:19:11
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
19 |   let i = 0
   |           ^

29 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I) = (1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
  let symbols = [
    (string.from_codepoint(1000), 1000),
    (string.from_codepoint(900), 900),
    (string.from_codepoint(500), 500),
    (string.from_codepoint(400), 400),
    (string.from_codepoint(100), 100),
    (string.from_codepoint(90), 90),
    (string.from_codepoint(50), 50),
    (string.from_codepoint(40), 40),
    (string.from_codepoint(10), 10),
    (string.from_codepoint(9), 9),
    (string.from_codepoint(5), 5),
    (string.from_codepoint(4), 4),
    (string.from_codepoint(1), 1),
  ]
  let mut result = ""
  let mut
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected identifier at line 2:8 (got TypeName 'M')
  --> /tmp/dojo-roman-numeral-3.almd:2:8
  |
2 |   let (M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I) = (1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
  |        ^
error: 'let mut' is not valid in Almide at line 18:7
  --> /tmp/dojo-roman-numeral-3.almd:18:7
  hint: Use 'var' for mutable variables. Example: var x = 0
   |
18 |   let mut result = ""
   |       ^
error: 'let mut' is not valid in Almide at line 19:7
  --> /tmp/dojo-roman-numeral-3.almd:19:7
  hint: Use 'var' for mutable variables. Example: var x = 0
   |
19 |   let mut
   |       ^
error: Expected expression at line 21:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-3.almd:21:1
   |
21 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:16:32
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
16 |     (string.from_codepoint(1), 1),
   |                                ^

5 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
