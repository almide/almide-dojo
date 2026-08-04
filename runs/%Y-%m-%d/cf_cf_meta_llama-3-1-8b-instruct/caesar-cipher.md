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
  let encrypted_chars = chars.map(
    (c) => {
      let codepoint = string.codepoint(c);
      if (codepoint >= 97 && codepoint <= 122) {
        let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
        string.from_codepoint(shifted_codepoint)
      } else {
        c
      }
    }
  );
  string.join(encrypted_chars, "")
}

fn decrypt(text: String, shift: Int) -> String {
  let chars = string.chars(text);
  let decrypted_chars = chars.map(
    (c) => {
      let codepoint = string.codepoint(c);
      if (codepoint >= 97 && codepoint <= 122) {
        let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
        string.from_codepoint(shifted_codepoint)
      } else {
        c
      }
    }
  );
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
  let encrypted_chars = chars.map(
    (c) => {
      let codepoint = string.codepoint(c);
      if (codepoint >= 97 && codepoint <= 122) {
        let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
        string.from_codepoint(shifted_codepoint)
      } else {
        c
      }
    }
  );
  string.join(encrypted_chars, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let decrypted_chars = chars.map(
    (c) => {
      let codepoint = string.codepoint(c);
      if (codepoint >= 97 && codepoint <= 122) {
        let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
        string.from_codepoint(shifted_codepoint)
      } else {
        c
      }
    }
  );
  string.join(decrypted_chars, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '&&' is not valid in Almide at line 6:27
  --> /tmp/dojo-caesar-cipher-1.almd:6:27
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
6 |       if (codepoint >= 97 && codepoint <= 122) {
  |                           ^
error: Expected ')' to close function call opened at line 3:34
  --> /tmp/dojo-caesar-cipher-1.almd:9:9
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   let encrypted_chars = chars.map(
  |                                  --------------- '(' opened here
...
9 |       } else {
  |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:12:5
   |
12 |     }
   |     ^
error: '&&' is not valid in Almide at line 22:27
  --> /tmp/dojo-caesar-cipher-1.almd:22:27
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
22 |       if (codepoint >= 97 && codepoint <= 122) {
   |                           ^
error: Expected ')' to close function call opened at line 19:34
  --> /tmp/dojo-caesar-cipher-1.almd:25:9
  hint: Add ')' or check for a missing delimiter inside the function call
   |
19 |   let decrypted_chars = chars.map(
   |                                  --------------- '(' opened here
...
25 |       } else {
   |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 28:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:28:5
   |
28 |     }
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:10:9
  in variable c
  hint: Check the variable name
   |
10 |         c
   |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:26:9
  in variable c
  hint: Check the variable name
   |
26 |         c
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
  let chars = string.chars(text);
  let encrypted_chars = chars.map(
    (c) => {
      let codepoint = string.codepoint(c);
      if (codepoint >= 97 and codepoint <= 122) {
        let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
        string.from_codepoint(shifted_codepoint)
      } else {
        c
      }
    }
  );
  string.join(encrypted_chars, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let decrypted_chars = chars.map(
    (c) => {
      let codepoint = string.codepoint(c);
      if (codepoint >= 97 and codepoint <= 122) {
        let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
        string.from_codepoint(shifted_codepoint)
      } else {
        c
      }
    }
  );
  string.join(decrypted_chars, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected Then at line 6:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:6:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |       if (codepoint >= 97 and codepoint <= 122) {
  |                                                 ^
error: Expected ')' to close function call opened at line 3:34
  --> /tmp/dojo-caesar-cipher-2.almd:9:9
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   let encrypted_chars = chars.map(
  |                                  --------------- '(' opened here
...
9 |       } else {
  |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:12:5
   |
12 |     }
   |     ^
error: Expected Then at line 22:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:22:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
22 |       if (codepoint >= 97 and codepoint <= 122) {
   |                                                 ^
error: Expected ')' to close function call opened at line 19:34
  --> /tmp/dojo-caesar-cipher-2.almd:25:9
  hint: Add ')' or check for a missing delimiter inside the function call
   |
19 |   let decrypted_chars = chars.map(
   |                                  --------------- '(' opened here
...
25 |       } else {
   |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 28:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:28:5
   |
28 |     }
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:10:9
  in variable c
  hint: Check the variable name
   |
10 |         c
   |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:26:9
  in variable c
  hint: Check the variable name
   |
26 |         c
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
  let chars = string.chars(text);
  let encrypted_chars = chars.map(
    (c) => {
      let codepoint = string.codepoint(c);
      if (codepoint >= 97 and codepoint <= 122) {
        let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
        string.from_codepoint(shifted_codepoint)
      } else {
        c
      }
    }
  );
  string.join(encrypted_chars, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let decrypted_chars = chars.map(
    (c) => {
      let codepoint = string.codepoint(c);
      if (codepoint >= 97 and codepoint <= 122) {
        let shifted_codepoint = ((codepoint - 97 - shift + 26) % 26 + 97);
        string.from_codepoint(shifted_codepoint)
      } else {
        c
      }
    }
  );
  string.join(decrypted_chars, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected Then at line 6:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:6:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |       if (codepoint >= 97 and codepoint <= 122) {
  |                                                 ^
error: Expected ')' to close function call opened at line 3:34
  --> /tmp/dojo-caesar-cipher-3.almd:9:9
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   let encrypted_chars = chars.map(
  |                                  --------------- '(' opened here
...
9 |       } else {
  |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:12:5
   |
12 |     }
   |     ^
error: Expected Then at line 22:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:22:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
22 |       if (codepoint >= 97 and codepoint <= 122) {
   |                                                 ^
error: Expected ')' to close function call opened at line 19:34
  --> /tmp/dojo-caesar-cipher-3.almd:25:9
  hint: Add ')' or check for a missing delimiter inside the function call
   |
19 |   let decrypted_chars = chars.map(
   |                                  --------------- '(' opened here
...
25 |       } else {
   |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 28:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:28:5
   |
28 |     }
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:10:9
  in variable c
  hint: Check the variable name
   |
10 |         c
   |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:26:9
  in variable c
  hint: Check the variable name
   |
26 |         c
   |         ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
