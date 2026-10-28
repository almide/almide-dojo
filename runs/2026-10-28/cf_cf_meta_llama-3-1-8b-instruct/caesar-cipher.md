# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
  let chars = string.chars(text);
  let encrypted = chars.map(|c| {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      let shifted = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(shifted)
    } else {
      c
    }
  });
  string.join(encrypted, "")
}

fn decrypt(text: String, shift: Int) -> String {
  let chars = string.chars(text);
  let decrypted = chars.map(|c| {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
      string.from_codepoint(shifted)
    } else {
      c
    }
  });
  string.join(decrypted, "")
}
```

**Diagnostic:**

```
error: Missing '=' before function body at line 1:48
  --> /tmp/dojo-caesar-cipher-0.almd:1:48
  here: fn encrypt(text: String, shift: Int) -> String {
  hint: Almide requires '=' before the body. Write: fn encrypt(...) -> Type = { ... }
  |
1 | fn encrypt(text: String, shift: Int) -> String {
  |                                                ^
error: Missing '=' before function body at line 15:48
  --> /tmp/dojo-caesar-cipher-0.almd:15:48
  here: fn decrypt(text: String, shift: Int) -> String {
  hint: Almide requires '=' before the body. Write: fn decrypt(...) -> Type = { ... }
   |
15 | fn decrypt(text: String, shift: Int) -> String {
   |                                                ^

2 error(s) found
FAILED: /tmp/dojo-caesar-cipher-0.almd
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let encrypted = chars.map(|c| {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      let shifted = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(shifted)
    } else {
      c
    }
  });
  string.join(encrypted, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let decrypted = chars.map(|c| {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
      string.from_codepoint(shifted)
    } else {
      c
    }
  });
  string.join(decrypted, "")
}
```

**Diagnostic:**

```
error: '|x|' closure syntax is not valid in Almide at line 3:29
  --> /tmp/dojo-caesar-cipher-1.almd:3:29
  here: let encrypted = chars.map(|c| {
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
3 |   let encrypted = chars.map(|c| {
  |                             ^
error: '&&' is not valid in Almide at line 5:24
  --> /tmp/dojo-caesar-cipher-1.almd:5:24
  here: if codepoint >= 97 && codepoint <= 122 {
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |     if codepoint >= 97 && codepoint <= 122 {
  |                        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:8:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |     } else {
  |       ^
error: '|x|' closure syntax is not valid in Almide at line 17:29
  --> /tmp/dojo-caesar-cipher-1.almd:17:29
  here: let decrypted = chars.map(|c| {
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
17 |   let decrypted = chars.map(|c| {
   |                             ^
error: '&&' is not valid in Almide at line 19:24
  --> /tmp/dojo-caesar-cipher-1.almd:19:24
  here: if codepoint >= 97 && codepoint <= 122 {
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
19 |     if codepoint >= 97 && codepoint <= 122 {
   |                        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 22:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:22:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |     } else {
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:4:38
  in variable c
  here: let codepoint = string.codepoint(c);
  hint: Check the variable name
  |
4 |     let codepoint = string.codepoint(c);
  |                                      ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:34
  in operator -
  here: let shifted = (codepoint - 97 + shift) % 26 + 97;
  hint: Use numeric types (Int or Float)
  |
6 |       let shifted = (codepoint - 97 + shift) % 26 + 97;
  |                                  ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:39
  in operator +
  here: let shifted = (codepoint - 97 + shift) % 26 + 97;
  hint: Use + with numeric types, String, or List
  |
6 |       let shifted = (codepoint - 97 + shift) % 26 + 97;
  |                                       ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:48
  in operator %
  here: let shifted = (codepoint - 97 + shift) % 26 + 97;
  hint: Use numeric types (Int or Float)
  |
6 |       let shifted = (codepoint - 97 + shift) % 26 + 97;
  |                                                ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:53
  in operator +
  here: let shifted = (codepoint - 97 + shift) % 26 + 97;
  hint: Use + with numeric types, String, or List
  |
6 |       let shifted = (codepoint - 97 + shift) % 26 + 97;
  |                                                     ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:7:29
  in call to string.from_codepoint()
  here: string.from_codepoint(shifted)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
7 |       string.from_codepoint(shifted)
  |                             ^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:18:38
  in variable c
  here: let codepoint = string.codepoint(c);
  hint: Check the variable name
   |
18 |     let codepoint = string.codepoint(c);
   |                                      ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:34
  in operator -
  here: let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
  hint: Use numeric types (Int or Float)
   |
20 |       let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                  ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:39
  in operator -
  here: let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
  hint: Use numeric types (Int or Float)
   |
20 |       let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                       ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:47
  in operator +
  here: let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
  hint: Use + with numeric types, String, or List
   |
20 |       let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                               ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:53
  in operator %
  here: let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
  hint: Use numeric types (Int or Float)
   |
20 |       let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                     ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:58
  in operator +
  here: let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
  hint: Use + with numeric types, String, or List
   |
20 |       let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                          ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:21:29
  in call to string.from_codepoint()
  here: string.from_codepoint(shifted)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
21 |       string.from_codepoint(shifted)
   |                             ^^^^^^^

19 error(s) found
FAILED: /tmp/dojo-caesar-cipher-1.almd
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let encrypted = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      let shifted = ((codepoint - 97 + shift) % 26 + 97) ?? 0;
      string.from_codepoint(shifted)
    } else {
      c
    }
  });
  string.join(encrypted, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let decrypted = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      let shifted = ((codepoint - 97 - shift + 26) % 26 + 97) ?? 0;
      string.from_codepoint(shifted)
    } else {
      c
    }
  });
  string.join(decrypted, "")
}
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 5:24
  --> /tmp/dojo-caesar-cipher-2.almd:5:24
  here: if codepoint >= 97 && codepoint <= 122 {
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |     if codepoint >= 97 && codepoint <= 122 {
  |                        ^
error: Expected ')' to close function call opened at line 3:28
  --> /tmp/dojo-caesar-cipher-2.almd:8:7
  here: } else {
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   let encrypted = chars.map((c) => {
  |                            --------------- '(' opened here
...
8 |     } else {
  |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 11:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:11:3
  here: });
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |   });
   |   ^
error: '&&' is not valid in Almide at line 19:24
  --> /tmp/dojo-caesar-cipher-2.almd:19:24
  here: if codepoint >= 97 && codepoint <= 122 {
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
19 |     if codepoint >= 97 && codepoint <= 122 {
   |                        ^
error: Expected ')' to close function call opened at line 17:28
  --> /tmp/dojo-caesar-cipher-2.almd:22:7
  here: } else {
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |   let decrypted = chars.map((c) => {
   |                            --------------- '(' opened here
...
22 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 25:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:25:3
  here: });
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
25 |   });
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:9:7
  in variable c
  here: c
  hint: Check the variable name
  |
9 |       c
  |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:23:7
  in variable c
  here: c
  hint: Check the variable name
   |
23 |       c
   |       ^

8 error(s) found
FAILED: /tmp/dojo-caesar-cipher-2.almd
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let encrypted = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 and codepoint <= 122 {
      let shifted = ((codepoint - 97 + shift) % 26 + 97) ?? 0;
      string.from_codepoint(shifted)
    } else {
      c
    }
  });
  string.join(encrypted, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let decrypted = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 and codepoint <= 122 {
      let shifted = ((codepoint - 97 - shift + 26) % 26 + 97) ?? 0;
      string.from_codepoint(shifted)
    } else {
      c
    }
  });
  string.join(decrypted, "")
}
```

**Diagnostic:**

```
error: Expected Then at line 5:45 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:5:45
  here: if codepoint >= 97 and codepoint <= 122 {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |     if codepoint >= 97 and codepoint <= 122 {
  |                                             ^
error: Expected ')' to close function call opened at line 3:28
  --> /tmp/dojo-caesar-cipher-3.almd:8:7
  here: } else {
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   let encrypted = chars.map((c) => {
  |                            --------------- '(' opened here
...
8 |     } else {
  |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 11:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:11:3
  here: });
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |   });
   |   ^
error: Expected Then at line 19:45 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:19:45
  here: if codepoint >= 97 and codepoint <= 122 {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
19 |     if codepoint >= 97 and codepoint <= 122 {
   |                                             ^
error: Expected ')' to close function call opened at line 17:28
  --> /tmp/dojo-caesar-cipher-3.almd:22:7
  here: } else {
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |   let decrypted = chars.map((c) => {
   |                            --------------- '(' opened here
...
22 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 25:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:25:3
  here: });
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
25 |   });
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:9:7
  in variable c
  here: c
  hint: Check the variable name
  |
9 |       c
  |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:23:7
  in variable c
  here: c
  hint: Check the variable name
   |
23 |       c
   |       ^

8 error(s) found
FAILED: /tmp/dojo-caesar-cipher-3.almd
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
