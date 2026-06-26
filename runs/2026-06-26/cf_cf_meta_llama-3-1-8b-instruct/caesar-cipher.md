# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
    let chars = string.chars(text);
    let result = chars.map(
        (c) => {
            let codepoint = string.codepoint(c);
            if (codepoint >= 97 && codepoint <= 122) {
                let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
                string.from_codepoint(new_codepoint)
            } else {
                c
            }
        }
    ).join("");
    result
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
error: Missing '=' before function body at line 17:48
  --> /tmp/dojo-caesar-cipher-0.almd:17:48
  hint: Almide requires '=' before the body. Write: fn decrypt(...) -> Type = { ... }
   |
17 | fn decrypt(text: String, shift: Int) -> String {
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
    let chars = string.chars(text);
    let result = chars.map(
        (c) => {
            let codepoint = string.codepoint(c);
            if (codepoint >= 97 && codepoint <= 122) {
                let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
                string.from_codepoint(new_codepoint)
            } else {
                c
            }
        }
    ).join("");
    result
}

fn decrypt(text: String, shift: Int) -> String = {
    encrypt(text, 26 - shift)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '&&' is not valid in Almide at line 6:33
  --> /tmp/dojo-caesar-cipher-1.almd:6:33
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
6 |             if (codepoint >= 97 && codepoint <= 122) {
  |                                 ^
error: Expected ')' to close function call opened at line 3:27
  --> /tmp/dojo-caesar-cipher-1.almd:9:15
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |     let result = chars.map(
  |                           --------------- '(' opened here
...
9 |             } else {
  |               ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:9 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:12:9
   |
12 |         }
   |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:10:17
  in variable c
  hint: Check the variable name
   |
10 |                 c
   |                 ^

4 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let chars = string.chars(text);
    let result = chars.map(
        (c) => {
            let codepoint = string.codepoint(c);
            if (codepoint >= 97 and codepoint <= 122) {
                let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
                string.from_codepoint(new_codepoint)
            } else {
                c
            }
        }
    ).join("");
    result
}

fn decrypt(text: String, shift: Int) -> String = {
    encrypt(text, 26 - shift)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected Then at line 6:55 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:6:55
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |             if (codepoint >= 97 and codepoint <= 122) {
  |                                                       ^
error: Expected ')' to close function call opened at line 3:27
  --> /tmp/dojo-caesar-cipher-2.almd:9:15
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |     let result = chars.map(
  |                           --------------- '(' opened here
...
9 |             } else {
  |               ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:9 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:12:9
   |
12 |         }
   |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:10:17
  in variable c
  hint: Check the variable name
   |
10 |                 c
   |                 ^

4 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let chars = string.chars(text);
    let result = chars.map(
        (c) => {
            let codepoint = string.codepoint(c);
            if (codepoint >= 97 and codepoint <= 122) {
                let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
                string.from_codepoint(new_codepoint)
            } else {
                string.from_codepoint(codepoint)
            }
        }
    ).join("");
    result
}

fn decrypt(text: String, shift: Int) -> String = {
    let new_shift = 26 - shift;
    let chars = string.chars(text);
    let result = chars.map(
        (c) => {
            let codepoint = string.codepoint(c);
            if (codepoint >= 97 and codepoint <= 122) {
                let new_codepoint = (codepoint - 97 + new_shift) % 26 + 97;
                string.from_codepoint(new_codepoint)
            } else {
                string.from_codepoint(codepoint)
            }
        }
    ).join("");
    result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected Then at line 6:55 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:6:55
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |             if (codepoint >= 97 and codepoint <= 122) {
  |                                                       ^
error: Expected ')' to close function call opened at line 3:27
  --> /tmp/dojo-caesar-cipher-3.almd:9:15
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |     let result = chars.map(
  |                           --------------- '(' opened here
...
9 |             } else {
  |               ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:9 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:12:9
   |
12 |         }
   |         ^
error: Expected Then at line 23:55 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:23:55
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
23 |             if (codepoint >= 97 and codepoint <= 122) {
   |                                                       ^
error: Expected ')' to close function call opened at line 20:27
  --> /tmp/dojo-caesar-cipher-3.almd:26:15
  hint: Add ')' or check for a missing delimiter inside the function call
   |
20 |     let result = chars.map(
   |                           --------------- '(' opened here
...
26 |             } else {
   |               ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 29:9 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:29:9
   |
29 |         }
   |         ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-3.almd:10:39
  in variable codepoint
  hint: Check the variable name
   |
10 |                 string.from_codepoint(codepoint)
   |                                       ^^^^^^^^^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-3.almd:27:39
  in variable codepoint
  hint: Check the variable name
   |
27 |                 string.from_codepoint(codepoint)
   |                                       ^^^^^^^^^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
