# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
    let result = string.chars(text)
        .map(|c| {
            let codepoint = string.codepoint(c);
            if codepoint >= 97 && codepoint <= 122 {
                let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
                string.from_codepoint(new_codepoint)
            } else {
                c
            }
        })
        .join("");
    result
}

fn decrypt(text: String, shift: Int) -> String {
    let result = string.chars(text)
        .map(|c| {
            let codepoint = string.codepoint(c);
            if codepoint >= 97 && codepoint <= 122 {
                let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
                string.from_codepoint(new_codepoint)
            } else {
                c
            }
        })
        .join("");
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
    let result = string.chars(text)
        .map(|c| {
            let codepoint = string.codepoint(c);
            if codepoint >= 97 && codepoint < 122 {
                let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
                string.from_codepoint(new_codepoint)
            } else {
                c
            }
        })
        .join("");
    result
}

fn decrypt(text: String, shift: Int) -> String = {
    let result = string.chars(text)
        .map(|c| {
            let codepoint = string.codepoint(c);
            if codepoint >= 97 && codepoint < 122 {
                let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
                string.from_codepoint(new_codepoint)
            } else {
                c
            }
        })
        .join("");
    result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Expected expression at line 3:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-1.almd:3:9
  |
3 |         .map(|c| {
  |         ^
error: '&&' is not valid in Almide at line 5:32
  --> /tmp/dojo-caesar-cipher-1.almd:5:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |             if codepoint >= 97 && codepoint < 122 {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:15 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:8:15
  |
8 |             } else {
  |               ^
error: Expected expression at line 18:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-1.almd:18:9
   |
18 |         .map(|c| {
   |         ^
error: '&&' is not valid in Almide at line 20:32
  --> /tmp/dojo-caesar-cipher-1.almd:20:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
20 |             if codepoint >= 97 && codepoint < 122 {
   |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:15 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:23:15
   |
23 |             } else {
   |               ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:4:46
  in variable c
  hint: Check the variable name
  |
4 |             let codepoint = string.codepoint(c);
  |                                              ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:50
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                  ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:55
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                       ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:64
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                                ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:69
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                                     ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:7:39
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |                 string.from_codepoint(new_codepoint)
  |                                       ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:19:46
  in variable c
  hint: Check the variable name
   |
19 |             let codepoint = string.codepoint(c);
   |                                              ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:21:50
  in operator -
  hint: Use numeric types (Int or Float)
   |
21 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                  ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:21:55
  in operator -
  hint: Use numeric types (Int or Float)
   |
21 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                       ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:21:63
  in operator +
  hint: Use + with numeric types, String, or List
   |
21 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                               ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:21:69
  in operator %
  hint: Use numeric types (Int or Float)
   |
21 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                     ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:21:74
  in operator +
  hint: Use + with numeric types, String, or List
   |
21 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                          ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:22:39
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
22 |                 string.from_codepoint(new_codepoint)
   |                                       ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:7:39
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |                 string.from_codepoint(new_codepoint)
  |                                       ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:22:39
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
22 |                 string.from_codepoint(new_codepoint)
   |                                       ^^^^^^^^^^^^^

21 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let result = string.chars(text)
        .map(|c| {
            let codepoint = string.codepoint(c);
            if codepoint >= 97 && codepoint <= 122 {
                let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
                string.from_codepoint(new_codepoint)
            } else {
                c
            }
        })
        .join("");
    result
}

fn decrypt(text: String, shift: Int) -> String = {
    let result = string.chars(text)
        .map(|c| {
            let codepoint = string.codepoint(c);
            if codepoint >= 97 && codepoint <= 122 {
                let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
                string.from_codepoint(new_codepoint)
            } else {
                c
            }
        })
        .join("");
    result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected expression at line 3:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-2.almd:3:9
  |
3 |         .map(|c| {
  |         ^
error: '&&' is not valid in Almide at line 5:32
  --> /tmp/dojo-caesar-cipher-2.almd:5:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |             if codepoint >= 97 && codepoint <= 122 {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:15 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-2.almd:8:15
  |
8 |             } else {
  |               ^
error: Expected expression at line 18:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-2.almd:18:9
   |
18 |         .map(|c| {
   |         ^
error: '&&' is not valid in Almide at line 20:32
  --> /tmp/dojo-caesar-cipher-2.almd:20:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
20 |             if codepoint >= 97 && codepoint <= 122 {
   |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:15 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-2.almd:23:15
   |
23 |             } else {
   |               ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:4:46
  in variable c
  hint: Check the variable name
  |
4 |             let codepoint = string.codepoint(c);
  |                                              ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:50
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                  ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:55
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                       ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:64
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                                ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:69
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                                     ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:7:39
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |                 string.from_codepoint(new_codepoint)
  |                                       ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:19:46
  in variable c
  hint: Check the variable name
   |
19 |             let codepoint = string.codepoint(c);
   |                                              ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:21:50
  in operator -
  hint: Use numeric types (Int or Float)
   |
21 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                  ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:21:55
  in operator -
  hint: Use numeric types (Int or Float)
   |
21 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                       ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:21:63
  in operator +
  hint: Use + with numeric types, String, or List
   |
21 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                               ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:21:69
  in operator %
  hint: Use numeric types (Int or Float)
   |
21 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                     ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:21:74
  in operator +
  hint: Use + with numeric types, String, or List
   |
21 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                          ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:22:39
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
22 |                 string.from_codepoint(new_codepoint)
   |                                       ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:7:39
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |                 string.from_codepoint(new_codepoint)
  |                                       ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:22:39
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
22 |                 string.from_codepoint(new_codepoint)
   |                                       ^^^^^^^^^^^^^

21 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let result = string.chars(text)
        .map(|c| {
            let codepoint = string.codepoint(c);
            if codepoint >= 97 && codepoint <= 122 {
                let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
                string.from_codepoint(new_codepoint)
            } else {
                c
            }
        })
        .join("");
    result
}

fn decrypt(text: String, shift: Int) -> String = {
    let result = string.chars(text)
        .map(|c| {
            let codepoint = string.codepoint(c);
            if codepoint >= 97 && codepoint <= 122 {
                let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
                string.from_codepoint(new_codepoint)
            } else {
                c
            }
        })
        .join("");
    result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected expression at line 3:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-3.almd:3:9
  |
3 |         .map(|c| {
  |         ^
error: '&&' is not valid in Almide at line 5:32
  --> /tmp/dojo-caesar-cipher-3.almd:5:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |             if codepoint >= 97 && codepoint <= 122 {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:15 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-3.almd:8:15
  |
8 |             } else {
  |               ^
error: Expected expression at line 18:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-3.almd:18:9
   |
18 |         .map(|c| {
   |         ^
error: '&&' is not valid in Almide at line 20:32
  --> /tmp/dojo-caesar-cipher-3.almd:20:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
20 |             if codepoint >= 97 && codepoint <= 122 {
   |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:15 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-3.almd:23:15
   |
23 |             } else {
   |               ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:4:46
  in variable c
  hint: Check the variable name
  |
4 |             let codepoint = string.codepoint(c);
  |                                              ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:50
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                  ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:55
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                       ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:64
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                                ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:69
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                                     ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:7:39
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |                 string.from_codepoint(new_codepoint)
  |                                       ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:19:46
  in variable c
  hint: Check the variable name
   |
19 |             let codepoint = string.codepoint(c);
   |                                              ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:21:50
  in operator -
  hint: Use numeric types (Int or Float)
   |
21 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                  ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:21:55
  in operator -
  hint: Use numeric types (Int or Float)
   |
21 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                       ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:21:63
  in operator +
  hint: Use + with numeric types, String, or List
   |
21 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                               ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:21:69
  in operator %
  hint: Use numeric types (Int or Float)
   |
21 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                     ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:21:74
  in operator +
  hint: Use + with numeric types, String, or List
   |
21 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                          ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:22:39
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
22 |                 string.from_codepoint(new_codepoint)
   |                                       ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:7:39
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |                 string.from_codepoint(new_codepoint)
  |                                       ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:22:39
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
22 |                 string.from_codepoint(new_codepoint)
   |                                       ^^^^^^^^^^^^^

21 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
