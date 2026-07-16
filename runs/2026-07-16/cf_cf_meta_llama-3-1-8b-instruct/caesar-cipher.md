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
    let cp = string.codepoint(c);
    if (cp >= 97 && cp <= 122) {
      let new_cp = (cp - 97 + shift) % 26 + 97;
      string.from_codepoint(new_cp)
    } else {
      c
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
    let cp = string.codepoint(c);
    if (cp >= 97 && cp <= 122) {
      let new_cp = (cp - 97 + shift) % 26 + 97;
      string.from_codepoint(new_cp)
    } else {
      c
    }
  })
}

fn decrypt(text: String, shift: Int) -> String = {
  string.map(text, (c) => {
    let cp = string.codepoint(c);
    if (cp >= 97 && cp <= 122) {
      let new_cp = (cp - 97 - shift) % 26 + 97;
      string.from_codepoint(new_cp)
    } else {
      c
    }
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '&&' is not valid in Almide at line 4:18
  --> /tmp/dojo-caesar-cipher-1.almd:4:18
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |     if (cp >= 97 && cp <= 122) {
  |                  ^
error: Expected ')' to close function call opened at line 2:13
  --> /tmp/dojo-caesar-cipher-1.almd:7:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   string.map(text, (c) => {
  |             --------------- '(' opened here
...
7 |     } else {
  |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:10:3
   |
10 |   })
   |   ^
error: '&&' is not valid in Almide at line 16:18
  --> /tmp/dojo-caesar-cipher-1.almd:16:18
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
16 |     if (cp >= 97 && cp <= 122) {
   |                  ^
error: Expected ')' to close function call opened at line 14:13
  --> /tmp/dojo-caesar-cipher-1.almd:19:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
14 |   string.map(text, (c) => {
   |             --------------- '(' opened here
...
19 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:22:3
   |
22 |   })
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:8:7
  in variable c
  hint: Check the variable name
  |
8 |       c
  |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:20:7
  in variable c
  hint: Check the variable name
   |
20 |       c
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
  string.map(text, (c) => {
    let cp = string.codepoint(c);
    if (cp >= 97 and cp <= 122) {
      let new_cp = (cp - 97 + shift) % 26 + 97;
      string.from_codepoint(new_cp)
    } else {
      c
    }
  })
}

fn decrypt(text: String, shift: Int) -> String = {
  string.map(text, (c) => {
    let cp = string.codepoint(c);
    if (cp >= 97 and cp <= 122) {
      let new_cp = (cp - 97 - shift) % 26 + 97;
      string.from_codepoint(new_cp)
    } else {
      c
    }
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected Then at line 4:33 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:4:33
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |     if (cp >= 97 and cp <= 122) {
  |                                 ^
error: Expected ')' to close function call opened at line 2:13
  --> /tmp/dojo-caesar-cipher-2.almd:7:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   string.map(text, (c) => {
  |             --------------- '(' opened here
...
7 |     } else {
  |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:10:3
   |
10 |   })
   |   ^
error: Expected Then at line 16:33 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:16:33
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
16 |     if (cp >= 97 and cp <= 122) {
   |                                 ^
error: Expected ')' to close function call opened at line 14:13
  --> /tmp/dojo-caesar-cipher-2.almd:19:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
14 |   string.map(text, (c) => {
   |             --------------- '(' opened here
...
19 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:22:3
   |
22 |   })
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:8:7
  in variable c
  hint: Check the variable name
  |
8 |       c
  |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:20:7
  in variable c
  hint: Check the variable name
   |
20 |       c
   |       ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  string.map(text, (c) => {
    let cp = string.codepoint(c);
    if (cp >= 97 and cp <= 122) {
      let new_cp = (cp - 97 + shift) % 26 + 97;
      string.from_codepoint(new_cp)
    } else {
      string.from_codepoint(cp)
    }
  })
}

fn decrypt(text: String, shift: Int) -> String = {
  string.map(text, (c) => {
    let cp = string.codepoint(c);
    if (cp >= 97 and cp <= 122) {
      let new_cp = (cp - 97 - shift + 26) % 26 + 97;
      string.from_codepoint(new_cp)
    } else {
      string.from_codepoint(cp)
    }
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected Then at line 4:33 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:4:33
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |     if (cp >= 97 and cp <= 122) {
  |                                 ^
error: Expected ')' to close function call opened at line 2:13
  --> /tmp/dojo-caesar-cipher-3.almd:7:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   string.map(text, (c) => {
  |             --------------- '(' opened here
...
7 |     } else {
  |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:10:3
   |
10 |   })
   |   ^
error: Expected Then at line 16:33 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:16:33
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
16 |     if (cp >= 97 and cp <= 122) {
   |                                 ^
error: Expected ')' to close function call opened at line 14:13
  --> /tmp/dojo-caesar-cipher-3.almd:19:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
14 |   string.map(text, (c) => {
   |             --------------- '(' opened here
...
19 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:22:3
   |
22 |   })
   |   ^
error[E003]: undefined variable 'cp'
  --> /tmp/dojo-caesar-cipher-3.almd:8:29
  in variable cp
  hint: Check the variable name
  |
8 |       string.from_codepoint(cp)
  |                             ^^
error[E003]: undefined variable 'cp'
  --> /tmp/dojo-caesar-cipher-3.almd:20:29
  in variable cp
  hint: Check the variable name
   |
20 |       string.from_codepoint(cp)
   |                             ^^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
