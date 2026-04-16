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
    shift_letters = (x) =>
      if string.is_lower(x) then
        let
          codepoint = string.codepoint(x)
          shifted_codepoint = (codepoint - 97 + shift) % 26 + 97
        in
          string.from_codepoint(shifted_codepoint)
      else
        x
  in
    string.join(string.map(string.chars(text), shift_letters), "")

fn decrypt(text: String, shift: Int) -> String =
  let
    shift_letters = (x) =>
      if string.is_lower(x) then
        let
          codepoint = string.codepoint(x)
          shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
        in
          string.from_codepoint(shifted_codepoint)
      else
        x
  in
    string.join(string.map(string.chars(text), shift_letters), "")
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
error: Expected expression at line 8:9 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:8:9
  |
8 |         in
  |         ^
error: Expected expression at line 10:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:10:7
   |
10 |       else
   |       ^
error: Expected expression at line 12:3 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:12:3
   |
12 |   in
   |   ^
error: Expected identifier at line 16:6 (got Newline '')
  --> /tmp/dojo-caesar-cipher-0.almd:16:6
   |
16 |   let
   |      ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:19:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
19 |         let
   |         ^^^
error: Expected expression at line 22:9 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:22:9
   |
22 |         in
   |         ^
error: Expected expression at line 24:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:24:7
   |
24 |       else
   |       ^
error: Expected expression at line 26:3 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:26:3
   |
26 |   in
   |   ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-caesar-cipher-0.almd:6:40
  in variable x
  hint: Check the variable name
  |
6 |           codepoint = string.codepoint(x)
  |                                        ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:7:32
  in variable codepoint
  hint: Check the variable name
  |
7 |           shifted_codepoint = (codepoint - 97 + shift) % 26 + 97
  |                                ^^^^^^^^^
error[E003]: undefined variable 'shifted_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:9:33
  in variable shifted_codepoint
  hint: Did you mean `string.codepoint`?
  try:
      // shifted_codepoint  →  string.codepoint
      string.codepoint
  |
9 |           string.from_codepoint(shifted_codepoint)
  |                                 ^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-caesar-cipher-0.almd:11:9
  in variable x
  hint: Check the variable name
   |
11 |         x
   |         ^
error[E003]: undefined variable 'shift_letters'
  --> /tmp/dojo-caesar-cipher-0.almd:13:48
  in variable shift_letters
  hint: Check the variable name
   |
13 |     string.join(string.map(string.chars(text), shift_letters), "")
   |                                                ^^^^^^^^^^^^^
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-caesar-cipher-0.almd:13:48
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
13 |     string.join(string.map(string.chars(text), shift_letters), "")
   |                                                ^^^^^^^^^^^^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-caesar-cipher-0.almd:20:40
  in variable x
  hint: Check the variable name
   |
20 |           codepoint = string.codepoint(x)
   |                                        ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:21:32
  in variable codepoint
  hint: Check the variable name
   |
21 |           shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
   |                                ^^^^^^^^^
error[E003]: undefined variable 'shifted_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:23:33
  in variable shifted_codepoint
  hint: Did you mean `string.codepoint`?
  try:
      // shifted_codepoint  →  string.codepoint
      string.codepoint
   |
23 |           string.from_codepoint(shifted_codepoint)
   |                                 ^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-caesar-cipher-0.almd:25:9
  in variable x
  hint: Check the variable name
   |
25 |         x
   |         ^
error[E003]: undefined variable 'shift_letters'
  --> /tmp/dojo-caesar-cipher-0.almd:27:48
  in variable shift_letters
  hint: Check the variable name
   |
27 |     string.join(string.map(string.chars(text), shift_letters), "")
   |                                                ^^^^^^^^^^^^^
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-caesar-cipher-0.almd:27:48
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
27 |     string.join(string.map(string.chars(text), shift_letters), "")
   |                                                ^^^^^^^^^^^^^

22 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.join(list.map(string.chars(text), (c) =>
    if string.is_lower(c) then
      string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
    else
      c
  ), "")

fn decrypt(text: String, shift: Int) -> String =
  string.join(list.map(string.chars(text), (c) =>
    if string.is_lower(c) then
      string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
    else
      c
  ), "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:4:52
  in operator -
  hint: Use numeric types (Int or Float)
  |
4 |       string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                    ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:4:57
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                         ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:4:66
  in operator %
  hint: Use numeric types (Int or Float)
  |
4 |       string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                                  ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:4:71
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                                       ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:4:71
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
4 |       string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                                       ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:12:52
  in operator -
  hint: Use numeric types (Int or Float)
   |
12 |       string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
   |                                                    ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:12:57
  in operator -
  hint: Use numeric types (Int or Float)
   |
12 |       string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
   |                                                         ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:12:65
  in operator +
  hint: Use + with numeric types, String, or List
   |
12 |       string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
   |                                                                 ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:12:71
  in operator %
  hint: Use numeric types (Int or Float)
   |
12 |       string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
   |                                                                       ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:12:76
  in operator +
  hint: Use + with numeric types, String, or List
   |
12 |       string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
   |                                                                            ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:12:76
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
12 |       string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
   |                                                                            ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:4:71
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
4 |       string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                                       ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:12:76
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
12 |       string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
   |                                                                            ^^

13 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.join(list.map(string.chars(text), (c) =>
    match string.codepoint(c) {
      some(code) =>
        if string.is_lower(c) then
          string.from_codepoint((code - 97 + shift) % 26 + 97)
        else
          c
      none => c
    }
  ), "")

fn decrypt(text: String, shift: Int) -> String =
  string.join(list.map(string.chars(text), (c) =>
    match string.codepoint(c) {
      some(code) =>
        if string.is_lower(c) then
          string.from_codepoint((code - 97 - shift + 26) % 26 + 97)
        else
          c
      none => c
    }
  ), "")
```
