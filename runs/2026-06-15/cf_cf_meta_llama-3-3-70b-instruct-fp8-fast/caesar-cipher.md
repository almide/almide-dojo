# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:3:52
  in call to encrypt()
  hint: Check the function name
  |
3 | test "encrypt abc by 1" { assert_eq(encrypt("abc", 1), "bcd") }
  |                                                    ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:4:52
  in call to encrypt()
  hint: Check the function name
  |
4 | test "encrypt xyz by 3" { assert_eq(encrypt("xyz", 3), "abc") }
  |                                                    ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:5:57
  in call to encrypt()
  hint: Check the function name
  |
5 | test "encrypt hello by 13" { assert_eq(encrypt("hello", 13), "uryyb") }
  |                                                         ^^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:6:77
  in call to encrypt()
  hint: Check the function name
  |
6 | test "encrypt preserves non-lowercase" { assert_eq(encrypt("Hello, World!", 5), "Hjqqt, Wtwqi!") }
  |                                                                             ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:7:61
  in call to encrypt()
  hint: Check the function name
  |
7 | test "encrypt by 0 is identity" { assert_eq(encrypt("test", 0), "test") }
  |                                                             ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:8:62
  in call to encrypt()
  hint: Check the function name
  |
8 | test "encrypt by 26 is identity" { assert_eq(encrypt("test", 26), "test") }
  |                                                              ^^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:9:52
  in call to decrypt()
  hint: Check the function name
  |
9 | test "decrypt bcd by 1" { assert_eq(decrypt("bcd", 1), "abc") }
  |                                                    ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:10:52
  in call to decrypt()
  hint: Check the function name
   |
10 | test "decrypt abc by 3" { assert_eq(decrypt("abc", 3), "xyz") }
   |                                                    ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:11:57
  in call to decrypt()
  hint: Check the function name
   |
11 | test "decrypt uryyb by 13" { assert_eq(decrypt("uryyb", 13), "hello") }
   |                                                         ^^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:12:77
  in call to encrypt()
  hint: Check the function name
   |
12 | test "encrypt then decrypt roundtrip" { assert_eq(decrypt(encrypt("almide", 7), 7), "almide") }
   |                                                                             ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:12:81
  in call to decrypt()
  hint: Check the function name
   |
12 | test "encrypt then decrypt roundtrip" { assert_eq(decrypt(encrypt("almide", 7), 7), "almide") }
   |                                                                                 ^

11 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  let
    chars = string.chars(text)
    shifted_chars = list.map(chars, (c) =>
      if string.is_lower(c) then
        let
          codepoint = string.codepoint(c) |> option.unwrap_or(0)
          shifted_codepoint = (codepoint - 97 + shift) % 26 + 97
        in string.from_codepoint(shifted_codepoint)
      else c)
  in string.join(shifted_chars, "")

fn decrypt(text: String, shift: Int) -> String =
  let
    chars = string.chars(text)
    shifted_chars = list.map(chars, (c) =>
      if string.is_lower(c) then
        let
          codepoint = string.codepoint(c) |> option.unwrap_or(0)
          shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
        in string.from_codepoint(shifted_codepoint)
      else c)
  in string.join(shifted_chars, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-caesar-cipher-1.almd:2:6
  |
2 |   let
  |      ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:6:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |         let
  |         ^^^
error: Expected expression at line 9:9 (got In 'in')
  --> /tmp/dojo-caesar-cipher-1.almd:9:9
  |
9 |         in string.from_codepoint(shifted_codepoint)
  |         ^
error: Expected identifier at line 14:6 (got Newline '')
  --> /tmp/dojo-caesar-cipher-1.almd:14:6
   |
14 |   let
   |      ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:18:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
18 |         let
   |         ^^^
error: Expected expression at line 21:9 (got In 'in')
  --> /tmp/dojo-caesar-cipher-1.almd:21:9
   |
21 |         in string.from_codepoint(shifted_codepoint)
   |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:7:40
  in variable c
  hint: Check the variable name
  |
7 |           codepoint = string.codepoint(c) |> option.unwrap_or(0)
  |                                        ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-1.almd:8:32
  in variable codepoint
  hint: Check the variable name
  |
8 |           shifted_codepoint = (codepoint - 97 + shift) % 26 + 97
  |                                ^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:19:40
  in variable c
  hint: Check the variable name
   |
19 |           codepoint = string.codepoint(c) |> option.unwrap_or(0)
   |                                        ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-1.almd:20:32
  in variable codepoint
  hint: Check the variable name
   |
20 |           shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
   |                                ^^^^^^^^^
error[E001]: type mismatch in fn 'encrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-1.almd:8:63
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
8 |           shifted_codepoint = (codepoint - 97 + shift) % 26 + 97
  |                                                               ^^
error[E001]: type mismatch in fn 'decrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-1.almd:20:68
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
20 |           shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
   |                                                                    ^^

12 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.join(list.map(string.chars(text), (c) => 
    if string.is_lower(c) then 
      string.from_codepoint((string.codepoint(c) |> option.unwrap_or(0) - 97 + shift) % 26 + 97) 
    else c), "")

fn decrypt(text: String, shift: Int) -> String = 
  string.join(list.map(string.chars(text), (c) => 
    if string.is_lower(c) then 
      string.from_codepoint((string.codepoint(c) |> option.unwrap_or(0) - 97 - shift + 26) % 26 + 97) 
    else c), "")
```
