# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  let
    shift_letters = (c: String) =>
      if string.is_lower(c) then
        let
          codepoint = option.unwrap_or(string.codepoint(c), 0)
          base = 97
          new_codepoint = (codepoint - base + shift) % 26 + base
        in
          string.from_codepoint(new_codepoint)
      else
        c
  in
    string.join(list.map(string.chars(text), shift_letters), "")

fn decrypt(text: String, shift: Int) -> String =
  let
    shift_letters = (c: String) =>
      if string.is_lower(c) then
        let
          codepoint = option.unwrap_or(string.codepoint(c), 0)
          base = 97
          new_codepoint = (codepoint - base - shift + 26) % 26 + base
        in
          string.from_codepoint(new_codepoint)
      else
        c
  in
    string.join(list.map(string.chars(text), shift_letters), "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-caesar-cipher-0.almd:2:6
  |
2 |   let
  |      ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:5:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |         let
  |         ^^^
error: Expected expression at line 9:9 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:9:9
  |
9 |         in
  |         ^
error: Expected expression at line 11:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:11:7
   |
11 |       else
   |       ^
error: Expected expression at line 13:3 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:13:3
   |
13 |   in
   |   ^
error: Expected identifier at line 17:6 (got Newline '')
  --> /tmp/dojo-caesar-cipher-0.almd:17:6
   |
17 |   let
   |      ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:20:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
20 |         let
   |         ^^^
error: Expected expression at line 24:9 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:24:9
   |
24 |         in
   |         ^
error: Expected expression at line 26:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:26:7
   |
26 |       else
   |       ^
error: Expected expression at line 28:3 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:28:3
   |
28 |   in
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:6:57
  in variable c
  hint: Check the variable name
  |
6 |           codepoint = option.unwrap_or(string.codepoint(c), 0)
  |                                                         ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:8:28
  in variable codepoint
  hint: Check the variable name
  |
8 |           new_codepoint = (codepoint - base + shift) % 26 + base
  |                            ^^^^^^^^^
error[E003]: undefined variable 'base'
  --> /tmp/dojo-caesar-cipher-0.almd:8:40
  in variable base
  hint: Check the variable name
  |
8 |           new_codepoint = (codepoint - base + shift) % 26 + base
  |                                        ^^^^
error[E003]: undefined variable 'base'
  --> /tmp/dojo-caesar-cipher-0.almd:8:61
  in variable base
  hint: Check the variable name
  |
8 |           new_codepoint = (codepoint - base + shift) % 26 + base
  |                                                             ^^^^
error[E003]: undefined variable 'new_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:10:33
  in variable new_codepoint
  hint: Check the variable name
   |
10 |           string.from_codepoint(new_codepoint)
   |                                 ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:12:9
  in variable c
  hint: Check the variable name
   |
12 |         c
   |         ^
error[E003]: undefined variable 'shift_letters'
  --> /tmp/dojo-caesar-cipher-0.almd:14:46
  in variable shift_letters
  hint: Check the variable name
   |
14 |     string.join(list.map(string.chars(text), shift_letters), "")
   |                                              ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:21:57
  in variable c
  hint: Check the variable name
   |
21 |           codepoint = option.unwrap_or(string.codepoint(c), 0)
   |                                                         ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:23:28
  in variable codepoint
  hint: Check the variable name
   |
23 |           new_codepoint = (codepoint - base - shift + 26) % 26 + base
   |                            ^^^^^^^^^
error[E003]: undefined variable 'base'
  --> /tmp/dojo-caesar-cipher-0.almd:23:40
  in variable base
  hint: Check the variable name
   |
23 |           new_codepoint = (codepoint - base - shift + 26) % 26 + base
   |                                        ^^^^
error[E003]: undefined variable 'base'
  --> /tmp/dojo-caesar-cipher-0.almd:23:66
  in variable base
  hint: Check the variable name
   |
23 |           new_codepoint = (codepoint - base - shift + 26) % 26 + base
   |                                                                  ^^^^
error[E003]: undefined variable 'new_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:25:33
  in variable new_codepoint
  hint: Check the variable name
   |
25 |           string.from_codepoint(new_codepoint)
   |                                 ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:27:9
  in variable c
  hint: Check the variable name
   |
27 |         c
   |         ^
error[E003]: undefined variable 'shift_letters'
  --> /tmp/dojo-caesar-cipher-0.almd:29:46
  in variable shift_letters
  hint: Check the variable name
   |
29 |     string.join(list.map(string.chars(text), shift_letters), "")
   |                                              ^^^^^^^^^^^^^

24 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(
      string.chars(text),
      (c: String) =>
        if string.is_lower(c) then
          let codepoint = option.unwrap_or(string.codepoint(c), 0)
          let base = 97
          let new_codepoint = (codepoint - base + shift) % 26 + base
          in string.from_codepoint(new_codepoint)
        else c
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(
      string.chars(text),
      (c: String) =>
        if string.is_lower(c) then
          let codepoint = option.unwrap_or(string.codepoint(c), 0)
          let base = 97
          let new_codepoint = (codepoint - base - shift + 26) % 26 + base
          in string.from_codepoint(new_codepoint)
        else c
    ),
    ""
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:7:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |           let codepoint = option.unwrap_or(string.codepoint(c), 0)
  |           ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:22:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
22 |           let codepoint = option.unwrap_or(string.codepoint(c), 0)
   |           ^^^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(
      string.chars(text),
      (c: String) =>
        if string.is_lower(c) then
          {
            let codepoint = option.unwrap_or(string.codepoint(c), 0)
            let base = 97
            let new_codepoint = (codepoint - base + shift) % 26 + base
            string.from_codepoint(new_codepoint)
          }
        else c
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(
      string.chars(text),
      (c: String) =>
        if string.is_lower(c) then
          {
            let codepoint = option.unwrap_or(string.codepoint(c), 0)
            let base = 97
            let new_codepoint = (codepoint - base - shift + 26) % 26 + base
            string.from_codepoint(new_codepoint)
          }
        else c
    ),
    ""
  )
```
