# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
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
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:8:34
  in operator -
  here: (string.codepoint(c) - 97 + shift) % 26 + 97
  hint: Use numeric types (Int or Float)
  |
8 |           (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                  ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:8:39
  in operator +
  here: (string.codepoint(c) - 97 + shift) % 26 + 97
  hint: Use + with numeric types, String, or List
  |
8 |           (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                       ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:8:48
  in operator %
  here: (string.codepoint(c) - 97 + shift) % 26 + 97
  hint: Use numeric types (Int or Float)
  |
8 |           (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:8:53
  in operator +
  here: (string.codepoint(c) - 97 + shift) % 26 + 97
  hint: Use + with numeric types, String, or List
  |
8 |           (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                     ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-0.almd:8:51
  in call to string.from_codepoint()
  here: (string.codepoint(c) - 97 + shift) % 26 + 97
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
8 |           (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                   ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:22:34
  in operator -
  here: (string.codepoint(c) - 97 - shift + 26) % 26 + 97
  hint: Use numeric types (Int or Float)
   |
22 |           (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                  ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:22:39
  in operator -
  here: (string.codepoint(c) - 97 - shift + 26) % 26 + 97
  hint: Use numeric types (Int or Float)
   |
22 |           (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                       ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:22:47
  in operator +
  here: (string.codepoint(c) - 97 - shift + 26) % 26 + 97
  hint: Use + with numeric types, String, or List
   |
22 |           (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                               ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:22:53
  in operator %
  here: (string.codepoint(c) - 97 - shift + 26) % 26 + 97
  hint: Use numeric types (Int or Float)
   |
22 |           (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                     ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:22:58
  in operator +
  here: (string.codepoint(c) - 97 - shift + 26) % 26 + 97
  hint: Use + with numeric types, String, or List
   |
22 |           (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                          ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-0.almd:22:56
  in call to string.from_codepoint()
  here: (string.codepoint(c) - 97 - shift + 26) % 26 + 97
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
22 |           (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                        ^

11 error(s) found
FAILED: /tmp/dojo-caesar-cipher-0.almd
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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
          let codepoint = string.codepoint(c) in
          match codepoint {
            some(code) => string.from_codepoint((code - 97 + shift) % 26 + 97),
            none => c
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
          let codepoint = string.codepoint(c) in
          match codepoint {
            some(code) => string.from_codepoint((code - 97 - shift + 26) % 26 + 97),
            none => c
          }
        else c
    ), 
    ""
  )
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:8:11
  in let-in
  here: let codepoint = string.codepoint(c) in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |           let codepoint = string.codepoint(c) in
  |           ^^^
error: 'let' is not an expression in Almide at line 8:11
  --> /tmp/dojo-caesar-cipher-1.almd:8:11
  here: let codepoint = string.codepoint(c) in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |           let codepoint = string.codepoint(c) in
  |           ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:25:11
  in let-in
  here: let codepoint = string.codepoint(c) in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
25 |           let codepoint = string.codepoint(c) in
   |           ^^^
error: 'let' is not an expression in Almide at line 25:11
  --> /tmp/dojo-caesar-cipher-1.almd:25:11
  here: let codepoint = string.codepoint(c) in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
25 |           let codepoint = string.codepoint(c) in
   |           ^

4 error(s) found
FAILED: /tmp/dojo-caesar-cipher-1.almd
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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
            none => c
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
            none => c
          }
        else c
    ), 
    ""
  )
```
