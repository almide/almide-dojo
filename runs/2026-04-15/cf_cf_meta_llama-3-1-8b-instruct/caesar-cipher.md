# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let chars = text.chars();
  let encrypted = chars.map((c) => {
    if c >= 'a' && c <= 'z' then {
      let codepoint = string.codepoint(c);
      let shifted = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(shifted)
    } else {
      c
    }
  });
  string.from_chars(encrypted)
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = text.chars();
  let decrypted = chars.map((c) => {
    if c >= 'a' && c <= 'z' then {
      let codepoint = string.codepoint(c);
      let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
      string.from_codepoint(shifted)
    } else {
      c
    }
  });
  string.from_chars(decrypted)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: '&&' is not valid in Almide at line 4:17
  --> /tmp/dojo-caesar-cipher-0.almd:4:17
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |     if c >= 'a' && c <= 'z' then {
  |                 ^
error: Expected ')' to close function call opened at line 3:28
  --> /tmp/dojo-caesar-cipher-0.almd:8:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   let encrypted = chars.map((c) => {
  |                            --------------- '(' opened here
...
8 |     } else {
  |       ^^^^
error: Expected ')' to close function call opened at line 3:28 at line 8:7
  --> /tmp/dojo-caesar-cipher-0.almd:3:28
  |
3 |   let encrypted = chars.map((c) => {
  |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-0.almd:11:3
   |
11 |   });
   |   ^
error: '&&' is not valid in Almide at line 18:17
  --> /tmp/dojo-caesar-cipher-0.almd:18:17
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
18 |     if c >= 'a' && c <= 'z' then {
   |                 ^
error: Expected ')' to close function call opened at line 17:28
  --> /tmp/dojo-caesar-cipher-0.almd:22:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |   let decrypted = chars.map((c) => {
   |                            --------------- '(' opened here
...
22 |     } else {
   |       ^^^^
error: Expected ')' to close function call opened at line 17:28 at line 22:7
  --> /tmp/dojo-caesar-cipher-0.almd:17:28
   |
17 |   let decrypted = chars.map((c) => {
   |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 25:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-0.almd:25:3
   |
25 |   });
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:9:7
  in variable c
  hint: Check the variable name
  |
9 |       c
  |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:23:7
  in variable c
  hint: Check the variable name
   |
23 |       c
   |       ^

10 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let chars = text.chars();
  let encrypted = chars.map((c) => {
    if c >= 'a' and c < 'z' then {
      let codepoint = string.codepoint(c);
      let shifted = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(shifted)
    } else {
      c
    }
  });
  string.from_chars(encrypted)
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = text.chars();
  let decrypted = chars.map((c) => {
    if c >= 'a' and c < 'z' then {
      let codepoint = string.codepoint(c);
      let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
      string.from_codepoint(shifted)
    } else {
      c
    }
  });
  string.from_chars(decrypted)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:34
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |       let shifted = (codepoint - 97 + shift) % 26 + 97;
  |                                  ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:39
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |       let shifted = (codepoint - 97 + shift) % 26 + 97;
  |                                       ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:48
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |       let shifted = (codepoint - 97 + shift) % 26 + 97;
  |                                                ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:53
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |       let shifted = (codepoint - 97 + shift) % 26 + 97;
  |                                                     ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:7:29
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |       string.from_codepoint(shifted)
  |                             ^^^^^^^
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-caesar-cipher-1.almd:12:21
  in call to string.from_chars()
  hint: No function 'from_chars' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |   string.from_chars(encrypted)
   |                     ^^^^^^^^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:34
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |       let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                  ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:39
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |       let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                       ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:47
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |       let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                               ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:53
  in operator %
  hint: Use numeric types (Int or Float)
   |
20 |       let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                     ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:58
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |       let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                          ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:21:29
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
21 |       string.from_codepoint(shifted)
   |                             ^^^^^^^
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-caesar-cipher-1.almd:26:21
  in call to string.from_chars()
  hint: No function 'from_chars' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
26 |   string.from_chars(decrypted)
   |                     ^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:7:29
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |       string.from_codepoint(shifted)
  |                             ^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:21:29
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
21 |       string.from_codepoint(shifted)
   |                             ^^^^^^^

15 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let chars = text.chars();
  let encrypted = chars.map((c) => {
    if c >= 'a' and c <'z' then {
      let codepoint = string.codepoint(c);
      let shifted = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(shifted)
    } else {
      c
    }
  });
  string.from_chars(encrypted)
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = text.chars();
  let decrypted = chars.map((c) => {
    if c >= 'a' and c <'z' then {
      let codepoint = string.codepoint(c);
      let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
      string.from_codepoint(shifted)
    } else {
      c
    }
  });
  string.from_chars(decrypted)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:34
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |       let shifted = (codepoint - 97 + shift) % 26 + 97;
  |                                  ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:39
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |       let shifted = (codepoint - 97 + shift) % 26 + 97;
  |                                       ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:48
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |       let shifted = (codepoint - 97 + shift) % 26 + 97;
  |                                                ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:53
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |       let shifted = (codepoint - 97 + shift) % 26 + 97;
  |                                                     ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:7:29
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |       string.from_codepoint(shifted)
  |                             ^^^^^^^
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-caesar-cipher-2.almd:12:21
  in call to string.from_chars()
  hint: No function 'from_chars' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |   string.from_chars(encrypted)
   |                     ^^^^^^^^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:20:34
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |       let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                  ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:20:39
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |       let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                       ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:20:47
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |       let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                               ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:20:53
  in operator %
  hint: Use numeric types (Int or Float)
   |
20 |       let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                     ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:20:58
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |       let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                          ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:21:29
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
21 |       string.from_codepoint(shifted)
   |                             ^^^^^^^
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-caesar-cipher-2.almd:26:21
  in call to string.from_chars()
  hint: No function 'from_chars' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
26 |   string.from_chars(decrypted)
   |                     ^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:7:29
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |       string.from_codepoint(shifted)
  |                             ^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:21:29
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
21 |       string.from_codepoint(shifted)
   |                             ^^^^^^^

15 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let chars = text.chars();
  let encrypted = chars.map((c) => {
    if c >= 'a' and c <= 'z' then {
      let codepoint = string.codepoint(c);
      let shifted = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(shifted)
    } else {
      c
    }
  });
  string.from_chars(encrypted)
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = text.chars();
  let decrypted = chars.map((c) => {
    if c >= 'a' and c <= 'z' then {
      let codepoint = string.codepoint(c);
      let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
      string.from_codepoint(shifted)
    } else {
      c
    }
  });
  string.from_chars(decrypted)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:34
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |       let shifted = (codepoint - 97 + shift) % 26 + 97;
  |                                  ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:39
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |       let shifted = (codepoint - 97 + shift) % 26 + 97;
  |                                       ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:48
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |       let shifted = (codepoint - 97 + shift) % 26 + 97;
  |                                                ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:53
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |       let shifted = (codepoint - 97 + shift) % 26 + 97;
  |                                                     ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:7:29
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |       string.from_codepoint(shifted)
  |                             ^^^^^^^
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-caesar-cipher-3.almd:12:21
  in call to string.from_chars()
  hint: No function 'from_chars' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |   string.from_chars(encrypted)
   |                     ^^^^^^^^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:20:34
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |       let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                  ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:20:39
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |       let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                       ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:20:47
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |       let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                               ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:20:53
  in operator %
  hint: Use numeric types (Int or Float)
   |
20 |       let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                     ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:20:58
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |       let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                          ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:21:29
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
21 |       string.from_codepoint(shifted)
   |                             ^^^^^^^
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-caesar-cipher-3.almd:26:21
  in call to string.from_chars()
  hint: No function 'from_chars' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
26 |   string.from_chars(decrypted)
   |                     ^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:7:29
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |       string.from_codepoint(shifted)
  |                             ^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:21:29
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
21 |       string.from_codepoint(shifted)
   |                             ^^^^^^^

15 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
