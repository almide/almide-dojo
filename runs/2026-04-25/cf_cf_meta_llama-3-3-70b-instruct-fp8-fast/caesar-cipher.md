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
      (char) => 
        if string.is_lower(char) then
          let 
            codepoint = string.codepoint(char) |> option.unwrap_or(0)
            new_codepoint = (codepoint - 97 + shift) % 26 + 97
          in string.from_codepoint(new_codepoint) |> option.unwrap_or("")
        else char
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text),
      (char) => 
        if string.is_lower(char) then
          let 
            codepoint = string.codepoint(char) |> option.unwrap_or(0)
            new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
          in string.from_codepoint(new_codepoint) |> option.unwrap_or("")
        else char
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
  --> /tmp/dojo-caesar-cipher-0.almd:22:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
22 |           let
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
      (char) => 
        if string.is_lower(char) then
          {
            let codepoint = string.codepoint(char) |> option.unwrap_or(0)
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97
            string.from_codepoint(new_codepoint) |> option.unwrap_or("")
          }
        else char
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text),
      (char) => 
        if string.is_lower(char) then
          {
            let codepoint = string.codepoint(char) |> option.unwrap_or(0)
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
            string.from_codepoint(new_codepoint) |> option.unwrap_or("")
          }
        else char
    ),
    ""
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-caesar-cipher-1.almd:10:70
  in call to option.unwrap_or()
  hint: Fix the argument type
   |
10 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                                                      ^^
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-caesar-cipher-1.almd:26:70
  in call to option.unwrap_or()
  hint: Fix the argument type
   |
26 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                                                      ^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[String] but got String
  --> /tmp/dojo-caesar-cipher-1.almd:10:70
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
10 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                                                      ^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[String] but got String
  --> /tmp/dojo-caesar-cipher-1.almd:26:70
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
26 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                                                      ^^

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
      (char) => 
        if string.is_lower(char) then
          {
            let codepoint = string.codepoint(char) 
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97
            string.from_codepoint(new_codepoint)
          }
        else char
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text),
      (char) => 
        if string.is_lower(char) then
          {
            let codepoint = string.codepoint(char) 
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
            string.from_codepoint(new_codepoint)
          }
        else char
    ),
    ""
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:9:46
  in operator -
  hint: Use numeric types (Int or Float)
  |
9 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97
  |                                              ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:9:51
  in operator +
  hint: Use + with numeric types, String, or List
  |
9 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97
  |                                                   ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:9:60
  in operator %
  hint: Use numeric types (Int or Float)
  |
9 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97
  |                                                            ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:9:65
  in operator +
  hint: Use + with numeric types, String, or List
  |
9 |             let new_codepoint = (codepoint - 97 + shift) % 26 + 97
  |                                                                 ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:10:35
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
10 |             string.from_codepoint(new_codepoint)
   |                                   ^^^^^^^^^^^^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:25:46
  in operator -
  hint: Use numeric types (Int or Float)
   |
25 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
   |                                              ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:25:51
  in operator -
  hint: Use numeric types (Int or Float)
   |
25 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
   |                                                   ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:25:59
  in operator +
  hint: Use + with numeric types, String, or List
   |
25 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
   |                                                           ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:25:65
  in operator %
  hint: Use numeric types (Int or Float)
   |
25 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
   |                                                                 ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:25:70
  in operator +
  hint: Use + with numeric types, String, or List
   |
25 |             let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
   |                                                                      ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:26:35
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
26 |             string.from_codepoint(new_codepoint)
   |                                   ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:10:35
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
10 |             string.from_codepoint(new_codepoint)
   |                                   ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:26:35
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
26 |             string.from_codepoint(new_codepoint)
   |                                   ^^^^^^^^^^^^^

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
      (char) => 
        if string.is_lower(char) then
          {
            let codepoint = string.codepoint(char) |> option.unwrap_or(0)
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97
            string.from_codepoint(new_codepoint)
          }
        else char
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text),
      (char) => 
        if string.is_lower(char) then
          {
            let codepoint = string.codepoint(char) |> option.unwrap_or(0)
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
            string.from_codepoint(new_codepoint)
          }
        else char
    ),
    ""
  )
```
