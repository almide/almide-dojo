# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
    string.map(text, |c| {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint <= 122 {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    })
}

fn decrypt(text: String, shift: Int) -> String {
    string.map(text, |c| {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint <= 122 {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    })
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
    string.map(text, |c| {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint < 122 {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    })
}

fn decrypt(text: String, shift: Int) -> String = {
    string.map(text, |c| {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint < 122 {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '|x|' closure syntax is not valid in Almide at line 2:22
  --> /tmp/dojo-caesar-cipher-1.almd:2:22
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |     string.map(text, |c| {
  |                      ^
error: '&&' is not valid in Almide at line 4:28
  --> /tmp/dojo-caesar-cipher-1.almd:4:28
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |         if codepoint >= 97 && codepoint < 122 {
  |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:11 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:7:11
  |
7 |         } else {
  |           ^
error: '|x|' closure syntax is not valid in Almide at line 14:22
  --> /tmp/dojo-caesar-cipher-1.almd:14:22
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
14 |     string.map(text, |c| {
   |                      ^
error: '&&' is not valid in Almide at line 16:28
  --> /tmp/dojo-caesar-cipher-1.almd:16:28
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
16 |         if codepoint >= 97 && codepoint < 122 {
   |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 19:11 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:19:11
   |
19 |         } else {
   |           ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:3:42
  in variable c
  hint: Check the variable name
  |
3 |         let codepoint = string.codepoint(c);
  |                                          ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:5:46
  in operator -
  hint: Use numeric types (Int or Float)
  |
5 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                              ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:5:51
  in operator +
  hint: Use + with numeric types, String, or List
  |
5 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                   ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:5:60
  in operator %
  hint: Use numeric types (Int or Float)
  |
5 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                            ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:5:65
  in operator +
  hint: Use + with numeric types, String, or List
  |
5 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                                 ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:6:35
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
6 |             string.from_codepoint(new_codepoint)
  |                                   ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:15:42
  in variable c
  hint: Check the variable name
   |
15 |         let codepoint = string.codepoint(c);
   |                                          ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:17:46
  in operator -
  hint: Use numeric types (Int or Float)
   |
17 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                              ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:17:51
  in operator -
  hint: Use numeric types (Int or Float)
   |
17 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                   ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:17:59
  in operator +
  hint: Use + with numeric types, String, or List
   |
17 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                           ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:17:65
  in operator %
  hint: Use numeric types (Int or Float)
   |
17 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                 ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:17:70
  in operator +
  hint: Use + with numeric types, String, or List
   |
17 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                      ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:18:35
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
18 |             string.from_codepoint(new_codepoint)
   |                                   ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:6:35
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
6 |             string.from_codepoint(new_codepoint)
  |                                   ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:18:35
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
18 |             string.from_codepoint(new_codepoint)
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
    string.map(text, (c) => {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint <= 122 {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    })
}

fn decrypt(text: String, shift: Int) -> String = {
    string.map(text, (c) => {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint <= 122 {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: '&&' is not valid in Almide at line 4:28
  --> /tmp/dojo-caesar-cipher-2.almd:4:28
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |         if codepoint >= 97 && codepoint <= 122 {
  |                            ^
error: Expected ')' to close function call opened at line 2:15
  --> /tmp/dojo-caesar-cipher-2.almd:7:11
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |     string.map(text, (c) => {
  |               --------------- '(' opened here
...
7 |         } else {
  |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:10:5
   |
10 |     })
   |     ^
error: '&&' is not valid in Almide at line 16:28
  --> /tmp/dojo-caesar-cipher-2.almd:16:28
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
16 |         if codepoint >= 97 && codepoint <= 122 {
   |                            ^
error: Expected ')' to close function call opened at line 14:15
  --> /tmp/dojo-caesar-cipher-2.almd:19:11
  hint: Add ')' or check for a missing delimiter inside the function call
   |
14 |     string.map(text, (c) => {
   |               --------------- '(' opened here
...
19 |         } else {
   |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:22:5
   |
22 |     })
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:8:13
  in variable c
  hint: Check the variable name
  |
8 |             c
  |             ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:20:13
  in variable c
  hint: Check the variable name
   |
20 |             c
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
    string.map(text, (c) => {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 and codepoint < 122 {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    })
}

fn decrypt(text: String, shift: Int) -> String = {
    string.map(text, (c) => {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 and codepoint < 122 {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected Then at line 4:48 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:4:48
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |         if codepoint >= 97 and codepoint < 122 {
  |                                                ^
error: Expected ')' to close function call opened at line 2:15
  --> /tmp/dojo-caesar-cipher-3.almd:7:11
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |     string.map(text, (c) => {
  |               --------------- '(' opened here
...
7 |         } else {
  |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:10:5
   |
10 |     })
   |     ^
error: Expected Then at line 16:48 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:16:48
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
16 |         if codepoint >= 97 and codepoint < 122 {
   |                                                ^
error: Expected ')' to close function call opened at line 14:15
  --> /tmp/dojo-caesar-cipher-3.almd:19:11
  hint: Add ')' or check for a missing delimiter inside the function call
   |
14 |     string.map(text, (c) => {
   |               --------------- '(' opened here
...
19 |         } else {
   |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:22:5
   |
22 |     })
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:8:13
  in variable c
  hint: Check the variable name
  |
8 |             c
  |             ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:20:13
  in variable c
  hint: Check the variable name
   |
20 |             c
   |             ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
