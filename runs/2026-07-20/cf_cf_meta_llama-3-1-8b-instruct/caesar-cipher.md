# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text)
  let encrypted_chars = chars.map(
    (c) => {
      if string.is_lower(c) {
        let codepoint = string.codepoint(c) + shift
        if codepoint <= 122 then string.from_codepoint(codepoint) else string.from_codepoint(codepoint - 26)
      } else {
        c
      }
    }
  )
  string.join(encrypted_chars, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text)
  let decrypted_chars = chars.map(
    (c) => {
      if string.is_lower(c) {
        let codepoint = string.codepoint(c) - shift
        if codepoint >= 97 then string.from_codepoint(codepoint) else string.from_codepoint(codepoint + 26)
      } else {
        c
      }
    }
  )
  string.join(decrypted_chars, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: Expected Then at line 5:29 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-0.almd:5:29
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |       if string.is_lower(c) {
  |                             ^
error: Expected ')' to close function call opened at line 3:34
  --> /tmp/dojo-caesar-cipher-0.almd:8:9
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   let encrypted_chars = chars.map(
  |                                  --------------- '(' opened here
...
8 |       } else {
  |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-0.almd:11:5
   |
11 |     }
   |     ^
error: Expected Then at line 20:29 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-0.almd:20:29
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
20 |       if string.is_lower(c) {
   |                             ^
error: Expected ')' to close function call opened at line 18:34
  --> /tmp/dojo-caesar-cipher-0.almd:23:9
  hint: Add ')' or check for a missing delimiter inside the function call
   |
18 |   let decrypted_chars = chars.map(
   |                                  --------------- '(' opened here
...
23 |       } else {
   |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 26:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-0.almd:26:5
   |
26 |     }
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:9:9
  in variable c
  hint: Check the variable name
  |
9 |         c
  |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:24:9
  in variable c
  hint: Check the variable name
   |
24 |         c
   |         ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text)
  let encrypted_chars = chars.map(
    (c) => {
      if string.is_lower(c) {
        let codepoint = string.codepoint(c) + shift
        if codepoint <= 122 then string.from_codepoint(codepoint) else string.from_codepoint(codepoint - 26)
      } else {
        c
      }
    }
  )
  string.join(encrypted_chars, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text)
  let decrypted_chars = chars.map(
    (c) => {
      if string.is_lower(c) {
        let codepoint = string.codepoint(c) - shift
        if codepoint >= 97 then string.from_codepoint(codepoint) else string.from_codepoint(codepoint + 26)
      } else {
        c
      }
    }
  )
  string.join(decrypted_chars, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Expected Then at line 5:29 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-1.almd:5:29
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |       if string.is_lower(c) {
  |                             ^
error: Expected ')' to close function call opened at line 3:34
  --> /tmp/dojo-caesar-cipher-1.almd:8:9
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   let encrypted_chars = chars.map(
  |                                  --------------- '(' opened here
...
8 |       } else {
  |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:11:5
   |
11 |     }
   |     ^
error: Expected Then at line 20:29 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-1.almd:20:29
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
20 |       if string.is_lower(c) {
   |                             ^
error: Expected ')' to close function call opened at line 18:34
  --> /tmp/dojo-caesar-cipher-1.almd:23:9
  hint: Add ')' or check for a missing delimiter inside the function call
   |
18 |   let decrypted_chars = chars.map(
   |                                  --------------- '(' opened here
...
23 |       } else {
   |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 26:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:26:5
   |
26 |     }
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:9:9
  in variable c
  hint: Check the variable name
  |
9 |         c
  |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:24:9
  in variable c
  hint: Check the variable name
   |
24 |         c
   |         ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text)
  let encrypted_chars = chars.map(
    (c) => {
      if string.is_lower(c) {
        let codepoint = string.codepoint(c) + shift
        if codepoint > 122 then string.from_codepoint(codepoint - 26) else string.from_codepoint(codepoint)
      } else {
        c
      }
    }
  )
  string.join(encrypted_chars, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text)
  let decrypted_chars = chars.map(
    (c) => {
      if string.is_lower(c) {
        let codepoint = string.codepoint(c) - shift
        if codepoint < 97 then string.from_codepoint(codepoint + 26) else string.from_codepoint(codepoint)
      } else {
        c
      }
    }
  )
  string.join(decrypted_chars, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected Then at line 5:29 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:5:29
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |       if string.is_lower(c) {
  |                             ^
error: Expected ')' to close function call opened at line 3:34
  --> /tmp/dojo-caesar-cipher-2.almd:8:9
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   let encrypted_chars = chars.map(
  |                                  --------------- '(' opened here
...
8 |       } else {
  |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:11:5
   |
11 |     }
   |     ^
error: Expected Then at line 20:29 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:20:29
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
20 |       if string.is_lower(c) {
   |                             ^
error: Expected ')' to close function call opened at line 18:34
  --> /tmp/dojo-caesar-cipher-2.almd:23:9
  hint: Add ')' or check for a missing delimiter inside the function call
   |
18 |   let decrypted_chars = chars.map(
   |                                  --------------- '(' opened here
...
23 |       } else {
   |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 26:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:26:5
   |
26 |     }
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:9:9
  in variable c
  hint: Check the variable name
  |
9 |         c
  |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:24:9
  in variable c
  hint: Check the variable name
   |
24 |         c
   |         ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text)
  let encrypted_chars = chars.map(
    (c) => {
      if string.is_lower(c) {
        let codepoint = string.codepoint(c) + shift
        if codepoint > 122 then string.from_codepoint(codepoint - 26) else string.from_codepoint(codepoint)
      } else {
        c
      }
    }
  )
  string.join(encrypted_chars, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text)
  let decrypted_chars = chars.map(
    (c) => {
      if string.is_lower(c) {
        let codepoint = string.codepoint(c) - shift
        if codepoint < 97 then string.from_codepoint(codepoint + 26) else string.from_codepoint(codepoint)
      } else {
        c
      }
    }
  )
  string.join(decrypted_chars, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected Then at line 5:29 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:5:29
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |       if string.is_lower(c) {
  |                             ^
error: Expected ')' to close function call opened at line 3:34
  --> /tmp/dojo-caesar-cipher-3.almd:8:9
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   let encrypted_chars = chars.map(
  |                                  --------------- '(' opened here
...
8 |       } else {
  |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:11:5
   |
11 |     }
   |     ^
error: Expected Then at line 20:29 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:20:29
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
20 |       if string.is_lower(c) {
   |                             ^
error: Expected ')' to close function call opened at line 18:34
  --> /tmp/dojo-caesar-cipher-3.almd:23:9
  hint: Add ')' or check for a missing delimiter inside the function call
   |
18 |   let decrypted_chars = chars.map(
   |                                  --------------- '(' opened here
...
23 |       } else {
   |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 26:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:26:5
   |
26 |     }
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:9:9
  in variable c
  hint: Check the variable name
  |
9 |         c
  |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:24:9
  in variable c
  hint: Check the variable name
   |
24 |         c
   |         ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
