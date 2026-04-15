# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
  string.map(text, (c) => {
    if c >= 'a' && c <= 'z' then {
      let codepoint = string.codepoint(c) + shift
      if codepoint > 122 then
        string.from_codepoint(codepoint - 26)
      else
        string.from_codepoint(codepoint)
    } else {
      c
    }
  })
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
error: Missing '=' before function body at line 15:48
  --> /tmp/dojo-caesar-cipher-0.almd:15:48
  hint: Almide requires '=' before the body. Write: fn decrypt(...) -> Type = { ... }
   |
15 | fn decrypt(text: String, shift: Int) -> String {
   |                                                ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:19:52
  in call to encrypt()
  hint: Check the function name
   |
19 | test "encrypt abc by 1" { assert_eq(encrypt("abc", 1), "bcd") }
   |                                                    ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:20:52
  in call to encrypt()
  hint: Check the function name
   |
20 | test "encrypt xyz by 3" { assert_eq(encrypt("xyz", 3), "abc") }
   |                                                    ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:21:57
  in call to encrypt()
  hint: Check the function name
   |
21 | test "encrypt hello by 13" { assert_eq(encrypt("hello", 13), "uryyb") }
   |                                                         ^^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:22:77
  in call to encrypt()
  hint: Check the function name
   |
22 | test "encrypt preserves non-lowercase" { assert_eq(encrypt("Hello, World!", 5), "Hjqqt, Wtwqi!") }
   |                                                                             ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:23:61
  in call to encrypt()
  hint: Check the function name
   |
23 | test "encrypt by 0 is identity" { assert_eq(encrypt("test", 0), "test") }
   |                                                             ^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:24:62
  in call to encrypt()
  hint: Check the function name
   |
24 | test "encrypt by 26 is identity" { assert_eq(encrypt("test", 26), "test") }
   |                                                              ^^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:25:52
  in call to decrypt()
  hint: Check the function name
   |
25 | test "decrypt bcd by 1" { assert_eq(decrypt("bcd", 1), "abc") }
   |                                                    ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:26:52
  in call to decrypt()
  hint: Check the function name
   |
26 | test "decrypt abc by 3" { assert_eq(decrypt("abc", 3), "xyz") }
   |                                                    ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:27:57
  in call to decrypt()
  hint: Check the function name
   |
27 | test "decrypt uryyb by 13" { assert_eq(decrypt("uryyb", 13), "hello") }
   |                                                         ^^
error[E002]: undefined function 'encrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:28:77
  in call to encrypt()
  hint: Check the function name
   |
28 | test "encrypt then decrypt roundtrip" { assert_eq(decrypt(encrypt("almide", 7), 7), "almide") }
   |                                                                             ^
error[E002]: undefined function 'decrypt'
  --> /tmp/dojo-caesar-cipher-0.almd:28:81
  in call to decrypt()
  hint: Check the function name
   |
28 | test "encrypt then decrypt roundtrip" { assert_eq(decrypt(encrypt("almide", 7), 7), "almide") }
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
  string.map(text, (c) => {
    if c >= 'a' && c < 'z' then {
      let codepoint = string.codepoint(c) + shift
      if codepoint > 122 then
        string.from_codepoint(codepoint - 26)
      else
        string.from_codepoint(codepoint)
    } else {
      c
    }
  })
}

fn decrypt(text: String, shift: Int) -> String = {
  encrypt(text, -shift)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '&&' is not valid in Almide at line 3:17
  --> /tmp/dojo-caesar-cipher-1.almd:3:17
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
3 |     if c >= 'a' && c < 'z' then {
  |                 ^
error: Expected ')' to close function call opened at line 2:13
  --> /tmp/dojo-caesar-cipher-1.almd:9:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   string.map(text, (c) => {
  |             --------------- '(' opened here
...
9 |     } else {
  |       ^^^^
error: Expected ')' to close function call opened at line 2:13 at line 9:7
  --> /tmp/dojo-caesar-cipher-1.almd:2:13
  |
2 |   string.map(text, (c) => {
  |             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:12:3
   |
12 |   })
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:10:7
  in variable c
  hint: Check the variable name
   |
10 |       c
   |       ^

5 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  string.map(text, (c) => {
    if c >= 'a' && c <= 'z' then {
      let codepoint = string.codepoint(c) + shift
      if codepoint > 122 then
        string.from_codepoint(codepoint - 26)
      else
        string.from_codepoint(codepoint)
    } else {
      c
    }
  })
}

fn decrypt(text: String, shift: Int) -> String = {
  encrypt(text, -shift)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: '&&' is not valid in Almide at line 3:17
  --> /tmp/dojo-caesar-cipher-2.almd:3:17
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
3 |     if c >= 'a' && c <= 'z' then {
  |                 ^
error: Expected ')' to close function call opened at line 2:13
  --> /tmp/dojo-caesar-cipher-2.almd:9:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   string.map(text, (c) => {
  |             --------------- '(' opened here
...
9 |     } else {
  |       ^^^^
error: Expected ')' to close function call opened at line 2:13 at line 9:7
  --> /tmp/dojo-caesar-cipher-2.almd:2:13
  |
2 |   string.map(text, (c) => {
  |             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:12:3
   |
12 |   })
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:10:7
  in variable c
  hint: Check the variable name
   |
10 |       c
   |       ^

5 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  string.map(text, (c) => {
    if c >= 'a' && c < 'z' then {
      let codepoint = string.codepoint(c) + shift
      if codepoint > 122 then
        string.from_codepoint(codepoint - 26)
      else
        string.from_codepoint(codepoint)
    } else {
      c
    }
  })
}

fn decrypt(text: String, shift: Int) -> String = {
  let text_chars = string.chars(text)
  string.from_chars(text_chars.map((c) => {
    if c >= 'a' && c < 'z' then {
      let codepoint = string.codepoint(c) - shift
      if codepoint < 97 then
        string.from_codepoint(codepoint + 26)
      else
        string.from_codepoint(codepoint)
    } else {
      c
    }
  }))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: '&&' is not valid in Almide at line 3:17
  --> /tmp/dojo-caesar-cipher-3.almd:3:17
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
3 |     if c >= 'a' && c < 'z' then {
  |                 ^
error: Expected ')' to close function call opened at line 2:13
  --> /tmp/dojo-caesar-cipher-3.almd:9:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   string.map(text, (c) => {
  |             --------------- '(' opened here
...
9 |     } else {
  |       ^^^^
error: Expected ')' to close function call opened at line 2:13 at line 9:7
  --> /tmp/dojo-caesar-cipher-3.almd:2:13
  |
2 |   string.map(text, (c) => {
  |             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:12:3
   |
12 |   })
   |   ^
error: '&&' is not valid in Almide at line 18:17
  --> /tmp/dojo-caesar-cipher-3.almd:18:17
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
18 |     if c >= 'a' && c < 'z' then {
   |                 ^
error: Expected ')' to close function call opened at line 17:35
  --> /tmp/dojo-caesar-cipher-3.almd:24:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |   string.from_chars(text_chars.map((c) => {
   |                                   --------------- '(' opened here
...
24 |     } else {
   |       ^^^^
error: Expected ')' to close function call opened at line 17:35 at line 24:7
  --> /tmp/dojo-caesar-cipher-3.almd:17:35
   |
17 |   string.from_chars(text_chars.map((c) => {
   |                                   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 27:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:27:3
   |
27 |   }))
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:10:7
  in variable c
  hint: Check the variable name
   |
10 |       c
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:25:7
  in variable c
  hint: Check the variable name
   |
25 |       c
   |       ^

10 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
