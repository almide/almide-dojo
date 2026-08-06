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
            let new_code = (code - 97 + shift) % 26 + 97;
            string.from_codepoint(new_code)
        } else {
            c
        }
    })
}

fn decrypt(text: String, shift: Int) -> String {
    encrypt(text, 26 - shift)
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
fn encrypt(text: String, shift: Int) -> String = {
    string.map(text, (c) => {
        let code = string.codepoint(c);
        if (code >= 97 && code <= 122) {
            let new_code = (code - 97 + shift) % 26 + 97;
            string.from_codepoint(new_code)
        } else {
            c
        }
    })
}

fn decrypt(text: String, shift: Int) -> String = {
    encrypt(text, 26 - shift)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '&&' is not valid in Almide at line 4:24
  --> /tmp/dojo-caesar-cipher-1.almd:4:24
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |         if (code >= 97 && code <= 122) {
  |                        ^
error: Expected ')' to close function call opened at line 2:15
  --> /tmp/dojo-caesar-cipher-1.almd:7:11
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |     string.map(text, (c) => {
  |               --------------- '(' opened here
...
7 |         } else {
  |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:10:5
   |
10 |     })
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:8:13
  in variable c
  hint: Check the variable name
  |
8 |             c
  |             ^

4 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    string.map(text, (c) => {
        let code = string.codepoint(c);
        if (code >= 97 and code <= 122) {
            let new_code = (code - 97 + shift) % 26 + 97;
            string.from_codepoint(new_code)
        } else {
            c
        }
    })
}

fn decrypt(text: String, shift: Int) -> String = {
    encrypt(text, 26 - shift)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected Then at line 4:41 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:4:41
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |         if (code >= 97 and code <= 122) {
  |                                         ^
error: Expected ')' to close function call opened at line 2:15
  --> /tmp/dojo-caesar-cipher-2.almd:7:11
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |     string.map(text, (c) => {
  |               --------------- '(' opened here
...
7 |         } else {
  |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:10:5
   |
10 |     })
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:8:13
  in variable c
  hint: Check the variable name
  |
8 |             c
  |             ^

4 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    string.map(text, (c) => {
        let code = string.codepoint(c);
        if (code >= 97 and code <= 122) {
            let new_code = (code - 97 + shift) % 26 + 97;
            string.from_codepoint(new_code)
        } else {
            c
        }
    })
}

fn decrypt(text: String, shift: Int) -> String = {
    let shifted = 26 - shift;
    string.map(text, (c) => {
        let code = string.codepoint(c);
        if (code >= 97 and code <= 122) {
            let new_code = (code - 97 + shifted) % 26 + 97;
            string.from_codepoint(new_code)
        } else {
            c
        }
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected Then at line 4:41 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:4:41
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |         if (code >= 97 and code <= 122) {
  |                                         ^
error: Expected ')' to close function call opened at line 2:15
  --> /tmp/dojo-caesar-cipher-3.almd:7:11
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |     string.map(text, (c) => {
  |               --------------- '(' opened here
...
7 |         } else {
  |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:10:5
   |
10 |     })
   |     ^
error: Expected Then at line 17:41 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:17:41
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
17 |         if (code >= 97 and code <= 122) {
   |                                         ^
error: Expected ')' to close function call opened at line 15:15
  --> /tmp/dojo-caesar-cipher-3.almd:20:11
  hint: Add ')' or check for a missing delimiter inside the function call
   |
15 |     string.map(text, (c) => {
   |               --------------- '(' opened here
...
20 |         } else {
   |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:23:5
   |
23 |     })
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:8:13
  in variable c
  hint: Check the variable name
  |
8 |             c
  |             ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:21:13
  in variable c
  hint: Check the variable name
   |
21 |             c
   |             ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
