# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

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

```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-1.almd:3:52
  in call to encrypt()
  hint: Check the function name
  |
3 | test "encrypt abc by 1" { assert_eq(encrypt("abc", 1), "bcd") }
  |                                                    ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-1.almd:4:52
  in call to encrypt()
  hint: Check the function name
  |
4 | test "encrypt xyz by 3" { assert_eq(encrypt("xyz", 3), "abc") }
  |                                                    ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-1.almd:5:57
  in call to encrypt()
  hint: Check the function name
  |
5 | test "encrypt hello by 13" { assert_eq(encrypt("hello", 13), "uryyb") }
  |                                                         ^^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-1.almd:6:77
  in call to encrypt()
  hint: Check the function name
  |
6 | test "encrypt preserves non-lowercase" { assert_eq(encrypt("Hello, World!", 5), "Hjqqt, Wtwqi!") }
  |                                                                             ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-1.almd:7:61
  in call to encrypt()
  hint: Check the function name
  |
7 | test "encrypt by 0 is identity" { assert_eq(encrypt("test", 0), "test") }
  |                                                             ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-1.almd:8:62
  in call to encrypt()
  hint: Check the function name
  |
8 | test "encrypt by 26 is identity" { assert_eq(encrypt("test", 26), "test") }
  |                                                              ^^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-1.almd:9:52
  in call to decrypt()
  hint: Check the function name
  |
9 | test "decrypt bcd by 1" { assert_eq(decrypt("bcd", 1), "abc") }
  |                                                    ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-1.almd:10:52
  in call to decrypt()
  hint: Check the function name
   |
10 | test "decrypt abc by 3" { assert_eq(decrypt("abc", 3), "xyz") }
   |                                                    ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-1.almd:11:57
  in call to decrypt()
  hint: Check the function name
   |
11 | test "decrypt uryyb by 13" { assert_eq(decrypt("uryyb", 13), "hello") }
   |                                                         ^^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-1.almd:12:77
  in call to encrypt()
  hint: Check the function name
   |
12 | test "encrypt then decrypt roundtrip" { assert_eq(decrypt(encrypt("almide", 7), 7), "almide") }
   |                                                                             ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-1.almd:12:81
  in call to decrypt()
  hint: Check the function name
   |
12 | test "encrypt then decrypt roundtrip" { assert_eq(decrypt(encrypt("almide", 7), 7), "almide") }
   |                                                                                 ^

11 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:3:52
  in call to encrypt()
  hint: Check the function name
  |
3 | test "encrypt abc by 1" { assert_eq(encrypt("abc", 1), "bcd") }
  |                                                    ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:4:52
  in call to encrypt()
  hint: Check the function name
  |
4 | test "encrypt xyz by 3" { assert_eq(encrypt("xyz", 3), "abc") }
  |                                                    ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:5:57
  in call to encrypt()
  hint: Check the function name
  |
5 | test "encrypt hello by 13" { assert_eq(encrypt("hello", 13), "uryyb") }
  |                                                         ^^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:6:77
  in call to encrypt()
  hint: Check the function name
  |
6 | test "encrypt preserves non-lowercase" { assert_eq(encrypt("Hello, World!", 5), "Hjqqt, Wtwqi!") }
  |                                                                             ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:7:61
  in call to encrypt()
  hint: Check the function name
  |
7 | test "encrypt by 0 is identity" { assert_eq(encrypt("test", 0), "test") }
  |                                                             ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:8:62
  in call to encrypt()
  hint: Check the function name
  |
8 | test "encrypt by 26 is identity" { assert_eq(encrypt("test", 26), "test") }
  |                                                              ^^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:9:52
  in call to decrypt()
  hint: Check the function name
  |
9 | test "decrypt bcd by 1" { assert_eq(decrypt("bcd", 1), "abc") }
  |                                                    ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:10:52
  in call to decrypt()
  hint: Check the function name
   |
10 | test "decrypt abc by 3" { assert_eq(decrypt("abc", 3), "xyz") }
   |                                                    ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:11:57
  in call to decrypt()
  hint: Check the function name
   |
11 | test "decrypt uryyb by 13" { assert_eq(decrypt("uryyb", 13), "hello") }
   |                                                         ^^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:12:77
  in call to encrypt()
  hint: Check the function name
   |
12 | test "encrypt then decrypt roundtrip" { assert_eq(decrypt(encrypt("almide", 7), 7), "almide") }
   |                                                                             ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-2.almd:12:81
  in call to decrypt()
  hint: Check the function name
   |
12 | test "encrypt then decrypt roundtrip" { assert_eq(decrypt(encrypt("almide", 7), 7), "almide") }
   |                                                                                 ^

11 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:3:52
  in call to encrypt()
  hint: Check the function name
  |
3 | test "encrypt abc by 1" { assert_eq(encrypt("abc", 1), "bcd") }
  |                                                    ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:4:52
  in call to encrypt()
  hint: Check the function name
  |
4 | test "encrypt xyz by 3" { assert_eq(encrypt("xyz", 3), "abc") }
  |                                                    ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:5:57
  in call to encrypt()
  hint: Check the function name
  |
5 | test "encrypt hello by 13" { assert_eq(encrypt("hello", 13), "uryyb") }
  |                                                         ^^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:6:77
  in call to encrypt()
  hint: Check the function name
  |
6 | test "encrypt preserves non-lowercase" { assert_eq(encrypt("Hello, World!", 5), "Hjqqt, Wtwqi!") }
  |                                                                             ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:7:61
  in call to encrypt()
  hint: Check the function name
  |
7 | test "encrypt by 0 is identity" { assert_eq(encrypt("test", 0), "test") }
  |                                                             ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:8:62
  in call to encrypt()
  hint: Check the function name
  |
8 | test "encrypt by 26 is identity" { assert_eq(encrypt("test", 26), "test") }
  |                                                              ^^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:9:52
  in call to decrypt()
  hint: Check the function name
  |
9 | test "decrypt bcd by 1" { assert_eq(decrypt("bcd", 1), "abc") }
  |                                                    ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:10:52
  in call to decrypt()
  hint: Check the function name
   |
10 | test "decrypt abc by 3" { assert_eq(decrypt("abc", 3), "xyz") }
   |                                                    ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:11:57
  in call to decrypt()
  hint: Check the function name
   |
11 | test "decrypt uryyb by 13" { assert_eq(decrypt("uryyb", 13), "hello") }
   |                                                         ^^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:12:77
  in call to encrypt()
  hint: Check the function name
   |
12 | test "encrypt then decrypt roundtrip" { assert_eq(decrypt(encrypt("almide", 7), 7), "almide") }
   |                                                                             ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-3.almd:12:81
  in call to decrypt()
  hint: Check the function name
   |
12 | test "encrypt then decrypt roundtrip" { assert_eq(decrypt(encrypt("almide", 7), 7), "almide") }
   |                                                                                 ^

11 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
