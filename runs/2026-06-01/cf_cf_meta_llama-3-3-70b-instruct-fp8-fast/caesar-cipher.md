# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String
  = string.join(
      list.map(
        string.chars(text),
        (c) =>
          if string.is_lower(c) then
            let
              code = string.codepoint(c) |> option.unwrap_or(0)
              new_code = (code - 97 + shift) % 26 + 97
            in
              string.from_codepoint(new_code) |> option.unwrap_or("")
          else
            c
      ),
      ""
    )

fn decrypt(text: String, shift: Int) -> String
  = string.join(
      list.map(
        string.chars(text),
        (c) =>
          if string.is_lower(c) then
            let
              code = string.codepoint(c) |> option.unwrap_or(0)
              new_code = (code - 97 - shift + 26) % 26 + 97
            in
              string.from_codepoint(new_code) |> option.unwrap_or("")
          else
            c
      ),
      ""
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:3 (got Eq '=')
  --> /tmp/dojo-caesar-cipher-0.almd:2:3
  |
2 |   = string.join(
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 19:3 (got Eq '=')
  --> /tmp/dojo-caesar-cipher-0.almd:19:3
   |
19 |   = string.join(
   |   ^

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
          let
            code = string.codepoint(c) |> option.unwrap_or(0)
            new_code = (code - 97 + shift) % 26 + 97
          in
            string.from_codepoint(new_code) |> option.unwrap_or("")
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
            new_code = (code - 97 - shift + 26) % 26 + 97
          in
            string.from_codepoint(new_code) |> option.unwrap_or("")
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
  --> /tmp/dojo-caesar-cipher-1.almd:7:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |           let
  |           ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:24:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
24 |           let
   |           ^^^

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
    list.map(
      string.chars(text),
      (c) =>
        if string.is_lower(c) then
          {
            let code = string.codepoint(c) |> option.unwrap_or(0)
            let new_code = (code - 97 + shift) % 26 + 97
            string.from_codepoint(new_code) |> option.unwrap_or("")
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
            let new_code = (code - 97 - shift + 26) % 26 + 97
            string.from_codepoint(new_code) |> option.unwrap_or("")
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
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-caesar-cipher-2.almd:10:65
  in call to option.unwrap_or()
  hint: Fix the argument type
   |
10 |             string.from_codepoint(new_code) |> option.unwrap_or("")
   |                                                                 ^^
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-caesar-cipher-2.almd:27:65
  in call to option.unwrap_or()
  hint: Fix the argument type
   |
27 |             string.from_codepoint(new_code) |> option.unwrap_or("")
   |                                                                 ^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[String] but got String
  --> /tmp/dojo-caesar-cipher-2.almd:10:65
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
10 |             string.from_codepoint(new_code) |> option.unwrap_or("")
   |                                                                 ^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[String] but got String
  --> /tmp/dojo-caesar-cipher-2.almd:27:65
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
27 |             string.from_codepoint(new_code) |> option.unwrap_or("")
   |                                                                 ^^

4 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(
      string.chars(text),
      (c) =>
        if string.is_lower(c) then
          {
            let code = string.codepoint(c)
            let new_code = (code - 97 + shift) % 26 + 97
            string.from_codepoint(new_code)
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
            let new_code = (code - 97 - shift + 26) % 26 + 97
            string.from_codepoint(new_code)
          }
        else
          c
    ),
    ""
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:9:36
  in operator -
  hint: Use numeric types (Int or Float)
  |
9 |             let new_code = (code - 97 + shift) % 26 + 97
  |                                    ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:9:41
  in operator +
  hint: Use + with numeric types, String, or List
  |
9 |             let new_code = (code - 97 + shift) % 26 + 97
  |                                         ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:9:50
  in operator %
  hint: Use numeric types (Int or Float)
  |
9 |             let new_code = (code - 97 + shift) % 26 + 97
  |                                                  ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:9:55
  in operator +
  hint: Use + with numeric types, String, or List
  |
9 |             let new_code = (code - 97 + shift) % 26 + 97
  |                                                       ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:10:35
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
10 |             string.from_codepoint(new_code)
   |                                   ^^^^^^^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:26:36
  in operator -
  hint: Use numeric types (Int or Float)
   |
26 |             let new_code = (code - 97 - shift + 26) % 26 + 97
   |                                    ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:26:41
  in operator -
  hint: Use numeric types (Int or Float)
   |
26 |             let new_code = (code - 97 - shift + 26) % 26 + 97
   |                                         ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:26:49
  in operator +
  hint: Use + with numeric types, String, or List
   |
26 |             let new_code = (code - 97 - shift + 26) % 26 + 97
   |                                                 ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:26:55
  in operator %
  hint: Use numeric types (Int or Float)
   |
26 |             let new_code = (code - 97 - shift + 26) % 26 + 97
   |                                                       ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:26:60
  in operator +
  hint: Use + with numeric types, String, or List
   |
26 |             let new_code = (code - 97 - shift + 26) % 26 + 97
   |                                                            ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:27:35
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
27 |             string.from_codepoint(new_code)
   |                                   ^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:10:35
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
10 |             string.from_codepoint(new_code)
   |                                   ^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:27:35
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
27 |             string.from_codepoint(new_code)
   |                                   ^^^^^^^^

13 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
