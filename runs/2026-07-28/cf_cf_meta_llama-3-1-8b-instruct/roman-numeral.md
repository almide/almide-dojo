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
  let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
  let result = string.new()
  for (symbol, value) in roman {
    while n >= value {
      string.append(result, symbol)
      n -= value
    }
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Expected identifier at line 2:8 (got TypeName 'M')
  --> /tmp/dojo-roman-numeral-0.almd:2:8
  |
2 |   let (M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I) = (1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
  |        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-0.almd:8:10
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
8 |       n -= value
  |          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:3 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-0.almd:10:3
   |
10 |   }
   |   ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-roman-numeral-0.almd:4:26
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
  |
4 |   let result = string.new()
  |                          ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, CM)
  --> /tmp/dojo-roman-numeral-0.almd:3:32
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
  |                                ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, D)
  --> /tmp/dojo-roman-numeral-0.almd:3:43
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
  |                                           ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, CD)
  --> /tmp/dojo-roman-numeral-0.almd:3:54
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
  |                                                      ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, C)
  --> /tmp/dojo-roman-numeral-0.almd:3:65
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
  |                                                                 ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, XC)
  --> /tmp/dojo-roman-numeral-0.almd:3:76
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
  |                                                                            ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, L)
  --> /tmp/dojo-roman-numeral-0.almd:3:87
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
  |                                                                                       ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, XL)
  --> /tmp/dojo-roman-numeral-0.almd:3:98
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
  |                                                                                                  ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, X)
  --> /tmp/dojo-roman-numeral-0.almd:3:109
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
  |                                                                                                             ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, IX)
  --> /tmp/dojo-roman-numeral-0.almd:3:120
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
  |                                                                                                                        ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, V)
  --> /tmp/dojo-roman-numeral-0.almd:3:131
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
  |                                                                                                                                   ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, IV)
  --> /tmp/dojo-roman-numeral-0.almd:3:142
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
  |                                                                                                                                              ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, I)
  --> /tmp/dojo-roman-numeral-0.almd:3:153
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
  |                                                                                                                                                         ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:4:26
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
4 |   let result = string.new()
  |                          ^

17 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let M = 1000
  let CM = 900
  let D = 500
  let CD = 400
  let C = 100
  let XC = 90
  let L = 50
  let XL = 40
  let X = 10
  let IX = 9
  let V = 5
  let IV = 4
  let I = 1
  let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
  let result = string.new()
  for (symbol, value) in roman {
    while n >= value {
      string.append(result, symbol)
      n -= value
    }
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected identifier at line 2:7 (got TypeName 'M')
  --> /tmp/dojo-roman-numeral-1.almd:2:7
  |
2 |   let M = 1000
  |       ^
error: Expected identifier at line 3:7 (got TypeName 'CM')
  --> /tmp/dojo-roman-numeral-1.almd:3:7
  |
3 |   let CM = 900
  |       ^
error: Expected identifier at line 4:7 (got TypeName 'D')
  --> /tmp/dojo-roman-numeral-1.almd:4:7
  |
4 |   let D = 500
  |       ^
error: Expected identifier at line 5:7 (got TypeName 'CD')
  --> /tmp/dojo-roman-numeral-1.almd:5:7
  |
5 |   let CD = 400
  |       ^
error: Expected identifier at line 6:7 (got TypeName 'C')
  --> /tmp/dojo-roman-numeral-1.almd:6:7
  |
6 |   let C = 100
  |       ^
error: Expected identifier at line 7:7 (got TypeName 'XC')
  --> /tmp/dojo-roman-numeral-1.almd:7:7
  |
7 |   let XC = 90
  |       ^
error: Expected identifier at line 8:7 (got TypeName 'L')
  --> /tmp/dojo-roman-numeral-1.almd:8:7
  |
8 |   let L = 50
  |       ^
error: Expected identifier at line 9:7 (got TypeName 'XL')
  --> /tmp/dojo-roman-numeral-1.almd:9:7
  |
9 |   let XL = 40
  |       ^
error: Expected identifier at line 10:7 (got TypeName 'X')
  --> /tmp/dojo-roman-numeral-1.almd:10:7
   |
10 |   let X = 10
   |       ^
error: Expected identifier at line 11:7 (got TypeName 'IX')
  --> /tmp/dojo-roman-numeral-1.almd:11:7
   |
11 |   let IX = 9
   |       ^
error: Expected identifier at line 12:7 (got TypeName 'V')
  --> /tmp/dojo-roman-numeral-1.almd:12:7
   |
12 |   let V = 5
   |       ^
error: Expected identifier at line 13:7 (got TypeName 'IV')
  --> /tmp/dojo-roman-numeral-1.almd:13:7
   |
13 |   let IV = 4
   |       ^
error: Expected identifier at line 14:7 (got TypeName 'I')
  --> /tmp/dojo-roman-numeral-1.almd:14:7
   |
14 |   let I = 1
   |       ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-1.almd:20:10
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
20 |       n -= value
   |          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:3 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-1.almd:22:3
   |
22 |   }
   |   ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-roman-numeral-1.almd:16:26
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
   |
16 |   let result = string.new()
   |                          ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, CM)
  --> /tmp/dojo-roman-numeral-1.almd:15:32
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, D)
  --> /tmp/dojo-roman-numeral-1.almd:15:43
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                           ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, CD)
  --> /tmp/dojo-roman-numeral-1.almd:15:54
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                      ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, C)
  --> /tmp/dojo-roman-numeral-1.almd:15:65
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                 ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, XC)
  --> /tmp/dojo-roman-numeral-1.almd:15:76
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                            ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, L)
  --> /tmp/dojo-roman-numeral-1.almd:15:87
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                       ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, XL)
  --> /tmp/dojo-roman-numeral-1.almd:15:98
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                                  ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, X)
  --> /tmp/dojo-roman-numeral-1.almd:15:109
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                                             ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, IX)
  --> /tmp/dojo-roman-numeral-1.almd:15:120
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                                                        ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, V)
  --> /tmp/dojo-roman-numeral-1.almd:15:131
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                                                                   ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, IV)
  --> /tmp/dojo-roman-numeral-1.almd:15:142
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                                                                              ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, I)
  --> /tmp/dojo-roman-numeral-1.almd:15:153
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                                                                                         ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:16:26
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
16 |   let result = string.new()
   |                          ^

29 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let M = 1000
  let CM = 900
  let D = 500
  let CD = 400
  let C = 100
  let XC = 90
  let L = 50
  let XL = 40
  let X = 10
  let IX = 9
  let V = 5
  let IV = 4
  let I = 1
  let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
  let mut result = string.new()
  for (symbol, value) in roman {
    while n >= value {
      string.append(result, symbol)
      n -= value
    }
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected identifier at line 2:7 (got TypeName 'M')
  --> /tmp/dojo-roman-numeral-2.almd:2:7
  |
2 |   let M = 1000
  |       ^
error: Expected identifier at line 3:7 (got TypeName 'CM')
  --> /tmp/dojo-roman-numeral-2.almd:3:7
  |
3 |   let CM = 900
  |       ^
error: Expected identifier at line 4:7 (got TypeName 'D')
  --> /tmp/dojo-roman-numeral-2.almd:4:7
  |
4 |   let D = 500
  |       ^
error: Expected identifier at line 5:7 (got TypeName 'CD')
  --> /tmp/dojo-roman-numeral-2.almd:5:7
  |
5 |   let CD = 400
  |       ^
error: Expected identifier at line 6:7 (got TypeName 'C')
  --> /tmp/dojo-roman-numeral-2.almd:6:7
  |
6 |   let C = 100
  |       ^
error: Expected identifier at line 7:7 (got TypeName 'XC')
  --> /tmp/dojo-roman-numeral-2.almd:7:7
  |
7 |   let XC = 90
  |       ^
error: Expected identifier at line 8:7 (got TypeName 'L')
  --> /tmp/dojo-roman-numeral-2.almd:8:7
  |
8 |   let L = 50
  |       ^
error: Expected identifier at line 9:7 (got TypeName 'XL')
  --> /tmp/dojo-roman-numeral-2.almd:9:7
  |
9 |   let XL = 40
  |       ^
error: Expected identifier at line 10:7 (got TypeName 'X')
  --> /tmp/dojo-roman-numeral-2.almd:10:7
   |
10 |   let X = 10
   |       ^
error: Expected identifier at line 11:7 (got TypeName 'IX')
  --> /tmp/dojo-roman-numeral-2.almd:11:7
   |
11 |   let IX = 9
   |       ^
error: Expected identifier at line 12:7 (got TypeName 'V')
  --> /tmp/dojo-roman-numeral-2.almd:12:7
   |
12 |   let V = 5
   |       ^
error: Expected identifier at line 13:7 (got TypeName 'IV')
  --> /tmp/dojo-roman-numeral-2.almd:13:7
   |
13 |   let IV = 4
   |       ^
error: Expected identifier at line 14:7 (got TypeName 'I')
  --> /tmp/dojo-roman-numeral-2.almd:14:7
   |
14 |   let I = 1
   |       ^
error: 'let mut' is not valid in Almide at line 16:7
  --> /tmp/dojo-roman-numeral-2.almd:16:7
  hint: Use 'var' for mutable variables. Example: var x = 0
   |
16 |   let mut result = string.new()
   |       ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-2.almd:20:10
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
20 |       n -= value
   |          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:3 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-2.almd:22:3
   |
22 |   }
   |   ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, CM)
  --> /tmp/dojo-roman-numeral-2.almd:15:33
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                 ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, D)
  --> /tmp/dojo-roman-numeral-2.almd:15:44
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                            ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, CD)
  --> /tmp/dojo-roman-numeral-2.almd:15:55
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                       ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, C)
  --> /tmp/dojo-roman-numeral-2.almd:15:66
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                  ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, XC)
  --> /tmp/dojo-roman-numeral-2.almd:15:77
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                             ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, L)
  --> /tmp/dojo-roman-numeral-2.almd:15:88
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                        ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, XL)
  --> /tmp/dojo-roman-numeral-2.almd:15:99
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                                   ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, X)
  --> /tmp/dojo-roman-numeral-2.almd:15:110
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                                              ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, IX)
  --> /tmp/dojo-roman-numeral-2.almd:15:121
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                                                         ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, V)
  --> /tmp/dojo-roman-numeral-2.almd:15:132
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                                                                    ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, IV)
  --> /tmp/dojo-roman-numeral-2.almd:15:143
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                                                                               ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, I)
  --> /tmp/dojo-roman-numeral-2.almd:15:154
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                                                                                          ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:15:154
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                                                                                          ^

29 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let M = 1000
  let CM = 900
  let D = 500
  let CD = 400
  let C = 100
  let XC = 90
  let L = 50
  let XL = 40
  let X = 10
  let IX = 9
  let V = 5
  let IV = 4
  let I = 1
  let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
  var result = string.new()
  for (symbol, value) in roman {
    while n >= value {
      string.append(result, symbol)
      n -= value
    }
  }
  string.reverse(result)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected identifier at line 2:7 (got TypeName 'M')
  --> /tmp/dojo-roman-numeral-3.almd:2:7
  |
2 |   let M = 1000
  |       ^
error: Expected identifier at line 3:7 (got TypeName 'CM')
  --> /tmp/dojo-roman-numeral-3.almd:3:7
  |
3 |   let CM = 900
  |       ^
error: Expected identifier at line 4:7 (got TypeName 'D')
  --> /tmp/dojo-roman-numeral-3.almd:4:7
  |
4 |   let D = 500
  |       ^
error: Expected identifier at line 5:7 (got TypeName 'CD')
  --> /tmp/dojo-roman-numeral-3.almd:5:7
  |
5 |   let CD = 400
  |       ^
error: Expected identifier at line 6:7 (got TypeName 'C')
  --> /tmp/dojo-roman-numeral-3.almd:6:7
  |
6 |   let C = 100
  |       ^
error: Expected identifier at line 7:7 (got TypeName 'XC')
  --> /tmp/dojo-roman-numeral-3.almd:7:7
  |
7 |   let XC = 90
  |       ^
error: Expected identifier at line 8:7 (got TypeName 'L')
  --> /tmp/dojo-roman-numeral-3.almd:8:7
  |
8 |   let L = 50
  |       ^
error: Expected identifier at line 9:7 (got TypeName 'XL')
  --> /tmp/dojo-roman-numeral-3.almd:9:7
  |
9 |   let XL = 40
  |       ^
error: Expected identifier at line 10:7 (got TypeName 'X')
  --> /tmp/dojo-roman-numeral-3.almd:10:7
   |
10 |   let X = 10
   |       ^
error: Expected identifier at line 11:7 (got TypeName 'IX')
  --> /tmp/dojo-roman-numeral-3.almd:11:7
   |
11 |   let IX = 9
   |       ^
error: Expected identifier at line 12:7 (got TypeName 'V')
  --> /tmp/dojo-roman-numeral-3.almd:12:7
   |
12 |   let V = 5
   |       ^
error: Expected identifier at line 13:7 (got TypeName 'IV')
  --> /tmp/dojo-roman-numeral-3.almd:13:7
   |
13 |   let IV = 4
   |       ^
error: Expected identifier at line 14:7 (got TypeName 'I')
  --> /tmp/dojo-roman-numeral-3.almd:14:7
   |
14 |   let I = 1
   |       ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-3.almd:20:10
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
20 |       n -= value
   |          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:3 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-3.almd:22:3
   |
22 |   }
   |   ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-roman-numeral-3.almd:16:26
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
   |
16 |   var result = string.new()
   |                          ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, CM)
  --> /tmp/dojo-roman-numeral-3.almd:15:33
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                 ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, D)
  --> /tmp/dojo-roman-numeral-3.almd:15:44
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                            ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, CD)
  --> /tmp/dojo-roman-numeral-3.almd:15:55
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                       ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, C)
  --> /tmp/dojo-roman-numeral-3.almd:15:66
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                  ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, XC)
  --> /tmp/dojo-roman-numeral-3.almd:15:77
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                             ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, L)
  --> /tmp/dojo-roman-numeral-3.almd:15:88
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                        ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, XL)
  --> /tmp/dojo-roman-numeral-3.almd:15:99
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                                   ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, X)
  --> /tmp/dojo-roman-numeral-3.almd:15:110
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                                              ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, IX)
  --> /tmp/dojo-roman-numeral-3.almd:15:121
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                                                         ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, V)
  --> /tmp/dojo-roman-numeral-3.almd:15:132
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                                                                    ^
error[E001]: type mismatch in list element: expected (String, M) but got (String, IV)
  --> /tmp/dojo-roman-numeral-3.almd:15:143
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                                                                               ^^
error[E001]: type mismatch in list element: expected (String, M) but got (String, I)
  --> /tmp/dojo-roman-numeral-3.almd:15:154
  in list element
  hint: Fix the expression type or change the expected type
   |
15 |   let roman = [("M", M), ("CM", CM), ("D", D), ("CD", CD), ("C", C), ("XC", XC), ("L", L), ("XL", XL), ("X", X), ("IX", IX), ("V", V), ("IV", IV), ("I", I)]
   |                                                                                                                                                          ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:16:26
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
16 |   var result = string.new()
   |                          ^

29 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
