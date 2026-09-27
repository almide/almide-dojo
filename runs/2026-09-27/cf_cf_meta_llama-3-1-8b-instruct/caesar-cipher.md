# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E030`

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
    let chars = string.chars(text);
    let result = chars.map((c) => {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint <= 122 {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    });
    string.join(result, "")
}

fn decrypt(text: String, shift: Int) -> String {
    let chars = string.chars(text);
    let result = chars.map((c) => {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint <= 122 {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    });
    string.join(result, "")
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
    let result = chars.map((c) => {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint <= 122 {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    });
    string.join(result, "")
}

fn decrypt(text: String, shift: Int) -> String = {
    let chars = string.chars(text);
    let result = chars.map((c) => {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint <= 122 {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    });
    string.join(result, "")
}
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 5:28
  --> /tmp/dojo-caesar-cipher-1.almd:5:28
  here: if codepoint >= 97 && codepoint <= 122 {
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |         if codepoint >= 97 && codepoint <= 122 {
  |                            ^
error: Expected ')' to close function call opened at line 3:27
  --> /tmp/dojo-caesar-cipher-1.almd:8:11
  here: } else {
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |     let result = chars.map((c) => {
  |                           --------------- '(' opened here
...
8 |         } else {
  |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 11:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:11:5
  here: });
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |     });
   |     ^
error: '&&' is not valid in Almide at line 19:28
  --> /tmp/dojo-caesar-cipher-1.almd:19:28
  here: if codepoint >= 97 && codepoint <= 122 {
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
19 |         if codepoint >= 97 && codepoint <= 122 {
   |                            ^
error: Expected ')' to close function call opened at line 17:27
  --> /tmp/dojo-caesar-cipher-1.almd:22:11
  here: } else {
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |     let result = chars.map((c) => {
   |                           --------------- '(' opened here
...
22 |         } else {
   |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 25:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:25:5
  here: });
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
25 |     });
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:9:13
  in variable c
  here: c
  hint: Check the variable name
  |
9 |             c
  |             ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:23:13
  in variable c
  here: c
  hint: Check the variable name
   |
23 |             c
   |             ^

8 error(s) found
FAILED: /tmp/dojo-caesar-cipher-1.almd
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let chars = string.chars(text);
    let result = chars.map((c) => {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 and codepoint <= 122 {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    });
    string.join(result, "")
}

fn decrypt(text: String, shift: Int) -> String = {
    let chars = string.chars(text);
    let result = chars.map((c) => {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 and codepoint <= 122 {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    });
    string.join(result, "")
}
```

**Diagnostic:**

```
error: Expected Then at line 5:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:5:49
  here: if codepoint >= 97 and codepoint <= 122 {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |         if codepoint >= 97 and codepoint <= 122 {
  |                                                 ^
error: Expected ')' to close function call opened at line 3:27
  --> /tmp/dojo-caesar-cipher-2.almd:8:11
  here: } else {
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |     let result = chars.map((c) => {
  |                           --------------- '(' opened here
...
8 |         } else {
  |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 11:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:11:5
  here: });
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |     });
   |     ^
error: Expected Then at line 19:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:19:49
  here: if codepoint >= 97 and codepoint <= 122 {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
19 |         if codepoint >= 97 and codepoint <= 122 {
   |                                                 ^
error: Expected ')' to close function call opened at line 17:27
  --> /tmp/dojo-caesar-cipher-2.almd:22:11
  here: } else {
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |     let result = chars.map((c) => {
   |                           --------------- '(' opened here
...
22 |         } else {
   |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 25:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:25:5
  here: });
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
25 |     });
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:9:13
  in variable c
  here: c
  hint: Check the variable name
  |
9 |             c
  |             ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:23:13
  in variable c
  here: c
  hint: Check the variable name
   |
23 |             c
   |             ^

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
    let result = chars.map((c) => {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 and codepoint <= 122 then {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    });
    string.join(result, "")
}

fn decrypt(text: String, shift: Int) -> String = {
    let chars = string.chars(text);
    let result = chars.map((c) => {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 and codepoint <= 122 then {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    });
    string.join(result, "")
}
```

**Diagnostic:**

```
error[E030]: operator '>=' is not defined for Option[Int] — ordering applies to Int, Float, String, and Bool
  --> /tmp/dojo-caesar-cipher-3.almd:5:25
  in operator >=
  here: if codepoint >= 97 and codepoint <= 122 then {
  hint: Compare scalar fields explicitly, or use list.sort / list.min / list.max for ordered collections
  |
5 |         if codepoint >= 97 and codepoint <= 122 then {
  |                         ^^
error[E030]: operator '<=' is not defined for Option[Int] — ordering applies to Int, Float, String, and Bool
  --> /tmp/dojo-caesar-cipher-3.almd:5:45
  in operator <=
  here: if codepoint >= 97 and codepoint <= 122 then {
  hint: Compare scalar fields explicitly, or use list.sort / list.min / list.max for ordered collections
  |
5 |         if codepoint >= 97 and codepoint <= 122 then {
  |                                             ^^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:46
  in operator -
  here: let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  hint: Use numeric types (Int or Float)
  |
6 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                              ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:51
  in operator +
  here: let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  hint: Use + with numeric types, String, or List
  |
6 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                   ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:60
  in operator %
  here: let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  hint: Use numeric types (Int or Float)
  |
6 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                            ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:65
  in operator +
  here: let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  hint: Use + with numeric types, String, or List
  |
6 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                                 ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:7:35
  in call to string.from_codepoint()
  here: string.from_codepoint(new_codepoint)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
7 |             string.from_codepoint(new_codepoint)
  |                                   ^^^^^^^^^^^^^
error[E030]: operator '>=' is not defined for Option[Int] — ordering applies to Int, Float, String, and Bool
  --> /tmp/dojo-caesar-cipher-3.almd:19:25
  in operator >=
  here: if codepoint >= 97 and codepoint <= 122 then {
  hint: Compare scalar fields explicitly, or use list.sort / list.min / list.max for ordered collections
   |
19 |         if codepoint >= 97 and codepoint <= 122 then {
   |                         ^^
error[E030]: operator '<=' is not defined for Option[Int] — ordering applies to Int, Float, String, and Bool
  --> /tmp/dojo-caesar-cipher-3.almd:19:45
  in operator <=
  here: if codepoint >= 97 and codepoint <= 122 then {
  hint: Compare scalar fields explicitly, or use list.sort / list.min / list.max for ordered collections
   |
19 |         if codepoint >= 97 and codepoint <= 122 then {
   |                                             ^^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:20:46
  in operator -
  here: let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
  hint: Use numeric types (Int or Float)
   |
20 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                              ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:20:51
  in operator -
  here: let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
  hint: Use numeric types (Int or Float)
   |
20 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                   ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:20:59
  in operator +
  here: let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
  hint: Use + with numeric types, String, or List
   |
20 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                           ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:20:65
  in operator %
  here: let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
  hint: Use numeric types (Int or Float)
   |
20 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                 ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:20:70
  in operator +
  here: let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
  hint: Use + with numeric types, String, or List
   |
20 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                      ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:21:35
  in call to string.from_codepoint()
  here: string.from_codepoint(new_codepoint)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
21 |             string.from_codepoint(new_codepoint)
   |                                   ^^^^^^^^^^^^^

15 error(s) found
FAILED: /tmp/dojo-caesar-cipher-3.almd
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
