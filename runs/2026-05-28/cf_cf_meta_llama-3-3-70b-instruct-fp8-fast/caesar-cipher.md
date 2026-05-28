# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text), 
      (c) => 
        if string.is_lower(c) 
        then string.from_codepoint(
          (string.codepoint(c) - 97 + shift) % 26 + 97
        ) 
        else c
    ), 
    ""
  )

fn decrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text), 
      (c) => 
        if string.is_lower(c) 
        then string.from_codepoint(
          (string.codepoint(c) - 97 - shift + 26) % 26 + 97
        ) 
        else c
    ), 
    ""
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:8:34
  in operator -
  hint: Use numeric types (Int or Float)
  |
8 |           (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                  ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:8:39
  in operator +
  hint: Use + with numeric types, String, or List
  |
8 |           (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                       ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:8:48
  in operator %
  hint: Use numeric types (Int or Float)
  |
8 |           (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:8:53
  in operator +
  hint: Use + with numeric types, String, or List
  |
8 |           (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                     ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-0.almd:8:53
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
8 |           (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                     ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:22:34
  in operator -
  hint: Use numeric types (Int or Float)
   |
22 |           (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                  ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:22:39
  in operator -
  hint: Use numeric types (Int or Float)
   |
22 |           (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                       ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:22:47
  in operator +
  hint: Use + with numeric types, String, or List
   |
22 |           (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                               ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:22:53
  in operator %
  hint: Use numeric types (Int or Float)
   |
22 |           (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                     ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:22:58
  in operator +
  hint: Use + with numeric types, String, or List
   |
22 |           (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                          ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-0.almd:22:58
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
22 |           (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                          ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-0.almd:8:53
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
8 |           (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                     ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-0.almd:22:58
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
22 |           (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                          ^^

13 error(s) found
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
        if string.is_lower(c) 
        then 
          let code = string.codepoint(c) in
          match code {
            some(code) => string.from_codepoint((code - 97 + shift) % 26 + 97),
            none => c,
          }
        else c
    ), 
    ""
  )

fn decrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text), 
      (c) => 
        if string.is_lower(c) 
        then 
          let code = string.codepoint(c) in
          match code {
            some(code) => string.from_codepoint((code - 97 - shift + 26) % 26 + 97),
            none => c,
          }
        else c
    ), 
    ""
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:8:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |           let code = string.codepoint(c) in
  |           ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:25:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
25 |           let code = string.codepoint(c) in
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
      (c) => 
        if string.is_lower(c) 
        then 
          match string.codepoint(c) {
            some(code) => string.from_codepoint((code - 97 + shift) % 26 + 97),
            none => c,
          }
        else c
    ), 
    ""
  )

fn decrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text), 
      (c) => 
        if string.is_lower(c) 
        then 
          match string.codepoint(c) {
            some(code) => string.from_codepoint((code - 97 - shift + 26) % 26 + 97),
            none => c,
          }
        else c
    ), 
    ""
  )
```
