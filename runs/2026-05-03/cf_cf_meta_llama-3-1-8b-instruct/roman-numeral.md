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
    let part = (0..count).map(|_| symbol).join();
    acc + part
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
    let part = (0..count).map(|_| symbol).join();
    acc + part
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
error: '|x|' closure syntax is not valid in Almide at line 19:31
  --> /tmp/dojo-roman-numeral-1.almd:19:31
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
19 |     let part = (0..count).map(|_| symbol).join();
   |                               ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 21:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:21:4
   |
21 |   });
   |    ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:20:5
  in variable acc
  hint: Check the variable name
   |
20 |     acc + part
   |     ^^^
error[E003]: undefined variable 'part'
  --> /tmp/dojo-roman-numeral-1.almd:20:11
  in variable part
  hint: Check the variable name
   |
20 |     acc + part
   |           ^^^^

6 error(s) found
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
  let result = symbols.fold(String::new(), (acc, (value, symbol)) => {
    let count = (n / value).min(n % value == 0 ? 1 : 2);
    let part = (0..count).map((x) => symbol).join();
    acc + part
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
17 |   let result = symbols.fold(String::new(), (acc, (value, symbol)) => {
   |                                   ^
error: Missing ',' between function arguments at line 18:50
  --> /tmp/dojo-roman-numeral-2.almd:18:50
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
18 |     let count = (n / value).min(n % value == 0 ? 1 : 2);
   |                                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 21:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-2.almd:21:4
   |
21 |   });
   |    ^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:19:38
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
19 |     let part = (0..count).map((x) => symbol).join();
   |                                      ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:19:20
  in variable count
  hint: Check the variable name
   |
19 |     let part = (0..count).map((x) => symbol).join();
   |                    ^^^^^
error[E004]: list.join() expects 2 argument(s) but got 1
  --> /tmp/dojo-roman-numeral-2.almd:19:20
  in call to list.join()
  hint: Check the number of arguments
  try:
      // list.join() takes 2 arg(s) — you passed 1
      list.join(<xs: List[String]>, <sep: String>)
   |
19 |     let part = (0..count).map((x) => symbol).join();
   |                    ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:20:5
  in variable acc
  hint: Check the variable name
   |
20 |     acc + part
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
  let result = symbols.fold(String::new(), (acc, (value, symbol)) => {
    let count = (n / value).min(n % value == 0 ? 1 : 2);
    let part = (0..count).map((x) => symbol).join(" ");
    acc + part
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
17 |   let result = symbols.fold(String::new(), (acc, (value, symbol)) => {
   |                                   ^
error: Missing ',' between function arguments at line 18:50
  --> /tmp/dojo-roman-numeral-3.almd:18:50
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
18 |     let count = (n / value).min(n % value == 0 ? 1 : 2);
   |                                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 21:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-3.almd:21:4
   |
21 |   });
   |    ^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:19:38
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
19 |     let part = (0..count).map((x) => symbol).join(" ");
   |                                      ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:19:20
  in variable count
  hint: Check the variable name
   |
19 |     let part = (0..count).map((x) => symbol).join(" ");
   |                    ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:20:5
  in variable acc
  hint: Check the variable name
   |
20 |     acc + part
   |     ^^^

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
