# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
  let shifted_chars = string.chars(text)
    |>
    list.map((c) => {
      let codepoint = string.codepoint(c);
      if (codepoint >= 97 && codepoint <= 122) {
        let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
        string.from_codepoint(shifted_codepoint);
      } else {
        c;
      }
    });
  string.join(shifted_chars, "");
}

fn decrypt(text: String, shift: Int) -> String {
  let shifted_chars = string.chars(text)
    |>
    list.map((c) => {
      let codepoint = string.codepoint(c);
      if (codepoint >= 97 && codepoint <= 122) {
        let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
        string.from_codepoint(shifted_codepoint);
      } else {
        c;
      }
    });
  string.join(shifted_chars, "");
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
error: Missing '=' before function body at line 16:48
  --> /tmp/dojo-caesar-cipher-0.almd:16:48
  hint: Almide requires '=' before the body. Write: fn decrypt(...) -> Type = { ... }
   |
16 | fn decrypt(text: String, shift: Int) -> String {
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
  let shifted_chars = string.chars(text)
    |>
    list.map((c) => {
      let codepoint = string.codepoint(c);
      if (codepoint >= 97 && codepoint <= 122) {
        let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
        string.from_codepoint(shifted_codepoint);
      } else {
        c;
      }
    });
  string.join(shifted_chars, "");
}

fn decrypt(text: String, shift: Int) -> String = {
  let shifted_chars = string.chars(text)
    |>
    list.map((c) => {
      let codepoint = string.codepoint(c);
      if (codepoint >= 97 && codepoint <= 122) {
        let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
        string.from_codepoint(shifted_codepoint);
      } else {
        c;
      }
    });
  string.join(shifted_chars, "");
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
error: Expected ')' to close function call opened at line 4:13
  --> /tmp/dojo-caesar-cipher-1.almd:9:9
  hint: Add ')' or check for a missing delimiter inside the function call
  |
4 |     list.map((c) => {
  |             --------------- '(' opened here
...
9 |       } else {
  |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:12:5
   |
12 |     });
   |     ^
error: '&&' is not valid in Almide at line 21:27
  --> /tmp/dojo-caesar-cipher-1.almd:21:27
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
21 |       if (codepoint >= 97 && codepoint <= 122) {
   |                           ^
error: Expected ')' to close function call opened at line 19:13
  --> /tmp/dojo-caesar-cipher-1.almd:24:9
  hint: Add ')' or check for a missing delimiter inside the function call
   |
19 |     list.map((c) => {
   |             --------------- '(' opened here
...
24 |       } else {
   |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 27:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:27:5
   |
27 |     });
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:10:9
  in variable c
  hint: Check the variable name
   |
10 |         c;
   |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:25:9
  in variable c
  hint: Check the variable name
   |
25 |         c;
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
  let shifted_chars = string.chars(text)
    |>
    list.map((c) => {
      let codepoint = string.codepoint(c);
      if (codepoint >= 97 and codepoint <= 122) {
        let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
        string.from_codepoint(shifted_codepoint);
      } else {
        c;
      }
    });
  string.join(shifted_chars, "");
}

fn decrypt(text: String, shift: Int) -> String = {
  let shifted_chars = string.chars(text)
    |>
    list.map((c) => {
      let codepoint = string.codepoint(c);
      if (codepoint >= 97 and codepoint <= 122) {
        let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
        string.from_codepoint(shifted_codepoint);
      } else {
        c;
      }
    });
  string.join(shifted_chars, "");
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
error: Expected ')' to close function call opened at line 4:13
  --> /tmp/dojo-caesar-cipher-2.almd:9:9
  hint: Add ')' or check for a missing delimiter inside the function call
  |
4 |     list.map((c) => {
  |             --------------- '(' opened here
...
9 |       } else {
  |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:12:5
   |
12 |     });
   |     ^
error: Expected Then at line 21:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:21:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
21 |       if (codepoint >= 97 and codepoint <= 122) {
   |                                                 ^
error: Expected ')' to close function call opened at line 19:13
  --> /tmp/dojo-caesar-cipher-2.almd:24:9
  hint: Add ')' or check for a missing delimiter inside the function call
   |
19 |     list.map((c) => {
   |             --------------- '(' opened here
...
24 |       } else {
   |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 27:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:27:5
   |
27 |     });
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:10:9
  in variable c
  hint: Check the variable name
   |
10 |         c;
   |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:25:9
  in variable c
  hint: Check the variable name
   |
25 |         c;
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
  let shifted_chars = string.chars(text)
    |>
    list.map((c) => {
      let codepoint = string.codepoint(c);
      if (codepoint >= 97 and codepoint <= 122) {
        let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
        string.from_codepoint(shifted_codepoint);
      } else {
        c;
      }
    });
  string.join(shifted_chars, "");
}

fn decrypt(text: String, shift: Int) -> String = {
  let shifted_chars = string.chars(text)
    |>
    list.map((c) => {
      let codepoint = string.codepoint(c);
      if (codepoint >= 97 and codepoint <= 122) {
        let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
        string.from_codepoint(shifted_codepoint);
      } else {
        c;
      }
    });
  string.join(shifted_chars, "");
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
error: Expected ')' to close function call opened at line 4:13
  --> /tmp/dojo-caesar-cipher-3.almd:9:9
  hint: Add ')' or check for a missing delimiter inside the function call
  |
4 |     list.map((c) => {
  |             --------------- '(' opened here
...
9 |       } else {
  |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:12:5
   |
12 |     });
   |     ^
error: Expected Then at line 21:49 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:21:49
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
21 |       if (codepoint >= 97 and codepoint <= 122) {
   |                                                 ^
error: Expected ')' to close function call opened at line 19:13
  --> /tmp/dojo-caesar-cipher-3.almd:24:9
  hint: Add ')' or check for a missing delimiter inside the function call
   |
19 |     list.map((c) => {
   |             --------------- '(' opened here
...
24 |       } else {
   |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 27:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:27:5
   |
27 |     });
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:10:9
  in variable c
  hint: Check the variable name
   |
10 |         c;
   |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:25:9
  in variable c
  hint: Check the variable name
   |
25 |         c;
   |         ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
