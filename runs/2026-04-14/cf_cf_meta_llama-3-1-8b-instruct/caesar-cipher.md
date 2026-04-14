# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
    text.chars().map((c) => {
        if c >= 97 && c <= 122 {
            let codepoint = (c - 97 + shift) % 26 + 97
            string.from_codepoint(codepoint)
        } else {
            string.from_codepoint(c)
        }
    }).fold(string.new(), (acc, x) => acc + [x])
}

fn decrypt(text: String, shift: Int) -> String {
    encrypt(text, -shift)
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
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:16:52
  in call to encrypt()
  hint: Check the function name
   |
16 | test "encrypt abc by 1" { assert_eq(encrypt("abc", 1), "bcd") }
   |                                                    ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:17:52
  in call to encrypt()
  hint: Check the function name
   |
17 | test "encrypt xyz by 3" { assert_eq(encrypt("xyz", 3), "abc") }
   |                                                    ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:18:57
  in call to encrypt()
  hint: Check the function name
   |
18 | test "encrypt hello by 13" { assert_eq(encrypt("hello", 13), "uryyb") }
   |                                                         ^^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:19:77
  in call to encrypt()
  hint: Check the function name
   |
19 | test "encrypt preserves non-lowercase" { assert_eq(encrypt("Hello, World!", 5), "Hjqqt, Wtwqi!") }
   |                                                                             ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:20:61
  in call to encrypt()
  hint: Check the function name
   |
20 | test "encrypt by 0 is identity" { assert_eq(encrypt("test", 0), "test") }
   |                                                             ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:21:62
  in call to encrypt()
  hint: Check the function name
   |
21 | test "encrypt by 26 is identity" { assert_eq(encrypt("test", 26), "test") }
   |                                                              ^^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:22:52
  in call to decrypt()
  hint: Check the function name
   |
22 | test "decrypt bcd by 1" { assert_eq(decrypt("bcd", 1), "abc") }
   |                                                    ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:23:52
  in call to decrypt()
  hint: Check the function name
   |
23 | test "decrypt abc by 3" { assert_eq(decrypt("abc", 3), "xyz") }
   |                                                    ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:24:57
  in call to decrypt()
  hint: Check the function name
   |
24 | test "decrypt uryyb by 13" { assert_eq(decrypt("uryyb", 13), "hello") }
   |                                                         ^^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:25:77
  in call to encrypt()
  hint: Check the function name
   |
25 | test "encrypt then decrypt roundtrip" { assert_eq(decrypt(encrypt("almide", 7), 7), "almide") }
   |                                                                             ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:25:81
  in call to decrypt()
  hint: Check the function name
   |
25 | test "encrypt then decrypt roundtrip" { assert_eq(decrypt(encrypt("almide", 7), 7), "almide") }
   |                                                                                 ^

13 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    text.chars().map((c) => {
        if c >= 97 && c < 122 {
            let codepoint = (c - 97 + shift) % 26 + 97
            string.from_codepoint(codepoint)
        } else {
            string.from_codepoint(c)
        }
    }).fold(string.new(), (acc, x) => acc + [x])
}

fn decrypt(text: String, shift: Int) -> String = {
    encrypt(text, -shift)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '&&' is not valid in Almide at line 3:20
  --> /tmp/dojo-caesar-cipher-1.almd:3:20
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
3 |         if c >= 97 && c < 122 {
  |                    ^
error: Expected ')' to close function call opened at line 2:21
  --> /tmp/dojo-caesar-cipher-1.almd:6:11
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |     text.chars().map((c) => {
  |                     --------------- '(' opened here
...
6 |         } else {
  |           ^^^^
error: Expected ')' to close function call opened at line 2:21 at line 6:11
  --> /tmp/dojo-caesar-cipher-1.almd:2:21
  |
2 |     text.chars().map((c) => {
  |                     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:9:5
  |
9 |     }).fold(string.new(), (acc, x) => acc + [x])
  |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:7:35
  in variable c
  hint: Check the variable name
  |
7 |             string.from_codepoint(c)
  |                                   ^

5 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    text.chars().map((c) => {
        if c >= 97 and c < 122 {
            let codepoint = (c - 97 + shift) % 26 + 97
            string.from_codepoint(codepoint)
        } else {
            string.from_codepoint(c)
        }
    }).fold(string.new(), (acc, x) => acc + [x])
}

fn decrypt(text: String, shift: Int) -> String = {
    encrypt(text, -shift)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected Then at line 3:32 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:3:32
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |         if c >= 97 and c < 122 {
  |                                ^
error: Expected ')' to close function call opened at line 2:21
  --> /tmp/dojo-caesar-cipher-2.almd:6:11
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |     text.chars().map((c) => {
  |                     --------------- '(' opened here
...
6 |         } else {
  |           ^^^^
error: Expected ')' to close function call opened at line 2:21 at line 6:11
  --> /tmp/dojo-caesar-cipher-2.almd:2:21
  |
2 |     text.chars().map((c) => {
  |                     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:9:5
  |
9 |     }).fold(string.new(), (acc, x) => acc + [x])
  |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:7:35
  in variable c
  hint: Check the variable name
  |
7 |             string.from_codepoint(c)
  |                                   ^

5 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    text.chars().map((c) => {
        if c >= 97 and c < 123 {
            let codepoint = (c - 97 + shift) % 26 + 97
            string.from_codepoint(codepoint)
        } else {
            string.from_codepoint(c)
        }
    }).fold(string.new(), (acc, x) => acc + [x])
}

fn decrypt(text: String, shift: Int) -> String = {
    encrypt(text, -shift)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected Then at line 3:32 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:3:32
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |         if c >= 97 and c < 123 {
  |                                ^
error: Expected ')' to close function call opened at line 2:21
  --> /tmp/dojo-caesar-cipher-3.almd:6:11
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |     text.chars().map((c) => {
  |                     --------------- '(' opened here
...
6 |         } else {
  |           ^^^^
error: Expected ')' to close function call opened at line 2:21 at line 6:11
  --> /tmp/dojo-caesar-cipher-3.almd:2:21
  |
2 |     text.chars().map((c) => {
  |                     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:9:5
  |
9 |     }).fold(string.new(), (acc, x) => acc + [x])
  |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:7:35
  in variable c
  hint: Check the variable name
  |
7 |             string.from_codepoint(c)
  |                                   ^

5 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
