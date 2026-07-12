# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
  let shift = shift % 26;
  string.from_codepoint(list.map(string.chars(text), fn(c) {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      ((codepoint - 97 + shift) % 26) + 97
    } else {
      codepoint
    }
  }))
}

fn decrypt(text: String, shift: Int) -> String {
  let shift = 26 - (shift % 26);
  string.from_codepoint(list.map(string.chars(text), fn(c) {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      ((codepoint - 97 - shift) % 26) + 97
    } else {
      codepoint
    }
  }))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: Missing '=' before function body at line 1:48
  --> /tmp/dojo-caesar-cipher-0.almd:1:48
  hint: Almide requires '=' before the body. Write: fn encrypt(...) -> Type = { ... }
  |
1 | fn encrypt(text: String, shift: Int) -> String {
  |                                                ^
error: Expected function name at line 3:56 (got LParen '(')
  --> /tmp/dojo-caesar-cipher-0.almd:3:56
  |
3 |   string.from_codepoint(list.map(string.chars(text), fn(c) {
  |                                                        ^
error: Missing '=' before function body at line 13:48
  --> /tmp/dojo-caesar-cipher-0.almd:13:48
  hint: Almide requires '=' before the body. Write: fn decrypt(...) -> Type = { ... }
   |
13 | fn decrypt(text: String, shift: Int) -> String {
   |                                                ^
error: Expected function name at line 15:56 (got LParen '(')
  --> /tmp/dojo-caesar-cipher-0.almd:15:56
   |
15 |   string.from_codepoint(list.map(string.chars(text), fn(c) {
   |                                                        ^

4 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let shift = shift % 26;
  string.from_codepoint(list.map(string.chars(text), (c) {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      ((codepoint - 97 + shift) % 26) + 97
    } else {
      codepoint
    }
  }))
}

fn decrypt(text: String, shift: Int) -> String = {
  let shift = 26 - (shift % 26);
  string.from_codepoint(list.map(string.chars(text), (c) {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      ((codepoint - 97 - shift) % 26) + 97
    } else {
      codepoint
    }
  }))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Missing ',' between function arguments at line 3:58
  --> /tmp/dojo-caesar-cipher-1.almd:3:58
  hint: Add a comma after the previous element. Example: f(a, b, c)
  |
3 |   string.from_codepoint(list.map(string.chars(text), (c) {
  |                                                          ^
error: '&&' is not valid in Almide at line 5:24
  --> /tmp/dojo-caesar-cipher-1.almd:5:24
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |     if codepoint >= 97 && codepoint <= 122 {
  |                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:7:7
  |
7 |     } else {
  |       ^
error: Missing ',' between function arguments at line 15:58
  --> /tmp/dojo-caesar-cipher-1.almd:15:58
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
15 |   string.from_codepoint(list.map(string.chars(text), (c) {
   |                                                          ^
error: '&&' is not valid in Almide at line 17:24
  --> /tmp/dojo-caesar-cipher-1.almd:17:24
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
17 |     if codepoint >= 97 && codepoint <= 122 {
   |                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 19:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:19:7
   |
19 |     } else {
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:4:38
  in variable c
  hint: Check the variable name
  |
4 |     let codepoint = string.codepoint(c);
  |                                      ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:16:38
  in variable c
  hint: Check the variable name
   |
16 |     let codepoint = string.codepoint(c);
   |                                      ^
error[E001]: type mismatch in fn 'encrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-1.almd:4:38
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
4 |     let codepoint = string.codepoint(c);
  |                                      ^
error[E001]: type mismatch in fn 'decrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-1.almd:16:38
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
16 |     let codepoint = string.codepoint(c);
   |                                      ^

10 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let shift = shift % 26;
  string.from_codepoint(list.map(string.chars(text), (c) {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97) and (codepoint <= 122) {
      ((codepoint - 97 + shift) % 26) + 97
    } else {
      codepoint
    }
  }))
}

fn decrypt(text: String, shift: Int) -> String = {
  let shift = 26 - (shift % 26);
  string.from_codepoint(list.map(string.chars(text), (c) {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97) and (codepoint <= 122) {
      ((codepoint - 97 - shift) % 26) + 97
    } else {
      codepoint
    }
  }))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Missing ',' between function arguments at line 3:58
  --> /tmp/dojo-caesar-cipher-2.almd:3:58
  hint: Add a comma after the previous element. Example: f(a, b, c)
  |
3 |   string.from_codepoint(list.map(string.chars(text), (c) {
  |                                                          ^
error: Expected Then at line 5:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:5:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |     if (codepoint >= 97) and (codepoint <= 122) {
  |                                                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-2.almd:7:7
  |
7 |     } else {
  |       ^
error: Missing ',' between function arguments at line 15:58
  --> /tmp/dojo-caesar-cipher-2.almd:15:58
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
15 |   string.from_codepoint(list.map(string.chars(text), (c) {
   |                                                          ^
error: Expected Then at line 17:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:17:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
17 |     if (codepoint >= 97) and (codepoint <= 122) {
   |                                                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 19:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-2.almd:19:7
   |
19 |     } else {
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:4:38
  in variable c
  hint: Check the variable name
  |
4 |     let codepoint = string.codepoint(c);
  |                                      ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:16:38
  in variable c
  hint: Check the variable name
   |
16 |     let codepoint = string.codepoint(c);
   |                                      ^
error[E001]: type mismatch in fn 'encrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-2.almd:4:38
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
4 |     let codepoint = string.codepoint(c);
  |                                      ^
error[E001]: type mismatch in fn 'decrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-2.almd:16:38
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
16 |     let codepoint = string.codepoint(c);
   |                                      ^

10 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let shift = shift % 26;
  string.from_codepoint(list.map(string.chars(text), (c) {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97) and (codepoint <= 122) {
      ((codepoint - 97 + shift) % 26) + 97
    } else {
      codepoint
    }
  }).join(""))
}

fn decrypt(text: String, shift: Int) -> String = {
  let shift = 26 - (shift % 26);
  string.from_codepoint(list.map(string.chars(text), (c) {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97) and (codepoint <= 122) {
      ((codepoint - 97 - shift + 26) % 26) + 97
    } else {
      codepoint
    }
  }).join(""))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Missing ',' between function arguments at line 3:58
  --> /tmp/dojo-caesar-cipher-3.almd:3:58
  hint: Add a comma after the previous element. Example: f(a, b, c)
  |
3 |   string.from_codepoint(list.map(string.chars(text), (c) {
  |                                                          ^
error: Expected Then at line 5:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:5:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |     if (codepoint >= 97) and (codepoint <= 122) {
  |                                                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-3.almd:7:7
  |
7 |     } else {
  |       ^
error: Missing ',' between function arguments at line 15:58
  --> /tmp/dojo-caesar-cipher-3.almd:15:58
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
15 |   string.from_codepoint(list.map(string.chars(text), (c) {
   |                                                          ^
error: Expected Then at line 17:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:17:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
17 |     if (codepoint >= 97) and (codepoint <= 122) {
   |                                                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 19:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-3.almd:19:7
   |
19 |     } else {
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:4:38
  in variable c
  hint: Check the variable name
  |
4 |     let codepoint = string.codepoint(c);
  |                                      ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:16:38
  in variable c
  hint: Check the variable name
   |
16 |     let codepoint = string.codepoint(c);
   |                                      ^
error[E001]: type mismatch in fn 'encrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-3.almd:4:38
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
4 |     let codepoint = string.codepoint(c);
  |                                      ^
error[E001]: type mismatch in fn 'decrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-3.almd:16:38
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
16 |     let codepoint = string.codepoint(c);
   |                                      ^

10 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
