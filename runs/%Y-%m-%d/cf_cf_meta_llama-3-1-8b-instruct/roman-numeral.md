# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String {
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
  let roman = String::new();
  for (value, symbol) in symbols.iter() {
    while n >= *value {
      roman.push_str(symbol);
      n -= *value;
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
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
  let mut roman = string::new();
  for (value, symbol) in symbols.iter() {
    while n >= *value {
      roman.push_str(symbol);
      n -= *value;
    }
  }
  roman
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let mut' is not valid in Almide at line 3:7
  --> /tmp/dojo-roman-numeral-1.almd:3:7
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
3 |   let mut roman = string::new();
  |       ^
error: Expected expression at line 5:16 (got Star '*')
  --> /tmp/dojo-roman-numeral-1.almd:5:16
  |
5 |     while n >= *value {
  |                ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-1.almd:7:10
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |       n -= *value;
  |          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:3 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-1.almd:9:3
  |
9 |   }
  |   ^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:6:22
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
6 |       roman.push_str(symbol);
  |                      ^^^^^^
error[E003]: undefined variable 'roman'
  --> /tmp/dojo-roman-numeral-1.almd:6:7
  in variable roman
  hint: Check the variable name
  |
6 |       roman.push_str(symbol);
  |       ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:6:7
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
6 |       roman.push_str(symbol);
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
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
  var roman = string::new();
  for (value, symbol) in symbols.iter() {
    while n >= value {
      roman = roman + symbol;
      n = n - value;
    }
  }
  roman
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: '::' is not valid in Almide at line 3:21
  --> /tmp/dojo-roman-numeral-2.almd:3:21
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
  |
3 |   var roman = string::new();
  |                     ^
error[E003]: undefined variable 'string'
  --> /tmp/dojo-roman-numeral-2.almd:3:15
  in variable string
  hint: Check the variable name
  |
3 |   var roman = string::new();
  |               ^^^^^^
error[E002]: undefined method 'iter' on list
  --> /tmp/dojo-roman-numeral-2.almd:4:26
  in method call .iter()
  hint: Almide doesn't use method-call syntax. Write `list.filter(x)` (or `x |> list.filter`). Method syntax `x.iter()` is not supported.
  try:
      // x.iter()  →  list.filter(x)
      list.filter(x)
  |
4 |   for (value, symbol) in symbols.iter() {
  |                          ^^^^^^^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-roman-numeral-2.almd:7:15
  in n = ...
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
  |
7 |       n = n - value;
  |               ^^^^^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
  var roman = string.new();
  for (value, symbol) in list.filter(x => list.contains(symbols, x)) do {
    var n_ = n;
    while n_ >= value {
      roman = roman + symbol;
      n_ = n_ - value;
    }
  }
  roman
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-roman-numeral-3.almd:4:40
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
4 |   for (value, symbol) in list.filter(x => list.contains(symbols, x)) do {
  |                                        ^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:3 (got Ident 'roman')
  --> /tmp/dojo-roman-numeral-3.almd:11:3
   |
11 |   roman
   |   ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-roman-numeral-3.almd:3:25
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
  |
3 |   var roman = string.new();
  |                         ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:6:17
  in variable value
  hint: Check the variable name
  |
6 |     while n_ >= value {
  |                 ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:7:23
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
7 |       roman = roman + symbol;
  |                       ^^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:8:17
  in variable value
  hint: Check the variable name
  |
8 |       n_ = n_ - value;
  |                 ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:8:17
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
8 |       n_ = n_ - value;
  |                 ^^^^^

7 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
