# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String {
  let numeral_values = [ (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I") ]
  let result = match numeral_values.find_by(|(value, _)| value <= n) {
    Some((value, symbol)) => {
      let remaining = n - value
      if remaining == 0 {
        symbol
      } else {
        symbol + to_roman(remaining)
      }
    }
    None => ""
  }
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
  let numeral_values = [ (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I") ]
  let result = match numeral_values.find_by(|(value, _)| value < n) {
    Some((value, symbol)) => {
      let remaining = n - value
      if remaining == 0 {
        symbol
      } else {
        symbol + to_roman(remaining)
      }
    }
    None => ""
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected expression at line 3:45 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-1.almd:3:45
  |
3 |   let result = match numeral_values.find_by(|(value, _)| value < n) {
  |                                             ^
error: Expected Then at line 6:25 (got LBrace '{')
  --> /tmp/dojo-roman-numeral-1.almd:6:25
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |       if remaining == 0 {
  |                         ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:9 (got Else 'else')
  --> /tmp/dojo-roman-numeral-1.almd:8:9
  |
8 |       } else {
  |         ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:5:27
  in variable value
  hint: Check the variable name
  |
5 |       let remaining = n - value
  |                           ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:7:9
  in variable symbol
  hint: Check the variable name
  |
7 |         symbol
  |         ^^^^^^

5 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let numeral_values = [ (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I") ]
  let result = match numeral_values.find(|(value, _)| value < n) {
    Some((value, symbol)) => {
      let remaining = n - value
      if remaining == 0 {
        symbol
      } else {
        symbol + to_roman(remaining)
      }
    }
    None => ""
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 3:42 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-2.almd:3:42
  |
3 |   let result = match numeral_values.find(|(value, _)| value < n) {
  |                                          ^
error: Expected Then at line 6:25 (got LBrace '{')
  --> /tmp/dojo-roman-numeral-2.almd:6:25
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |       if remaining == 0 {
  |                         ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:9 (got Else 'else')
  --> /tmp/dojo-roman-numeral-2.almd:8:9
  |
8 |       } else {
  |         ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:5:27
  in variable value
  hint: Check the variable name
  |
5 |       let remaining = n - value
  |                           ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:7:9
  in variable symbol
  hint: Check the variable name
  |
7 |         symbol
  |         ^^^^^^

5 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let numeral_values = [ (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I") ]
  let result = match numeral_values.find(|(value, symbol)| value < n) {
    Some((value, symbol)) => {
      let remaining = n - value
      if remaining == 0 {
        symbol
      } else {
        symbol + to_roman(remaining)
      }
    }
    None => ""
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 3:42 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-3.almd:3:42
  |
3 |   let result = match numeral_values.find(|(value, symbol)| value < n) {
  |                                          ^
error: Expected Then at line 6:25 (got LBrace '{')
  --> /tmp/dojo-roman-numeral-3.almd:6:25
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |       if remaining == 0 {
  |                         ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:9 (got Else 'else')
  --> /tmp/dojo-roman-numeral-3.almd:8:9
  |
8 |       } else {
  |         ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:5:27
  in variable value
  hint: Check the variable name
  |
5 |       let remaining = n - value
  |                           ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:7:9
  in variable symbol
  hint: Check the variable name
  |
7 |         symbol
  |         ^^^^^^

5 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
