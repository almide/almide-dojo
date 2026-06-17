# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.map(text, (c) => 
    if (c >= 'a' && c <= 'z') then 
      string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97) 
    else 
      c
  )

fn decrypt(text: String, shift: Int) -> String = 
  encrypt(text, -shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: '&&' is not valid in Almide at line 3:18
  --> /tmp/dojo-caesar-cipher-0.almd:3:18
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
3 |     if (c >= 'a' && c <= 'z') then
  |                  ^

1 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.map(text, (c) => 
    if (c >= 'a' and c <= 'z') then 
      string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97) 
    else 
      c
  )

fn decrypt(text: String, shift: Int) -> String = 
  encrypt(text, -shift)
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
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-caesar-cipher-1.almd:6:7
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
6 |       c
  |       ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:4:71
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
4 |       string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                                       ^^

7 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.map(text, (c) => 
    match (string.codepoint(c)) {
      some(cp) => 
        if (cp >= 97 and cp <= 122) then 
          string.from_codepoint((cp - 97 + shift) % 26 + 97) 
        else 
          c
      none => c
    }
  )

fn decrypt(text: String, shift: Int) -> String = 
  encrypt(text, -shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-caesar-cipher-2.almd:9:15
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
9 |       none => c
  |               ^

1 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.map(text, (c) => 
    match (string.codepoint(c)) {
      some(cp) => 
        if (cp >= 97 and cp <= 122) then 
          string.from_codepoint((cp - 97 + shift) % 26 + 97) 
        else 
          c
      none => c
    }
  )

fn decrypt(text: String, shift: Int) -> String = 
  encrypt(text, shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-caesar-cipher-3.almd:9:15
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
9 |       none => c
  |               ^

1 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
