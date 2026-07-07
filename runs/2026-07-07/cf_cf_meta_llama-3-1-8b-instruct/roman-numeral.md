# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String
  = if n < 1 || n > 3999
    then err("Input must be between 1 and 3999")
    else let
      (value, symbol) = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
      in
      list.fold(value, "", (acc, (v, s)) => if n >= v then acc + s + to_roman(n - v) else acc)

fn to_roman(n: Int) -> String
  = if n < 1 || n > 3999
    then err("Input must be between 1 and 3999")
    else let
      (value, symbol) = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:3 (got Eq '=')
  --> /tmp/dojo-roman-numeral-0.almd:2:3
  |
2 |   = if n < 1 || n > 3999
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:3 (got Eq '=')
  --> /tmp/dojo-roman-numeral-0.almd:10:3
   |
10 |   = if n < 1 || n > 3999
   |   ^
error[E012]: duplicate function 'to_roman'
  at line 9
  in fn to_roman
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
  |
1 | fn to_roman(n: Int) -> String
  | ----------------------------------- first definition of 'to_roman' here
...
9 | fn to_roman(n: Int) -> String
  | ^^^^^^^^^^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String
  = if n < 1 || n > 3999
    then err("Input must be between 1 and 3999")
    else let
      (value, symbol) = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
      in
      list.fold(value, "", (acc, (v, s)) => if n >= v then acc + s + to_roman(n - v) else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:3 (got Eq '=')
  --> /tmp/dojo-roman-numeral-1.almd:2:3
  |
2 |   = if n < 1 || n > 3999
  |   ^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String
  = if n < 1 || n > 3999
    then err("Input must be between 1 and 3999")
    else let
      value = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
      in
      list.fold(value, "", (acc, (v, s)) => if n >= v then acc + s + to_roman(n - v) else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:3 (got Eq '=')
  --> /tmp/dojo-roman-numeral-2.almd:2:3
  |
2 |   = if n < 1 || n > 3999
  |   ^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String
  = if n < 1 || n > 3999
    then err("Input must be between 1 and 3999")
    else let
      value = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
      in
      list.fold(value, "", (acc, (v, s)) => if n >= v then acc + s + to_roman(n - v) else acc)

// Helper function to handle cases when n is less than a value
fn to_roman_helper(n: Int, value: Int, symbol: String) -> String
  = if n >= value
    then symbol + to_roman_helper(n - value, value, symbol)
    else ""

fn to_roman(n: Int) -> String
  = if n < 1 || n > 3999
    then err("Input must be between
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:3 (got Eq '=')
  --> /tmp/dojo-roman-numeral-3.almd:2:3
  |
2 |   = if n < 1 || n > 3999
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:3 (got Eq '=')
  --> /tmp/dojo-roman-numeral-3.almd:11:3
   |
11 |   = if n >= value
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 16:3 (got Eq '=')
  --> /tmp/dojo-roman-numeral-3.almd:16:3
   |
16 |   = if n < 1 || n > 3999
   |   ^
error[E012]: duplicate function 'to_roman'
  at line 15
  in fn to_roman
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn to_roman(n: Int) -> String
   | ----------------------------------- first definition of 'to_roman' here
...
15 | fn to_roman(n: Int) -> String
   | ^^^^^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
