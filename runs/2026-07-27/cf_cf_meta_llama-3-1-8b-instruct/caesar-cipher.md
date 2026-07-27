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
  let shifted_chars = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  });
  string.join(shifted_chars, "")
}

fn decrypt(text: String, shift: Int) -> String {
  let chars = string.chars(text);
  let decrypted_chars = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      let new_codepoint = ((codepoint - 97 - shift + 26) % 26 + 97);
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  });
  string.join(decrypted_chars, "")
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
  let shifted_chars = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  });
  string.join(shifted_chars, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let decrypted_chars = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      let new_codepoint = ((codepoint - 97 - shift + 26) % 26 + 97);
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  });
  string.join(decrypted_chars, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '&&' is not valid in Almide at line 5:24
  --> /tmp/dojo-caesar-cipher-1.almd:5:24
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |     if codepoint >= 97 && codepoint <= 122 {
  |                        ^
error: Expected ')' to close function call opened at line 3:32
  --> /tmp/dojo-caesar-cipher-1.almd:8:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   let shifted_chars = chars.map((c) => {
  |                                --------------- '(' opened here
...
8 |     } else {
  |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:11:3
   |
11 |   });
   |   ^
error: '&&' is not valid in Almide at line 19:24
  --> /tmp/dojo-caesar-cipher-1.almd:19:24
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
19 |     if codepoint >= 97 && codepoint <= 122 {
   |                        ^
error: Expected ')' to close function call opened at line 17:34
  --> /tmp/dojo-caesar-cipher-1.almd:22:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |   let decrypted_chars = chars.map((c) => {
   |                                  --------------- '(' opened here
...
22 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 25:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:25:3
   |
25 |   });
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:9:7
  in variable c
  hint: Check the variable name
  |
9 |       c
  |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:23:7
  in variable c
  hint: Check the variable name
   |
23 |       c
   |       ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let shifted_chars = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97) and (codepoint <= 122) {
      let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  });
  string.join(shifted_chars, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let decrypted_chars = chars.map((char) => {
    let codepoint = string.codepoint(char);
    if (codepoint >= 97) and (codepoint <= 122) {
      let new_codepoint = ((codepoint - 97 - shift + 26) % 26 + 97);
      string.from_codepoint(new_codepoint)
    } else {
      char
    }
  });
  string.join(decrypted_chars, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected Then at line 5:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:5:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |     if (codepoint >= 97) and (codepoint <= 122) {
  |                                                 ^
error: Expected ')' to close function call opened at line 3:32
  --> /tmp/dojo-caesar-cipher-2.almd:8:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   let shifted_chars = chars.map((c) => {
  |                                --------------- '(' opened here
...
8 |     } else {
  |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:11:3
   |
11 |   });
   |   ^
error: Expected Then at line 19:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:19:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
19 |     if (codepoint >= 97) and (codepoint <= 122) {
   |                                                 ^
error: Expected ')' to close function call opened at line 17:34
  --> /tmp/dojo-caesar-cipher-2.almd:22:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |   let decrypted_chars = chars.map((char) => {
   |                                  --------------- '(' opened here
...
22 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 25:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:25:3
   |
25 |   });
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:9:7
  in variable c
  hint: Check the variable name
  |
9 |       c
  |       ^
error[E003]: undefined variable 'char'
  --> /tmp/dojo-caesar-cipher-2.almd:23:7
  in variable char
  hint: Did you mean `chars`?
  try:
      // char  →  chars
      chars
   |
23 |       char
   |       ^^^^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let shifted_chars = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97) and (codepoint <= 122) {
      let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  });
  string.join(shifted_chars, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let decrypted_chars = chars.map((char) => {
    let codepoint = string.codepoint(char);
    if (codepoint >= 97) and (codepoint <= 122) {
      let new_codepoint = ((codepoint - 97 - shift + 26) % 26 + 97);
      string.from_codepoint(new_codepoint)
    } else {
      char
    }
  });
  string.join(decrypted_chars, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected Then at line 5:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:5:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |     if (codepoint >= 97) and (codepoint <= 122) {
  |                                                 ^
error: Expected ')' to close function call opened at line 3:32
  --> /tmp/dojo-caesar-cipher-3.almd:8:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   let shifted_chars = chars.map((c) => {
  |                                --------------- '(' opened here
...
8 |     } else {
  |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:11:3
   |
11 |   });
   |   ^
error: Expected Then at line 19:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:19:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
19 |     if (codepoint >= 97) and (codepoint <= 122) {
   |                                                 ^
error: Expected ')' to close function call opened at line 17:34
  --> /tmp/dojo-caesar-cipher-3.almd:22:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |   let decrypted_chars = chars.map((char) => {
   |                                  --------------- '(' opened here
...
22 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 25:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:25:3
   |
25 |   });
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:9:7
  in variable c
  hint: Check the variable name
  |
9 |       c
  |       ^
error[E003]: undefined variable 'char'
  --> /tmp/dojo-caesar-cipher-3.almd:23:7
  in variable char
  hint: Did you mean `chars`?
  try:
      // char  →  chars
      chars
   |
23 |       char
   |       ^^^^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
