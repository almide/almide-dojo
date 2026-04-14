# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Attempts

### Attempt 1 (FAIL)

```almide
def encrypt(text: String, shift: Int): String = 
  text.chars.map { c => 
    if c >= 'a' && c <= 'z' then 
      string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
    else c
  }.mkString

def decrypt(text: String, shift: Int): String = 
  text.chars.map { c => 
    if c >= 'a' && c <= 'z' then 
      string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
    else c
  }.mkString
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: 'def' is not a keyword in Almide at line 1:1
  --> /tmp/dojo-caesar-cipher-0.almd:1:1
  hint: Use 'fn name(...) -> Type = expr' or 'effect fn name(...) -> Result[T, E] = expr'.
  |
1 | def encrypt(text: String, shift: Int): String =
  | ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:15:52
  in call to encrypt()
  hint: Check the function name
   |
15 | test "encrypt abc by 1" { assert_eq(encrypt("abc", 1), "bcd") }
   |                                                    ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:16:52
  in call to encrypt()
  hint: Check the function name
   |
16 | test "encrypt xyz by 3" { assert_eq(encrypt("xyz", 3), "abc") }
   |                                                    ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:17:57
  in call to encrypt()
  hint: Check the function name
   |
17 | test "encrypt hello by 13" { assert_eq(encrypt("hello", 13), "uryyb") }
   |                                                         ^^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:18:77
  in call to encrypt()
  hint: Check the function name
   |
18 | test "encrypt preserves non-lowercase" { assert_eq(encrypt("Hello, World!", 5), "Hjqqt, Wtwqi!") }
   |                                                                             ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:19:61
  in call to encrypt()
  hint: Check the function name
   |
19 | test "encrypt by 0 is identity" { assert_eq(encrypt("test", 0), "test") }
   |                                                             ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:20:62
  in call to encrypt()
  hint: Check the function name
   |
20 | test "encrypt by 26 is identity" { assert_eq(encrypt("test", 26), "test") }
   |                                                              ^^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:21:52
  in call to decrypt()
  hint: Check the function name
   |
21 | test "decrypt bcd by 1" { assert_eq(decrypt("bcd", 1), "abc") }
   |                                                    ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:22:52
  in call to decrypt()
  hint: Check the function name
   |
22 | test "decrypt abc by 3" { assert_eq(decrypt("abc", 3), "xyz") }
   |                                                    ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:23:57
  in call to decrypt()
  hint: Check the function name
   |
23 | test "decrypt uryyb by 13" { assert_eq(decrypt("uryyb", 13), "hello") }
   |                                                         ^^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:24:77
  in call to encrypt()
  hint: Check the function name
   |
24 | test "encrypt then decrypt roundtrip" { assert_eq(decrypt(encrypt("almide", 7), 7), "almide") }
   |                                                                             ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:24:81
  in call to decrypt()
  hint: Check the function name
   |
24 | test "encrypt then decrypt roundtrip" { assert_eq(decrypt(encrypt("almide", 7), 7), "almide") }
   |                                                                                 ^

12 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  text.chars.map { c => 
    if c >= 'a' && c <= 'z' then 
      string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
    else c
  }.mkString

fn decrypt(text: String, shift: Int) -> String = 
  text.chars.map { c => 
    if c >= 'a' && c <= 'z' then 
      string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
    else c
  }.mkString
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:18 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-1.almd:2:18
  |
2 |   text.chars.map { c =>
  |                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:18 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-1.almd:9:18
  |
9 |   text.chars.map { c =>
  |                  ^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.mkString(text.chars.map((c) => 
    if string.codepoint(c) >= 97 && string.codepoint(c) <= 122 then 
      string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
    else c
  ))

fn decrypt(text: String, shift: Int) -> String = 
  string.mkString(text.chars.map((c) => 
    if string.codepoint(c) >= 97 && string.codepoint(c) <= 122 then 
      string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
    else c
  ))
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: '&&' is not valid in Almide at line 3:34
  --> /tmp/dojo-caesar-cipher-2.almd:3:34
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
3 |     if string.codepoint(c) >= 97 && string.codepoint(c) <= 122 then
  |                                  ^
error: '&&' is not valid in Almide at line 10:34
  --> /tmp/dojo-caesar-cipher-2.almd:10:34
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
10 |     if string.codepoint(c) >= 97 && string.codepoint(c) <= 122 then
   |                                  ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:15:52
  in call to encrypt()
  hint: Check the function name
   |
15 | test "encrypt abc by 1" { assert_eq(encrypt("abc", 1), "bcd") }
   |                                                    ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:16:52
  in call to encrypt()
  hint: Check the function name
   |
16 | test "encrypt xyz by 3" { assert_eq(encrypt("xyz", 3), "abc") }
   |                                                    ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:17:57
  in call to encrypt()
  hint: Check the function name
   |
17 | test "encrypt hello by 13" { assert_eq(encrypt("hello", 13), "uryyb") }
   |                                                         ^^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:18:77
  in call to encrypt()
  hint: Check the function name
   |
18 | test "encrypt preserves non-lowercase" { assert_eq(encrypt("Hello, World!", 5), "Hjqqt, Wtwqi!") }
   |                                                                             ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:19:61
  in call to encrypt()
  hint: Check the function name
   |
19 | test "encrypt by 0 is identity" { assert_eq(encrypt("test", 0), "test") }
   |                                                             ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:20:62
  in call to encrypt()
  hint: Check the function name
   |
20 | test "encrypt by 26 is identity" { assert_eq(encrypt("test", 26), "test") }
   |                                                              ^^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:21:52
  in call to decrypt()
  hint: Check the function name
   |
21 | test "decrypt bcd by 1" { assert_eq(decrypt("bcd", 1), "abc") }
   |                                                    ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:22:52
  in call to decrypt()
  hint: Check the function name
   |
22 | test "decrypt abc by 3" { assert_eq(decrypt("abc", 3), "xyz") }
   |                                                    ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:23:57
  in call to decrypt()
  hint: Check the function name
   |
23 | test "decrypt uryyb by 13" { assert_eq(decrypt("uryyb", 13), "hello") }
   |                                                         ^^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:24:77
  in call to encrypt()
  hint: Check the function name
   |
24 | test "encrypt then decrypt roundtrip" { assert_eq(decrypt(encrypt("almide", 7), 7), "almide") }
   |                                                                             ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:24:81
  in call to decrypt()
  hint: Check the function name
   |
24 | test "encrypt then decrypt roundtrip" { assert_eq(decrypt(encrypt("almide", 7), 7), "almide") }
   |                                                                                 ^

13 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.mkString(text.chars.map((c) => 
    if string.codepoint(c) >= 97 and string.codepoint(c) <= 122 then 
      string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
    else c
  ))

fn decrypt(text: String, shift: Int) -> String = 
  string.mkString(text.chars.map((c) => 
    if string.codepoint(c) >= 97 and string.codepoint(c) <= 122 then 
      string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
    else c
  ))
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:4:52
  in operator -
  hint: Use numeric types (Int or Float)
  |
4 |       string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                    ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:4:57
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                         ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:4:66
  in operator %
  hint: Use numeric types (Int or Float)
  |
4 |       string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                                  ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:4:71
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                                       ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:4:71
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
4 |       string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                                       ^^
error[E002]: undefined function 'string.mkString'
  --> /tmp/dojo-caesar-cipher-3.almd:2:19
  in call to string.mkString()
  hint: No function 'mkString' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
2 |   string.mkString(text.chars.map((c) =>
  |                   ^^^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:11:52
  in operator -
  hint: Use numeric types (Int or Float)
   |
11 |       string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
   |                                                    ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:11:57
  in operator -
  hint: Use numeric types (Int or Float)
   |
11 |       string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
   |                                                         ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:11:65
  in operator +
  hint: Use + with numeric types, String, or List
   |
11 |       string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
   |                                                                 ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:11:71
  in operator %
  hint: Use numeric types (Int or Float)
   |
11 |       string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
   |                                                                       ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:11:76
  in operator +
  hint: Use + with numeric types, String, or List
   |
11 |       string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
   |                                                                            ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:11:76
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
11 |       string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
   |                                                                            ^^
error[E002]: undefined function 'string.mkString'
  --> /tmp/dojo-caesar-cipher-3.almd:9:19
  in call to string.mkString()
  hint: No function 'mkString' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
9 |   string.mkString(text.chars.map((c) =>
  |                   ^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:4:71
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
4 |       string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                                       ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:11:76
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
11 |       string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
   |                                                                            ^^

15 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
