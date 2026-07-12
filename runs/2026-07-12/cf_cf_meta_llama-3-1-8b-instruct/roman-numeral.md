# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  let result = 
    match symbols 
    { 
      some((value, symbol)) => 
        if n >= value 
        then 
          let count = n / value 
          let rest = n - count * value 
          symbol + string.repeat(symbol, count) + to_roman(rest) 
        else 
          to_roman(n) 
    , none => "" 
    } 
  result
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:9:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |           let count = n / value
  |           ^^^
error: Expected expression at line 12:9 (got Else 'else')
  --> /tmp/dojo-roman-numeral-0.almd:12:9
   |
12 |         else
   |         ^
error: Expected expression at line 14:5 (got Comma ',')
  --> /tmp/dojo-roman-numeral-0.almd:14:5
   |
14 |     , none => ""
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 15:5 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-0.almd:15:5
   |
15 |     }
   |     ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-0.almd:10:26
  in variable count
  hint: Check the variable name
   |
10 |           let rest = n - count * value
   |                          ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:10:34
  in variable value
  hint: Check the variable name
   |
10 |           let rest = n - count * value
   |                                  ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:11:11
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
11 |           symbol + string.repeat(symbol, count) + to_roman(rest)
   |           ^^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:11:34
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
11 |           symbol + string.repeat(symbol, count) + to_roman(rest)
   |                                  ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-0.almd:11:42
  in variable count
  hint: Check the variable name
   |
11 |           symbol + string.repeat(symbol, count) + to_roman(rest)
   |                                          ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:13:20
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
13 |           to_roman(n)
   |                    ^

10 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  match symbols 
  { 
    some((value, symbol)) => 
      if n >= value 
      then 
        let count = n / value 
        let rest = n - count * value 
        symbol + string.repeat(symbol, count) + to_roman(rest) 
      else 
        to_roman(n) 
  , none => "" 
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:8:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |         let count = n / value
  |         ^^^
error: Expected expression at line 11:7 (got Else 'else')
  --> /tmp/dojo-roman-numeral-1.almd:11:7
   |
11 |       else
   |       ^
error: Expected expression at line 13:3 (got Comma ',')
  --> /tmp/dojo-roman-numeral-1.almd:13:3
   |
13 |   , none => ""
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 14:3 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-1.almd:14:3
   |
14 |   }
   |   ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-1.almd:9:24
  in variable count
  hint: Check the variable name
  |
9 |         let rest = n - count * value
  |                        ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:9:32
  in variable value
  hint: Check the variable name
  |
9 |         let rest = n - count * value
  |                                ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:10:9
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
10 |         symbol + string.repeat(symbol, count) + to_roman(rest)
   |         ^^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:10:32
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
10 |         symbol + string.repeat(symbol, count) + to_roman(rest)
   |                                ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-1.almd:10:40
  in variable count
  hint: Check the variable name
   |
10 |         symbol + string.repeat(symbol, count) + to_roman(rest)
   |                                        ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:12:18
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
12 |         to_roman(n)
   |                  ^

10 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  match symbols 
  { 
    some((value, symbol)) => 
      if n >= value 
      then 
        let count = n / value 
        let rest = n - count * value 
        string.repeat(symbol, count) + to_roman(rest) 
      else 
        to_roman(n) 
  , none => "" 
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:8:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |         let count = n / value
  |         ^^^
error: Expected expression at line 11:7 (got Else 'else')
  --> /tmp/dojo-roman-numeral-2.almd:11:7
   |
11 |       else
   |       ^
error: Expected expression at line 13:3 (got Comma ',')
  --> /tmp/dojo-roman-numeral-2.almd:13:3
   |
13 |   , none => ""
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 14:3 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-2.almd:14:3
   |
14 |   }
   |   ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:9:24
  in variable count
  hint: Check the variable name
  |
9 |         let rest = n - count * value
  |                        ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:9:32
  in variable value
  hint: Check the variable name
  |
9 |         let rest = n - count * value
  |                                ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:10:23
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
10 |         string.repeat(symbol, count) + to_roman(rest)
   |                       ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:10:31
  in variable count
  hint: Check the variable name
   |
10 |         string.repeat(symbol, count) + to_roman(rest)
   |                               ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:12:18
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
12 |         to_roman(n)
   |                  ^

9 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  match symbols 
  { 
    some((value, symbol)) => 
      if n >= value 
      then 
        let count = n / value 
        let rest = n - count * value 
        string.repeat(symbol, count) + to_roman(rest) 
      else 
        to_roman(n) 
  , none => string.from_empty() 
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:8:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |         let count = n / value
  |         ^^^
error: Expected expression at line 11:7 (got Else 'else')
  --> /tmp/dojo-roman-numeral-3.almd:11:7
   |
11 |       else
   |       ^
error: Expected expression at line 13:3 (got Comma ',')
  --> /tmp/dojo-roman-numeral-3.almd:13:3
   |
13 |   , none => string.from_empty()
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 14:3 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-3.almd:14:3
   |
14 |   }
   |   ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:9:24
  in variable count
  hint: Check the variable name
  |
9 |         let rest = n - count * value
  |                        ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:9:32
  in variable value
  hint: Check the variable name
  |
9 |         let rest = n - count * value
  |                                ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:10:23
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
10 |         string.repeat(symbol, count) + to_roman(rest)
   |                       ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:10:31
  in variable count
  hint: Check the variable name
   |
10 |         string.repeat(symbol, count) + to_roman(rest)
   |                               ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:12:18
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
12 |         to_roman(n)
   |                  ^

9 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
