# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

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
  let result = List::new();
  for (value, symbol) in symbols {
    while n >= value {
      result = result + [symbol];
      n = n - value;
    }
  }
  result.join("")
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
  let result = List::new();
  for (value, symbol) in symbols {
    while n >= value {
      result = result + [symbol];
      n = n - value;
    }
  }
  result.join("")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: '::' is not valid in Almide at line 17:20
  --> /tmp/dojo-roman-numeral-1.almd:17:20
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
   |
17 |   let result = List::new();
   |                    ^
error: operator '+' requires numeric, String, or List types but got List and List[String]
  --> /tmp/dojo-roman-numeral-1.almd:20:26
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |       result = result + [symbol];
   |                          ^^^^^^
error[E009]: cannot reassign immutable binding 'result'
  --> /tmp/dojo-roman-numeral-1.almd:20:26
  in result = ...
  hint: Use 'var result = ...' instead of 'let result = ...' to declare a mutable variable
  try:
      // let result = ...  →  var result = ...
      var result = <initial value>
   |
17 |   let result = List::new();
   |   ---------------------- 'result' declared here
...
20 |       result = result + [symbol];
   |                          ^^^^^^
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
error[E002]: undefined function 'result.join'
  --> /tmp/dojo-roman-numeral-1.almd:24:15
  in call to result.join()
  hint: No function 'join' in module 'result'. See docs/CHEATSHEET.md for available functions
   |
24 |   result.join("")
   |               ^^

5 error(s) found
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
  var result = List::new();
  for (value, symbol) in symbols {
    while n >= value {
      result = result + [symbol];
      var n_ = n - value;
      n = n_;
    }
  }
  result.join("")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: '::' is not valid in Almide at line 17:20
  --> /tmp/dojo-roman-numeral-2.almd:17:20
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
   |
17 |   var result = List::new();
   |                    ^
error: operator '+' requires numeric, String, or List types but got List and List[String]
  --> /tmp/dojo-roman-numeral-2.almd:20:26
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |       result = result + [symbol];
   |                          ^^^^^^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-roman-numeral-2.almd:22:11
  in n = ...
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
   |
22 |       n = n_;
   |           ^^
error[E002]: undefined function 'result.join'
  --> /tmp/dojo-roman-numeral-2.almd:25:15
  in call to result.join()
  hint: No function 'join' in module 'result'. See docs/CHEATSHEET.md for available functions
   |
25 |   result.join("")
   |               ^^

4 error(s) found
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
  var result = List::new();
  for (value, symbol) in symbols {
    var n_ = n;
    while n_ >= value {
      result = result + [symbol];
      n_ = n_ - value;
    }
  }
  list.join(result, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: '::' is not valid in Almide at line 17:20
  --> /tmp/dojo-roman-numeral-3.almd:17:20
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
   |
17 |   var result = List::new();
   |                    ^
error: operator '+' requires numeric, String, or List types but got List and List[String]
  --> /tmp/dojo-roman-numeral-3.almd:21:26
  in operator +
  hint: Use + with numeric types, String, or List
   |
21 |       result = result + [symbol];
   |                          ^^^^^^
error[E005]: argument 'xs' expects List[String] but got List
  --> /tmp/dojo-roman-numeral-3.almd:25:21
  in call to list.join()
  hint: Fix the argument type
   |
25 |   list.join(result, "")
   |                     ^^
error[E001]: type mismatch in call to list.join(): expected List[String] but got List
  --> /tmp/dojo-roman-numeral-3.almd:25:21
  in call to list.join()
  hint: Fix the expression type or change the expected type
   |
25 |   list.join(result, "")
   |                     ^^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
