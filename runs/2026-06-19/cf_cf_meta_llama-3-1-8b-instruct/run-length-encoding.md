# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String {
  let mut result = "";
  let mut count = 0;
  let mut last_char = "";
  for c in string.chars(s) {
    if c == last_char {
      count += 1;
    } else {
      if count > 0 {
        result += int.to_string(count) + last_char;
      }
      count = 1;
      last_char = c;
    }
  }
  if count > 0 {
    result += int.to_string(count) + last_char;
  }
  result
}

fn rle_decode(s: String) -> String {
  let mut result = "";
  let mut count = 0;
  let mut last_char = "";
  for c in string.chars(s) {
    if int.is_digit(c) {
      count = int.parse(c.to_string()) + count * 10;
    } else {
      result += string.repeat(last_char, count);
      count = 0;
      last_char = c;
    }
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-0.almd
error: Missing '=' before function body at line 1:36
  --> /tmp/dojo-run-length-encoding-0.almd:1:36
  hint: Almide requires '=' before the body. Write: fn rle_encode(...) -> Type = { ... }
  |
1 | fn rle_encode(s: String) -> String {
  |                                    ^
error: Missing '=' before function body at line 22:36
  --> /tmp/dojo-run-length-encoding-0.almd:22:36
  hint: Almide requires '=' before the body. Write: fn rle_decode(...) -> Type = { ... }
   |
22 | fn rle_decode(s: String) -> String {
   |                                    ^

2 error(s) found
Compile error for /tmp/dojo-run-length-encoding-0.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let mut result = "";
  let mut count = 0;
  let mut last_char = "";
  for c in string.chars(s) {
    if c == last_char {
      count += 1;
    } else {
      if count > 0 {
        result += int.to_string(count) + last_char;
      }
      count = 1;
      last_char = c;
    }
  }
  if count > 0 {
    result += int.to_string(count) + last_char;
  }
  result
}

fn rle_decode(s: String) -> String = {
  let mut result = "";
  let mut count = 0;
  let mut last_char = "";
  for c in string.chars(s) {
    if int.is_digit(c) {
      count = int.parse(c.to_string()).unwrap_or(0) + count * 10;
    } else {
      result += string.repeat(last_char, count);
      count = 0;
      last_char = c;
    }
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-1.almd
error: 'let mut' is not valid in Almide at line 2:7
  --> /tmp/dojo-run-length-encoding-1.almd:2:7
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
2 |   let mut result = "";
  |       ^
error: 'let mut' is not valid in Almide at line 3:7
  --> /tmp/dojo-run-length-encoding-1.almd:3:7
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
3 |   let mut count = 0;
  |       ^
error: 'let mut' is not valid in Almide at line 4:7
  --> /tmp/dojo-run-length-encoding-1.almd:4:7
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
4 |   let mut last_char = "";
  |       ^
error: Expected Then at line 6:23 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-1.almd:6:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |     if c == last_char {
  |                       ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-1.almd:7:14
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |       count += 1;
  |              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:7 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-1.almd:8:7
  |
8 |     } else {
  |       ^
error: 'let mut' is not valid in Almide at line 23:7
  --> /tmp/dojo-run-length-encoding-1.almd:23:7
  hint: Use 'var' for mutable variables. Example: var x = 0
   |
23 |   let mut result = "";
   |       ^
error: 'let mut' is not valid in Almide at line 24:7
  --> /tmp/dojo-run-length-encoding-1.almd:24:7
  hint: Use 'var' for mutable variables. Example: var x = 0
   |
24 |   let mut count = 0;
   |       ^
error: 'let mut' is not valid in Almide at line 25:7
  --> /tmp/dojo-run-length-encoding-1.almd:25:7
  hint: Use 'var' for mutable variables. Example: var x = 0
   |
25 |   let mut last_char = "";
   |       ^
error: Expected Then at line 27:24 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-1.almd:27:24
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
27 |     if int.is_digit(c) {
   |                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 29:7 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-1.almd:29:7
   |
29 |     } else {
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-run-length-encoding-1.almd:28:25
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
   |
28 |       count = int.parse(c.to_string()).unwrap_or(0) + count * 10;
   |                         ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-run-length-encoding-1.almd:28:55
  in variable count
  hint: Check the variable name
   |
28 |       count = int.parse(c.to_string()).unwrap_or(0) + count * 10;
   |                                                       ^^^^^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-1.almd:1:38
  in fn 'rle_encode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
1 | fn rle_encode(s: String) -> String = {
  |                                      ^
error[E001]: type mismatch in fn 'rle_decode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-1.almd:28:63
  in fn 'rle_decode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
28 |       count = int.parse(c.to_string()).unwrap_or(0) + count * 10;
   |                                                               ^^

15 error(s) found
Compile error for /tmp/dojo-run-length-encoding-1.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  var result = "";
  var count = 0;
  var last_char = "";
  for c in string.chars(s) {
    if c == last_char {
      count += 1;
    } else {
      if count > 0 {
        result += int.to_string(count) + last_char;
      }
      count = 1;
      last_char = c;
    }
  }
  if count > 0 {
    result += int.to_string(count) + last_char;
  }
  result
}

fn rle_decode(s: String) -> String = {
  var result = "";
  var count = 0;
  var last_char = "";
  for c in string.chars(s) {
    if int.is_digit(c) {
      count = int.parse(c.to_string()).unwrap_or(0) * 10 + count;
    } else {
      result += string.repeat(last_char, count);
      count = 0;
      last_char = c;
    }
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-2.almd
error: Expected Then at line 6:23 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-2.almd:6:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |     if c == last_char {
  |                       ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-2.almd:7:14
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |       count += 1;
  |              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:7 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-2.almd:8:7
  |
8 |     } else {
  |       ^
error: Expected Then at line 27:24 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-2.almd:27:24
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
27 |     if int.is_digit(c) {
   |                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 29:7 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-2.almd:29:7
   |
29 |     } else {
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-run-length-encoding-2.almd:28:25
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
   |
28 |       count = int.parse(c.to_string()).unwrap_or(0) * 10 + count;
   |                         ^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-2.almd:4:19
  in fn 'rle_encode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
4 |   var last_char = "";
  |                   ^^
error[E001]: type mismatch in fn 'rle_decode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-2.almd:28:60
  in fn 'rle_decode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
28 |       count = int.parse(c.to_string()).unwrap_or(0) * 10 + count;
   |                                                            ^^^^^

8 error(s) found
Compile error for /tmp/dojo-run-length-encoding-2.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let result = string.join(string.map(string.chars(s), (c) => if c == "" then "" else int.to_string(1) + c), "");
  result
}

fn rle_decode(s: String) -> String = {
  let result = string.join(string.map(string.chars(s), (c) => if int.is_digit(c) then int.parse(c.to_string()).unwrap_or(0) else string.repeat("", int.parse(c.to_string()).unwrap_or(0))), "");
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-3.almd
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-run-length-encoding-3.almd:2:106
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
2 |   let result = string.join(string.map(string.chars(s), (c) => if c == "" then "" else int.to_string(1) + c), "");
  |                                                                                                          ^
error[E002]: undefined function 'int.is_digit'
  --> /tmp/dojo-run-length-encoding-3.almd:7:79
  in call to int.is_digit()
  hint: No function 'is_digit' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
7 |   let result = string.join(string.map(string.chars(s), (c) => if int.is_digit(c) then int.parse(c.to_string()).unwrap_or(0) else string.repeat("", int.parse(c.to_string()).unwrap_or(0))), "");
  |                                                                               ^
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-run-length-encoding-3.almd:7:158
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
7 |   let result = string.join(string.map(string.chars(s), (c) => if int.is_digit(c) then int.parse(c.to_string()).unwrap_or(0) else string.repeat("", int.parse(c.to_string()).unwrap_or(0))), "");
  |                                                                                                                                                              ^
error[E001]: type mismatch in if branches: expected Int but got String
  --> /tmp/dojo-run-length-encoding-3.almd:7:158
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or use `int.parse(s)` to convert String to Int (returns Result[Int, String])
  |
7 |   let result = string.join(string.map(string.chars(s), (c) => if int.is_digit(c) then int.parse(c.to_string()).unwrap_or(0) else string.repeat("", int.parse(c.to_string()).unwrap_or(0))), "");
  |                                                                                                                                                              ^

4 error(s) found
Compile error for /tmp/dojo-run-length-encoding-3.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-3.almd

1/1 test file(s) failed

```
