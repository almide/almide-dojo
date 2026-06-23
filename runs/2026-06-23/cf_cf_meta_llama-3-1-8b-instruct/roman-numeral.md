# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  match n with
  | 1 => "I"
  | 4 => "IV"
  | 5 => "V"
  | 9 => "IX"
  | 10 => "X"
  | 40 => "XL"
  | 50 => "L"
  | 90 => "XC"
  | 100 => "C"
  | 400 => "CD"
  | 500 => "D"
  | 900 => "CM"
  | 1000 => "M"
  | _ when n >= 1000 => 
    let (thousands, rest) = (n / 1000, n % 1000)
    "M" + to_roman(thousands) + to_roman(rest)
  | _ when n >= 100 => 
    let (hundreds, rest) = (n / 100, n % 100)
    "C" + to_roman(hundreds) + to_roman(rest)
  | _ when n >= 10 => 
    let (tens, rest) = (n / 10, n % 10)
    "X" + to_
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Expected LBrace at line 2:11 (got Ident 'with')
  --> /tmp/dojo-roman-numeral-0.almd:2:11
  |
2 |   match n with
  |           ^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  match n with
  | 1 => "I"
  | 4 => "IV"
  | 5 => "V"
  | 9 => "IX"
  | 10 => "X"
  | 40 => "XL"
  | 50 => "L"
  | 90 => "XC"
  | 100 => "C"
  | 400 => "CD"
  | 500 => "D"
  | 900 => "CM"
  | 1000 => "M"
  | _ when n >= 1000 => 
    let (thousands, rest) = (n / 1000, n % 1000)
    "M" + to_roman(thousands) + to_roman(rest)
  | _ when n >= 100 => 
    let (hundreds, rest) = (n / 100, n % 100)
    "C" + to_roman(hundreds) + to_roman(rest)
  | _ when n >= 10 => 
    let (tens, rest) = (n / 10, n % 10)
    to_roman(tens)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected LBrace at line 2:11 (got Ident 'with')
  --> /tmp/dojo-roman-numeral-1.almd:2:11
  |
2 |   match n with
  |           ^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  match n with
  | 1 => "I"
  | 4 => "IV"
  | 5 => "V"
  | 9 => "IX"
  | 10 => "X"
  | 40 => "XL"
  | 50 => "L"
  | 90 => "XC"
  | 100 => "C"
  | 400 => "CD"
  | 500 => "D"
  | 900 => "CM"
  | 1000 => "M"
  | _ when n >= 1000 => 
    let (thousands, rest) = (n / 1000, n % 1000)
    "M" + to_roman(thousands) + to_roman(rest)
  | _ when n >= 100 => 
    let (hundreds, rest) = (n / 100, n % 100)
    "C" + to_roman(hundreds) + to_roman(rest)
  | _ when n >= 50 => 
    let (fifties, rest) = (n / 50, n % 50)
    "L" + to
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected LBrace at line 2:11 (got Ident 'with')
  --> /tmp/dojo-roman-numeral-2.almd:2:11
  |
2 |   match n with
  |           ^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  match n with
  | 1 => "I"
  | 4 => "IV"
  | 5 => "V"
  | 9 => "IX"
  | 10 => "X"
  | 40 => "XL"
  | 50 => "L"
  | 90 => "XC"
  | 100 => "C"
  | 400 => "CD"
  | 500 => "D"
  | 900 => "CM"
  | 1000 => "M"
  | _ when n >= 1000 => 
    let (thousands, rest) = (n / 1000, n % 1000)
    "M" + to_roman(thousands) + to_roman(rest)
  | _ when n >= 100 => 
    let (hundreds, rest) = (n / 100, n % 100)
    "C" + to_roman(hundreds) + to_roman(rest)
  | _ when n >= 50 => 
    let (fifties, rest) = (n / 50, n % 50)
    "L" + to
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected LBrace at line 2:11 (got Ident 'with')
  --> /tmp/dojo-roman-numeral-3.almd:2:11
  |
2 |   match n with
  |           ^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
