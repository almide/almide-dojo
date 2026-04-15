# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
  text.chars()
    |> list.map((c) => {
      let code = string.codepoint(c);
      if code >= 97 && code <= 122 {
        let new_code = (code - 97 + shift) % 26 + 97;
        string.from_codepoint(new_code)
      } else {
        c
      }
    })
    |> list.join("")
}

fn decrypt(text: String, shift: Int) -> String {
  text.chars()
    |> list.map((c) => {
      let code = string.codepoint(c);
      if code >= 97 && code <= 122 {
        let new_code = (code - 97 - shift + 26) % 26 + 97;
        string.from_codepoint(new_code)
      } else {
        c
      }
    })
    |> list.join("")
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
  text.chars()
    |> list.map((c) => {
      let code = string.codepoint(c);
      if code >= 97 && code < 122 {
        let new_code = (code - 97 + shift) % 26 + 97;
        string.from_codepoint(new_code)
      } else {
        c
      }
    })
    |> list.join("")
}

fn decrypt(text: String, shift: Int) -> String = {
  text.chars()
    |> list.map((c) => {
      let code = string.codepoint(c);
      if code >= 97 && code < 122 {
        let new_code = (code - 97 - shift + 26) % 26 + 97;
        string.from_codepoint(new_code)
      } else {
        c
      }
    })
    |> list.join("")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '&&' is not valid in Almide at line 5:21
  --> /tmp/dojo-caesar-cipher-1.almd:5:21
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |       if code >= 97 && code < 122 {
  |                     ^
error: Expected ')' to close function call opened at line 3:16
  --> /tmp/dojo-caesar-cipher-1.almd:8:9
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |     |> list.map((c) => {
  |                --------------- '(' opened here
...
8 |       } else {
  |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:11:5
   |
11 |     })
   |     ^
error: '&&' is not valid in Almide at line 19:21
  --> /tmp/dojo-caesar-cipher-1.almd:19:21
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
19 |       if code >= 97 && code < 122 {
   |                     ^
error: Expected ')' to close function call opened at line 17:16
  --> /tmp/dojo-caesar-cipher-1.almd:22:9
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |     |> list.map((c) => {
   |                --------------- '(' opened here
...
22 |       } else {
   |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 25:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:25:5
   |
25 |     })
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:9:9
  in variable c
  hint: Check the variable name
  |
9 |         c
  |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:23:9
  in variable c
  hint: Check the variable name
   |
23 |         c
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
  text.chars()
    |> list.map((char) => {
      let code = string.codepoint(char);
      if code >= 97 && code < 122 {
        let new_code = (code - 97 + shift) % 26 + 97;
        string.from_codepoint(new_code)
      } else {
        char
      }
    })
    |> list.join("")
}

fn decrypt(text: String, shift: Int) -> String = {
  text.chars()
    |> list.map((char) => {
      let code = string.codepoint(char);
      if code >= 97 && code < 122 {
        let new_code = (code - 97 - shift + 26) % 26 + 97;
        string.from_codepoint(new_code)
      } else {
        char
      }
    })
    |> list.join("")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: '&&' is not valid in Almide at line 5:21
  --> /tmp/dojo-caesar-cipher-2.almd:5:21
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |       if code >= 97 && code < 122 {
  |                     ^
error: Expected ')' to close function call opened at line 3:16
  --> /tmp/dojo-caesar-cipher-2.almd:8:9
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |     |> list.map((char) => {
  |                --------------- '(' opened here
...
8 |       } else {
  |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:11:5
   |
11 |     })
   |     ^
error: '&&' is not valid in Almide at line 19:21
  --> /tmp/dojo-caesar-cipher-2.almd:19:21
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
19 |       if code >= 97 && code < 122 {
   |                     ^
error: Expected ')' to close function call opened at line 17:16
  --> /tmp/dojo-caesar-cipher-2.almd:22:9
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |     |> list.map((char) => {
   |                --------------- '(' opened here
...
22 |       } else {
   |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 25:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:25:5
   |
25 |     })
   |     ^
error[E003]: undefined variable 'char'
  --> /tmp/dojo-caesar-cipher-2.almd:9:9
  in variable char
  hint: Check the variable name
  |
9 |         char
  |         ^^^^
error[E003]: undefined variable 'char'
  --> /tmp/dojo-caesar-cipher-2.almd:23:9
  in variable char
  hint: Check the variable name
   |
23 |         char
   |         ^^^^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  text.chars()
    |> list.map((c) => {
      let code = string.codepoint(c);
      if code >= 97 && code < 122 {
        let new_code = (code - 97 + shift) % 26 + 97;
        string.from_codepoint(new_code)
      } else {
        c
      }
    })
    |> list.join("")
}

fn decrypt(text: String, shift: Int) -> String = {
  text.chars()
    |> list.map((c) => {
      let code = string.codepoint(c);
      if code >= 97 && code < 122 {
        let new_code = (code - 97 - shift + 26) % 26 + 97;
        string.from_codepoint(new_code)
      } else {
        c
      }
    })
    |> list.join("")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: '&&' is not valid in Almide at line 5:21
  --> /tmp/dojo-caesar-cipher-3.almd:5:21
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |       if code >= 97 && code < 122 {
  |                     ^
error: Expected ')' to close function call opened at line 3:16
  --> /tmp/dojo-caesar-cipher-3.almd:8:9
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |     |> list.map((c) => {
  |                --------------- '(' opened here
...
8 |       } else {
  |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:11:5
   |
11 |     })
   |     ^
error: '&&' is not valid in Almide at line 19:21
  --> /tmp/dojo-caesar-cipher-3.almd:19:21
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
19 |       if code >= 97 && code < 122 {
   |                     ^
error: Expected ')' to close function call opened at line 17:16
  --> /tmp/dojo-caesar-cipher-3.almd:22:9
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |     |> list.map((c) => {
   |                --------------- '(' opened here
...
22 |       } else {
   |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 25:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:25:5
   |
25 |     })
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:9:9
  in variable c
  hint: Check the variable name
  |
9 |         c
  |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:23:9
  in variable c
  hint: Check the variable name
   |
23 |         c
   |         ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
