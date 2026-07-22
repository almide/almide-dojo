# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
    let result = string.map(text, (c) => {
        let codepoint = string.codepoint(c);
        if (codepoint >= 97 && codepoint <= 122) {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    });
    result
}

fn decrypt(text: String, shift: Int) -> String {
    let result = string.map(text, (c) => {
        let codepoint = string.codepoint(c);
        if (codepoint >= 97 && codepoint <= 122) {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    });
    result
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
    let result = string.map(text, (c) => {
        let codepoint = string.codepoint(c);
        if (codepoint >= 97 && codepoint <= 122) {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    });
    result
}

fn decrypt(text: String, shift: Int) -> String = {
    let result = string.map(text, (c) => {
        let codepoint = string.codepoint(c);
        if (codepoint >= 97 && codepoint <= 122) {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    });
    result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '&&' is not valid in Almide at line 4:29
  --> /tmp/dojo-caesar-cipher-1.almd:4:29
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |         if (codepoint >= 97 && codepoint <= 122) {
  |                             ^
error: Expected ')' to close function call opened at line 2:28
  --> /tmp/dojo-caesar-cipher-1.almd:7:11
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |     let result = string.map(text, (c) => {
  |                            --------------- '(' opened here
...
7 |         } else {
  |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:10:5
   |
10 |     });
   |     ^
error: '&&' is not valid in Almide at line 17:29
  --> /tmp/dojo-caesar-cipher-1.almd:17:29
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
17 |         if (codepoint >= 97 && codepoint <= 122) {
   |                             ^
error: Expected ')' to close function call opened at line 15:28
  --> /tmp/dojo-caesar-cipher-1.almd:20:11
  hint: Add ')' or check for a missing delimiter inside the function call
   |
15 |     let result = string.map(text, (c) => {
   |                            --------------- '(' opened here
...
20 |         } else {
   |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:23:5
   |
23 |     });
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:8:13
  in variable c
  hint: Check the variable name
  |
8 |             c
  |             ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:21:13
  in variable c
  hint: Check the variable name
   |
21 |             c
   |             ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let result = string.map(text, (c) => {
        let codepoint = string.codepoint(c);
        if (codepoint >= 97 and codepoint <= 122) {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    });
    result
}

fn decrypt(text: String, shift: Int) -> String = {
    let result = string.map(text, (c) => {
        let codepoint = string.codepoint(c);
        if (codepoint >= 97 and codepoint <= 122) {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    });
    result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected Then at line 4:51 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:4:51
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |         if (codepoint >= 97 and codepoint <= 122) {
  |                                                   ^
error: Expected ')' to close function call opened at line 2:28
  --> /tmp/dojo-caesar-cipher-2.almd:7:11
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |     let result = string.map(text, (c) => {
  |                            --------------- '(' opened here
...
7 |         } else {
  |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:10:5
   |
10 |     });
   |     ^
error: Expected Then at line 17:51 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:17:51
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
17 |         if (codepoint >= 97 and codepoint <= 122) {
   |                                                   ^
error: Expected ')' to close function call opened at line 15:28
  --> /tmp/dojo-caesar-cipher-2.almd:20:11
  hint: Add ')' or check for a missing delimiter inside the function call
   |
15 |     let result = string.map(text, (c) => {
   |                            --------------- '(' opened here
...
20 |         } else {
   |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:23:5
   |
23 |     });
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:8:13
  in variable c
  hint: Check the variable name
  |
8 |             c
  |             ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:21:13
  in variable c
  hint: Check the variable name
   |
21 |             c
   |             ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let result = string.map(text, (c) => {
        let codepoint = string.codepoint(c);
        if (codepoint >= 97 and codepoint <= 122) {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    });
    result
}

fn decrypt(text: String, shift: Int) -> String = {
    let result = string.map(text, (c) => {
        let codepoint = string.codepoint(c);
        if (codepoint >= 97 and codepoint <= 122) {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint)
        } else {
            c
        }
    });
    result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected Then at line 4:51 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:4:51
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |         if (codepoint >= 97 and codepoint <= 122) {
  |                                                   ^
error: Expected ')' to close function call opened at line 2:28
  --> /tmp/dojo-caesar-cipher-3.almd:7:11
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |     let result = string.map(text, (c) => {
  |                            --------------- '(' opened here
...
7 |         } else {
  |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:10:5
   |
10 |     });
   |     ^
error: Expected Then at line 17:51 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:17:51
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
17 |         if (codepoint >= 97 and codepoint <= 122) {
   |                                                   ^
error: Expected ')' to close function call opened at line 15:28
  --> /tmp/dojo-caesar-cipher-3.almd:20:11
  hint: Add ')' or check for a missing delimiter inside the function call
   |
15 |     let result = string.map(text, (c) => {
   |                            --------------- '(' opened here
...
20 |         } else {
   |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:23:5
   |
23 |     });
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
