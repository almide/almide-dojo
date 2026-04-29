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

  let result = values.fold(String::new(), |acc, (value, symbol)| {
    let count = (n / value).min(n % value == 0 ? 1 : 2);
    let repeat = String::from_iter(std::iter::repeat(symbol).take(count));
    acc + repeat
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

  let result = values.fold(String::new(), |acc, (value, symbol)| {
    let count = (n / value).min(n % value == 0 ? 1 : 2);
    let repeat = String::from_iter(std::iter::repeat(symbol).take(count));
    acc + repeat
  });

  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: '::' is not valid in Almide at line 18:34
  --> /tmp/dojo-roman-numeral-1.almd:18:34
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
   |
18 |   let result = values.fold(String::new(), |acc, (value, symbol)| {
   |                                  ^
error: Missing ',' between function arguments at line 19:50
  --> /tmp/dojo-roman-numeral-1.almd:19:50
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
19 |     let count = (n / value).min(n % value == 0 ? 1 : 2);
   |                                                  ^
error: '::' is not valid in Almide at line 20:24
  --> /tmp/dojo-roman-numeral-1.almd:20:24
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
   |
20 |     let repeat = String::from_iter(std::iter::repeat(symbol).take(count));
   |                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:22:4
   |
22 |   });
   |    ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-1.almd:21:5
  in variable acc
  hint: Check the variable name
   |
21 |     acc + repeat
   |     ^^^
error: operator '+' requires numeric, String, or List types but got Unknown and String
  --> /tmp/dojo-roman-numeral-1.almd:21:11
  in operator +
  hint: Use + with numeric types, String, or List
   |
21 |     acc + repeat
   |           ^^^^^^

6 error(s) found
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

  let result = values.fold(String::new(), |acc, (value, symbol)| {
    let count = (n / value).min(n % value == 0 ? 1 : 2);
    let repeat = string.from_iter(list.iter().repeat(symbol).take(count));
    acc + repeat
  });

  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: '::' is not valid in Almide at line 18:34
  --> /tmp/dojo-roman-numeral-2.almd:18:34
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
   |
18 |   let result = values.fold(String::new(), |acc, (value, symbol)| {
   |                                  ^
error: Missing ',' between function arguments at line 19:50
  --> /tmp/dojo-roman-numeral-2.almd:19:50
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
19 |     let count = (n / value).min(n % value == 0 ? 1 : 2);
   |                                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-2.almd:22:4
   |
22 |   });
   |    ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:20:67
  in variable count
  hint: Check the variable name
   |
20 |     let repeat = string.from_iter(list.iter().repeat(symbol).take(count));
   |                                                                   ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:20:54
  in variable symbol
  hint: Check the variable name
   |
20 |     let repeat = string.from_iter(list.iter().repeat(symbol).take(count));
   |                                                      ^^^^^^
error[E002]: undefined function 'list.iter'
  --> /tmp/dojo-roman-numeral-2.almd:20:44
  in call to list.iter()
  hint: Did you mean `list.filter`?
  try:
      // list.iter(...)  →  list.filter(...)
      list.filter(...)
   |
20 |     let repeat = string.from_iter(list.iter().repeat(symbol).take(count));
   |                                            ^
error[E002]: undefined function 'string.from_iter'
  --> /tmp/dojo-roman-numeral-2.almd:20:44
  in call to string.from_iter()
  hint: Did you mean `string.from_bytes`?
  try:
      // string.from_iter(...)  →  string.from_bytes(...)
      string.from_bytes(...)
   |
20 |     let repeat = string.from_iter(list.iter().repeat(symbol).take(count));
   |                                            ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-2.almd:21:5
  in variable acc
  hint: Check the variable name
   |
21 |     acc + repeat
   |     ^^^

8 error(s) found
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

  let result = values.fold(String::new(), |acc, (value, symbol)| {
    let count = (n / value).min((n % value == 0) ? 1 : 2);
    let repeat = string.repeat(symbol, count);
    acc + repeat
  });

  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: '::' is not valid in Almide at line 18:34
  --> /tmp/dojo-roman-numeral-3.almd:18:34
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
   |
18 |   let result = values.fold(String::new(), |acc, (value, symbol)| {
   |                                  ^
error: Missing ',' between function arguments at line 19:52
  --> /tmp/dojo-roman-numeral-3.almd:19:52
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
19 |     let count = (n / value).min((n % value == 0) ? 1 : 2);
   |                                                    ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-3.almd:22:4
   |
22 |   });
   |    ^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:20:32
  in variable symbol
  hint: Check the variable name
   |
20 |     let repeat = string.repeat(symbol, count);
   |                                ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:20:40
  in variable count
  hint: Check the variable name
   |
20 |     let repeat = string.repeat(symbol, count);
   |                                        ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:21:5
  in variable acc
  hint: Check the variable name
   |
21 |     acc + repeat
   |     ^^^

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
