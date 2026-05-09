# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
    let result = string.chars(text)
        .map(|c| match string.codepoint(c) {
            code if code >= 97 && code <= 122 => {
                let new_code = (code - 97 + shift) % 26 + 97;
                string.from_codepoint(new_code)
            }
            _ => c
        })
        .join("");
    result
}

fn decrypt(text: String, shift: Int) -> String {
    let result = string.chars(text)
        .map(|c| match string.codepoint(c) {
            code if code >= 97 && code <= 122 => {
                let new_code = (code - 97 - shift + 26) % 26 + 97;
                string.from_codepoint(new_code)
            }
            _ => c
        })
        .join("");
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
    let result = string.chars(text)
        .map(|c| match string.codepoint(c) {
            code if code >= 97 && code < 122 => {
                let new_code = (code - 97 + shift) % 26 + 97;
                string.from_codepoint(new_code)
            }
            _ => c
        })
        .join("");
    result
}

fn decrypt(text: String, shift: Int) -> String = {
    let result = string.chars(text)
        .map(|c| match string.codepoint(c) {
            code if code >= 97 && code < 122 => {
                let new_code = (code - 97 - shift + 26) % 26 + 97;
                string.from_codepoint(new_code)
            }
            _ => c
        })
        .join("");
    result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Expected expression at line 3:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-1.almd:3:9
  |
3 |         .map(|c| match string.codepoint(c) {
  |         ^
error: '&&' is not valid in Almide at line 4:32
  --> /tmp/dojo-caesar-cipher-1.almd:4:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |             code if code >= 97 && code < 122 => {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:13 (got Underscore '_')
  --> /tmp/dojo-caesar-cipher-1.almd:8:13
  |
8 |             _ => c
  |             ^
error: Expected expression at line 16:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-1.almd:16:9
   |
16 |         .map(|c| match string.codepoint(c) {
   |         ^
error: '&&' is not valid in Almide at line 17:32
  --> /tmp/dojo-caesar-cipher-1.almd:17:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
17 |             code if code >= 97 && code < 122 => {
   |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 21:13 (got Underscore '_')
  --> /tmp/dojo-caesar-cipher-1.almd:21:13
   |
21 |             _ => c
   |             ^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-1.almd:4:13
  in variable code
  hint: Check the variable name
  |
4 |             code if code >= 97 && code < 122 => {
  |             ^^^^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-1.almd:5:33
  in variable code
  hint: Check the variable name
  |
5 |                 let new_code = (code - 97 + shift) % 26 + 97;
  |                                 ^^^^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-1.almd:17:13
  in variable code
  hint: Check the variable name
   |
17 |             code if code >= 97 && code < 122 => {
   |             ^^^^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-1.almd:18:33
  in variable code
  hint: Check the variable name
   |
18 |                 let new_code = (code - 97 - shift + 26) % 26 + 97;
   |                                 ^^^^

10 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let result = string.chars(text)
        .map(|c| match string.codepoint(c) {
            code if code >= 97 && code < 123 => {
                let new_code = (code - 97 + shift) % 26 + 97;
                string.from_codepoint(new_code)
            }
            _ => c
        })
        .join("");
    result
}

fn decrypt(text: String, shift: Int) -> String = {
    let result = string.chars(text)
        .map(|c| match string.codepoint(c) {
            code if code >= 97 && code < 123 => {
                let new_code = (code - 97 - shift + 26) % 26 + 97;
                string.from_codepoint(new_code)
            }
            _ => c
        })
        .join("");
    result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected expression at line 3:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-2.almd:3:9
  |
3 |         .map(|c| match string.codepoint(c) {
  |         ^
error: '&&' is not valid in Almide at line 4:32
  --> /tmp/dojo-caesar-cipher-2.almd:4:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |             code if code >= 97 && code < 123 => {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:13 (got Underscore '_')
  --> /tmp/dojo-caesar-cipher-2.almd:8:13
  |
8 |             _ => c
  |             ^
error: Expected expression at line 16:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-2.almd:16:9
   |
16 |         .map(|c| match string.codepoint(c) {
   |         ^
error: '&&' is not valid in Almide at line 17:32
  --> /tmp/dojo-caesar-cipher-2.almd:17:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
17 |             code if code >= 97 && code < 123 => {
   |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 21:13 (got Underscore '_')
  --> /tmp/dojo-caesar-cipher-2.almd:21:13
   |
21 |             _ => c
   |             ^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-2.almd:4:13
  in variable code
  hint: Check the variable name
  |
4 |             code if code >= 97 && code < 123 => {
  |             ^^^^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-2.almd:5:33
  in variable code
  hint: Check the variable name
  |
5 |                 let new_code = (code - 97 + shift) % 26 + 97;
  |                                 ^^^^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-2.almd:17:13
  in variable code
  hint: Check the variable name
   |
17 |             code if code >= 97 && code < 123 => {
   |             ^^^^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-2.almd:18:33
  in variable code
  hint: Check the variable name
   |
18 |                 let new_code = (code - 97 - shift + 26) % 26 + 97;
   |                                 ^^^^

10 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let result = string.chars(text)
        .map(|c| match string.codepoint(c) {
            code if code >= 97 && code < 123 => {
                let new_code = (code - 97 + shift) % 26 + 97;
                string.from_codepoint(new_code)
            }
            _ => c
        })
        .join("");
    result
}

fn decrypt(text: String, shift: Int) -> String = {
    let result = string.chars(text)
        .map(|c| match string.codepoint(c) {
            code if code >= 97 && code < 123 => {
                let new_code = (code - 97 - shift + 26) % 26 + 97;
                string.from_codepoint(new_code)
            }
            _ => c
        })
        .join("");
    result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected expression at line 3:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-3.almd:3:9
  |
3 |         .map(|c| match string.codepoint(c) {
  |         ^
error: '&&' is not valid in Almide at line 4:32
  --> /tmp/dojo-caesar-cipher-3.almd:4:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |             code if code >= 97 && code < 123 => {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:13 (got Underscore '_')
  --> /tmp/dojo-caesar-cipher-3.almd:8:13
  |
8 |             _ => c
  |             ^
error: Expected expression at line 16:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-3.almd:16:9
   |
16 |         .map(|c| match string.codepoint(c) {
   |         ^
error: '&&' is not valid in Almide at line 17:32
  --> /tmp/dojo-caesar-cipher-3.almd:17:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
17 |             code if code >= 97 && code < 123 => {
   |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 21:13 (got Underscore '_')
  --> /tmp/dojo-caesar-cipher-3.almd:21:13
   |
21 |             _ => c
   |             ^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-3.almd:4:13
  in variable code
  hint: Check the variable name
  |
4 |             code if code >= 97 && code < 123 => {
  |             ^^^^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-3.almd:5:33
  in variable code
  hint: Check the variable name
  |
5 |                 let new_code = (code - 97 + shift) % 26 + 97;
  |                                 ^^^^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-3.almd:17:13
  in variable code
  hint: Check the variable name
   |
17 |             code if code >= 97 && code < 123 => {
   |             ^^^^
error[E003]: undefined variable 'code'
  --> /tmp/dojo-caesar-cipher-3.almd:18:33
  in variable code
  hint: Check the variable name
   |
18 |                 let new_code = (code - 97 - shift + 26) % 26 + 97;
   |                                 ^^^^

10 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
