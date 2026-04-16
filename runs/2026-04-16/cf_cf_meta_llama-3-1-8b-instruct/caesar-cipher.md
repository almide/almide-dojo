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
    |> list.map((c) => {
      let codepoint = string.codepoint(c);
      if codepoint >= 97 && codepoint <= 122 {
        let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
        string.from_codepoint(new_codepoint)
      } else {
        c
      }
    })
    |> string.join("");
  result
}

fn decrypt(text: String, shift: Int) -> String {
  let result = string.chars(text)
    |> list.map((c) => {
      let codepoint = string.codepoint(c);
      if codepoint >= 97 && codepoint <= 122 {
        let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
        string.from_codepoint(new_codepoint)
      } else {
        c
      }
    })
    |> string.join("");
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
  let result = string.chars(text)
    |> list.map((c) => {
      let codepoint = string.codepoint(c);
      if codepoint >= 97 && codepoint < 122 {
        let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
        string.from_codepoint(new_codepoint)
      } else {
        c
      }
    })
    |> string.join("");
  result
}

fn decrypt(text: String, shift: Int) -> String = {
  let result = string.chars(text)
    |> list.map((c) => {
      let codepoint = string.codepoint(c);
      if codepoint >= 97 && codepoint < 122 {
        let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
        string.from_codepoint(new_codepoint)
      } else {
        c
      }
    })
    |> string.join("");
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '&&' is not valid in Almide at line 5:26
  --> /tmp/dojo-caesar-cipher-1.almd:5:26
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |       if codepoint >= 97 && codepoint < 122 {
  |                          ^
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
error: '&&' is not valid in Almide at line 20:26
  --> /tmp/dojo-caesar-cipher-1.almd:20:26
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
20 |       if codepoint >= 97 && codepoint < 122 {
   |                          ^
error: Expected ')' to close function call opened at line 18:16
  --> /tmp/dojo-caesar-cipher-1.almd:23:9
  hint: Add ')' or check for a missing delimiter inside the function call
   |
18 |     |> list.map((c) => {
   |                --------------- '(' opened here
...
23 |       } else {
   |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 26:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:26:5
   |
26 |     })
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
  let result = string.chars(text)
    |> list.map((c) => {
      let codepoint = string.codepoint(c);
      if codepoint >= 97 and codepoint < 122 {
        let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
        string.from_codepoint(new_codepoint)
      } else {
        c
      }
    })
    |> string.join("");
  result
}

fn decrypt(text: String, shift: Int) -> String = {
  let result = string.chars(text)
    |> list.map((c) => {
      let codepoint = string.codepoint(c);
      if codepoint >= 97 and codepoint < 122 {
        let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
        string.from_codepoint(new_codepoint)
      } else {
        c
      }
    })
    |> string.join("");
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected Then at line 5:46 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:5:46
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |       if codepoint >= 97 and codepoint < 122 {
  |                                              ^
error: Expected ')' to close function call opened at line 3:16
  --> /tmp/dojo-caesar-cipher-2.almd:8:9
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |     |> list.map((c) => {
  |                --------------- '(' opened here
...
8 |       } else {
  |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:11:5
   |
11 |     })
   |     ^
error: Expected Then at line 20:46 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:20:46
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
20 |       if codepoint >= 97 and codepoint < 122 {
   |                                              ^
error: Expected ')' to close function call opened at line 18:16
  --> /tmp/dojo-caesar-cipher-2.almd:23:9
  hint: Add ')' or check for a missing delimiter inside the function call
   |
18 |     |> list.map((c) => {
   |                --------------- '(' opened here
...
23 |       } else {
   |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 26:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:26:5
   |
26 |     })
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
  let result = string.chars(text)
    |> list.map((c) => {
      let codepoint = string.codepoint(c);
      if codepoint >= 97 and codepoint < 122 {
        let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
        string.from_codepoint(new_codepoint)
      } else {
        c
      }
    })
    |> string.join("");
  result
}

fn decrypt(text: String, shift: Int) -> String = {
  let result = string.chars(text)
    |> list.map((c) => {
      let codepoint = string.codepoint(c);
      if codepoint >= 97 and codepoint < 122 {
        let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
        string.from_codepoint(new_codepoint)
      } else {
        c
      }
    })
    |> string.join("");
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected Then at line 5:46 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:5:46
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |       if codepoint >= 97 and codepoint < 122 {
  |                                              ^
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
error: Expected Then at line 20:46 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:20:46
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
20 |       if codepoint >= 97 and codepoint < 122 {
   |                                              ^
error: Expected ')' to close function call opened at line 18:16
  --> /tmp/dojo-caesar-cipher-3.almd:23:9
  hint: Add ')' or check for a missing delimiter inside the function call
   |
18 |     |> list.map((c) => {
   |                --------------- '(' opened here
...
23 |       } else {
   |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 26:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:26:5
   |
26 |     })
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
