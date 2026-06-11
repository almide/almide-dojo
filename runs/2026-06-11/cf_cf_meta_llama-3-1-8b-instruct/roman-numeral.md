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
  let result = values.fold(String::new(), |acc, (value, symbol)| {
    let count = n / value;
    let new_acc = acc + symbol.repeat(count);
    let new_n = n - count * value;
    new_acc
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
  let result = values.fold(String::new(), |acc, (value, symbol)| {
    let count = n / value;
    let new_acc = acc + symbol.repeat(count);
    let new_n = n - count * value;
    new_acc
  });
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: '::' is not valid in Almide at line 3:34
  --> /tmp/dojo-roman-numeral-1.almd:3:34
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
  |
3 |   let result = values.fold(String::new(), |acc, (value, symbol)| {
  |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:8:4
  |
8 |   });
  |    ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:4:21
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
4 |     let count = n / value;
  |                     ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:5:19
  in variable acc
  hint: Check the variable name
  |
5 |     let new_acc = acc + symbol.repeat(count);
  |                   ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:5:25
  in variable symbol
  hint: Check the variable name
  |
5 |     let new_acc = acc + symbol.repeat(count);
  |                         ^^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:6:29
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
6 |     let new_n = n - count * value;
  |                             ^^^^^

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let values = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
  let result = values.fold(String::new(), |acc, (value, symbol)| {
    let count = n / value;
    let new_acc = acc + symbol.repeat(count);
    let new_n = n - count * value;
    new_acc
  });
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: '::' is not valid in Almide at line 3:34
  --> /tmp/dojo-roman-numeral-2.almd:3:34
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
  |
3 |   let result = values.fold(String::new(), |acc, (value, symbol)| {
  |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-2.almd:8:4
  |
8 |   });
  |    ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:4:21
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
4 |     let count = n / value;
  |                     ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:5:19
  in variable acc
  hint: Check the variable name
  |
5 |     let new_acc = acc + symbol.repeat(count);
  |                   ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:5:25
  in variable symbol
  hint: Check the variable name
  |
5 |     let new_acc = acc + symbol.repeat(count);
  |                         ^^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:6:29
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
6 |     let new_n = n - count * value;
  |                             ^^^^^

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let values = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
  let result = values.fold(String::new(), |acc, (value, symbol)| {
    let count = n / value;
    let new_acc = acc + symbol.repeat(count);
    let new_n = n - count * value;
    new_acc
  });
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: '::' is not valid in Almide at line 3:34
  --> /tmp/dojo-roman-numeral-3.almd:3:34
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
  |
3 |   let result = values.fold(String::new(), |acc, (value, symbol)| {
  |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-3.almd:8:4
  |
8 |   });
  |    ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:4:21
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
4 |     let count = n / value;
  |                     ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:5:19
  in variable acc
  hint: Check the variable name
  |
5 |     let new_acc = acc + symbol.repeat(count);
  |                   ^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:5:25
  in variable symbol
  hint: Check the variable name
  |
5 |     let new_acc = acc + symbol.repeat(count);
  |                         ^^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:6:29
  in variable value
  hint: Did you mean `values`?
  try:
      // value  →  values
      values
  |
6 |     let new_n = n - count * value;
  |                             ^^^^^

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
