# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  let chars = string.chars(text)
  let shifted_chars = list.map(chars, (c) => 
    let codepoint = string.codepoint(c) 
    if codepoint >= 97 and codepoint <= 122 then 
      let new_codepoint = (codepoint - 97 + shift) % 26 + 97
      string.from_codepoint(new_codepoint)
    else 
      c
  )
  string.join(shifted_chars, "")

fn decrypt(text: String, shift: Int) -> String = 
  let chars = string.chars(text)
  let shifted_chars = list.map(chars, (c) => 
    let codepoint = string.codepoint(c) 
    if codepoint >= 97 and codepoint <= 122 then 
      let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
      string.from_codepoint(new_codepoint)
    else 
      c
  )
  string.join(shifted_chars, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let codepoint = string.codepoint(c)
  |     ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:6:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |       let new_codepoint = (codepoint - 97 + shift) % 26 + 97
  |       ^^^
error: Expected expression at line 8:5 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:8:5
  |
8 |     else
  |     ^
error: Expected expression at line 10:3 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-0.almd:10:3
   |
10 |   )
   |   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:16:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
16 |     let codepoint = string.codepoint(c)
   |     ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:18:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
18 |       let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
   |       ^^^
error: Expected expression at line 20:5 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:20:5
   |
20 |     else
   |     ^
error: Expected expression at line 22:3 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-0.almd:22:3
   |
22 |   )
   |   ^
error[E003]: undefined variable 'new_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:7:29
  in variable new_codepoint
  hint: Check the variable name
  |
7 |       string.from_codepoint(new_codepoint)
  |                             ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:9:7
  in variable c
  hint: Check the variable name
  |
9 |       c
  |       ^
error[E003]: undefined variable 'shifted_chars'
  --> /tmp/dojo-caesar-cipher-0.almd:11:15
  in variable shifted_chars
  hint: Check the variable name
   |
11 |   string.join(shifted_chars, "")
   |               ^^^^^^^^^^^^^
error[E003]: undefined variable 'new_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:19:29
  in variable new_codepoint
  hint: Check the variable name
   |
19 |       string.from_codepoint(new_codepoint)
   |                             ^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:21:7
  in variable c
  hint: Check the variable name
   |
21 |       c
   |       ^
error[E003]: undefined variable 'shifted_chars'
  --> /tmp/dojo-caesar-cipher-0.almd:23:15
  in variable shifted_chars
  hint: Check the variable name
   |
23 |   string.join(shifted_chars, "")
   |               ^^^^^^^^^^^^^

14 error(s) found
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
      if string.codepoint(c) >= some(97) and string.codepoint(c) <= some(122) then 
        string.from_codepoint((string.codepoint(c) - some(97) + shift) % 26 + 97)
      else 
        c
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(string.chars(text), (c) => 
      if string.codepoint(c) >= some(97) and string.codepoint(c) <= some(122) then 
        string.from_codepoint((string.codepoint(c) - some(97) - shift + 26) % 26 + 97)
      else 
        c
    ),
    ""
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: operator '-' requires numeric types but got Option[Int] and Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:5:59
  in operator -
  hint: Use numeric types (Int or Float)
  |
5 |         string.from_codepoint((string.codepoint(c) - some(97) + shift) % 26 + 97)
  |                                                           ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:5:65
  in operator +
  hint: Use + with numeric types, String, or List
  |
5 |         string.from_codepoint((string.codepoint(c) - some(97) + shift) % 26 + 97)
  |                                                                 ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:5:74
  in operator %
  hint: Use numeric types (Int or Float)
  |
5 |         string.from_codepoint((string.codepoint(c) - some(97) + shift) % 26 + 97)
  |                                                                          ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:5:79
  in operator +
  hint: Use + with numeric types, String, or List
  |
5 |         string.from_codepoint((string.codepoint(c) - some(97) + shift) % 26 + 97)
  |                                                                               ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:5:79
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
5 |         string.from_codepoint((string.codepoint(c) - some(97) + shift) % 26 + 97)
  |                                                                               ^^
error: operator '-' requires numeric types but got Option[Int] and Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:16:59
  in operator -
  hint: Use numeric types (Int or Float)
   |
16 |         string.from_codepoint((string.codepoint(c) - some(97) - shift + 26) % 26 + 97)
   |                                                           ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:16:65
  in operator -
  hint: Use numeric types (Int or Float)
   |
16 |         string.from_codepoint((string.codepoint(c) - some(97) - shift + 26) % 26 + 97)
   |                                                                 ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:16:73
  in operator +
  hint: Use + with numeric types, String, or List
   |
16 |         string.from_codepoint((string.codepoint(c) - some(97) - shift + 26) % 26 + 97)
   |                                                                         ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:16:79
  in operator %
  hint: Use numeric types (Int or Float)
   |
16 |         string.from_codepoint((string.codepoint(c) - some(97) - shift + 26) % 26 + 97)
   |                                                                               ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:16:84
  in operator +
  hint: Use + with numeric types, String, or List
   |
16 |         string.from_codepoint((string.codepoint(c) - some(97) - shift + 26) % 26 + 97)
   |                                                                                    ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:16:84
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
16 |         string.from_codepoint((string.codepoint(c) - some(97) - shift + 26) % 26 + 97)
   |                                                                                    ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:5:79
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
5 |         string.from_codepoint((string.codepoint(c) - some(97) + shift) % 26 + 97)
  |                                                                               ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:16:84
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
16 |         string.from_codepoint((string.codepoint(c) - some(97) - shift + 26) % 26 + 97)
   |                                                                                    ^^

13 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(string.chars(text), (c) => 
      match string.codepoint(c) {
        some(code) => 
          if code >= 97 and code <= 122 then 
            string.from_codepoint((code - 97 + shift) % 26 + 97)
          else 
            c
        none => 
          c
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
            string.from_codepoint((code - 97 - shift + 26) % 26 + 97)
          else 
            c
        none => 
          c
      }
    ),
    ""
  )
```
