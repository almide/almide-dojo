# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text),
      (c) => 
        if string.is_lower(c) then
          let 
            code = string.codepoint(c) |> option.unwrap_or(0)
            shifted_code = (code - 97 + shift) % 26 + 97
          in
            string.from_codepoint(shifted_code) |> option.unwrap_or("")
        else 
          c
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text),
      (c) => 
        if string.is_lower(c) then
          let 
            code = string.codepoint(c) |> option.unwrap_or(0)
            shifted_code = (code - 97 - shift + 26) % 26 + 97
          in
            string.from_codepoint(shifted_code) |> option.unwrap_or("")
        else 
          c
    ),
    ""
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:7:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |           let
  |           ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:24:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
24 |           let
   |           ^^^

2 error(s) found
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
      (c) => 
        if string.is_lower(c) then
          {
            let code = string.codepoint(c) |> option.unwrap_or(0)
            let shifted_code = (code - 97 + shift) % 26 + 97
            string.from_codepoint(shifted_code) |> option.unwrap_or("")
          }
        else 
          c
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text),
      (c) => 
        if string.is_lower(c) then
          {
            let code = string.codepoint(c) |> option.unwrap_or(0)
            let shifted_code = (code - 97 - shift + 26) % 26 + 97
            string.from_codepoint(shifted_code) |> option.unwrap_or("")
          }
        else 
          c
    ),
    ""
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-caesar-cipher-1.almd:10:69
  in call to option.unwrap_or()
  hint: Fix the argument type
   |
10 |             string.from_codepoint(shifted_code) |> option.unwrap_or("")
   |                                                                     ^^
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-caesar-cipher-1.almd:27:69
  in call to option.unwrap_or()
  hint: Fix the argument type
   |
27 |             string.from_codepoint(shifted_code) |> option.unwrap_or("")
   |                                                                     ^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[String] but got String
  --> /tmp/dojo-caesar-cipher-1.almd:10:69
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
10 |             string.from_codepoint(shifted_code) |> option.unwrap_or("")
   |                                                                     ^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[String] but got String
  --> /tmp/dojo-caesar-cipher-1.almd:27:69
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
27 |             string.from_codepoint(shifted_code) |> option.unwrap_or("")
   |                                                                     ^^

4 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text),
      (c) => 
        if string.is_lower(c) then
          {
            let code = string.codepoint(c) 
            let shifted_code = (code - 97 + shift) % 26 + 97
            string.from_codepoint(shifted_code)
          }
        else 
          c
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text),
      (c) => 
        if string.is_lower(c) then
          {
            let code = string.codepoint(c) 
            let shifted_code = (code - 97 - shift + 26) % 26 + 97
            string.from_codepoint(shifted_code)
          }
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
  --> /tmp/dojo-caesar-cipher-2.almd:9:40
  in operator -
  hint: Use numeric types (Int or Float)
  |
9 |             let shifted_code = (code - 97 + shift) % 26 + 97
  |                                        ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:9:45
  in operator +
  hint: Use + with numeric types, String, or List
  |
9 |             let shifted_code = (code - 97 + shift) % 26 + 97
  |                                             ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:9:54
  in operator %
  hint: Use numeric types (Int or Float)
  |
9 |             let shifted_code = (code - 97 + shift) % 26 + 97
  |                                                      ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:9:59
  in operator +
  hint: Use + with numeric types, String, or List
  |
9 |             let shifted_code = (code - 97 + shift) % 26 + 97
  |                                                           ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:10:35
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
10 |             string.from_codepoint(shifted_code)
   |                                   ^^^^^^^^^^^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:26:40
  in operator -
  hint: Use numeric types (Int or Float)
   |
26 |             let shifted_code = (code - 97 - shift + 26) % 26 + 97
   |                                        ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:26:45
  in operator -
  hint: Use numeric types (Int or Float)
   |
26 |             let shifted_code = (code - 97 - shift + 26) % 26 + 97
   |                                             ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:26:53
  in operator +
  hint: Use + with numeric types, String, or List
   |
26 |             let shifted_code = (code - 97 - shift + 26) % 26 + 97
   |                                                     ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:26:59
  in operator %
  hint: Use numeric types (Int or Float)
   |
26 |             let shifted_code = (code - 97 - shift + 26) % 26 + 97
   |                                                           ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:26:64
  in operator +
  hint: Use + with numeric types, String, or List
   |
26 |             let shifted_code = (code - 97 - shift + 26) % 26 + 97
   |                                                                ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:27:35
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
27 |             string.from_codepoint(shifted_code)
   |                                   ^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:10:35
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
10 |             string.from_codepoint(shifted_code)
   |                                   ^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:27:35
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
27 |             string.from_codepoint(shifted_code)
   |                                   ^^^^^^^^^^^^

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
    list.map(
      string.chars(text),
      (c) => 
        if string.is_lower(c) then
          {
            let code = string.codepoint(c) |> option.unwrap_or(0)
            let shifted_code = (code - 97 + shift) % 26 + 97
            string.from_codepoint(shifted_code)
          }
        else 
          c
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text),
      (c) => 
        if string.is_lower(c) then
          {
            let code = string.codepoint(c) |> option.unwrap_or(0)
            let shifted_code = (code - 97 - shift + 26) % 26 + 97
            string.from_codepoint(shifted_code)
          }
        else 
          c
    ),
    ""
  )
```
