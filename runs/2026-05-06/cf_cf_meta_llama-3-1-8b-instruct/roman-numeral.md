# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String {
  let values = [
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
  let result = String.from_iter(values.iter().filter_map(|(v, s)| {
    if n >= v {
      Some((s, v))
    } else {
      None
    }
  }).map(|(s, v)| {
    n -= v;
    s
  }).to_list());
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
  let values = [
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
  let result = String.from_iter(values.iter().filter_map(|(v, s)| {
    if n >= v {
      Some((s, v))
    } else {
      None
    }
  }).map(|(s, v)| {
    n -= v;
    s
  }).to_list());
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected expression at line 17:58 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-1.almd:17:58
   |
17 |   let result = String.from_iter(values.iter().filter_map(|(v, s)| {
   |                                                          ^
error: Expected Then at line 18:15 (got LBrace '{')
  --> /tmp/dojo-roman-numeral-1.almd:18:15
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
18 |     if n >= v {
   |               ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 20:7 (got Else 'else')
  --> /tmp/dojo-roman-numeral-1.almd:20:7
   |
20 |     } else {
   |       ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:15:9
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
15 |     (1, "I")
   |         ^^^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let values = [
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
  let result = String.from_iter(values.iter().filter_map(|(v, s)| if n >= v { Some((s, v)) } else { None }).map(|(s, v)| {
    n -= v;
    s
  }).to_list());
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 17:58 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-2.almd:17:58
   |
17 |   let result = String.from_iter(values.iter().filter_map(|(v, s)| if n >= v { Some((s, v)) } else { None }).map(|(s, v)| {
   |                                                          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 17:94 (got Else 'else')
  --> /tmp/dojo-roman-numeral-2.almd:17:94
   |
17 |   let result = String.from_iter(values.iter().filter_map(|(v, s)| if n >= v { Some((s, v)) } else { None }).map(|(s, v)| {
   |                                                                                              ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:15:9
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
15 |     (1, "I")
   |         ^^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let values = [
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
  let result = String.from_iter(values.iter().filter_map(|(v, s)| if n >= v { Some((s, v)) } else { None }).map(|(s, v)| {
    n -= v;
    s
  }).to_list());
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 17:58 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-3.almd:17:58
   |
17 |   let result = String.from_iter(values.iter().filter_map(|(v, s)| if n >= v { Some((s, v)) } else { None }).map(|(s, v)| {
   |                                                          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 17:94 (got Else 'else')
  --> /tmp/dojo-roman-numeral-3.almd:17:94
   |
17 |   let result = String.from_iter(values.iter().filter_map(|(v, s)| if n >= v { Some((s, v)) } else { None }).map(|(s, v)| {
   |                                                                                              ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:15:9
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
15 |     (1, "I")
   |         ^^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
