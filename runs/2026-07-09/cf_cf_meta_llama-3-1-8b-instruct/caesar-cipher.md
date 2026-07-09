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
  let chars = string.chars(text);
  let encrypted_chars = chars.map(|c| {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97) && (codepoint <= 122) {
      let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(shifted_codepoint)
    } else {
      c
    }
  });
  string.from_chars(encrypted_chars)
}

fn decrypt(text: String, shift: Int) -> String {
  let shift = 26 - shift % 26;
  let chars = string.chars(text);
  let decrypted_chars = chars.map(|c| {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97) && (codepoint <= 122) {
      let shifted_codepoint = (codepoint - 97 - shift) % 26 + 97;
      string.from_codepoint(shifted_codepoint)
    } else {
      c
    }
  });
  string.from_chars(decrypted_chars)
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
error: Missing '=' before function body at line 16:48
  --> /tmp/dojo-caesar-cipher-0.almd:16:48
  hint: Almide requires '=' before the body. Write: fn decrypt(...) -> Type = { ... }
   |
16 | fn decrypt(text: String, shift: Int) -> String {
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
  let shift = shift % 26;
  let chars = string.chars(text);
  let encrypted_chars = chars.map(|c| {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97) && (codepoint <= 122) {
      let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(shifted_codepoint)
    } else {
      c
    }
  });
  string.from_chars(encrypted_chars)
}

fn decrypt(text: String, shift: Int) -> String = {
  let shift = 26 - shift % 26;
  let chars = string.chars(text);
  let decrypted_chars = chars.map(|c| {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97) && (codepoint <= 122) {
      let shifted_codepoint = (codepoint - 97 - shift) % 26 + 97;
      string.from_codepoint(shifted_codepoint)
    } else {
      c
    }
  });
  string.from_chars(decrypted_chars)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '|x|' closure syntax is not valid in Almide at line 4:35
  --> /tmp/dojo-caesar-cipher-1.almd:4:35
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
4 |   let encrypted_chars = chars.map(|c| {
  |                                   ^
error: '&&' is not valid in Almide at line 6:26
  --> /tmp/dojo-caesar-cipher-1.almd:6:26
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
6 |     if (codepoint >= 97) && (codepoint <= 122) {
  |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:9:7
  |
9 |     } else {
  |       ^
error: '|x|' closure syntax is not valid in Almide at line 19:35
  --> /tmp/dojo-caesar-cipher-1.almd:19:35
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
19 |   let decrypted_chars = chars.map(|c| {
   |                                   ^
error: '&&' is not valid in Almide at line 21:26
  --> /tmp/dojo-caesar-cipher-1.almd:21:26
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
21 |     if (codepoint >= 97) && (codepoint <= 122) {
   |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:24:7
   |
24 |     } else {
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:5:38
  in variable c
  hint: Check the variable name
  |
5 |     let codepoint = string.codepoint(c);
  |                                      ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:7:44
  in operator -
  hint: Use numeric types (Int or Float)
  |
7 |       let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                            ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:7:49
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |       let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                 ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:7:58
  in operator %
  hint: Use numeric types (Int or Float)
  |
7 |       let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                          ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:7:63
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |       let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                               ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:8:29
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
8 |       string.from_codepoint(shifted_codepoint)
  |                             ^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:20:38
  in variable c
  hint: Check the variable name
   |
20 |     let codepoint = string.codepoint(c);
   |                                      ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:22:44
  in operator -
  hint: Use numeric types (Int or Float)
   |
22 |       let shifted_codepoint = (codepoint - 97 - shift) % 26 + 97;
   |                                            ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:22:49
  in operator -
  hint: Use numeric types (Int or Float)
   |
22 |       let shifted_codepoint = (codepoint - 97 - shift) % 26 + 97;
   |                                                 ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:22:58
  in operator %
  hint: Use numeric types (Int or Float)
   |
22 |       let shifted_codepoint = (codepoint - 97 - shift) % 26 + 97;
   |                                                          ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:22:63
  in operator +
  hint: Use + with numeric types, String, or List
   |
22 |       let shifted_codepoint = (codepoint - 97 - shift) % 26 + 97;
   |                                                               ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:23:29
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
23 |       string.from_codepoint(shifted_codepoint)
   |                             ^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:8:29
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
8 |       string.from_codepoint(shifted_codepoint)
  |                             ^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:23:29
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
23 |       string.from_codepoint(shifted_codepoint)
   |                             ^^^^^^^^^^^^^^^^^

20 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let shift = shift % 26;
  let chars = string.chars(text);
  let encrypted_chars = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97) && (codepoint <= 122) {
      let shifted_codepoint = ((codepoint - 97 + shift) % 26 + 97).unwrap_or(0);
      string.from_codepoint(shifted_codepoint)
    } else {
      c
    }
  });
  string.from_chars(encrypted_chars)
}

fn decrypt(text: String, shift: Int) -> String = {
  let shift = 26 - (shift % 26);
  let chars = string.chars(text);
  let decrypted_chars = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97) && (codepoint <= 122) {
      let shifted_codepoint = ((codepoint - 97 - shift) % 26 + 97).unwrap_or(0);
      string.from_codepoint(shifted_codepoint)
    } else {
      c
    }
  });
  string.from_chars(dec
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: '&&' is not valid in Almide at line 6:26
  --> /tmp/dojo-caesar-cipher-2.almd:6:26
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
6 |     if (codepoint >= 97) && (codepoint <= 122) {
  |                          ^
error: Expected ')' to close function call opened at line 4:34
  --> /tmp/dojo-caesar-cipher-2.almd:9:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
4 |   let encrypted_chars = chars.map((c) => {
  |                                  --------------- '(' opened here
...
9 |     } else {
  |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:12:3
   |
12 |   });
   |   ^
error: '&&' is not valid in Almide at line 21:26
  --> /tmp/dojo-caesar-cipher-2.almd:21:26
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
21 |     if (codepoint >= 97) && (codepoint <= 122) {
   |                          ^
error: Expected ')' to close function call opened at line 19:34
  --> /tmp/dojo-caesar-cipher-2.almd:24:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
19 |   let decrypted_chars = chars.map((c) => {
   |                                  --------------- '(' opened here
...
24 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 27:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:27:3
   |
27 |   });
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:10:7
  in variable c
  hint: Check the variable name
   |
10 |       c
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:25:7
  in variable c
  hint: Check the variable name
   |
25 |       c
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
  let shift = shift % 26;
  let chars = string.chars(text);
  let encrypted_chars = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97) and (codepoint <= 122) {
      let shifted_codepoint = ((codepoint - 97 + shift) % 26 + 97).unwrap_or(0);
      string.from_codepoint(shifted_codepoint)
    } else {
      c
    }
  });
  string.from_chars(encrypted_chars)
}

fn decrypt(text: String, shift: Int) -> String = {
  let shift = 26 - (shift % 26);
  let chars = string.chars(text);
  let decrypted_chars = chars.map((char) => {
    let codepoint = string.codepoint(char);
    if (codepoint >= 97) and (codepoint <= 122) {
      let shifted_codepoint = ((codepoint - 97 - shift) % 26 + 97).unwrap_or(0);
      string.from_codepoint(shifted_codepoint)
    } else {
      char
    }
  });
  string.from_chars(dec
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected Then at line 6:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:6:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |     if (codepoint >= 97) and (codepoint <= 122) {
  |                                                 ^
error: Expected ')' to close function call opened at line 4:34
  --> /tmp/dojo-caesar-cipher-3.almd:9:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
4 |   let encrypted_chars = chars.map((c) => {
  |                                  --------------- '(' opened here
...
9 |     } else {
  |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:12:3
   |
12 |   });
   |   ^
error: Expected Then at line 21:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:21:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
21 |     if (codepoint >= 97) and (codepoint <= 122) {
   |                                                 ^
error: Expected ')' to close function call opened at line 19:34
  --> /tmp/dojo-caesar-cipher-3.almd:24:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
19 |   let decrypted_chars = chars.map((char) => {
   |                                  --------------- '(' opened here
...
24 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 27:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:27:3
   |
27 |   });
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:10:7
  in variable c
  hint: Check the variable name
   |
10 |       c
   |       ^
error[E003]: undefined variable 'char'
  --> /tmp/dojo-caesar-cipher-3.almd:25:7
  in variable char
  hint: Did you mean `chars`?
  try:
      // char  →  chars
      chars
   |
25 |       char
   |       ^^^^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
