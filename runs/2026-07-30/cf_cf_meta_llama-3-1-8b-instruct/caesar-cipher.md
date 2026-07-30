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
    let encrypted = chars.map(|c| {
        let codepoint = string.codepoint(c);
        let ascii_offset = 97;
        let shifted_codepoint = ((codepoint - ascii_offset + shift) % 26) + ascii_offset;
        string.from_codepoint(shifted_codepoint)
    });
    string.join(encrypted, "")
}

fn decrypt(text: String, shift: Int) -> String {
    let chars = string.chars(text);
    let decrypted = chars.map(|c| {
        let codepoint = string.codepoint(c);
        let ascii_offset = 97;
        let shifted_codepoint = ((codepoint - ascii_offset - shift + 26) % 26) + ascii_offset;
        string.from_codepoint(shifted_codepoint)
    });
    string.join(decrypted, "")
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
error: Missing '=' before function body at line 12:48
  --> /tmp/dojo-caesar-cipher-0.almd:12:48
  hint: Almide requires '=' before the body. Write: fn decrypt(...) -> Type = { ... }
   |
12 | fn decrypt(text: String, shift: Int) -> String {
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
    let encrypted = chars.map(|c| {
        let codepoint = string.codepoint(c);
        let ascii_offset = 97;
        let shifted_codepoint = ((codepoint - ascii_offset + shift) % 26) + ascii_offset;
        string.from_codepoint(shifted_codepoint)
    });
    string.join(encrypted, "")
}

fn decrypt(text: String, shift: Int) -> String = {
    let chars = string.chars(text);
    let decrypted = chars.map(|c| {
        let codepoint = string.codepoint(c);
        let ascii_offset = 97;
        let shifted_codepoint = ((codepoint - ascii_offset - shift + 26) % 26) + ascii_offset;
        string.from_codepoint(shifted_codepoint)
    });
    string.join(decrypted, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '|x|' closure syntax is not valid in Almide at line 3:31
  --> /tmp/dojo-caesar-cipher-1.almd:3:31
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
3 |     let encrypted = chars.map(|c| {
  |                               ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:6 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-1.almd:8:6
  |
8 |     });
  |      ^
error: '|x|' closure syntax is not valid in Almide at line 14:31
  --> /tmp/dojo-caesar-cipher-1.almd:14:31
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
14 |     let decrypted = chars.map(|c| {
   |                               ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 19:6 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-1.almd:19:6
   |
19 |     });
   |      ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:4:42
  in variable c
  hint: Check the variable name
  |
4 |         let codepoint = string.codepoint(c);
  |                                          ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:47
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |         let shifted_codepoint = ((codepoint - ascii_offset + shift) % 26) + ascii_offset;
  |                                               ^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:62
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |         let shifted_codepoint = ((codepoint - ascii_offset + shift) % 26) + ascii_offset;
  |                                                              ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:71
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |         let shifted_codepoint = ((codepoint - ascii_offset + shift) % 26) + ascii_offset;
  |                                                                       ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:77
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |         let shifted_codepoint = ((codepoint - ascii_offset + shift) % 26) + ascii_offset;
  |                                                                             ^^^^^^^^^^^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:7:31
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |         string.from_codepoint(shifted_codepoint)
  |                               ^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:15:42
  in variable c
  hint: Check the variable name
   |
15 |         let codepoint = string.codepoint(c);
   |                                          ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:17:47
  in operator -
  hint: Use numeric types (Int or Float)
   |
17 |         let shifted_codepoint = ((codepoint - ascii_offset - shift + 26) % 26) + ascii_offset;
   |                                               ^^^^^^^^^^^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:17:62
  in operator -
  hint: Use numeric types (Int or Float)
   |
17 |         let shifted_codepoint = ((codepoint - ascii_offset - shift + 26) % 26) + ascii_offset;
   |                                                              ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:17:70
  in operator +
  hint: Use + with numeric types, String, or List
   |
17 |         let shifted_codepoint = ((codepoint - ascii_offset - shift + 26) % 26) + ascii_offset;
   |                                                                      ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:17:76
  in operator %
  hint: Use numeric types (Int or Float)
   |
17 |         let shifted_codepoint = ((codepoint - ascii_offset - shift + 26) % 26) + ascii_offset;
   |                                                                            ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:17:82
  in operator +
  hint: Use + with numeric types, String, or List
   |
17 |         let shifted_codepoint = ((codepoint - ascii_offset - shift + 26) % 26) + ascii_offset;
   |                                                                                  ^^^^^^^^^^^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:18:31
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
18 |         string.from_codepoint(shifted_codepoint)
   |                               ^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:7:31
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |         string.from_codepoint(shifted_codepoint)
  |                               ^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:18:31
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
18 |         string.from_codepoint(shifted_codepoint)
   |                               ^^^^^^^^^^^^^^^^^

19 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let chars = string.chars(text);
    let encrypted = chars.map((c) => {
        let codepoint = string.codepoint(c);
        let ascii_offset = 97;
        let shifted_codepoint = ((codepoint - ascii_offset + shift) % 26) + ascii_offset;
        string.from_codepoint(shifted_codepoint)
    });
    string.join(encrypted, "")
}

fn decrypt(text: String, shift: Int) -> String = {
    let chars = string.chars(text);
    let decrypted = chars.map((c) => {
        let codepoint = string.codepoint(c);
        let ascii_offset = 97;
        let shifted_codepoint = ((codepoint - ascii_offset - shift + 26) % 26) + ascii_offset;
        string.from_codepoint(shifted_codepoint)
    });
    string.join(decrypted, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:47
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |         let shifted_codepoint = ((codepoint - ascii_offset + shift) % 26) + ascii_offset;
  |                                               ^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:62
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |         let shifted_codepoint = ((codepoint - ascii_offset + shift) % 26) + ascii_offset;
  |                                                              ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:71
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |         let shifted_codepoint = ((codepoint - ascii_offset + shift) % 26) + ascii_offset;
  |                                                                       ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:77
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |         let shifted_codepoint = ((codepoint - ascii_offset + shift) % 26) + ascii_offset;
  |                                                                             ^^^^^^^^^^^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:7:31
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |         string.from_codepoint(shifted_codepoint)
  |                               ^^^^^^^^^^^^^^^^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:17:47
  in operator -
  hint: Use numeric types (Int or Float)
   |
17 |         let shifted_codepoint = ((codepoint - ascii_offset - shift + 26) % 26) + ascii_offset;
   |                                               ^^^^^^^^^^^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:17:62
  in operator -
  hint: Use numeric types (Int or Float)
   |
17 |         let shifted_codepoint = ((codepoint - ascii_offset - shift + 26) % 26) + ascii_offset;
   |                                                              ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:17:70
  in operator +
  hint: Use + with numeric types, String, or List
   |
17 |         let shifted_codepoint = ((codepoint - ascii_offset - shift + 26) % 26) + ascii_offset;
   |                                                                      ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:17:76
  in operator %
  hint: Use numeric types (Int or Float)
   |
17 |         let shifted_codepoint = ((codepoint - ascii_offset - shift + 26) % 26) + ascii_offset;
   |                                                                            ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:17:82
  in operator +
  hint: Use + with numeric types, String, or List
   |
17 |         let shifted_codepoint = ((codepoint - ascii_offset - shift + 26) % 26) + ascii_offset;
   |                                                                                  ^^^^^^^^^^^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:18:31
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
18 |         string.from_codepoint(shifted_codepoint)
   |                               ^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:7:31
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |         string.from_codepoint(shifted_codepoint)
  |                               ^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:18:31
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
18 |         string.from_codepoint(shifted_codepoint)
   |                               ^^^^^^^^^^^^^^^^^

13 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let chars = string.chars(text);
    let encrypted = chars.map((c) => {
        let codepoint = string.codepoint(c);
        let ascii_offset = 97;
        if string.is_lower(c) {
            let shifted_codepoint = ((codepoint - ascii_offset + shift) % 26) + ascii_offset;
            string.from_codepoint(shifted_codepoint)
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
        let ascii_offset = 97;
        if string.is_lower(c) {
            let shifted_codepoint = ((codepoint - ascii_offset - shift + 26) % 26) + ascii_offset;
            string.from_codepoint(shifted_codepoint)
        } else {
            c
        }
    });
    string.join(decrypted, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected Then at line 6:31 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:6:31
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |         if string.is_lower(c) {
  |                               ^
error: Expected ')' to close function call opened at line 3:30
  --> /tmp/dojo-caesar-cipher-3.almd:9:11
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |     let encrypted = chars.map((c) => {
  |                              --------------- '(' opened here
...
9 |         } else {
  |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:12:5
   |
12 |     });
   |     ^
error: Expected Then at line 21:31 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:21:31
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
21 |         if string.is_lower(c) {
   |                               ^
error: Expected ')' to close function call opened at line 18:30
  --> /tmp/dojo-caesar-cipher-3.almd:24:11
  hint: Add ')' or check for a missing delimiter inside the function call
   |
18 |     let decrypted = chars.map((c) => {
   |                              --------------- '(' opened here
...
24 |         } else {
   |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 27:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:27:5
   |
27 |     });
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:10:13
  in variable c
  hint: Check the variable name
   |
10 |             c
   |             ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:25:13
  in variable c
  hint: Check the variable name
   |
25 |             c
   |             ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
