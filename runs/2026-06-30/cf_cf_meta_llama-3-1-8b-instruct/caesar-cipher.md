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
        let codepoint = string.codepoint(c);
        if (codepoint >= 97 && codepoint <= 122) {
            let new_codepoint = ((codepoint - 97 + shift) % 26) + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    })
}

fn decrypt(text: String, shift: Int) -> String {
    string.map(text, (c) => {
        let codepoint = string.codepoint(c);
        if (codepoint >= 97 && codepoint <= 122) {
            let new_codepoint = ((codepoint - 97 - shift + 26) % 26) + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    })
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
error: Missing '=' before function body at line 13:48
  --> /tmp/dojo-caesar-cipher-0.almd:13:48
  hint: Almide requires '=' before the body. Write: fn decrypt(...) -> Type = { ... }
   |
13 | fn decrypt(text: String, shift: Int) -> String {
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
    let codepoint = string.codepoint(c);
    if (codepoint >= 97 && codepoint <= 122) {
        let new_codepoint = ((codepoint - 97 + shift) % 26) + 97;
        string.from_codepoint(new_codepoint)
    } else {
        c
    }
})

fn decrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97 && codepoint <= 122) {
        let new_codepoint = ((codepoint - 97 - shift + 26) % 26) + 97;
        string.from_codepoint(new_codepoint)
    } else {
        c
    }
})
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '&&' is not valid in Almide at line 3:25
  --> /tmp/dojo-caesar-cipher-1.almd:3:25
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
3 |     if (codepoint >= 97 && codepoint <= 122) {
  |                         ^
error: Expected ')' to close function call opened at line 1:60
  --> /tmp/dojo-caesar-cipher-1.almd:6:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
1 | fn encrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
  |                                                            --------------- '(' opened here
...
6 |     } else {
  |       ^^^^
error: '&&' is not valid in Almide at line 13:25
  --> /tmp/dojo-caesar-cipher-1.almd:13:25
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
13 |     if (codepoint >= 97 && codepoint <= 122) {
   |                         ^
error: Expected ')' to close function call opened at line 11:60
  --> /tmp/dojo-caesar-cipher-1.almd:16:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
11 | fn decrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
   |                                                            --------------- '(' opened here
...
16 |     } else {
   |       ^^^^

4 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97 and codepoint <= 122) {
        let new_codepoint = ((codepoint - 97 + shift) % 26) + 97;
        string.from_codepoint(new_codepoint)
    } else {
        c
    }
})

fn decrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97 and codepoint <= 122) {
        let new_codepoint = ((codepoint - 97 - shift + 26) % 26) + 97;
        string.from_codepoint(new_codepoint)
    } else {
        c
    }
})
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected Then at line 3:47 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:3:47
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if (codepoint >= 97 and codepoint <= 122) {
  |                                               ^
error: Expected ')' to close function call opened at line 1:60
  --> /tmp/dojo-caesar-cipher-2.almd:6:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
1 | fn encrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
  |                                                            --------------- '(' opened here
...
6 |     } else {
  |       ^^^^
error: Expected Then at line 13:47 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:13:47
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
13 |     if (codepoint >= 97 and codepoint <= 122) {
   |                                               ^
error: Expected ')' to close function call opened at line 11:60
  --> /tmp/dojo-caesar-cipher-2.almd:16:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
11 | fn decrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
   |                                                            --------------- '(' opened here
...
16 |     } else {
   |       ^^^^

4 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97 and codepoint <= 122) {
        let new_codepoint = ((codepoint - 97 + shift) % 26) + 97;
        string.from_codepoint(new_codepoint)
    } else {
        c
    }
})

fn decrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97 and codepoint <= 122) {
        let new_codepoint = ((codepoint - 97 - shift + 26) % 26) + 97;
        string.from_codepoint(new_codepoint)
    } else {
        c
    }
})
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected Then at line 3:47 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:3:47
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if (codepoint >= 97 and codepoint <= 122) {
  |                                               ^
error: Expected ')' to close function call opened at line 1:60
  --> /tmp/dojo-caesar-cipher-3.almd:6:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
1 | fn encrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
  |                                                            --------------- '(' opened here
...
6 |     } else {
  |       ^^^^
error: Expected Then at line 13:47 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:13:47
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
13 |     if (codepoint >= 97 and codepoint <= 122) {
   |                                               ^
error: Expected ')' to close function call opened at line 11:60
  --> /tmp/dojo-caesar-cipher-3.almd:16:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
11 | fn decrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
   |                                                            --------------- '(' opened here
...
16 |     } else {
   |       ^^^^

4 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
