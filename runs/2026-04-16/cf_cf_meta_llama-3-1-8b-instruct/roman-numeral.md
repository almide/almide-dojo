# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

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
  ];
  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    while n >= value {
      acc = acc + symbol;
      n = n - value;
    }
    acc
  });
  result
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
  ];
  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    while n >= value {
      acc = acc + symbol;
      n = n - value;
    }
    acc
  });
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:19:19
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
19 |       acc = acc + symbol;
   |                   ^^^^^^
error[E009]: cannot reassign immutable binding 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:19:19
  in acc = ...
  hint: Use 'var acc = ...' instead of 'let acc = ...' to declare a mutable variable
  try:
      // let acc = ...  →  var acc = ...
      var acc = <initial value>
   |
19 |       acc = acc + symbol;
   |                   ^^^^^^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-roman-numeral-1.almd:20:15
  in n = ...
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
   |
20 |       n = n - value;
   |               ^^^^^
error[E005]: argument 'f' expects fn(String, (Int, String)) -> String but got fn(?0, Int) -> ?0
  --> /tmp/dojo-roman-numeral-1.almd:22:5
  in call to list.fold()
  hint: Fix the argument type
   |
22 |     acc
   |     ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-1.almd:22:5
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
22 |     acc
   |     ^^^

5 error(s) found
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
  ];
  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var nَت = n;
    while nَت >= value {
      acc = acc + symbol;
      nَت = nَت - value;
    }
    acc
  });
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected Eq at line 18:10 (got EOF '')
  --> /tmp/dojo-roman-numeral-2.almd:18:10
error: Expected '}' to close block opened at line 17:65
  --> /tmp/dojo-roman-numeral-2.almd:18:10
  hint: Add '}' or check for a missing delimiter inside the block
error: Expected '}' to close block opened at line 1:33
  --> /tmp/dojo-roman-numeral-2.almd:18:10
  hint: Add '}' or check for a missing delimiter inside the block

```

### Attempt 4 (FAIL)

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
  ];
  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    let n_t = n;
    while n_t >= value {
      acc = acc + symbol;
      n_t = n_t - value;
    }
    acc
  });
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:20:19
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
20 |       acc = acc + symbol;
   |                   ^^^^^^
error[E009]: cannot reassign immutable binding 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:20:19
  in acc = ...
  hint: Use 'var acc = ...' instead of 'let acc = ...' to declare a mutable variable
  try:
      // let acc = ...  →  var acc = ...
      var acc = <initial value>
   |
20 |       acc = acc + symbol;
   |                   ^^^^^^
error[E009]: cannot reassign immutable binding 'n_t'
  --> /tmp/dojo-roman-numeral-3.almd:21:19
  in n_t = ...
  hint: Use 'var n_t = ...' instead of 'let n_t = ...' to declare a mutable variable
  try:
      // let n_t = ...  →  var n_t = ...
      var n_t = <initial value>
   |
18 |     let n_t = n;
   |     ------------------- 'n_t' declared here
...
21 |       n_t = n_t - value;
   |                   ^^^^^
error[E005]: argument 'f' expects fn(String, (Int, String)) -> String but got fn(?0, Int) -> ?0
  --> /tmp/dojo-roman-numeral-3.almd:23:5
  in call to list.fold()
  hint: Fix the argument type
   |
23 |     acc
   |     ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-3.almd:23:5
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
23 |     acc
   |     ^^^

5 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
