# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let mut acc = ""
  let mut count = 0
  let chars = string.chars(s)
  for c in chars {
    if c == chars.head {
      count += 1
    } else {
      if count > 0 {
        acc += int.to_string(count) + c
      } else {
        acc += c
      }
      count = 1
    }
  }
  acc
}

fn rle_decode(s: String) -> String = {
  let mut acc = ""
  let chars = string.chars(s)
  let mut count = ""
  for c in chars {
    if int.is_digit(c) {
      count += c
    } else {
      let count = int.parse(count)
      match count {
        ok(n) => acc += string.repeat(n.to_string(), c),
        err(_) => return ""
      }
      count = ""
    }
  }
  acc
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-0.almd
error: 'let mut' is not valid in Almide at line 2:7
  --> /tmp/dojo-run-length-encoding-0.almd:2:7
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
2 |   let mut acc = ""
  |       ^
error: 'let mut' is not valid in Almide at line 3:7
  --> /tmp/dojo-run-length-encoding-0.almd:3:7
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
3 |   let mut count = 0
  |       ^
error: Expected Then at line 6:24 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-0.almd:6:24
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |     if c == chars.head {
  |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-0.almd:7:14
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |       count += 1
  |              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:7 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-0.almd:8:7
  |
8 |     } else {
  |       ^
error: 'let mut' is not valid in Almide at line 21:7
  --> /tmp/dojo-run-length-encoding-0.almd:21:7
  hint: Use 'var' for mutable variables. Example: var x = 0
   |
21 |   let mut acc = ""
   |       ^
error: 'let mut' is not valid in Almide at line 23:7
  --> /tmp/dojo-run-length-encoding-0.almd:23:7
  hint: Use 'var' for mutable variables. Example: var x = 0
   |
23 |   let mut count = ""
   |       ^
error: Expected Then at line 25:24 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-0.almd:25:24
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
25 |     if int.is_digit(c) {
   |                        ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-0.almd:26:14
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
26 |       count += c
   |              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 27:7 (got Else 'else')
  --> /tmp/dojo-run-length-encoding-0.almd:27:7
   |
27 |     } else {
   |       ^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-0.almd:4:28
  in fn 'rle_encode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
4 |   let chars = string.chars(s)
  |                            ^
error[E001]: type mismatch in fn 'rle_decode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-0.almd:22:28
  in fn 'rle_decode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
22 |   let chars = string.chars(s)
   |                            ^

12 error(s) found
Compile error for /tmp/dojo-run-length-encoding-0.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let acc = string.join(string.map(string.chars(s), (c) => int.to_string(string.count(s, c)) + c), "")
  acc
}

fn rle_decode(s: String) -> String = {
  let chars = string.chars(s)
  let acc = string.join(string.map(chars, (c) => {
    if int.is_digit(c) {
      let count = int.parse(string.take(chars, chars.index_of(c) + 1))
      match count {
        ok(n) => string.repeat(n.to_string(), string.drop(chars, chars.index_of(c) + 1).first)
        err(_) => ""
      }
    } else {
      ""
    }
  }), "")
  acc
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-1.almd
error: Expected Then at line 9:24 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-1.almd:9:24
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |     if int.is_digit(c) {
  |                        ^
error: Expected ')' to close function call opened at line 8:35
  --> /tmp/dojo-run-length-encoding-1.almd:15:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
 8 |   let acc = string.join(string.map(chars, (c) => {
   |                                   --------------- '(' opened here
...
15 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 18:3 (got RBrace '}')
  --> /tmp/dojo-run-length-encoding-1.almd:18:3
   |
18 |   }), "")
   |   ^
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-run-length-encoding-1.almd:2:96
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
2 |   let acc = string.join(string.map(string.chars(s), (c) => int.to_string(string.count(s, c)) + c), "")
  |                                                                                                ^
error[E001]: type mismatch in fn 'rle_decode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-1.almd:7:28
  in fn 'rle_decode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
7 |   let chars = string.chars(s)
  |                            ^

5 error(s) found
Compile error for /tmp/dojo-run-length-encoding-1.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let chars = string.chars(s)
  let acc = string.join(string.map(chars, (c) => int.to_string(string.count(s, c)) + c), "")
  acc
}

fn rle_decode(s: String) -> String = {
  let chars = string.chars(s)
  let acc = string.join(string.map(chars, (c) => {
    if int.is_digit(c) {
      let count = int.parse(string.take(chars, chars.index_of(c) + 1))
      match count {
        ok(n) => string.repeat(n.to_string(), string.drop(chars, chars.index_of(c) + 1).first)
        err(_) => ""
      }
    } else {
      ""
    }
  }), "")
  acc
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-2.almd
error: Expected Then at line 10:24 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-2.almd:10:24
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
10 |     if int.is_digit(c) {
   |                        ^
error: Expected ')' to close function call opened at line 9:35
  --> /tmp/dojo-run-length-encoding-2.almd:16:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
 9 |   let acc = string.join(string.map(chars, (c) => {
   |                                   --------------- '(' opened here
...
16 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 19:3 (got RBrace '}')
  --> /tmp/dojo-run-length-encoding-2.almd:19:3
   |
19 |   }), "")
   |   ^
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-run-length-encoding-2.almd:3:86
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   let acc = string.join(string.map(chars, (c) => int.to_string(string.count(s, c)) + c), "")
  |                                                                                      ^
error[E001]: type mismatch in fn 'rle_decode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-2.almd:8:28
  in fn 'rle_decode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
8 |   let chars = string.chars(s)
  |                            ^

5 error(s) found
Compile error for /tmp/dojo-run-length-encoding-2.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let chars = string.chars(s)
  let acc = string.join(string.map(chars, (c) => int.to_string(string.count(s, c)) + c), "")
  acc
}

fn rle_decode(s: String) -> String = {
  let chars = string.chars(s)
  let acc = string.join(string.map(chars, (c) => {
    if int.is_digit(c) {
      let count = int.parse(string.take(chars, chars.index_of(c) + 1))
      match count {
        ok(n) => string.repeat(n.to_string(), string.drop(chars, chars.index_of(c) + 1).first)
        err(_) => ""
      }
    } else {
      c
    }
  }), "")
  acc
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-3.almd
error: Expected Then at line 10:24 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-3.almd:10:24
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
10 |     if int.is_digit(c) {
   |                        ^
error: Expected ')' to close function call opened at line 9:35
  --> /tmp/dojo-run-length-encoding-3.almd:16:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
 9 |   let acc = string.join(string.map(chars, (c) => {
   |                                   --------------- '(' opened here
...
16 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 19:3 (got RBrace '}')
  --> /tmp/dojo-run-length-encoding-3.almd:19:3
   |
19 |   }), "")
   |   ^
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-run-length-encoding-3.almd:3:86
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   let acc = string.join(string.map(chars, (c) => int.to_string(string.count(s, c)) + c), "")
  |                                                                                      ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-run-length-encoding-3.almd:17:7
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
   |
17 |       c
   |       ^

5 error(s) found
Compile error for /tmp/dojo-run-length-encoding-3.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-3.almd

1/1 test file(s) failed

```
