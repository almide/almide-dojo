# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (value, symbol) = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  let result = value.foldl((n, ""), fn ((num, str), (val, sym)) => {
    while num >= val {
      num -= val
      str += sym
    }
    (num, str)
  }, (n, ""))
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Expected expression at line 3:37 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-0.almd:3:37
  |
3 |   let result = value.foldl((n, ""), fn ((num, str), (val, sym)) => {
  |                                     ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-0.almd:5:12
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
5 |       num -= val
  |            ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-0.almd:6:12
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
6 |       str += sym
  |            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:5 (got LParen '(')
  --> /tmp/dojo-roman-numeral-0.almd:8:5
  |
8 |     (num, str)
  |     ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:2:171
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
2 |   let (value, symbol) = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  |                                                                                                                                                                           ^^^

5 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let value = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  let result = value.foldl((n, ""), fn ((num, str), (val, sym)) => {
    while num >= val {
      num -= val
      str += sym
    }
    (num, str)
  }, (n, ""))
  let (num, str) = result
  if num > 0 {
    str + int.to_string(num)
  } else {
    str
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected expression at line 3:37 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-1.almd:3:37
  |
3 |   let result = value.foldl((n, ""), fn ((num, str), (val, sym)) => {
  |                                     ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-1.almd:5:12
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
5 |       num -= val
  |            ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-1.almd:6:12
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
6 |       str += sym
  |            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:5 (got LParen '(')
  --> /tmp/dojo-roman-numeral-1.almd:8:5
  |
8 |     (num, str)
  |     ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:2:161
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
2 |   let value = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  |                                                                                                                                                                 ^^^

5 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let value = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  let result = value.foldl((n, ""), fn ((num, str), (val, sym)) => {
    let new_num = num - val
    let new_str = str + sym
    (new_num, new_str)
  }, (n, ""))
  let (num, str) = result
  str
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 3:37 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-2.almd:3:37
  |
3 |   let result = value.foldl((n, ""), fn ((num, str), (val, sym)) => {
  |                                     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:4 (got Comma ',')
  --> /tmp/dojo-roman-numeral-2.almd:7:4
  |
7 |   }, (n, ""))
  |    ^
error[E003]: undefined variable 'num'
  --> /tmp/dojo-roman-numeral-2.almd:4:19
  in variable num
  hint: Did you mean `n`?
  try:
      // num  →  n
      n
  |
4 |     let new_num = num - val
  |                   ^^^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-roman-numeral-2.almd:4:25
  in variable val
  hint: Did you mean `value`?
  try:
      // val  →  value
      value
  |
4 |     let new_num = num - val
  |                         ^^^
error[E003]: undefined variable 'str'
  --> /tmp/dojo-roman-numeral-2.almd:5:19
  in variable str
  hint: Check the variable name
  |
5 |     let new_str = str + sym
  |                   ^^^
error[E003]: undefined variable 'sym'
  --> /tmp/dojo-roman-numeral-2.almd:5:25
  in variable sym
  hint: Check the variable name
  |
5 |     let new_str = str + sym
  |                         ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got (Unknown, Unknown)
  --> /tmp/dojo-roman-numeral-2.almd:6:15
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  |
6 |     (new_num, new_str)
  |               ^^^^^^^

7 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let value = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  let result = value.foldl((n, ""), fn ((num, str), (val, sym)) => {
    let new_num = num - val
    let new_str = str + sym
    (new_num, new_str)
  }, (n, ""))
  let (_, str) = result
  str
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 3:37 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-3.almd:3:37
  |
3 |   let result = value.foldl((n, ""), fn ((num, str), (val, sym)) => {
  |                                     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:4 (got Comma ',')
  --> /tmp/dojo-roman-numeral-3.almd:7:4
  |
7 |   }, (n, ""))
  |    ^
error[E003]: undefined variable 'num'
  --> /tmp/dojo-roman-numeral-3.almd:4:19
  in variable num
  hint: Did you mean `n`?
  try:
      // num  →  n
      n
  |
4 |     let new_num = num - val
  |                   ^^^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-roman-numeral-3.almd:4:25
  in variable val
  hint: Did you mean `value`?
  try:
      // val  →  value
      value
  |
4 |     let new_num = num - val
  |                         ^^^
error[E003]: undefined variable 'str'
  --> /tmp/dojo-roman-numeral-3.almd:5:19
  in variable str
  hint: Check the variable name
  |
5 |     let new_str = str + sym
  |                   ^^^
error[E003]: undefined variable 'sym'
  --> /tmp/dojo-roman-numeral-3.almd:5:25
  in variable sym
  hint: Check the variable name
  |
5 |     let new_str = str + sym
  |                         ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got (Unknown, Unknown)
  --> /tmp/dojo-roman-numeral-3.almd:6:15
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  |
6 |     (new_num, new_str)
  |               ^^^^^^^

7 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
