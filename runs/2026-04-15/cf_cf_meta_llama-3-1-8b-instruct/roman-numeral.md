# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let roman = [
    (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), 
    (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), 
    (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
  ]
  let result = ""
  for (value, symbol) in roman do
    while n >= value do
      result += symbol
      n -= value
  result
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Expected LBrace at line 8:32 (got Ident 'do')
  --> /tmp/dojo-roman-numeral-0.almd:8:32
  |
8 |   for (value, symbol) in roman do
  |                                ^
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-roman-numeral-0.almd:9:22
  in while body
  hint: Almide uses `while cond { ... }` (curly braces, no `do`/`done`). Pure code: prefer recursion or `list.fold`. Effect code: `while cond { ... }`.
  |
9 |     while n >= value do
  |                      ^^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-0.almd:10:15
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
10 |       result += symbol
   |               ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-0.almd:11:10
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
11 |       n -= value
   |          ^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let roman = [
    (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), 
    (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), 
    (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
  ]
  let result = ""
  for (value, symbol) in roman do
    while n >= value do
      result := result + symbol
      n := n - value
  result
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected LBrace at line 8:32 (got Ident 'do')
  --> /tmp/dojo-roman-numeral-1.almd:8:32
  |
8 |   for (value, symbol) in roman do
  |                                ^
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-roman-numeral-1.almd:9:22
  in while body
  hint: Almide uses `while cond { ... }` (curly braces, no `do`/`done`). Pure code: prefer recursion or `list.fold`. Effect code: `while cond { ... }`.
  |
9 |     while n >= value do
  |                      ^^
error: Expected expression at line 10:14 (got Colon ':')
  --> /tmp/dojo-roman-numeral-1.almd:10:14
   |
10 |       result := result + symbol
   |              ^
error: Expected expression at line 11:9 (got Colon ':')
  --> /tmp/dojo-roman-numeral-1.almd:11:9
   |
11 |       n := n - value
   |         ^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let roman = [
    (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), 
    (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), 
    (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
  ]
  let result = ""
  for (value, symbol) in roman do
    while n >= value do
      result := result + symbol
      n := n - value
  result

fn to_roman(n: Int) -> String = 
  let roman = [
    (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), 
    (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), 
    (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
  ]
  let result = ""
  for (value,
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected LBrace at line 8:32 (got Ident 'do')
  --> /tmp/dojo-roman-numeral-2.almd:8:32
  |
8 |   for (value, symbol) in roman do
  |                                ^
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-roman-numeral-2.almd:9:22
  in while body
  hint: Almide uses `while cond { ... }` (curly braces, no `do`/`done`). Pure code: prefer recursion or `list.fold`. Effect code: `while cond { ... }`.
  |
9 |     while n >= value do
  |                      ^^
error: Expected expression at line 10:14 (got Colon ':')
  --> /tmp/dojo-roman-numeral-2.almd:10:14
   |
10 |       result := result + symbol
   |              ^
error: Expected expression at line 11:9 (got Colon ':')
  --> /tmp/dojo-roman-numeral-2.almd:11:9
   |
11 |       n := n - value
   |         ^
error: Expected identifier at line 21:14 (got Newline '')
  --> /tmp/dojo-roman-numeral-2.almd:21:14
   |
21 |   for (value,
   |              ^
error[E012]: duplicate function 'to_roman'
  at line 14
  in fn to_roman
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn to_roman(n: Int) -> String =
   | ----------------------------------- first definition of 'to_roman' here
...
14 | fn to_roman(n: Int) -> String =
   | ^^^^^^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:20:16
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
   |
20 |   let result = ""
   |                ^^

7 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let roman = [
    (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), 
    (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), 
    (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
  ]
  let result = ""
  for (value, symbol) in roman do
    while n >= value do
      result := result + symbol
      n := n - value
  result
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected LBrace at line 8:32 (got Ident 'do')
  --> /tmp/dojo-roman-numeral-3.almd:8:32
  |
8 |   for (value, symbol) in roman do
  |                                ^
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-roman-numeral-3.almd:9:22
  in while body
  hint: Almide uses `while cond { ... }` (curly braces, no `do`/`done`). Pure code: prefer recursion or `list.fold`. Effect code: `while cond { ... }`.
  |
9 |     while n >= value do
  |                      ^^
error: Expected expression at line 10:14 (got Colon ':')
  --> /tmp/dojo-roman-numeral-3.almd:10:14
   |
10 |       result := result + symbol
   |              ^
error: Expected expression at line 11:9 (got Colon ':')
  --> /tmp/dojo-roman-numeral-3.almd:11:9
   |
11 |       n := n - value
   |         ^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
