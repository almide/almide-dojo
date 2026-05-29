# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String {
  let values = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
  let result = values.iter().fold(String::new(), |acc, (value, symbol)| {
    let count = (n / value) * value;
    let rest = n - count;
    if count > 0 {
      acc + symbol * (count / value)
    } else {
      acc
    }
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
  let values = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
  let result = values.iter().fold(String::new(), |acc, (value, symbol)| {
    let count = (n / value) * value;
    let rest = n - count;
    if count > 0 {
      acc + symbol * (count / value)
    } else {
      acc
    }
  });
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: '::' is not valid in Almide at line 3:41
  --> /tmp/dojo-roman-numeral-1.almd:3:41
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
  |
3 |   let result = values.iter().fold(String::new(), |acc, (value, symbol)| {
  |                                         ^
error: Expected Then at line 6:18 (got LBrace '{')
  --> /tmp/dojo-roman-numeral-1.almd:6:18
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |     if count > 0 {
  |                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:7 (got Else 'else')
  --> /tmp/dojo-roman-numeral-1.almd:8:7
  |
8 |     } else {
  |       ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:4:22
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
4 |     let count = (n / value) * value;
  |                      ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:4:31
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
4 |     let count = (n / value) * value;
  |                               ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:7:7
  in variable acc
  hint: Check the variable name
  |
7 |       acc + symbol * (count / value)
  |       ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:7:13
  in variable symbol
  hint: Check the variable name
  |
7 |       acc + symbol * (count / value)
  |             ^^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:7:31
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
7 |       acc + symbol * (count / value)
  |                               ^^^^^

8 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let values = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
  let result = values.iter().fold(String::new(), |acc, (value, symbol)| {
    let count = (n / value) * value;
    let rest = n - count;
    if count > 0 then acc + symbol * (count / value) else acc
  });
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: '::' is not valid in Almide at line 3:41
  --> /tmp/dojo-roman-numeral-2.almd:3:41
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
  |
3 |   let result = values.iter().fold(String::new(), |acc, (value, symbol)| {
  |                                         ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-2.almd:7:4
  |
7 |   });
  |    ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:4:22
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
4 |     let count = (n / value) * value;
  |                      ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:4:31
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
4 |     let count = (n / value) * value;
  |                               ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:6:23
  in variable acc
  hint: Check the variable name
  |
6 |     if count > 0 then acc + symbol * (count / value) else acc
  |                       ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:6:29
  in variable symbol
  hint: Check the variable name
  |
6 |     if count > 0 then acc + symbol * (count / value) else acc
  |                             ^^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:6:47
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
6 |     if count > 0 then acc + symbol * (count / value) else acc
  |                                               ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:6:59
  in variable acc
  hint: Check the variable name
  |
6 |     if count > 0 then acc + symbol * (count / value) else acc
  |                                                           ^^^

8 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let values = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
  let result = values.iter().fold(String::new(), |acc, pair| {
    let (value, symbol) = pair;
    let count = (n / value) * value;
    let rest = n - count;
    if count > 0 then acc + symbol * (count / value) else acc
  });
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: '::' is not valid in Almide at line 3:41
  --> /tmp/dojo-roman-numeral-3.almd:3:41
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
  |
3 |   let result = values.iter().fold(String::new(), |acc, pair| {
  |                                         ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-3.almd:8:4
  |
8 |   });
  |    ^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-3.almd:4:27
  in variable pair
  hint: Did you mean `panic`?
  try:
      // pair  →  panic
      panic
  |
4 |     let (value, symbol) = pair;
  |                           ^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:7:23
  in variable acc
  hint: Check the variable name
  |
7 |     if count > 0 then acc + symbol * (count / value) else acc
  |                       ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:7:59
  in variable acc
  hint: Check the variable name
  |
7 |     if count > 0 then acc + symbol * (count / value) else acc
  |                                                           ^^^

5 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
