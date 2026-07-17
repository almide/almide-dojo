# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let encrypted = string.chars(text) |> list.map((c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97 && codepoint <= 122) {
      let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  });
  string.join(encrypted, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let decrypted = string.chars(text) |> list.map((c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97 && codepoint <= 122) {
      let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  });
  string.join(decrypted, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: '&&' is not valid in Almide at line 4:25
  --> /tmp/dojo-caesar-cipher-0.almd:4:25
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |     if (codepoint >= 97 && codepoint <= 122) {
  |                         ^
error: Expected ')' to close function call opened at line 2:49
  --> /tmp/dojo-caesar-cipher-0.almd:7:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   let encrypted = string.chars(text) |> list.map((c) => {
  |                                                 --------------- '(' opened here
...
7 |     } else {
  |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-0.almd:10:3
   |
10 |   });
   |   ^
error: '&&' is not valid in Almide at line 17:25
  --> /tmp/dojo-caesar-cipher-0.almd:17:25
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
17 |     if (codepoint >= 97 && codepoint <= 122) {
   |                         ^
error: Expected ')' to close function call opened at line 15:49
  --> /tmp/dojo-caesar-cipher-0.almd:20:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
15 |   let decrypted = string.chars(text) |> list.map((c) => {
   |                                                 --------------- '(' opened here
...
20 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-0.almd:23:3
   |
23 |   });
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:8:7
  in variable c
  hint: Check the variable name
  |
8 |       c
  |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:21:7
  in variable c
  hint: Check the variable name
   |
21 |       c
   |       ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let encrypted = string.chars(text) |> list.map((c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97 and codepoint <= 122) {
      let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  });
  string.join(encrypted, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let decrypted = string.chars(text) |> list.map((c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97 and codepoint <= 122) {
      let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  });
  string.join(decrypted, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Expected Then at line 4:47 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-1.almd:4:47
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |     if (codepoint >= 97 and codepoint <= 122) {
  |                                               ^
error: Expected ')' to close function call opened at line 2:49
  --> /tmp/dojo-caesar-cipher-1.almd:7:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   let encrypted = string.chars(text) |> list.map((c) => {
  |                                                 --------------- '(' opened here
...
7 |     } else {
  |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:10:3
   |
10 |   });
   |   ^
error: Expected Then at line 17:47 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-1.almd:17:47
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
17 |     if (codepoint >= 97 and codepoint <= 122) {
   |                                               ^
error: Expected ')' to close function call opened at line 15:49
  --> /tmp/dojo-caesar-cipher-1.almd:20:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
15 |   let decrypted = string.chars(text) |> list.map((c) => {
   |                                                 --------------- '(' opened here
...
20 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:23:3
   |
23 |   });
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:8:7
  in variable c
  hint: Check the variable name
  |
8 |       c
  |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:21:7
  in variable c
  hint: Check the variable name
   |
21 |       c
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
  let encrypted = string.chars(text) |> list.map((c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97 and codepoint <= 122) {
      let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  });
  string.join(encrypted, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let decrypted = string.chars(text) |> list.map((c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97 and codepoint <= 122) {
      let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  });
  string.join(decrypted, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected Then at line 4:47 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:4:47
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |     if (codepoint >= 97 and codepoint <= 122) {
  |                                               ^
error: Expected ')' to close function call opened at line 2:49
  --> /tmp/dojo-caesar-cipher-2.almd:7:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   let encrypted = string.chars(text) |> list.map((c) => {
  |                                                 --------------- '(' opened here
...
7 |     } else {
  |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:10:3
   |
10 |   });
   |   ^
error: Expected Then at line 17:47 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:17:47
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
17 |     if (codepoint >= 97 and codepoint <= 122) {
   |                                               ^
error: Expected ')' to close function call opened at line 15:49
  --> /tmp/dojo-caesar-cipher-2.almd:20:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
15 |   let decrypted = string.chars(text) |> list.map((c) => {
   |                                                 --------------- '(' opened here
...
20 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:23:3
   |
23 |   });
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:8:7
  in variable c
  hint: Check the variable name
  |
8 |       c
  |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:21:7
  in variable c
  hint: Check the variable name
   |
21 |       c
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
  let encrypted = string.chars(text) |> list.map((c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97 and codepoint <= 122) {
      let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  });
  string.join(encrypted, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let decrypted = string.chars(text) |> list.map((c) => {
    let codepoint = string.codepoint(c);
    if (codepoint >= 97 and codepoint <= 122) {
      let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  });
  string.join(decrypted, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected Then at line 4:47 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:4:47
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |     if (codepoint >= 97 and codepoint <= 122) {
  |                                               ^
error: Expected ')' to close function call opened at line 2:49
  --> /tmp/dojo-caesar-cipher-3.almd:7:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   let encrypted = string.chars(text) |> list.map((c) => {
  |                                                 --------------- '(' opened here
...
7 |     } else {
  |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:10:3
   |
10 |   });
   |   ^
error: Expected Then at line 17:47 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:17:47
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
17 |     if (codepoint >= 97 and codepoint <= 122) {
   |                                               ^
error: Expected ')' to close function call opened at line 15:49
  --> /tmp/dojo-caesar-cipher-3.almd:20:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
15 |   let decrypted = string.chars(text) |> list.map((c) => {
   |                                                 --------------- '(' opened here
...
20 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:23:3
   |
23 |   });
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:8:7
  in variable c
  hint: Check the variable name
  |
8 |       c
  |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:21:7
  in variable c
  hint: Check the variable name
   |
21 |       c
   |       ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
