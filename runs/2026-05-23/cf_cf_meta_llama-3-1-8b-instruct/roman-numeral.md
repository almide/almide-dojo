# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

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
  let result = string.new();
  for (value, symbol) in symbols {
    while n >= value {
      result = result + symbol;
      n = n - value;
    }
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
  let result = string.new();
  for (value, symbol) in symbols {
    while n >= value {
      result = result + symbol;
      n = n - value;
    }
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-roman-numeral-1.almd:17:26
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
   |
17 |   let result = string.new();
   |                          ^
error[E009]: cannot reassign immutable binding 'result'
  --> /tmp/dojo-roman-numeral-1.almd:20:25
  in result = ...
  hint: Use 'var result = ...' instead of 'let result = ...' to declare a mutable variable
  try:
      // let result = ...  →  var result = ...
      var result = <initial value>
   |
17 |   let result = string.new();
   |   ---------------------- 'result' declared here
...
20 |       result = result + symbol;
   |                         ^^^^^^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-roman-numeral-1.almd:21:15
  in n = ...
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
   |
21 |       n = n - value;
   |               ^^^^^

3 error(s) found
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
  var result = string.new();
  var n_ = n;
  for (value, symbol) in symbols {
    while n_ >= value {
      result = result + symbol;
      n_ = n_ - value;
    }
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-roman-numeral-2.almd:17:26
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
   |
17 |   var result = string.new();
   |                          ^

1 error(s) found
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
  var result = string.new();
  var n_ = n;
  for (value, symbol) in symbols {
    while n_ >= value {
      result = result + symbol;
      n_ = n_ - value;
    }
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-roman-numeral-3.almd:17:26
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
   |
17 |   var result = string.new();
   |                          ^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
