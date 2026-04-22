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
    let encrypted_chars = chars.map(|c| {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint <= 122 {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    });
    string.from_chars(encrypted_chars)
}

fn decrypt(text: String, shift: Int) -> String {
    let chars = string.chars(text);
    let decrypted_chars = chars.map(|c| {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint <= 122 {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint)
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
    let encrypted_chars = chars.map(|c| {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint < 122 {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    });
    string.from_chars(encrypted_chars)
}

fn decrypt(text: String, shift: Int) -> String = {
    let chars = string.chars(text);
    let decrypted_chars = chars.map(|c| {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint < 122 {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint)
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
error: '|x|' closure syntax is not valid in Almide at line 3:37
  --> /tmp/dojo-caesar-cipher-1.almd:3:37
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
3 |     let encrypted_chars = chars.map(|c| {
  |                                     ^
error: '&&' is not valid in Almide at line 5:28
  --> /tmp/dojo-caesar-cipher-1.almd:5:28
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |         if codepoint >= 97 && codepoint < 122 {
  |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:11 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:8:11
  |
8 |         } else {
  |           ^
error: '|x|' closure syntax is not valid in Almide at line 17:37
  --> /tmp/dojo-caesar-cipher-1.almd:17:37
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
17 |     let decrypted_chars = chars.map(|c| {
   |                                     ^
error: '&&' is not valid in Almide at line 19:28
  --> /tmp/dojo-caesar-cipher-1.almd:19:28
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
19 |         if codepoint >= 97 && codepoint < 122 {
   |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:11 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:22:11
   |
22 |         } else {
   |           ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:4:42
  in variable c
  hint: Check the variable name
  |
4 |         let codepoint = string.codepoint(c);
  |                                          ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:46
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                              ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:51
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                   ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:60
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                            ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:65
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                                 ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:7:35
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |             string.from_codepoint(new_codepoint)
  |                                   ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:18:42
  in variable c
  hint: Check the variable name
   |
18 |         let codepoint = string.codepoint(c);
   |                                          ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:46
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                              ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:51
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                   ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:59
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                           ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:65
  in operator %
  hint: Use numeric types (Int or Float)
   |
20 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                 ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:70
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                      ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:21:35
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
21 |             string.from_codepoint(new_codepoint)
   |                                   ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:7:35
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |             string.from_codepoint(new_codepoint)
  |                                   ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:21:35
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
21 |             string.from_codepoint(new_codepoint)
   |                                   ^^^^^^^^^^^^^

21 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let chars = string.chars(text);
    let encrypted_chars = chars.map((x) => {
        let codepoint = string.codepoint(x);
        if codepoint >= 97 && codepoint <= 122 {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            x
        }
    });
    string.from_chars(encrypted_chars)
}

fn decrypt(text: String, shift: Int) -> String = {
    let chars = string.chars(text);
    let decrypted_chars = chars.map((x) => {
        let codepoint = string.codepoint(x);
        if codepoint >= 97 && codepoint <= 122 {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            x
        }
    });
    string.from_chars(decrypted_chars)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: '&&' is not valid in Almide at line 5:28
  --> /tmp/dojo-caesar-cipher-2.almd:5:28
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |         if codepoint >= 97 && codepoint <= 122 {
  |                            ^
error: Expected ')' to close function call opened at line 3:36
  --> /tmp/dojo-caesar-cipher-2.almd:8:11
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |     let encrypted_chars = chars.map((x) => {
  |                                    --------------- '(' opened here
...
8 |         } else {
  |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:11:5
   |
11 |     });
   |     ^
error: '&&' is not valid in Almide at line 19:28
  --> /tmp/dojo-caesar-cipher-2.almd:19:28
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
19 |         if codepoint >= 97 && codepoint <= 122 {
   |                            ^
error: Expected ')' to close function call opened at line 17:36
  --> /tmp/dojo-caesar-cipher-2.almd:22:11
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |     let decrypted_chars = chars.map((x) => {
   |                                    --------------- '(' opened here
...
22 |         } else {
   |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 25:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:25:5
   |
25 |     });
   |     ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-caesar-cipher-2.almd:9:13
  in variable x
  hint: Check the variable name
  |
9 |             x
  |             ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-caesar-cipher-2.almd:23:13
  in variable x
  hint: Check the variable name
   |
23 |             x
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
    let chars = string.chars(text);
    let encrypted_chars = chars.map((x) => {
        let codepoint = string.codepoint(x);
        if codepoint >= 97 and codepoint < 122 {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            x
        }
    });
    string.from_chars(encrypted_chars)
}

fn decrypt(text: String, shift: Int) -> String = {
    let chars = string.chars(text);
    let decrypted_chars = chars.map((x) => {
        let codepoint = string.codepoint(x);
        if codepoint >= 97 and codepoint < 122 {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            x
        }
    });
    string.from_chars(decrypted_chars)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected Then at line 5:48 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:5:48
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |         if codepoint >= 97 and codepoint < 122 {
  |                                                ^
error: Expected ')' to close function call opened at line 3:36
  --> /tmp/dojo-caesar-cipher-3.almd:8:11
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |     let encrypted_chars = chars.map((x) => {
  |                                    --------------- '(' opened here
...
8 |         } else {
  |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:11:5
   |
11 |     });
   |     ^
error: Expected Then at line 19:48 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:19:48
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
19 |         if codepoint >= 97 and codepoint < 122 {
   |                                                ^
error: Expected ')' to close function call opened at line 17:36
  --> /tmp/dojo-caesar-cipher-3.almd:22:11
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |     let decrypted_chars = chars.map((x) => {
   |                                    --------------- '(' opened here
...
22 |         } else {
   |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 25:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:25:5
   |
25 |     });
   |     ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-caesar-cipher-3.almd:9:13
  in variable x
  hint: Check the variable name
  |
9 |             x
  |             ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-caesar-cipher-3.almd:23:13
  in variable x
  hint: Check the variable name
   |
23 |             x
   |             ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
