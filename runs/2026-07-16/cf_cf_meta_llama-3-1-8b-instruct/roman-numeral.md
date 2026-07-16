# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  match n {
    | n when n < 1 || n > 3999 => string.to_upper("Invalid input")
    | 4000 => string.to_upper("MMM")
    | n => 
      let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
      let roman = string.new()
      for (value, symbol) in symbols {
        while n >= value {
          roman += symbol
          n -= value
        }
      }
      roman
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-0.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | n when n < 1 || n > 3999 => string.to_upper("Invalid input")
  |     ^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  match n {
    | n when n < 1 || n > 3999 => string.to_upper("Invalid input")
    | 4000 => string.to_upper("MMM")
    | _ =>
      let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
      let roman = string.new()
      for (value, symbol) in symbols {
        while n >= value {
          roman += symbol
          n -= value
        }
      }
      roman
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-1.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | n when n < 1 || n > 3999 => string.to_upper("Invalid input")
  |     ^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  match n {
    | n when n < 1 || n > 3999 => string.to_upper("Invalid input")
    | 4000 => string.to_upper("MMM")
    | _ =>
      let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
      let roman = string.new()
      for (value, symbol) in symbols {
        while n >= value {
          roman += symbol
          n -= value
        }
      }
      roman
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-2.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | n when n < 1 || n > 3999 => string.to_upper("Invalid input")
  |     ^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  match n {
    | n when n < 1 => string.to_upper("Invalid input")
    | n when n > 3999 => string.to_upper("Invalid input")
    | 4000 => string.to_upper("MMM")
    | _ =>
      let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
      let roman = string.new()
      for (value, symbol) in symbols {
        while n >= value {
          roman += symbol
          n -= value
        }
      }
      roman
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-3.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | n when n < 1 => string.to_upper("Invalid input")
  |     ^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
