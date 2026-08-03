# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  let
    shift_amount = shift % 26
    encrypted_chars =
      string.chars(text)
      |> list.map((c) =>
        let
          codepoint = string.codepoint(c)
        in
        if codepoint >= 97 and codepoint <= 122 then
          let
            shifted_codepoint = (codepoint - 97 + shift_amount) % 26 + 97
          in
          string.from_codepoint(shifted_codepoint)
        else
          c
      )
  in
  string.join(encrypted_chars, "")

fn decrypt(text: String, shift: Int) -> String =
  let
    shift_amount = shift % 26
    decrypted_chars =
      string.chars(text)
      |> list.map((c) =>
        let
          codepoint = string.codepoint(c)
        in
        if codepoint >= 97 and codepoint <= 122 then
          let
            shifted_codepoint = (codepoint - 97 - shift_amount + 26) % 26 + 97
          in
          string.from_codepoint(shifted_codepoint)
        else
          c
      )
  in
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
  --> /tmp/dojo-caesar-cipher-0.almd:7:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |         let
  |         ^^^
error: Expected expression at line 9:9 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:9:9
  |
9 |         in
  |         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:11:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |           let
   |           ^^^
error: Expected expression at line 13:11 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:13:11
   |
13 |           in
   |           ^
error: Expected expression at line 15:9 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:15:9
   |
15 |         else
   |         ^
error: Expected expression at line 17:7 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-0.almd:17:7
   |
17 |       )
   |       ^
error: Expected identifier at line 22:6 (got Newline '')
  --> /tmp/dojo-caesar-cipher-0.almd:22:6
   |
22 |   let
   |      ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:27:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
27 |         let
   |         ^^^
error: Expected expression at line 29:9 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:29:9
   |
29 |         in
   |         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:31:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
31 |           let
   |           ^^^
error: Expected expression at line 33:11 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:33:11
   |
33 |           in
   |           ^
error: Expected expression at line 35:9 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:35:9
   |
35 |         else
   |         ^
error: Expected expression at line 37:7 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-0.almd:37:7
   |
37 |       )
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:8:40
  in variable c
  hint: Check the variable name
  |
8 |           codepoint = string.codepoint(c)
  |                                        ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:12:34
  in variable codepoint
  hint: Check the variable name
   |
12 |             shifted_codepoint = (codepoint - 97 + shift_amount) % 26 + 97
   |                                  ^^^^^^^^^
error[E003]: undefined variable 'shift_amount'
  --> /tmp/dojo-caesar-cipher-0.almd:12:51
  in variable shift_amount
  hint: Check the variable name
   |
12 |             shifted_codepoint = (codepoint - 97 + shift_amount) % 26 + 97
   |                                                   ^^^^^^^^^^^^
error[E003]: undefined variable 'shifted_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:14:33
  in variable shifted_codepoint
  hint: Did you mean `string.codepoint`?
  try:
      // shifted_codepoint  →  string.codepoint
      string.codepoint
   |
14 |           string.from_codepoint(shifted_codepoint)
   |                                 ^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:16:11
  in variable c
  hint: Check the variable name
   |
16 |           c
   |           ^
error[E003]: undefined variable 'encrypted_chars'
  --> /tmp/dojo-caesar-cipher-0.almd:19:15
  in variable encrypted_chars
  hint: Check the variable name
   |
19 |   string.join(encrypted_chars, "")
   |               ^^^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:28:40
  in variable c
  hint: Check the variable name
   |
28 |           codepoint = string.codepoint(c)
   |                                        ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:32:34
  in variable codepoint
  hint: Check the variable name
   |
32 |             shifted_codepoint = (codepoint - 97 - shift_amount + 26) % 26 + 97
   |                                  ^^^^^^^^^
error[E003]: undefined variable 'shift_amount'
  --> /tmp/dojo-caesar-cipher-0.almd:32:51
  in variable shift_amount
  hint: Check the variable name
   |
32 |             shifted_codepoint = (codepoint - 97 - shift_amount + 26) % 26 + 97
   |                                                   ^^^^^^^^^^^^
error[E003]: undefined variable 'shifted_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:34:33
  in variable shifted_codepoint
  hint: Did you mean `string.codepoint`?
  try:
      // shifted_codepoint  →  string.codepoint
      string.codepoint
   |
34 |           string.from_codepoint(shifted_codepoint)
   |                                 ^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:36:11
  in variable c
  hint: Check the variable name
   |
36 |           c
   |           ^
error[E001]: type mismatch in fn 'decrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-0.almd:36:11
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
36 |           c
   |           ^

26 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(string.chars(text), (c) =>
      let codepoint = string.codepoint(c) in
      if codepoint >= 97 and codepoint <= 122 then
        string.from_codepoint((codepoint - 97 + shift % 26) % 26 + 97)
      else
        c
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(string.chars(text), (c) =>
      let codepoint = string.codepoint(c) in
      if codepoint >= 97 and codepoint <= 122 then
        string.from_codepoint((codepoint - 97 - shift % 26 + 26) % 26 + 97)
      else
        c
    ),
    ""
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:4:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |       let codepoint = string.codepoint(c) in
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:16:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
16 |       let codepoint = string.codepoint(c) in
   |       ^^^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(string.chars(text), (c) =>
      if string.codepoint(c) >= some(97) and string.codepoint(c) <= some(122) then
        string.from_codepoint((string.codepoint(c) - 97 + shift % 26) % 26 + 97)
      else
        c
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(string.chars(text), (c) =>
      if string.codepoint(c) >= some(97) and string.codepoint(c) <= some(122) then
        string.from_codepoint((string.codepoint(c) - 97 - shift % 26 + 26) % 26 + 97)
      else
        c
    ),
    ""
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:5:54
  in operator -
  hint: Use numeric types (Int or Float)
  |
5 |         string.from_codepoint((string.codepoint(c) - 97 + shift % 26) % 26 + 97)
  |                                                      ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:5:67
  in operator +
  hint: Use + with numeric types, String, or List
  |
5 |         string.from_codepoint((string.codepoint(c) - 97 + shift % 26) % 26 + 97)
  |                                                                   ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:5:73
  in operator %
  hint: Use numeric types (Int or Float)
  |
5 |         string.from_codepoint((string.codepoint(c) - 97 + shift % 26) % 26 + 97)
  |                                                                         ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:5:78
  in operator +
  hint: Use + with numeric types, String, or List
  |
5 |         string.from_codepoint((string.codepoint(c) - 97 + shift % 26) % 26 + 97)
  |                                                                              ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:5:78
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
5 |         string.from_codepoint((string.codepoint(c) - 97 + shift % 26) % 26 + 97)
  |                                                                              ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:16:54
  in operator -
  hint: Use numeric types (Int or Float)
   |
16 |         string.from_codepoint((string.codepoint(c) - 97 - shift % 26 + 26) % 26 + 97)
   |                                                      ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:16:67
  in operator -
  hint: Use numeric types (Int or Float)
   |
16 |         string.from_codepoint((string.codepoint(c) - 97 - shift % 26 + 26) % 26 + 97)
   |                                                                   ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:16:72
  in operator +
  hint: Use + with numeric types, String, or List
   |
16 |         string.from_codepoint((string.codepoint(c) - 97 - shift % 26 + 26) % 26 + 97)
   |                                                                        ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:16:78
  in operator %
  hint: Use numeric types (Int or Float)
   |
16 |         string.from_codepoint((string.codepoint(c) - 97 - shift % 26 + 26) % 26 + 97)
   |                                                                              ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:16:83
  in operator +
  hint: Use + with numeric types, String, or List
   |
16 |         string.from_codepoint((string.codepoint(c) - 97 - shift % 26 + 26) % 26 + 97)
   |                                                                                   ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:16:83
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
16 |         string.from_codepoint((string.codepoint(c) - 97 - shift % 26 + 26) % 26 + 97)
   |                                                                                   ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:5:78
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
5 |         string.from_codepoint((string.codepoint(c) - 97 + shift % 26) % 26 + 97)
  |                                                                              ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:16:83
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
16 |         string.from_codepoint((string.codepoint(c) - 97 - shift % 26 + 26) % 26 + 97)
   |                                                                                   ^^

13 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(string.chars(text), (c) =>
      match string.codepoint(c) {
        some(code) =>
          if code >= 97 and code <= 122 then
            string.from_codepoint((code - 97 + shift % 26) % 26 + 97)
          else
            c
        none => c
      }
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(string.chars(text), (c) =>
      match string.codepoint(c) {
        some(code) =>
          if code >= 97 and code <= 122 then
            string.from_codepoint((code - 97 - shift % 26 + 26) % 26 + 97)
          else
            c
        none => c
      }
    ),
    ""
  )
```
