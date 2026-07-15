# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.map(text, (c) => {
    val code = string.codepoint(c)
    if (97 <= code && code <= 122) {
      (code - 97 + shift) % 26 + 97
    } else {
      code
    }
  }) |> string.from_codepoint

fn decrypt(text: String, shift: Int) -> String =
  encrypt(text, -shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: '&&' is not valid in Almide at line 4:20
  --> /tmp/dojo-caesar-cipher-0.almd:4:20
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |     if (97 <= code && code <= 122) {
  |                    ^
error: Expected ')' to close function call opened at line 2:13
  --> /tmp/dojo-caesar-cipher-0.almd:6:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   string.map(text, (c) => {
  |             --------------- '(' opened here
...
6 |     } else {
  |       ^^^^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.map(text, (c) => {
    val code = string.codepoint(c)
    if (97 <= code and code <= 122) {
      (code - 97 + shift) % 26 + 97
    } else {
      code
    }
  }) |> string.from_codepoint

fn decrypt(text: String, shift: Int) -> String =
  encrypt(text, -shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Expected Then at line 4:37 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-1.almd:4:37
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |     if (97 <= code and code <= 122) {
  |                                     ^
error: Expected ')' to close function call opened at line 2:13
  --> /tmp/dojo-caesar-cipher-1.almd:6:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   string.map(text, (c) => {
  |             --------------- '(' opened here
...
6 |     } else {
  |       ^^^^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.map(text, (c) => {
    val code = string.codepoint(c)
    if (97 <= code and code <= 122) then
      (code - 97 + shift) % 26 + 97
    else
      code
  }) |> string.from_codepoint

fn decrypt(text: String, shift: Int) -> String =
  encrypt(text, -shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error[E003]: undefined variable 'val'
  --> /tmp/dojo-caesar-cipher-2.almd:3:5
  in variable val
  hint: Check the variable name
  |
3 |     val code = string.codepoint(c)
  |     ^^^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-2.almd:4:15
  in variable code
  hint: Check the variable name
  |
4 |     if (97 <= code and code <= 122) then
  |               ^^^^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-2.almd:4:24
  in variable code
  hint: Check the variable name
  |
4 |     if (97 <= code and code <= 122) then
  |                        ^^^^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-2.almd:5:8
  in variable code
  hint: Check the variable name
  |
5 |       (code - 97 + shift) % 26 + 97
  |        ^^^^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-2.almd:7:7
  in variable code
  hint: Check the variable name
  |
7 |       code
  |       ^^^^
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-caesar-cipher-2.almd:7:7
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
7 |       code
  |       ^^^^

6 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.map(text, (c) => {
    val codepoint = string.codepoint(c)
    if (97 <= codepoint and codepoint <= 122) then
      (codepoint - 97 + shift) % 26 + 97
    else
      codepoint
  }) |> string.from_codepoint

fn decrypt(text: String, shift: Int) -> String =
  encrypt(text, -shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error[E003]: undefined variable 'val'
  --> /tmp/dojo-caesar-cipher-3.almd:3:5
  in variable val
  hint: Check the variable name
  |
3 |     val codepoint = string.codepoint(c)
  |     ^^^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-3.almd:4:15
  in variable codepoint
  hint: Check the variable name
  |
4 |     if (97 <= codepoint and codepoint <= 122) then
  |               ^^^^^^^^^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-3.almd:4:29
  in variable codepoint
  hint: Check the variable name
  |
4 |     if (97 <= codepoint and codepoint <= 122) then
  |                             ^^^^^^^^^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-3.almd:5:8
  in variable codepoint
  hint: Check the variable name
  |
5 |       (codepoint - 97 + shift) % 26 + 97
  |        ^^^^^^^^^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-3.almd:7:7
  in variable codepoint
  hint: Check the variable name
  |
7 |       codepoint
  |       ^^^^^^^^^
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-caesar-cipher-3.almd:7:7
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
7 |       codepoint
  |       ^^^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
