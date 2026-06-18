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
        let code = string.codepoint(c);
        if (code >= 97 && code <= 122) {
            (code - 97 + shift) % 26 + 97
        } else {
            code
        }
    }) |> string.from_codepoints
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

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
    let code = string.codepoint(c);
    if (code >= 97 && code <= 122) {
        (code - 97 + shift) % 26 + 97
    } else {
        code
    }
}) |> string.from_codepoints

fn decrypt(text: String, shift: Int) -> String = encrypt(text, -shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '&&' is not valid in Almide at line 3:20
  --> /tmp/dojo-caesar-cipher-1.almd:3:20
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
3 |     if (code >= 97 && code <= 122) {
  |                    ^
error: Expected ')' to close function call opened at line 1:60
  --> /tmp/dojo-caesar-cipher-1.almd:5:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
1 | fn encrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
  |                                                            --------------- '(' opened here
...
5 |     } else {
  |       ^^^^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
    let code = string.codepoint(c);
    if (code >= 97 and code <= 122) {
        (code - 97 + shift) % 26 + 97
    } else {
        code
    }
}) |> string.from_codepoints

fn decrypt(text: String, shift: Int) -> String = encrypt(text, -shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected Then at line 3:37 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:3:37
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if (code >= 97 and code <= 122) {
  |                                     ^
error: Expected ')' to close function call opened at line 1:60
  --> /tmp/dojo-caesar-cipher-2.almd:5:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
1 | fn encrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
  |                                                            --------------- '(' opened here
...
5 |     } else {
  |       ^^^^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
    let code = string.codepoint(c);
    if (code >= 97 and code <= 122) {
        (code - 97 + shift) % 26 + 97
    } else {
        code
    }
}) |> string.from_codepoints

fn decrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
    let code = string.codepoint(c);
    if (code >= 97 and code <= 122) {
        (code - 97 - shift + 26) % 26 + 97
    } else {
        code
    }
}) |> string.from_codepoints
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected Then at line 3:37 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:3:37
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if (code >= 97 and code <= 122) {
  |                                     ^
error: Expected ')' to close function call opened at line 1:60
  --> /tmp/dojo-caesar-cipher-3.almd:5:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
1 | fn encrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
  |                                                            --------------- '(' opened here
...
5 |     } else {
  |       ^^^^
error: Expected Then at line 12:37 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:12:37
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
12 |     if (code >= 97 and code <= 122) {
   |                                     ^
error: Expected ')' to close function call opened at line 10:60
  --> /tmp/dojo-caesar-cipher-3.almd:14:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
10 | fn decrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
   |                                                            --------------- '(' opened here
...
14 |     } else {
   |       ^^^^

4 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
