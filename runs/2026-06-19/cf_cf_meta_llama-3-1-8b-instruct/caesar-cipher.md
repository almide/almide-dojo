# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
    string.chars(text)
        |> list.map((c) => {
            let codepoint = string.codepoint(c);
            if codepoint >= 97 && codepoint <= 122 {
                let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
                string.from_codepoint(new_codepoint)
            } else {
                c
            }
        })
        |> string.join("")
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
    string.chars(text)
        |> list.map((c) => {
            let codepoint = string.codepoint(c);
            if codepoint >= 97 && codepoint <= 122 {
                let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
                string.from_codepoint(new_codepoint)
            } else {
                c
            }
        })
        |> string.join("")
}

fn decrypt(text: String, shift: Int) -> String = {
    encrypt(text, 26 - shift)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '&&' is not valid in Almide at line 5:32
  --> /tmp/dojo-caesar-cipher-1.almd:5:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |             if codepoint >= 97 && codepoint <= 122 {
  |                                ^
error: Expected ')' to close function call opened at line 3:20
  --> /tmp/dojo-caesar-cipher-1.almd:8:15
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |         |> list.map((c) => {
  |                    --------------- '(' opened here
...
8 |             } else {
  |               ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:9 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:11:9
   |
11 |         })
   |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:9:17
  in variable c
  hint: Check the variable name
  |
9 |                 c
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
    string.chars(text)
        |> list.map((c) => {
            let codepoint = string.codepoint(c);
            let in_range = codepoint >= 97 and codepoint <= 122;
            if in_range {
                let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
                string.from_codepoint(new_codepoint)
            } else {
                c
            }
        })
        |> string.join("")
}

fn decrypt(text: String, shift: Int) -> String = {
    encrypt(text, 26 - shift)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected Then at line 6:25 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:6:25
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |             if in_range {
  |                         ^
error: Expected ')' to close function call opened at line 3:20
  --> /tmp/dojo-caesar-cipher-2.almd:9:15
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |         |> list.map((c) => {
  |                    --------------- '(' opened here
...
9 |             } else {
  |               ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:9 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:12:9
   |
12 |         })
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
    string.chars(text)
        |> list.map((char) => {
            let codepoint = string.codepoint(char);
            let in_range = codepoint >= 97 and codepoint <= 122;
            if in_range {
                let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
                string.from_codepoint(new_codepoint)
            } else {
                char
            }
        })
        |> string.join("")
}

fn decrypt(text: String, shift: Int) -> String = {
    let new_shift = 26 - shift;
    string.chars(text)
        |> list.map((char) => {
            let codepoint = string.codepoint(char);
            let in_range = codepoint >= 97 and codepoint <= 122;
            if in_range {
                let new_codepoint = (codepoint - 97 + new_shift) % 26 + 97;
                string.from_codepoint(new_codepoint)
            } else {
                char
            }
        })
        |> string.join("")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected Then at line 6:25 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:6:25
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |             if in_range {
  |                         ^
error: Expected ')' to close function call opened at line 3:20
  --> /tmp/dojo-caesar-cipher-3.almd:9:15
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |         |> list.map((char) => {
  |                    --------------- '(' opened here
...
9 |             } else {
  |               ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:9 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:12:9
   |
12 |         })
   |         ^
error: Expected Then at line 22:25 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:22:25
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
22 |             if in_range {
   |                         ^
error: Expected ')' to close function call opened at line 19:20
  --> /tmp/dojo-caesar-cipher-3.almd:25:15
  hint: Add ')' or check for a missing delimiter inside the function call
   |
19 |         |> list.map((char) => {
   |                    --------------- '(' opened here
...
25 |             } else {
   |               ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 28:9 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:28:9
   |
28 |         })
   |         ^
error[E003]: undefined variable 'char'
  --> /tmp/dojo-caesar-cipher-3.almd:10:17
  in variable char
  hint: Check the variable name
   |
10 |                 char
   |                 ^^^^
error[E003]: undefined variable 'char'
  --> /tmp/dojo-caesar-cipher-3.almd:26:17
  in variable char
  hint: Check the variable name
   |
26 |                 char
   |                 ^^^^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
