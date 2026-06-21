# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
    let shifted_chars = string.chars(text).map(|c| {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint <= 122 {
            ((codepoint - 97 + shift) % 26 + 97).to_string()
        } else {
            c
        }
    });
    string.from_codepoints(shifted_chars)
}

fn decrypt(text: String, shift: Int) -> String {
    let shifted_chars = string.chars(text).map(|c| {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint <= 122 {
            ((codepoint - 97 - shift + 26) % 26 + 97).to_string()
        } else {
            c
        }
    });
    string.from_codepoints(shifted_chars)
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
error: Missing '=' before function body at line 13:48
  --> /tmp/dojo-caesar-cipher-0.almd:13:48
  hint: Almide requires '=' before the body. Write: fn decrypt(...) -> Type = { ... }
   |
13 | fn decrypt(text: String, shift: Int) -> String {
   |                                                ^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let shifted_chars = string.chars(text).map(|c| {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint <= 122 {
            ((codepoint - 97 + shift) % 26 + 97).to_string()
        } else {
            c
        }
    });
    string.from_codepoints(shifted_chars)
}

fn decrypt(text: String, shift: Int) -> String = {
    let shifted_chars = string.chars(text).map(|c| {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint <= 122 {
            ((codepoint - 97 - shift + 26) % 26 + 97).to_string()
        } else {
            c
        }
    });
    string.from_codepoints(shifted_chars)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '|x|' closure syntax is not valid in Almide at line 2:48
  --> /tmp/dojo-caesar-cipher-1.almd:2:48
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |     let shifted_chars = string.chars(text).map(|c| {
  |                                                ^
error: '&&' is not valid in Almide at line 4:28
  --> /tmp/dojo-caesar-cipher-1.almd:4:28
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |         if codepoint >= 97 && codepoint <= 122 {
  |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 6:11 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:6:11
  |
6 |         } else {
  |           ^
error: '|x|' closure syntax is not valid in Almide at line 14:48
  --> /tmp/dojo-caesar-cipher-1.almd:14:48
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
14 |     let shifted_chars = string.chars(text).map(|c| {
   |                                                ^
error: '&&' is not valid in Almide at line 16:28
  --> /tmp/dojo-caesar-cipher-1.almd:16:28
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
16 |         if codepoint >= 97 && codepoint <= 122 {
   |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 18:11 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:18:11
   |
18 |         } else {
   |           ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:3:42
  in variable c
  hint: Check the variable name
  |
3 |         let codepoint = string.codepoint(c);
  |                                          ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:15:42
  in variable c
  hint: Check the variable name
   |
15 |         let codepoint = string.codepoint(c);
   |                                          ^
error[E001]: type mismatch in fn 'encrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-1.almd:3:42
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
3 |         let codepoint = string.codepoint(c);
  |                                          ^
error[E001]: type mismatch in fn 'decrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-1.almd:15:42
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
15 |         let codepoint = string.codepoint(c);
   |                                          ^

10 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let shifted_chars = string.chars(text).map((c) => {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 and codepoint <= 122 {
            ((codepoint - 97 + shift) % 26 + 97).to_string()
        } else {
            c
        }
    });
    string.from_codepoints(shifted_chars)
}

fn decrypt(text: String, shift: Int) -> String = {
    let shifted_chars = string.chars(text).map((c) => {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 and codepoint <= 122 {
            ((codepoint - 97 - shift + 26) % 26 + 97).to_string()
        } else {
            c
        }
    });
    string.from_codepoints(shifted_chars)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected Then at line 4:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:4:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |         if codepoint >= 97 and codepoint <= 122 {
  |                                                 ^
error: Expected ')' to close function call opened at line 2:47
  --> /tmp/dojo-caesar-cipher-2.almd:6:11
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |     let shifted_chars = string.chars(text).map((c) => {
  |                                               --------------- '(' opened here
...
6 |         } else {
  |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:9:5
  |
9 |     });
  |     ^
error: Expected Then at line 16:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:16:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
16 |         if codepoint >= 97 and codepoint <= 122 {
   |                                                 ^
error: Expected ')' to close function call opened at line 14:47
  --> /tmp/dojo-caesar-cipher-2.almd:18:11
  hint: Add ')' or check for a missing delimiter inside the function call
   |
14 |     let shifted_chars = string.chars(text).map((c) => {
   |                                               --------------- '(' opened here
...
18 |         } else {
   |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 21:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:21:5
   |
21 |     });
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:7:13
  in variable c
  hint: Check the variable name
  |
7 |             c
  |             ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:19:13
  in variable c
  hint: Check the variable name
   |
19 |             c
   |             ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let shifted_chars = string.chars(text).map((c) => {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 and codepoint <= 122 {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    });
    string.from_codepoints(shifted_chars)
}

fn decrypt(text: String, shift: Int) -> String = {
    let shifted_chars = string.chars(text).map((c) => {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 and codepoint <= 122 {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    });
    string.from_codepoints(shifted_chars)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected Then at line 4:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:4:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |         if codepoint >= 97 and codepoint <= 122 {
  |                                                 ^
error: Expected ')' to close function call opened at line 2:47
  --> /tmp/dojo-caesar-cipher-3.almd:7:11
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |     let shifted_chars = string.chars(text).map((c) => {
  |                                               --------------- '(' opened here
...
7 |         } else {
  |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:10:5
   |
10 |     });
   |     ^
error: Expected Then at line 17:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:17:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
17 |         if codepoint >= 97 and codepoint <= 122 {
   |                                                 ^
error: Expected ')' to close function call opened at line 15:47
  --> /tmp/dojo-caesar-cipher-3.almd:20:11
  hint: Add ')' or check for a missing delimiter inside the function call
   |
15 |     let shifted_chars = string.chars(text).map((c) => {
   |                                               --------------- '(' opened here
...
20 |         } else {
   |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:23:5
   |
23 |     });
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:8:13
  in variable c
  hint: Check the variable name
  |
8 |             c
  |             ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:21:13
  in variable c
  hint: Check the variable name
   |
21 |             c
   |             ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
