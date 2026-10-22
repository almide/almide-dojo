# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 1
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
          string.from_codepoint(
            (string.codepoint(c) - 97 + shift) % 26 + 97
          )
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
          string.from_codepoint(
            (string.codepoint(c) - 97 - shift + 26) % 26 + 97
          )
        else 
          c
    ), 
    ""
  )
```

**Diagnostic:**

```
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:8:36
  in operator -
  here: (string.codepoint(c) - 97 + shift) % 26 + 97
  hint: Use numeric types (Int or Float)
  |
8 |             (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                    ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:8:41
  in operator +
  here: (string.codepoint(c) - 97 + shift) % 26 + 97
  hint: Use + with numeric types, String, or List
  |
8 |             (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                         ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:8:50
  in operator %
  here: (string.codepoint(c) - 97 + shift) % 26 + 97
  hint: Use numeric types (Int or Float)
  |
8 |             (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                  ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:8:55
  in operator +
  here: (string.codepoint(c) - 97 + shift) % 26 + 97
  hint: Use + with numeric types, String, or List
  |
8 |             (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                       ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-0.almd:8:53
  in call to string.from_codepoint()
  here: (string.codepoint(c) - 97 + shift) % 26 + 97
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
8 |             (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                     ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:23:36
  in operator -
  here: (string.codepoint(c) - 97 - shift + 26) % 26 + 97
  hint: Use numeric types (Int or Float)
   |
23 |             (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                    ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:23:41
  in operator -
  here: (string.codepoint(c) - 97 - shift + 26) % 26 + 97
  hint: Use numeric types (Int or Float)
   |
23 |             (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                         ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:23:49
  in operator +
  here: (string.codepoint(c) - 97 - shift + 26) % 26 + 97
  hint: Use + with numeric types, String, or List
   |
23 |             (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                 ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:23:55
  in operator %
  here: (string.codepoint(c) - 97 - shift + 26) % 26 + 97
  hint: Use numeric types (Int or Float)
   |
23 |             (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                       ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:23:60
  in operator +
  here: (string.codepoint(c) - 97 - shift + 26) % 26 + 97
  hint: Use + with numeric types, String, or List
   |
23 |             (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                            ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-0.almd:23:58
  in call to string.from_codepoint()
  here: (string.codepoint(c) - 97 - shift + 26) % 26 + 97
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
23 |             (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                          ^

11 error(s) found
FAILED: /tmp/dojo-caesar-cipher-0.almd
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text), 
      (c) => 
        if string.is_lower(c) then 
          string.from_codepoint(
            (string.codepoint(c) ?? 0 - 97 + shift) % 26 + 97
          )
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
          string.from_codepoint(
            (string.codepoint(c) ?? 0 - 97 - shift + 26) % 26 + 97
          )
        else 
          c
    ), 
    ""
  )
```
