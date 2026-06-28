# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
    string.map(text, (c) => {
        match string.codepoint(c) {
            some(codepoint) => {
                let base = if codepoint >= 97 && codepoint <= 122 then 97 else codepoint;
                let shifted = (base + shift) % 26 + 97;
                string.from_codepoint(shifted)
            },
            none => c
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
error: Missing '=' before function body at line 14:48
  --> /tmp/dojo-caesar-cipher-0.almd:14:48
  hint: Almide requires '=' before the body. Write: fn decrypt(...) -> Type = { ... }
   |
14 | fn decrypt(text: String, shift: Int) -> String {
   |                                                ^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    string.map(text, (c) => {
        match string.codepoint(c) {
            some(codepoint) => {
                let base = if codepoint >= 97 && codepoint <= 122 then 97 else codepoint;
                let shifted = (base + shift) % 26 + 97;
                string.from_codepoint(shifted)
            },
            none => c
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
error: '&&' is not valid in Almide at line 5:47
  --> /tmp/dojo-caesar-cipher-1.almd:5:47
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |                 let base = if codepoint >= 97 && codepoint <= 122 then 97 else codepoint;
  |                                               ^
error[E003]: undefined variable 'base'
  --> /tmp/dojo-caesar-cipher-1.almd:6:32
  in variable base
  hint: Check the variable name
  |
6 |                 let shifted = (base + shift) % 26 + 97;
  |                                ^^^^
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-caesar-cipher-1.almd:9:21
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
9 |             none => c
  |                     ^

3 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    string.map(text, (c) => {
        match string.codepoint(c) {
            some(codepoint) => {
                let base = if codepoint >= 97 and codepoint <= 122 then 97 else codepoint;
                let shifted = (base + shift) % 26 + 97;
                string.from_codepoint(shifted)
            },
            none => c
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
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-caesar-cipher-2.almd:9:21
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
9 |             none => c
  |                     ^

1 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    string.map(text, (c) => {
        match string.codepoint(c) {
            some(codepoint) => {
                let base = if codepoint >= 97 and codepoint <= 122 then 97 else codepoint;
                let shifted = (base + shift) % 26 + 97;
                string.from_codepoint(shifted)
            },
            none => c
        }
    })
}

fn decrypt(text: String, shift: Int) -> String = {
    encrypt(text, -shift)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-caesar-cipher-3.almd:9:21
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
9 |             none => c
  |                     ^

1 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
