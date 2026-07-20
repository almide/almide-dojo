# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
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
Compiling /tmp/dojo-caesar-cipher-0.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:8:48
  in operator -
  hint: Use numeric types (Int or Float)
  |
8 |                         (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:8:53
  in operator +
  hint: Use + with numeric types, String, or List
  |
8 |                         (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                     ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:8:62
  in operator %
  hint: Use numeric types (Int or Float)
  |
8 |                         (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                              ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:8:67
  in operator +
  hint: Use + with numeric types, String, or List
  |
8 |                         (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                                   ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-0.almd:8:67
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
8 |                         (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                                   ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:23:48
  in operator -
  hint: Use numeric types (Int or Float)
   |
23 |                         (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:23:53
  in operator -
  hint: Use numeric types (Int or Float)
   |
23 |                         (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                     ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:23:61
  in operator +
  hint: Use + with numeric types, String, or List
   |
23 |                         (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                             ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:23:67
  in operator %
  hint: Use numeric types (Int or Float)
   |
23 |                         (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                                   ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-0.almd:23:72
  in operator +
  hint: Use + with numeric types, String, or List
   |
23 |                         (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                                        ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-0.almd:23:72
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
23 |                         (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                                        ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-0.almd:8:67
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
8 |                         (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                                   ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-0.almd:23:72
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
23 |                         (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                                        ^^

13 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

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
                        (option.unwrap_or(string.codepoint(c), 0) - 97 + shift) % 26 + 97
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
                        (option.unwrap_or(string.codepoint(c), 0) - 97 - shift + 26) % 26 + 97
                    )
                else 
                    c
        ), 
        ""
    )
```
