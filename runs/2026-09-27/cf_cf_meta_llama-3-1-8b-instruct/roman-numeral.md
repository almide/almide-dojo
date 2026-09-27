# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String {
  let (thousands, remainder) = (n / 1000, n % 1000);
  let (hundreds, remainder) = (remainder / 100, remainder % 100);
  let (tens, remainder) = (remainder / 10, remainder % 10);
  let (ones, _) = (remainder, remainder % 1);

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
    (1, "I"),
  ];

  let result = symbols
    .iter()
    .filter(|&(value, _)| value <= thousands)
    .map(|&(value, symbol)| {
      let count = (thousands / value).min(3);
      (count, symbol)
    })
    .fold(String::new(), |acc, (count, symbol)| {
      acc + &symbol.repeat(count)
    });

  result + &symbols
    .iter()
    .filter(|&(value, _)| value <= hundreds)
    .map(|&(value, symbol)| {
      let count = (hundreds / value).min(3);
      (count, symbol)
    })
    .fold(String::new(), |acc, (count, symbol)| {
      acc + &symbol.repeat(count)
    });

  result + &symbols
    .iter()
    .filter(|&(value, _)| value <= tens)
    .map(|&(value, symbol)| {
      let count = (tens / value).min(3);
      (count, symbol)
    })
    .fold(String::new(), |acc, (count, symbol)| {
      acc + &symbol.repeat(count)
    });

  result + &symbols
    .iter()
    .filter(|&(value, _)| value <= ones)
    .map(|&(value, symbol)| {
      let count = (ones / value).min(3);
      (count, symbol)
    })
    .fold(String::new(), |acc, (count, symbol)| {
      acc + &symbol.repeat(count)
    });
}
```

**Diagnostic:**

```
error: Missing '=' before function body at line 1:31
  --> /tmp/dojo-roman-numeral-0.almd:1:31
  here: fn to_roman(n: Int) -> String {
  hint: Almide requires '=' before the body. Write: fn to_roman(...) -> Type = { ... }
  |
1 | fn to_roman(n: Int) -> String {
  |                               ^

1 error(s) found
FAILED: /tmp/dojo-roman-numeral-0.almd
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (thousands, remainder) = (n / 1000, n % 1000);
  let (hundreds, remainder) = (remainder / 100, remainder % 100);
  let (tens, remainder) = (remainder / 10, remainder % 10);
  let (ones, _) = (remainder, remainder % 1);

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
    (1, "I"),
  ];

  let result = symbols
    .iter()
    .filter(|&(value, _)| value <= thousands)
    .map(|&(value, symbol)| {
      let count = (thousands / value).min(3);
      (count, symbol)
    })
    .fold(String::new(), |acc, (count, symbol)| {
      acc + &symbol.repeat(count)
    });

  result + &symbols
    .iter()
    .filter(|&(value, _)| value <= hundreds)
    .map(|&(value, symbol)| {
      let count = (hundreds / value).min(3);
      (count, symbol)
    })
    .fold(String::new(), |acc, (count, symbol)| {
      acc + &symbol.repeat(count)
    });

  result + &symbols
    .iter()
    .filter(|&(value, _)| value <= tens)
    .map(|&(value, symbol)| {
      let count = (tens / value).min(3);
      (count, symbol)
    })
    .fold(String::new(), |acc, (count, symbol)| {
      acc + &symbol.repeat(count)
    });

  result + &symbols
    .iter()
    .filter(|&(value, _)| value <= ones)
    .map(|&(value, symbol)| {
      let count = (ones / value).min(3);
      (count, symbol)
    })
    .fold(String::new(), |acc, (count, symbol)| {
      acc + &symbol.repeat(count)
    });
}
```

**Diagnostic:**

```
error: Expected expression at line 25:13 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-1.almd:25:13
  here: .filter(|&(value, _)| value <= thousands)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
25 |     .filter(|&(value, _)| value <= thousands)
   |             ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 29:6 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:29:6
  here: })
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
29 |     })
   |      ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:27:32
  in variable value
  here: let count = (thousands / value).min(3);
  hint: Did you mean `value.str`?
  try:
      value.str
   |
27 |       let count = (thousands / value).min(3);
   |                                ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:28:15
  in variable symbol
  here: (count, symbol)
  hint: Did you mean `symbols`?
  try:
      symbols
   |
28 |       (count, symbol)
   |               ^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got (Int, Unknown)
  --> /tmp/dojo-roman-numeral-1.almd:28:15
  in fn 'to_roman'
  here: (count, symbol)
  hint: Fix the expression type or change the expected type
   |
28 |       (count, symbol)
   |               ^^^^^^

5 error(s) found
FAILED: /tmp/dojo-roman-numeral-1.almd
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (thousands, remainder) = (n / 1000, n % 1000);
  let (hundreds, remainder) = (remainder / 100, remainder % 100);
  let (tens, remainder) = (remainder / 10, remainder % 10);
  let (ones, _) = (remainder, remainder % 1);

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
    (1, "I"),
  ];

  let result = symbols
    .iter()
    .filter(|&(value, _)| value <= thousands)
    .map(|(value, symbol)| {
      let count = (thousands / value).min(3);
      (count, symbol)
    })
    .fold(String::new(), |acc, (count, symbol)| {
      acc + &symbol.repeat(count)
    });

  let hundreds_result = symbols
    .iter()
    .filter(|&(value, _)| value <= hundreds)
    .map(|(value, symbol)| {
      let count = (hundreds / value).min(3);
      (count, symbol)
    })
    .fold(String::new(), |acc, (count, symbol)| {
      acc + &symbol.repeat(count)
    });

  let tens_result = symbols
    .iter()
    .filter(|&(value, _)| value <= tens)
    .map(|(value, symbol)| {
      let count = (tens / value).min(3);
      (count, symbol)
    })
    .fold(String::new(), |acc, (count, symbol)| {
      acc + &symbol.repeat(count)
    });

  let ones_result = symbols
    .iter()
    .filter(|&(value, _)| value <= ones)
    .map(|(value, symbol)| {
      let count = (ones / value).min(3);
      (count, symbol)
    })
    .fold(String::new(), |acc, (count, symbol)| {
      acc + &symbol.repeat(count)
    });

  result + hundreds_result + tens_result + ones_result
}
```

**Diagnostic:**

```
error: Expected expression at line 25:13 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-2.almd:25:13
  here: .filter(|&(value, _)| value <= thousands)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
25 |     .filter(|&(value, _)| value <= thousands)
   |             ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 29:6 (got RParen ')')
  --> /tmp/dojo-roman-numeral-2.almd:29:6
  here: })
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
29 |     })
   |      ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:27:32
  in variable value
  here: let count = (thousands / value).min(3);
  hint: Did you mean `value.int`?
  try:
      value.int
   |
27 |       let count = (thousands / value).min(3);
   |                                ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:28:15
  in variable symbol
  here: (count, symbol)
  hint: Did you mean `symbols`?
  try:
      symbols
   |
28 |       (count, symbol)
   |               ^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got (Int, Unknown)
  --> /tmp/dojo-roman-numeral-2.almd:28:15
  in fn 'to_roman'
  here: (count, symbol)
  hint: Fix the expression type or change the expected type
   |
28 |       (count, symbol)
   |               ^^^^^^

5 error(s) found
FAILED: /tmp/dojo-roman-numeral-2.almd
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (thousands, remainder) = (n / 1000, n % 1000);
  let (hundreds, remainder) = (remainder / 100, remainder % 100);
  let (tens, remainder) = (remainder / 10, remainder % 10);
  let (ones, _) = (remainder, remainder % 1);

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
    (1, "I"),
  ];

  let result = symbols
    .iter()
    .filter(|&(value, _)| value <= thousands)
    .map(|(value, symbol)| {
      let count = (thousands / value).min(3);
      (count, symbol)
    })
    .fold(String::new(), |acc, (count, symbol)| {
      acc + &symbol.repeat(count)
    });

  let hundreds_result = symbols
    .iter()
    .filter(|&(value, _)| value <= hundreds)
    .map(|(value, symbol)| {
      let count = (hundreds / value).min(3);
      (count, symbol)
    })
    .fold(String::new(), |acc, (count, symbol)| {
      acc + &symbol.repeat(count)
    });

  let tens_result = symbols
    .iter()
    .filter(|&(value, _)| value <= tens)
    .map(|(value, symbol)| {
      let count = (tens / value).min(3);
      (count, symbol)
    })
    .fold(String::new(), |acc, (count, symbol)| {
      acc + &symbol.repeat(count)
    });

  let ones_result = symbols
    .iter()
    .filter(|&(value, _)| value <= ones)
    .map(|(value, symbol)| {
      let count = (ones / value).min(3);
      (count, symbol)
    })
    .fold(String::new(), |acc, (count, symbol)| {
      acc + &symbol.repeat(count)
    });

  result + hundreds_result + tens_result + ones_result
}
```

**Diagnostic:**

```
error: Expected expression at line 25:13 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-3.almd:25:13
  here: .filter(|&(value, _)| value <= thousands)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
25 |     .filter(|&(value, _)| value <= thousands)
   |             ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 29:6 (got RParen ')')
  --> /tmp/dojo-roman-numeral-3.almd:29:6
  here: })
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
29 |     })
   |      ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:27:32
  in variable value
  here: let count = (thousands / value).min(3);
  hint: Did you mean `value.int`?
  try:
      value.int
   |
27 |       let count = (thousands / value).min(3);
   |                                ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:28:15
  in variable symbol
  here: (count, symbol)
  hint: Did you mean `symbols`?
  try:
      symbols
   |
28 |       (count, symbol)
   |               ^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got (Int, Unknown)
  --> /tmp/dojo-roman-numeral-3.almd:28:15
  in fn 'to_roman'
  here: (count, symbol)
  hint: Fix the expression type or change the expected type
   |
28 |       (count, symbol)
   |               ^^^^^^

5 error(s) found
FAILED: /tmp/dojo-roman-numeral-3.almd
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
