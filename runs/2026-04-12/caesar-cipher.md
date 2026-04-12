# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: '&&' is not valid in Almide at line 3:17
  --> /tmp/dojo-caesar-cipher-3.almd:3:17
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
3 |     if c >= 'a' && c <= 'z' then
  |                 ^
error: '&&' is not valid in Almide at line 10:17
  --> /tmp/dojo-caesar-cipher-3.almd:10:17
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
10 |     if c >= 'a' && c <= 'z' then
   |                 ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:15:52
  in call to encrypt()
  hint: Check the function name
   |
15 | test "encrypt abc by 1" { assert_eq(encrypt("abc", 1), "bcd") }
   |                                                    ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:16:52
  in call to encrypt()
  hint: Check the function name
   |
16 | test "encrypt xyz by 3" { assert_eq(encrypt("xyz", 3), "abc") }
   |                                                    ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:17:57
  in call to encrypt()
  hint: Check the function name
   |
17 | test "encrypt hello by 13" { assert_eq(encrypt("hello", 13), "uryyb") }
   |                                                         ^^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:18:77
  in call to encrypt()
  hint: Check the function name
   |
18 | test "encrypt preserves non-lowercase" { assert_eq(encrypt("Hello, World!", 5), "Hjqqt, Wtwqi!") }
   |                                                                             ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:19:61
  in call to encrypt()
  hint: Check the function name
   |
19 | test "encrypt by 0 is identity" { assert_eq(encrypt("test", 0), "test") }
   |                                                             ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:20:62
  in call to encrypt()
  hint: Check the function name
   |
20 | test "encrypt by 26 is identity" { assert_eq(encrypt("test", 26), "test") }
   |                                                              ^^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:21:52
  in call to decrypt()
  hint: Check the function name
   |
21 | test "decrypt bcd by 1" { assert_eq(decrypt("bcd", 1), "abc") }
   |                                                    ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:22:52
  in call to decrypt()
  hint: Check the function name
   |
22 | test "decrypt abc by 3" { assert_eq(decrypt("abc", 3), "xyz") }
   |                                                    ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:23:57
  in call to decrypt()
  hint: Check the function name
   |
23 | test "decrypt uryyb by 13" { assert_eq(decrypt("uryyb", 13), "hello") }
   |                                                         ^^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:24:77
  in call to encrypt()
  hint: Check the function name
   |
24 | test "encrypt then decrypt roundtrip" { assert_eq(decrypt(encrypt("almide", 7), 7), "almide") }
   |                                                                             ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:24:81
  in call to decrypt()
  hint: Check the function name
   |
24 | test "encrypt then decrypt roundtrip" { assert_eq(decrypt(encrypt("almide", 7), 7), "almide") }
   |                                                                                 ^

13 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.chars(text).map((c) => 
    if c >= 'a' && c <= 'z' then 
      string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
    else c
  ).mkString

fn decrypt(text: String, shift: Int) -> String = 
  string.chars(text).map((c) => 
    if c >= 'a' && c <= 'z' then 
      string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
    else c
  ).mkString
```
