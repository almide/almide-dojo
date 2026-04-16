# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

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
  let result = symbols.fold(String::new(), |acc, (value, symbol)| {
    let count = (n / value).min(n % value == 0 ? 1 : 2);
    acc + String::from(symbol).repeat(count)
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
  let result = symbols.fold(String::new(), |acc, (value, symbol)| {
    let count = (n / value).min(n % value == 0 ? 1 : 2);
    acc + String::from(symbol).repeat(count)
  });
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: '::' is not valid in Almide at line 17:35
  --> /tmp/dojo-roman-numeral-1.almd:17:35
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
   |
17 |   let result = symbols.fold(String::new(), |acc, (value, symbol)| {
   |                                   ^
error: Missing ',' between function arguments at line 18:50
  --> /tmp/dojo-roman-numeral-1.almd:18:50
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
18 |     let count = (n / value).min(n % value == 0 ? 1 : 2);
   |                                                  ^
error: '::' is not valid in Almide at line 19:17
  --> /tmp/dojo-roman-numeral-1.almd:19:17
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
   |
19 |     acc + String::from(symbol).repeat(count)
   |                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 20:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:20:4
   |
20 |   });
   |    ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:19:5
  in variable acc
  hint: Check the variable name
   |
19 |     acc + String::from(symbol).repeat(count)
   |     ^^^
error: operator '+' requires numeric, String, or List types but got Unknown and String
  --> /tmp/dojo-roman-numeral-1.almd:19:11
  in operator +
  hint: Use + with numeric types, String, or List
   |
19 |     acc + String::from(symbol).repeat(count)
   |           ^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:19:11
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
19 |     acc + String::from(symbol).repeat(count)
   |           ^^^^^^

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
  ];
  let result = symbols.fold(String::new(), |acc, (value, symbol)| {
    let count = (n / value).min(n % value == 0 ? 1 : 2);
    acc + symbol.repeat(count)
  });
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: '::' is not valid in Almide at line 17:35
  --> /tmp/dojo-roman-numeral-2.almd:17:35
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
   |
17 |   let result = symbols.fold(String::new(), |acc, (value, symbol)| {
   |                                   ^
error: Missing ',' between function arguments at line 18:50
  --> /tmp/dojo-roman-numeral-2.almd:18:50
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
18 |     let count = (n / value).min(n % value == 0 ? 1 : 2);
   |                                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 20:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-2.almd:20:4
   |
20 |   });
   |    ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:19:5
  in variable acc
  hint: Check the variable name
   |
19 |     acc + symbol.repeat(count)
   |     ^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:19:25
  in variable count
  hint: Check the variable name
   |
19 |     acc + symbol.repeat(count)
   |                         ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:19:11
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
19 |     acc + symbol.repeat(count)
   |           ^^^^^^

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

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
  let result = symbols.fold(String::new(), |acc, (value, symbol)| {
    let count = (n / value).min(n % value == 0 ? 1 : 2);
    acc + symbol.repeat(count)
  });
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: '::' is not valid in Almide at line 17:35
  --> /tmp/dojo-roman-numeral-3.almd:17:35
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
   |
17 |   let result = symbols.fold(String::new(), |acc, (value, symbol)| {
   |                                   ^
error: Missing ',' between function arguments at line 18:50
  --> /tmp/dojo-roman-numeral-3.almd:18:50
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
18 |     let count = (n / value).min(n % value == 0 ? 1 : 2);
   |                                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 20:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-3.almd:20:4
   |
20 |   });
   |    ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:19:5
  in variable acc
  hint: Check the variable name
   |
19 |     acc + symbol.repeat(count)
   |     ^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:19:25
  in variable count
  hint: Check the variable name
   |
19 |     acc + symbol.repeat(count)
   |                         ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:19:11
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
19 |     acc + symbol.repeat(count)
   |           ^^^^^^

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
