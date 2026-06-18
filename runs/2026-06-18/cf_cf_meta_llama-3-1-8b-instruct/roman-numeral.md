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
  let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  let result = string.new()
  for (symbol, value) in symbols.zip(values) {
    while n >= value {
      result += symbol
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
  --> /tmp/dojo-roman-numeral-0.almd:7:15
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |       result += symbol
  |               ^
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
error[E001]: type mismatch in list element: expected M but got CM
  --> /tmp/dojo-roman-numeral-0.almd:3:105
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                         ^^
error[E001]: type mismatch in list element: expected M but got D
  --> /tmp/dojo-roman-numeral-0.almd:3:109
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                             ^
error[E001]: type mismatch in list element: expected M but got CD
  --> /tmp/dojo-roman-numeral-0.almd:3:112
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                ^^
error[E001]: type mismatch in list element: expected M but got C
  --> /tmp/dojo-roman-numeral-0.almd:3:116
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                    ^
error[E001]: type mismatch in list element: expected M but got XC
  --> /tmp/dojo-roman-numeral-0.almd:3:119
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                       ^^
error[E001]: type mismatch in list element: expected M but got L
  --> /tmp/dojo-roman-numeral-0.almd:3:123
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                           ^
error[E001]: type mismatch in list element: expected M but got XL
  --> /tmp/dojo-roman-numeral-0.almd:3:126
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                              ^^
error[E001]: type mismatch in list element: expected M but got X
  --> /tmp/dojo-roman-numeral-0.almd:3:130
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                                  ^
error[E001]: type mismatch in list element: expected M but got IX
  --> /tmp/dojo-roman-numeral-0.almd:3:133
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                                     ^^
error[E001]: type mismatch in list element: expected M but got V
  --> /tmp/dojo-roman-numeral-0.almd:3:137
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                                         ^
error[E001]: type mismatch in list element: expected M but got IV
  --> /tmp/dojo-roman-numeral-0.almd:3:140
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                                            ^^
error[E001]: type mismatch in list element: expected M but got I
  --> /tmp/dojo-roman-numeral-0.almd:3:144
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                                                ^
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

18 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I) = (1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
  let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  let result = string.new()
  for (symbol, value) in symbols.zip(values) {
    while n >= value {
      result += symbol
      n -= value
    }
  }
  result
}
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
  --> /tmp/dojo-roman-numeral-1.almd:7:15
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |       result += symbol
  |               ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-1.almd:8:10
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
8 |       n -= value
  |          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:3 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-1.almd:10:3
   |
10 |   }
   |   ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-roman-numeral-1.almd:4:26
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
  |
4 |   let result = string.new()
  |                          ^
error[E001]: type mismatch in list element: expected M but got CM
  --> /tmp/dojo-roman-numeral-1.almd:3:105
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                         ^^
error[E001]: type mismatch in list element: expected M but got D
  --> /tmp/dojo-roman-numeral-1.almd:3:109
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                             ^
error[E001]: type mismatch in list element: expected M but got CD
  --> /tmp/dojo-roman-numeral-1.almd:3:112
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                ^^
error[E001]: type mismatch in list element: expected M but got C
  --> /tmp/dojo-roman-numeral-1.almd:3:116
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                    ^
error[E001]: type mismatch in list element: expected M but got XC
  --> /tmp/dojo-roman-numeral-1.almd:3:119
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                       ^^
error[E001]: type mismatch in list element: expected M but got L
  --> /tmp/dojo-roman-numeral-1.almd:3:123
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                           ^
error[E001]: type mismatch in list element: expected M but got XL
  --> /tmp/dojo-roman-numeral-1.almd:3:126
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                              ^^
error[E001]: type mismatch in list element: expected M but got X
  --> /tmp/dojo-roman-numeral-1.almd:3:130
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                                  ^
error[E001]: type mismatch in list element: expected M but got IX
  --> /tmp/dojo-roman-numeral-1.almd:3:133
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                                     ^^
error[E001]: type mismatch in list element: expected M but got V
  --> /tmp/dojo-roman-numeral-1.almd:3:137
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                                         ^
error[E001]: type mismatch in list element: expected M but got IV
  --> /tmp/dojo-roman-numeral-1.almd:3:140
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                                            ^^
error[E001]: type mismatch in list element: expected M but got I
  --> /tmp/dojo-roman-numeral-1.almd:3:144
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                                                ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:4:26
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

18 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I) = (1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
  let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  let result = string.new()
  for (symbol, value) in symbols.zip(values) {
    while n >= value {
      result = string.concat(result, symbol)
      n = n - value
    }
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected identifier at line 2:8 (got TypeName 'M')
  --> /tmp/dojo-roman-numeral-2.almd:2:8
  |
2 |   let (M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I) = (1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
  |        ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-roman-numeral-2.almd:4:26
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
  |
4 |   let result = string.new()
  |                          ^
error[E002]: undefined function 'string.concat'
  --> /tmp/dojo-roman-numeral-2.almd:7:38
  in call to string.concat()
  hint: No function 'concat' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
7 |       result = string.concat(result, symbol)
  |                                      ^^^^^^
error[E009]: cannot reassign immutable binding 'result'
  --> /tmp/dojo-roman-numeral-2.almd:7:38
  in result = ...
  hint: Use 'var result = ...' instead of 'let result = ...' to declare a mutable variable
  try:
      // let result = ...  →  var result = ...
      var result = <initial value>
  |
4 |   let result = string.new()
  |   ---------------------- 'result' declared here
...
7 |       result = string.concat(result, symbol)
  |                                      ^^^^^^
error: operator '-' requires numeric types but got Int and M
  --> /tmp/dojo-roman-numeral-2.almd:8:15
  in operator -
  hint: Use numeric types (Int or Float)
  |
8 |       n = n - value
  |               ^^^^^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-roman-numeral-2.almd:8:15
  in n = ...
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
  |
8 |       n = n - value
  |               ^^^^^
error[E001]: type mismatch in list element: expected M but got CM
  --> /tmp/dojo-roman-numeral-2.almd:3:105
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                         ^^
error[E001]: type mismatch in list element: expected M but got D
  --> /tmp/dojo-roman-numeral-2.almd:3:109
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                             ^
error[E001]: type mismatch in list element: expected M but got CD
  --> /tmp/dojo-roman-numeral-2.almd:3:112
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                ^^
error[E001]: type mismatch in list element: expected M but got C
  --> /tmp/dojo-roman-numeral-2.almd:3:116
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                    ^
error[E001]: type mismatch in list element: expected M but got XC
  --> /tmp/dojo-roman-numeral-2.almd:3:119
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                       ^^
error[E001]: type mismatch in list element: expected M but got L
  --> /tmp/dojo-roman-numeral-2.almd:3:123
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                           ^
error[E001]: type mismatch in list element: expected M but got XL
  --> /tmp/dojo-roman-numeral-2.almd:3:126
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                              ^^
error[E001]: type mismatch in list element: expected M but got X
  --> /tmp/dojo-roman-numeral-2.almd:3:130
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                                  ^
error[E001]: type mismatch in list element: expected M but got IX
  --> /tmp/dojo-roman-numeral-2.almd:3:133
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                                     ^^
error[E001]: type mismatch in list element: expected M but got V
  --> /tmp/dojo-roman-numeral-2.almd:3:137
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                                         ^
error[E001]: type mismatch in list element: expected M but got IV
  --> /tmp/dojo-roman-numeral-2.almd:3:140
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                                            ^^
error[E001]: type mismatch in list element: expected M but got I
  --> /tmp/dojo-roman-numeral-2.almd:3:144
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                                                ^

18 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I) = (1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
  let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  var result = string.new()
  for (symbol, value) in symbols.zip(values) {
    while n >= value {
      result = string.concat(result, symbol)
      n = n - value
    }
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected identifier at line 2:8 (got TypeName 'M')
  --> /tmp/dojo-roman-numeral-3.almd:2:8
  |
2 |   let (M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I) = (1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
  |        ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-roman-numeral-3.almd:4:26
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
  |
4 |   var result = string.new()
  |                          ^
error[E002]: undefined function 'string.concat'
  --> /tmp/dojo-roman-numeral-3.almd:7:38
  in call to string.concat()
  hint: No function 'concat' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
7 |       result = string.concat(result, symbol)
  |                                      ^^^^^^
error: operator '-' requires numeric types but got Int and M
  --> /tmp/dojo-roman-numeral-3.almd:8:15
  in operator -
  hint: Use numeric types (Int or Float)
  |
8 |       n = n - value
  |               ^^^^^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-roman-numeral-3.almd:8:15
  in n = ...
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
  |
8 |       n = n - value
  |               ^^^^^
error[E001]: type mismatch in list element: expected M but got CM
  --> /tmp/dojo-roman-numeral-3.almd:3:105
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                         ^^
error[E001]: type mismatch in list element: expected M but got D
  --> /tmp/dojo-roman-numeral-3.almd:3:109
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                             ^
error[E001]: type mismatch in list element: expected M but got CD
  --> /tmp/dojo-roman-numeral-3.almd:3:112
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                ^^
error[E001]: type mismatch in list element: expected M but got C
  --> /tmp/dojo-roman-numeral-3.almd:3:116
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                    ^
error[E001]: type mismatch in list element: expected M but got XC
  --> /tmp/dojo-roman-numeral-3.almd:3:119
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                       ^^
error[E001]: type mismatch in list element: expected M but got L
  --> /tmp/dojo-roman-numeral-3.almd:3:123
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                           ^
error[E001]: type mismatch in list element: expected M but got XL
  --> /tmp/dojo-roman-numeral-3.almd:3:126
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                              ^^
error[E001]: type mismatch in list element: expected M but got X
  --> /tmp/dojo-roman-numeral-3.almd:3:130
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                                  ^
error[E001]: type mismatch in list element: expected M but got IX
  --> /tmp/dojo-roman-numeral-3.almd:3:133
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                                     ^^
error[E001]: type mismatch in list element: expected M but got V
  --> /tmp/dojo-roman-numeral-3.almd:3:137
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                                         ^
error[E001]: type mismatch in list element: expected M but got IV
  --> /tmp/dojo-roman-numeral-3.almd:3:140
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                                            ^^
error[E001]: type mismatch in list element: expected M but got I
  --> /tmp/dojo-roman-numeral-3.almd:3:144
  in list element
  hint: Fix the expression type or change the expected type
  |
3 |   let (symbols, values) = (["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"], [M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I])
  |                                                                                                                                                ^

17 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
