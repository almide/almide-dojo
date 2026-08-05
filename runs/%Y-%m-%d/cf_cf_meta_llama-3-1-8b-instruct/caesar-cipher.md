# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
  let chars = string.chars(text);
  let result = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      let new_codepoint = ((codepoint - 97 + shift) % 26) + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  }).join("");
  result
}

fn decrypt(text: String, shift: Int) -> String {
  let chars = string.chars(text);
  let result = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      let new_codepoint = ((codepoint - 97 - shift + 26) % 26) + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  }).join("");
  result
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
error: Missing '=' before function body at line 15:48
  --> /tmp/dojo-caesar-cipher-0.almd:15:48
  hint: Almide requires '=' before the body. Write: fn decrypt(...) -> Type = { ... }
   |
15 | fn decrypt(text: String, shift: Int) -> String {
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
  let chars = string.chars(text);
  let result = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      let new_codepoint = ((codepoint - 97 + shift) % 26) + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  }).join("");
  result
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let result = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      let new_codepoint = ((codepoint - 97 - shift + 26) % 26) + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  }).join("");
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '&&' is not valid in Almide at line 5:24
  --> /tmp/dojo-caesar-cipher-1.almd:5:24
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |     if codepoint >= 97 && codepoint <= 122 {
  |                        ^
error: Expected ')' to close function call opened at line 3:25
  --> /tmp/dojo-caesar-cipher-1.almd:8:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   let result = chars.map((c) => {
  |                         --------------- '(' opened here
...
8 |     } else {
  |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:11:3
   |
11 |   }).join("");
   |   ^
error: '&&' is not valid in Almide at line 19:24
  --> /tmp/dojo-caesar-cipher-1.almd:19:24
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
19 |     if codepoint >= 97 && codepoint <= 122 {
   |                        ^
error: Expected ')' to close function call opened at line 17:25
  --> /tmp/dojo-caesar-cipher-1.almd:22:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |   let result = chars.map((c) => {
   |                         --------------- '(' opened here
...
22 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 25:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:25:3
   |
25 |   }).join("");
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:9:7
  in variable c
  hint: Check the variable name
  |
9 |       c
  |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:23:7
  in variable c
  hint: Check the variable name
   |
23 |       c
   |       ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let result = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97) and (codepoint <= 122) {
      let new_codepoint = ((codepoint - 97 + shift) % 26) + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  }).join("");
  result
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let result = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97) and (codepoint <= 122) {
      let new_codepoint = ((codepoint - 97 - shift + 26) % 26) + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  }).join("");
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected Then at line 5:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:5:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |     if (codepoint >= 97) and (codepoint <= 122) {
  |                                                 ^
error: Expected ')' to close function call opened at line 3:25
  --> /tmp/dojo-caesar-cipher-2.almd:8:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   let result = chars.map((c) => {
  |                         --------------- '(' opened here
...
8 |     } else {
  |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:11:3
   |
11 |   }).join("");
   |   ^
error: Expected Then at line 19:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:19:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
19 |     if (codepoint >= 97) and (codepoint <= 122) {
   |                                                 ^
error: Expected ')' to close function call opened at line 17:25
  --> /tmp/dojo-caesar-cipher-2.almd:22:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |   let result = chars.map((c) => {
   |                         --------------- '(' opened here
...
22 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 25:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:25:3
   |
25 |   }).join("");
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:9:7
  in variable c
  hint: Check the variable name
  |
9 |       c
  |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:23:7
  in variable c
  hint: Check the variable name
   |
23 |       c
   |       ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let result = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97) and (codepoint <= 122) {
      let new_codepoint = ((codepoint - 97 + shift) % 26) + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  }).join("");
  result
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let result = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97) and (codepoint <= 122) {
      let new_codepoint = ((codepoint - 97 - shift + 26) % 26) + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  }).join("");
  result
}

// Corrected version:

fn encrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let result = chars.map
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected Then at line 5:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:5:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |     if (codepoint >= 97) and (codepoint <= 122) {
  |                                                 ^
error: Expected ')' to close function call opened at line 3:25
  --> /tmp/dojo-caesar-cipher-3.almd:8:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   let result = chars.map((c) => {
  |                         --------------- '(' opened here
...
8 |     } else {
  |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:11:3
   |
11 |   }).join("");
   |   ^
error: Expected Then at line 19:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:19:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
19 |     if (codepoint >= 97) and (codepoint <= 122) {
   |                                                 ^
error: Expected ')' to close function call opened at line 17:25
  --> /tmp/dojo-caesar-cipher-3.almd:22:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |   let result = chars.map((c) => {
   |                         --------------- '(' opened here
...
22 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 25:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:25:3
   |
25 |   }).join("");
   |   ^
error: Expected expression at line 35:1 (got Test 'test')
  --> /tmp/dojo-caesar-cipher-3.almd:35:1
   |
35 | test "encrypt abc by 1" { assert_eq(encrypt("abc", 1), "bcd") }
   | ^
error[E012]: duplicate function 'encrypt'
  at line 31
  in fn encrypt
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn encrypt(text: String, shift: Int) -> String = {
   | ---------------------------------- first definition of 'encrypt' here
...
31 | fn encrypt(text: String, shift: Int) -> String = {
   | ^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:9:7
  in variable c
  hint: Check the variable name
  |
9 |       c
  |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:23:7
  in variable c
  hint: Check the variable name
   |
23 |       c
   |       ^
error[E013]: no field 'map' on list
  --> /tmp/dojo-caesar-cipher-3.almd:33:16
  in field access .map
  hint: Almide values have no fields. Use `list.<fn>(x)` (or `x |> list.<fn>`) — see docs/stdlib/list.md for available functions.
   |
33 |   let result = chars.map
   |                ^^^^^
error[E001]: type mismatch in fn 'encrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-3.almd:33:16
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
33 |   let result = chars.map
   |                ^^^^^

12 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
