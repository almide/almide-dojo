# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
    string.map(text, fn(c) {
        match string.codepoint(c) {
            n if n >= 97 && n <= 122 => {
                let new_codepoint = (n - 97 + shift) % 26 + 97;
                string.from_codepoint(new_codepoint)
            }
            _ => c
        }
    })
}

fn decrypt(text: String, shift: Int) -> String {
    string.map(text, fn(c) {
        match string.codepoint(c) {
            n if n >= 97 && n <= 122 => {
                let new_codepoint = (n - 97 - shift + 26) % 26 + 97;
                string.from_codepoint(new_codepoint)
            }
            _ => c
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
error: Expected function name at line 2:24 (got LParen '(')
  --> /tmp/dojo-caesar-cipher-0.almd:2:24
  |
2 |     string.map(text, fn(c) {
  |                        ^
error: Missing '=' before function body at line 13:48
  --> /tmp/dojo-caesar-cipher-0.almd:13:48
  hint: Almide requires '=' before the body. Write: fn decrypt(...) -> Type = { ... }
   |
13 | fn decrypt(text: String, shift: Int) -> String {
   |                                                ^
error: Expected function name at line 14:24 (got LParen '(')
  --> /tmp/dojo-caesar-cipher-0.almd:14:24
   |
14 |     string.map(text, fn(c) {
   |                        ^

4 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    string.map(text, fn(c) {
        match string.codepoint(c) {
            n if n >= 97 && n < 122 => {
                let new_codepoint = (n - 97 + shift) % 26 + 97;
                string.from_codepoint(new_codepoint)
            }
            _ => c
        }
    })
}

fn decrypt(text: String, shift: Int) -> String = {
    string.map(text, fn(c) {
        match string.codepoint(c) {
            n if n >= 97 && n < 122 => {
                let new_codepoint = (n - 97 - shift + 26) % 26 + 97;
                string.from_codepoint(new_codepoint)
            }
            _ => c
        }
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Expected expression at line 2:22 (got Fn 'fn')
  --> /tmp/dojo-caesar-cipher-1.almd:2:22
  |
2 |     string.map(text, fn(c) {
  |                      ^
error: '&&' is not valid in Almide at line 4:26
  --> /tmp/dojo-caesar-cipher-1.almd:4:26
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |             n if n >= 97 && n < 122 => {
  |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:13 (got Underscore '_')
  --> /tmp/dojo-caesar-cipher-1.almd:8:13
  |
8 |             _ => c
  |             ^
error: Expected expression at line 14:22 (got Fn 'fn')
  --> /tmp/dojo-caesar-cipher-1.almd:14:22
   |
14 |     string.map(text, fn(c) {
   |                      ^
error: '&&' is not valid in Almide at line 16:26
  --> /tmp/dojo-caesar-cipher-1.almd:16:26
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
16 |             n if n >= 97 && n < 122 => {
   |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 20:13 (got Underscore '_')
  --> /tmp/dojo-caesar-cipher-1.almd:20:13
   |
20 |             _ => c
   |             ^
error[E003]: undefined variable 'n'
  --> /tmp/dojo-caesar-cipher-1.almd:5:38
  in variable n
  hint: Check the variable name
  |
5 |                 let new_codepoint = (n - 97 + shift) % 26 + 97;
  |                                      ^
error[E003]: undefined variable 'n'
  --> /tmp/dojo-caesar-cipher-1.almd:17:38
  in variable n
  hint: Check the variable name
   |
17 |                 let new_codepoint = (n - 97 - shift + 26) % 26 + 97;
   |                                      ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    string.map(text, fn(c) {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 and codepoint < 123 then {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint)
        }
        else c
    })
}

fn decrypt(text: String, shift: Int) -> String = {
    string.map(text, fn(c) {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 and codepoint < 123 then {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint)
        }
        else c
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected expression at line 2:22 (got Fn 'fn')
  --> /tmp/dojo-caesar-cipher-2.almd:2:22
  |
2 |     string.map(text, fn(c) {
  |                      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:6 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-2.almd:9:6
  |
9 |     })
  |      ^
error: Expected expression at line 13:22 (got Fn 'fn')
  --> /tmp/dojo-caesar-cipher-2.almd:13:22
   |
13 |     string.map(text, fn(c) {
   |                      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 20:6 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-2.almd:20:6
   |
20 |     })
   |      ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:3:42
  in variable c
  hint: Check the variable name
  |
3 |         let codepoint = string.codepoint(c);
  |                                          ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:5:46
  in operator -
  hint: Use numeric types (Int or Float)
  |
5 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                              ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:5:51
  in operator +
  hint: Use + with numeric types, String, or List
  |
5 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                   ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:5:60
  in operator %
  hint: Use numeric types (Int or Float)
  |
5 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                            ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:5:65
  in operator +
  hint: Use + with numeric types, String, or List
  |
5 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                                 ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:6:35
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
6 |             string.from_codepoint(new_codepoint)
  |                                   ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:8:14
  in variable c
  hint: Check the variable name
  |
8 |         else c
  |              ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:14:42
  in variable c
  hint: Check the variable name
   |
14 |         let codepoint = string.codepoint(c);
   |                                          ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:16:46
  in operator -
  hint: Use numeric types (Int or Float)
   |
16 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                              ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:16:51
  in operator -
  hint: Use numeric types (Int or Float)
   |
16 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                   ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:16:59
  in operator +
  hint: Use + with numeric types, String, or List
   |
16 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                           ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:16:65
  in operator %
  hint: Use numeric types (Int or Float)
   |
16 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                 ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:16:70
  in operator +
  hint: Use + with numeric types, String, or List
   |
16 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                      ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:17:35
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
17 |             string.from_codepoint(new_codepoint)
   |                                   ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:19:14
  in variable c
  hint: Check the variable name
   |
19 |         else c
   |              ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:6:35
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
6 |             string.from_codepoint(new_codepoint)
  |                                   ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:17:35
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
17 |             string.from_codepoint(new_codepoint)
   |                                   ^^^^^^^^^^^^^

21 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    string.map(text, fn(c) {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 and codepoint <= 122 then {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint)
        }
        else c
    })
}

fn decrypt(text: String, shift: Int) -> String = {
    string.map(text, fn(c) {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 and codepoint <= 122 then {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint)
        }
        else c
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected expression at line 2:22 (got Fn 'fn')
  --> /tmp/dojo-caesar-cipher-3.almd:2:22
  |
2 |     string.map(text, fn(c) {
  |                      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:6 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-3.almd:9:6
  |
9 |     })
  |      ^
error: Expected expression at line 13:22 (got Fn 'fn')
  --> /tmp/dojo-caesar-cipher-3.almd:13:22
   |
13 |     string.map(text, fn(c) {
   |                      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 20:6 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-3.almd:20:6
   |
20 |     })
   |      ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:3:42
  in variable c
  hint: Check the variable name
  |
3 |         let codepoint = string.codepoint(c);
  |                                          ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:5:46
  in operator -
  hint: Use numeric types (Int or Float)
  |
5 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                              ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:5:51
  in operator +
  hint: Use + with numeric types, String, or List
  |
5 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                   ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:5:60
  in operator %
  hint: Use numeric types (Int or Float)
  |
5 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                            ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:5:65
  in operator +
  hint: Use + with numeric types, String, or List
  |
5 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                                 ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:6:35
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
6 |             string.from_codepoint(new_codepoint)
  |                                   ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:8:14
  in variable c
  hint: Check the variable name
  |
8 |         else c
  |              ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:14:42
  in variable c
  hint: Check the variable name
   |
14 |         let codepoint = string.codepoint(c);
   |                                          ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:16:46
  in operator -
  hint: Use numeric types (Int or Float)
   |
16 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                              ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:16:51
  in operator -
  hint: Use numeric types (Int or Float)
   |
16 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                   ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:16:59
  in operator +
  hint: Use + with numeric types, String, or List
   |
16 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                           ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:16:65
  in operator %
  hint: Use numeric types (Int or Float)
   |
16 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                 ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:16:70
  in operator +
  hint: Use + with numeric types, String, or List
   |
16 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                      ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:17:35
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
17 |             string.from_codepoint(new_codepoint)
   |                                   ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:19:14
  in variable c
  hint: Check the variable name
   |
19 |         else c
   |              ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:6:35
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
6 |             string.from_codepoint(new_codepoint)
  |                                   ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:17:35
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
17 |             string.from_codepoint(new_codepoint)
   |                                   ^^^^^^^^^^^^^

21 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
