# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E009`

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String {
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
    (1, "I")
  ]
  let roman = String::new()
  for (value, symbol) in symbols.iter() {
    while n >= *value {
      roman.push_str(symbol);
      n -= *value
    }
  }
  roman
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Missing '=' before function body at line 1:31
  --> /tmp/dojo-roman-numeral-0.almd:1:31
  hint: Almide requires '=' before the body. Write: fn to_roman(...) -> Type = { ... }
  |
1 | fn to_roman(n: Int) -> String {
  |                               ^

1 error(s) found
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
    (1, "I")
  ]
  let roman = String::new()
  for (value, symbol) in symbols.iter() {
    while n >= *value {
      roman.push_str(symbol);
      n -= *value
    }
  }
  roman
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: '::' is not valid in Almide at line 17:21
  --> /tmp/dojo-roman-numeral-1.almd:17:21
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
   |
17 |   let roman = String::new()
   |                     ^
error: Expected expression at line 19:16 (got Star '*')
  --> /tmp/dojo-roman-numeral-1.almd:19:16
   |
19 |     while n >= *value {
   |                ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-1.almd:21:10
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
21 |       n -= *value
   |          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:3 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-1.almd:23:3
   |
23 |   }
   |   ^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:20:22
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
20 |       roman.push_str(symbol);
   |                      ^^^^^^
error[E001]: type mismatch in method call: expected String but got fn(Unknown) -> ?0
  --> /tmp/dojo-roman-numeral-1.almd:20:7
  in method call
  hint: Fix the expression type or change the expected type
   |
20 |       roman.push_str(symbol);
   |       ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:20:7
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
20 |       roman.push_str(symbol);
   |       ^^^^^

7 error(s) found
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
    (1, "I")
  ]
  let mut roman = String::new()
  for (value, symbol) in symbols.iter() {
    while n >= value {
      roman = roman + symbol
      n = n - value
    }
  }
  roman
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'let mut' is not valid in Almide at line 17:7
  --> /tmp/dojo-roman-numeral-2.almd:17:7
  hint: Use 'var' for mutable variables. Example: var x = 0
   |
17 |   let mut roman = String::new()
   |       ^
error[E002]: undefined method 'iter' on list
  --> /tmp/dojo-roman-numeral-2.almd:18:26
  in method call .iter()
  hint: Almide doesn't use method-call syntax. Write `list.filter(x)` (or `x |> list.filter`). Method syntax `x.iter()` is not supported.
  try:
      // x.iter()  →  list.filter(x)
      list.filter(x)
   |
18 |   for (value, symbol) in symbols.iter() {
   |                          ^^^^^^^
error[E003]: undefined variable 'roman'
  --> /tmp/dojo-roman-numeral-2.almd:20:15
  in variable roman
  hint: Check the variable name
   |
20 |       roman = roman + symbol
   |               ^^^^^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-roman-numeral-2.almd:21:15
  in n = ...
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
   |
21 |       n = n - value
   |               ^^^^^
error[E003]: undefined variable 'roman'
  --> /tmp/dojo-roman-numeral-2.almd:24:3
  in variable roman
  hint: Check the variable name
   |
24 |   roman
   |   ^^^^^

5 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  var roman = ""
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
    (1, "I")
  ]
  for (value, symbol) in symbols {
    while n >= value {
      roman = roman + symbol
      var n_ = n
      n_ = n_ - value
      n = n_
    }
  }
  roman
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-roman-numeral-3.almd:23:11
  in n = ...
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
   |
23 |       n = n_
   |           ^^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
