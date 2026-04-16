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
  let result = symbols.fold(String::new(), (a, pair) => {
    let (value, symbol) = pair;
    let count = (n / value).min(3);
    let sub = count * value;
    let str = String::from_iter((0..count).map(|_| symbol));
    a + str
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
  let result = symbols.fold(String::new(), (a, pair) => {
    let (value, symbol) = pair;
    let count = (n / value).min(3);
    let sub = count * value;
    let str = String::from_iter((0..count).map(|_| symbol));
    a + str
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
17 |   let result = symbols.fold(String::new(), (a, pair) => {
   |                                   ^
error: '::' is not valid in Almide at line 21:21
  --> /tmp/dojo-roman-numeral-1.almd:21:21
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
   |
21 |     let str = String::from_iter((0..count).map(|_| symbol));
   |                     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:23:4
   |
23 |   });
   |    ^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-1.almd:18:27
  in variable pair
  hint: Did you mean `panic`?
  try:
      // pair  →  panic
      panic
   |
18 |     let (value, symbol) = pair;
   |                           ^^^^
error[E002]: undefined method 'min' on int
  --> /tmp/dojo-roman-numeral-1.almd:19:22
  in method call .min()
  hint: Almide doesn't use method-call syntax. Write `int.max(x)` (or `x |> int.max`). Method syntax `x.min()` is not supported.
  try:
      // x.min()  →  int.max(x)
      int.max(x)
   |
19 |     let count = (n / value).min(3);
   |                      ^^^^^
error[E003]: undefined variable 'a'
  --> /tmp/dojo-roman-numeral-1.almd:22:5
  in variable a
  hint: Did you mean `n`?
  try:
      // a  →  n
      n
   |
22 |     a + str
   |     ^
error: operator '+' requires numeric, String, or List types but got Unknown and String
  --> /tmp/dojo-roman-numeral-1.almd:22:9
  in operator +
  hint: Use + with numeric types, String, or List
   |
22 |     a + str
   |         ^^^

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
  let result = symbols.fold(String::new(), (acc, pair) => {
    let (value, symbol) = pair;
    let count = (n / value).|> int.clamp(0, 3);
    let sub = count * value;
    let str = symbol |> string.repeat(count);
    acc + str
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
17 |   let result = symbols.fold(String::new(), (acc, pair) => {
   |                                   ^
error: Expected name at line 19:29 (got PipeArrow '|>')
  --> /tmp/dojo-roman-numeral-2.almd:19:29
   |
19 |     let count = (n / value).|> int.clamp(0, 3);
   |                             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-2.almd:23:4
   |
23 |   });
   |    ^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-2.almd:18:27
  in variable pair
  hint: Did you mean `panic`?
  try:
      // pair  →  panic
      panic
   |
18 |     let (value, symbol) = pair;
   |                           ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:20:15
  in variable count
  hint: Check the variable name
   |
20 |     let sub = count * value;
   |               ^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:21:39
  in variable count
  hint: Check the variable name
   |
21 |     let str = symbol |> string.repeat(count);
   |                                       ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:22:5
  in variable acc
  hint: Check the variable name
   |
22 |     acc + str
   |     ^^^

7 error(s) found
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
  let mut result = String::new();
  symbols.fold(() => {}, (acc, pair) => {
    let (value, symbol) = pair;
    let count = (n / value).|> int.clamp(0, 3);
    let sub = count * value;
    let str = symbol |> string.repeat(count);
    result = result + str
  });
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'let mut' is not valid in Almide at line 17:7
  --> /tmp/dojo-roman-numeral-3.almd:17:7
  hint: Use 'var' for mutable variables. Example: var x = 0
   |
17 |   let mut result = String::new();
   |       ^
error: Expected name at line 20:29 (got PipeArrow '|>')
  --> /tmp/dojo-roman-numeral-3.almd:20:29
   |
20 |     let count = (n / value).|> int.clamp(0, 3);
   |                             ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:21:15
  in variable count
  hint: Check the variable name
   |
21 |     let sub = count * value;
   |               ^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:22:39
  in variable count
  hint: Check the variable name
   |
22 |     let str = symbol |> string.repeat(count);
   |                                       ^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-3.almd:23:14
  in variable result
  hint: Check the variable name
   |
23 |     result = result + str
   |              ^^^^^^
error[E005]: argument 'f' expects fn(fn() -> Unit, (Int, String)) -> fn() -> Unit but got fn(?0, (?2, String)) -> Unit
  --> /tmp/dojo-roman-numeral-3.almd:18:3
  in call to list.fold()
  hint: Fix the argument type
   |
18 |   symbols.fold(() => {}, (acc, pair) => {
   |   ^^^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-3.almd:25:3
  in variable result
  hint: Check the variable name
   |
25 |   result
   |   ^^^^^^
error[E001]: type mismatch in call to list.fold(): expected fn(fn() -> Unit, (Int, String)) -> fn() -> Unit but got fn(fn() -> Unit, (Int, String)) -> Unit
  --> /tmp/dojo-roman-numeral-3.almd:18:3
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
18 |   symbols.fold(() => {}, (acc, pair) => {
   |   ^^^^^^^

8 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
