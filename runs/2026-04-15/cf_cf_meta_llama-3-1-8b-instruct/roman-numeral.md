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
  let result = match symbols.find(|&(v, _)| v >= n) {
    Some((v, s)) => {
      let (x, y) = (n / v, n % v);
      String::from_str_repeat(s, x) + to_roman(y)
    }
    None => ""
  };
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Missing '=' before function body at line 1:31
  --> /tmp/dojo-roman-numeral-0.almd:1:31
  hint: Almide requires '=' before the body. Write: fn to_roman(...) -> Type = { ... }

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
  let result = match symbols.find(|&(v, _)| v >= n) {
    Some((v, s)) => {
      let (x, y) = (n / v, n % v);
      String::from_str_repeat(s, x) + to_roman(y)
    }
    None => ""
  };
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected expression at line 17:35 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-1.almd:17:35
error: Expected '}' to close block opened at line 1:33
  --> /tmp/dojo-roman-numeral-1.almd:17:36
  hint: Add '}' or check for a missing delimiter inside the block

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
  let result = match symbols.find(|&(v, _)| v >= n) {
    Some((v, s)) => {
      let (x, y) = (n / v, n % v);
      String::from_str_repeat(s, x) + to_roman(y)
    }
    None => ""
  };
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 17:35 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-2.almd:17:35
error: Expected '}' to close block opened at line 1:33
  --> /tmp/dojo-roman-numeral-2.almd:17:36
  hint: Add '}' or check for a missing delimiter inside the block

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
  let result = match symbols.find(|&(v, _)| v >= n) {
    Some((v, s)) => {
      let (x, y) = (n / v, n % v);
      String::from_str_repeat(s, x) + to_roman(y)
    }
    None => ""
  };
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 17:35 (got Pipe '|')
  --> /tmp/dojo-roman-numeral-3.almd:17:35
error: Expected '}' to close block opened at line 1:33
  --> /tmp/dojo-roman-numeral-3.almd:17:36
  hint: Add '}' or check for a missing delimiter inside the block

```
