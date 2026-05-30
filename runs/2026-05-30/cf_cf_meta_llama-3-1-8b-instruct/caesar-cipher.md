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
    let shift = shift % 26;
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
error: Missing '=' before function body at line 17:48
  --> /tmp/dojo-caesar-cipher-0.almd:17:48
  hint: Almide requires '=' before the body. Write: fn decrypt(...) -> Type = { ... }
   |
17 | fn decrypt(text: String, shift: Int) -> String {
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
    let shift = shift % 26;
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
error: Expected expression at line 4:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-1.almd:4:9
  |
4 |         .map(|c| {
  |         ^
error: '&&' is not valid in Almide at line 6:32
  --> /tmp/dojo-caesar-cipher-1.almd:6:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
6 |             if codepoint >= 97 && codepoint < 122 {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:15 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:9:15
  |
9 |             } else {
  |               ^
error: Expected expression at line 20:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-1.almd:20:9
   |
20 |         .map(|c| {
   |         ^
error: '&&' is not valid in Almide at line 22:32
  --> /tmp/dojo-caesar-cipher-1.almd:22:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
22 |             if codepoint >= 97 && codepoint < 122 {
   |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 25:15 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:25:15
   |
25 |             } else {
   |               ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:5:46
  in variable c
  hint: Check the variable name
  |
5 |             let codepoint = string.codepoint(c);
  |                                              ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:7:50
  in operator -
  hint: Use numeric types (Int or Float)
  |
7 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                  ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:7:55
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                       ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:7:64
  in operator %
  hint: Use numeric types (Int or Float)
  |
7 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                                ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:7:69
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                                     ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:8:39
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
8 |                 string.from_codepoint(new_codepoint)
  |                                       ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:21:46
  in variable c
  hint: Check the variable name
   |
21 |             let codepoint = string.codepoint(c);
   |                                              ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:23:50
  in operator -
  hint: Use numeric types (Int or Float)
   |
23 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                  ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:23:55
  in operator -
  hint: Use numeric types (Int or Float)
   |
23 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                       ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:23:63
  in operator +
  hint: Use + with numeric types, String, or List
   |
23 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                               ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:23:69
  in operator %
  hint: Use numeric types (Int or Float)
   |
23 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                     ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:23:74
  in operator +
  hint: Use + with numeric types, String, or List
   |
23 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                          ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:24:39
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
24 |                 string.from_codepoint(new_codepoint)
   |                                       ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:8:39
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
8 |                 string.from_codepoint(new_codepoint)
  |                                       ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:24:39
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
24 |                 string.from_codepoint(new_codepoint)
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
    let shift = shift % 26;
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
    let shift = shift % 26;
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
error: Expected expression at line 4:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-2.almd:4:9
  |
4 |         .map(|c| {
  |         ^
error: '&&' is not valid in Almide at line 6:32
  --> /tmp/dojo-caesar-cipher-2.almd:6:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
6 |             if codepoint >= 97 && codepoint <= 122 {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:15 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-2.almd:9:15
  |
9 |             } else {
  |               ^
error: Expected expression at line 20:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-2.almd:20:9
   |
20 |         .map(|c| {
   |         ^
error: '&&' is not valid in Almide at line 22:32
  --> /tmp/dojo-caesar-cipher-2.almd:22:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
22 |             if codepoint >= 97 && codepoint <= 122 {
   |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 25:15 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-2.almd:25:15
   |
25 |             } else {
   |               ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:5:46
  in variable c
  hint: Check the variable name
  |
5 |             let codepoint = string.codepoint(c);
  |                                              ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:7:50
  in operator -
  hint: Use numeric types (Int or Float)
  |
7 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                  ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:7:55
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                       ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:7:64
  in operator %
  hint: Use numeric types (Int or Float)
  |
7 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                                ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:7:69
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                                     ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:8:39
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
8 |                 string.from_codepoint(new_codepoint)
  |                                       ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:21:46
  in variable c
  hint: Check the variable name
   |
21 |             let codepoint = string.codepoint(c);
   |                                              ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:23:50
  in operator -
  hint: Use numeric types (Int or Float)
   |
23 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                  ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:23:55
  in operator -
  hint: Use numeric types (Int or Float)
   |
23 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                       ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:23:63
  in operator +
  hint: Use + with numeric types, String, or List
   |
23 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                               ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:23:69
  in operator %
  hint: Use numeric types (Int or Float)
   |
23 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                     ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:23:74
  in operator +
  hint: Use + with numeric types, String, or List
   |
23 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                          ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:24:39
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
24 |                 string.from_codepoint(new_codepoint)
   |                                       ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:8:39
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
8 |                 string.from_codepoint(new_codepoint)
  |                                       ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:24:39
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
24 |                 string.from_codepoint(new_codepoint)
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
    let shift = shift % 26;
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
    let shift = shift % 26;
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
error: Expected expression at line 4:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-3.almd:4:9
  |
4 |         .map(|c| {
  |         ^
error: '&&' is not valid in Almide at line 6:32
  --> /tmp/dojo-caesar-cipher-3.almd:6:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
6 |             if codepoint >= 97 && codepoint <= 122 {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:15 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-3.almd:9:15
  |
9 |             } else {
  |               ^
error: Expected expression at line 20:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-3.almd:20:9
   |
20 |         .map(|c| {
   |         ^
error: '&&' is not valid in Almide at line 22:32
  --> /tmp/dojo-caesar-cipher-3.almd:22:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
22 |             if codepoint >= 97 && codepoint <= 122 {
   |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 25:15 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-3.almd:25:15
   |
25 |             } else {
   |               ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:5:46
  in variable c
  hint: Check the variable name
  |
5 |             let codepoint = string.codepoint(c);
  |                                              ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:7:50
  in operator -
  hint: Use numeric types (Int or Float)
  |
7 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                  ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:7:55
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                       ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:7:64
  in operator %
  hint: Use numeric types (Int or Float)
  |
7 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                                ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:7:69
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                                     ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:8:39
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
8 |                 string.from_codepoint(new_codepoint)
  |                                       ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:21:46
  in variable c
  hint: Check the variable name
   |
21 |             let codepoint = string.codepoint(c);
   |                                              ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:23:50
  in operator -
  hint: Use numeric types (Int or Float)
   |
23 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                  ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:23:55
  in operator -
  hint: Use numeric types (Int or Float)
   |
23 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                       ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:23:63
  in operator +
  hint: Use + with numeric types, String, or List
   |
23 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                               ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:23:69
  in operator %
  hint: Use numeric types (Int or Float)
   |
23 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                     ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:23:74
  in operator +
  hint: Use + with numeric types, String, or List
   |
23 |                 let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                          ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:24:39
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
24 |                 string.from_codepoint(new_codepoint)
   |                                       ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:8:39
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
8 |                 string.from_codepoint(new_codepoint)
  |                                       ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:24:39
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
24 |                 string.from_codepoint(new_codepoint)
   |                                       ^^^^^^^^^^^^^

21 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
