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
  let result = symbols
    .iter()
    .filter_map(|(value, symbol)| {
      let count = n / value;
      if count > 0 {
        Some((count, symbol))
      } else {
        None
      }
    })
    .map(|(count, symbol)| {
      let mut result = String::new();
      for _ in 0..count {
        result.push_str(symbol);
      }
      result
    })
    .collect::<Vec<String>>()
    .join("");
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
  let result = symbols
    .iter()
    .filter_map(|(value, symbol)| {
      let count = n / value;
      if count > 0 {
        Some((count, symbol))
      } else {
        None
      }
    })
    .map(|(count, symbol)| {
      let mut result = String::new();
      for _ in 0..count {
        result.push_str(symbol);
      }
      result
    })
    .collect::<List<String>>()
    .join("");
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected expression at line 18:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-1.almd:18:5
   |
18 |     .iter()
   |     ^
error: Expected Then at line 21:20 (got LBrace '{')
  --> /tmp/dojo-roman-numeral-1.almd:21:20
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
21 |       if count > 0 {
   |                    ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:9 (got Else 'else')
  --> /tmp/dojo-roman-numeral-1.almd:23:9
   |
23 |       } else {
   |         ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:20:23
  in variable value
  hint: Check the variable name
   |
20 |       let count = n / value;
   |                       ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:20:23
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
20 |       let count = n / value;
   |                       ^^^^^

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
  let result = symbols
    .iter()
    .filter_map(|(value, symbol)| {
      let count = n / value;
      if count > 0 then Some((count, symbol)) else None
    })
    .map(|(count, symbol)| {
      let mut result = String::new();
      for _ in 0..count {
        result.push_str(symbol);
      }
      result
    })
    .collect::<List<String>>()
    .join("");
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 18:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-2.almd:18:5
   |
18 |     .iter()
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:6 (got RParen ')')
  --> /tmp/dojo-roman-numeral-2.almd:22:6
   |
22 |     })
   |      ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:20:23
  in variable value
  hint: Check the variable name
   |
20 |       let count = n / value;
   |                       ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:21:38
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
21 |       if count > 0 then Some((count, symbol)) else None
   |                                      ^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Option[(Int, Unknown)]
  --> /tmp/dojo-roman-numeral-2.almd:21:52
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
   |
21 |       if count > 0 then Some((count, symbol)) else None
   |                                                    ^^^^

5 error(s) found
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
  let result = symbols
    .iter()
    .filter_map(|item| {
      let (value, symbol) = item;
      let count = n / value;
      if count > 0 then Some((count, symbol)) else None
    })
    .map(|(count, symbol)| {
      let mut result = String::new();
      for _ in 0..count {
        result.push_str(symbol);
      }
      result
    })
    .collect::<List<String>>()
    .join("");
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 18:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-3.almd:18:5
   |
18 |     .iter()
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:6 (got RParen ')')
  --> /tmp/dojo-roman-numeral-3.almd:23:6
   |
23 |     })
   |      ^
error[E003]: undefined variable 'item'
  --> /tmp/dojo-roman-numeral-3.almd:20:29
  in variable item
  hint: Check the variable name
   |
20 |       let (value, symbol) = item;
   |                             ^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Option[(Int, Unknown)]
  --> /tmp/dojo-roman-numeral-3.almd:22:52
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
   |
22 |       if count > 0 then Some((count, symbol)) else None
   |                                                    ^^^^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
