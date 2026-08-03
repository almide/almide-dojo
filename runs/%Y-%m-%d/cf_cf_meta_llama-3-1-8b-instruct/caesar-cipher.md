# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
  string.map(text, (c) => {
    if string.is_lower(c) {
      let cp = string.codepoint(c);
      let shifted_cp = ((cp - 97 + shift) % 26) + 97;
      string.from_codepoint(shifted_cp)
    } else {
      c
    }
  })
}

fn decrypt(text: String, shift: Int) -> String {
  string.map(text, (c) => {
    if string.is_lower(c) {
      let cp = string.codepoint(c);
      let shifted_cp = ((cp - 97 - shift + 26) % 26) + 97;
      string.from_codepoint(shifted_cp)
    } else {
      c
    }
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: Missing '=' before function body at line 1:48
  --> /tmp/dojo-caesar-cipher-0.almd:1:48
  hint: Almide requires '=' before the body. Write: fn encrypt(...) -> Type = { ... }
  |
1 | fn encrypt(text: String, shift: Int) -> String {
  |                                                ^
error: Missing '=' before function body at line 13:48
  --> /tmp/dojo-caesar-cipher-0.almd:13:48
  hint: Almide requires '=' before the body. Write: fn decrypt(...) -> Type = { ... }
   |
13 | fn decrypt(text: String, shift: Int) -> String {
   |                                                ^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
  if string.is_lower(c) {
    let cp = string.codepoint(c);
    let shifted_cp = ((cp - 97 + shift) % 26) + 97;
    string.from_codepoint(shifted_cp)
  } else {
    c
  }
})

fn decrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
  if string.is_lower(c) {
    let cp = string.codepoint(c);
    let shifted_cp = ((cp - 97 - shift + 26) % 26) + 97;
    string.from_codepoint(shifted_cp)
  } else {
    c
  }
})
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Expected Then at line 2:25 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-1.almd:2:25
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if string.is_lower(c) {
  |                         ^
error: Expected ')' to close function call opened at line 1:60
  --> /tmp/dojo-caesar-cipher-1.almd:6:5
  hint: Add ')' or check for a missing delimiter inside the function call
  |
1 | fn encrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
  |                                                            --------------- '(' opened here
...
6 |   } else {
  |     ^^^^
error: Expected Then at line 12:25 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-1.almd:12:25
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
12 |   if string.is_lower(c) {
   |                         ^
error: Expected ')' to close function call opened at line 11:60
  --> /tmp/dojo-caesar-cipher-1.almd:16:5
  hint: Add ')' or check for a missing delimiter inside the function call
   |
11 | fn decrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
   |                                                            --------------- '(' opened here
...
16 |   } else {
   |     ^^^^

4 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
  if string.is_lower(c) then string.from_codepoint(((string.codepoint(c) - 97 + shift) % 26) + 97) else c
})

fn decrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
  if string.is_lower(c) then string.from_codepoint(((string.codepoint(c) - 97 - shift + 26) % 26) + 97) else c
})
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:2:76
  in operator -
  hint: Use numeric types (Int or Float)
  |
2 |   if string.is_lower(c) then string.from_codepoint(((string.codepoint(c) - 97 + shift) % 26) + 97) else c
  |                                                                            ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:2:81
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   if string.is_lower(c) then string.from_codepoint(((string.codepoint(c) - 97 + shift) % 26) + 97) else c
  |                                                                                 ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:2:90
  in operator %
  hint: Use numeric types (Int or Float)
  |
2 |   if string.is_lower(c) then string.from_codepoint(((string.codepoint(c) - 97 + shift) % 26) + 97) else c
  |                                                                                          ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:2:96
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   if string.is_lower(c) then string.from_codepoint(((string.codepoint(c) - 97 + shift) % 26) + 97) else c
  |                                                                                                ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:2:96
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
2 |   if string.is_lower(c) then string.from_codepoint(((string.codepoint(c) - 97 + shift) % 26) + 97) else c
  |                                                                                                ^^
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-caesar-cipher-2.almd:2:105
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
2 |   if string.is_lower(c) then string.from_codepoint(((string.codepoint(c) - 97 + shift) % 26) + 97) else c
  |                                                                                                         ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:76
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |   if string.is_lower(c) then string.from_codepoint(((string.codepoint(c) - 97 - shift + 26) % 26) + 97) else c
  |                                                                            ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:81
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |   if string.is_lower(c) then string.from_codepoint(((string.codepoint(c) - 97 - shift + 26) % 26) + 97) else c
  |                                                                                 ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:89
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |   if string.is_lower(c) then string.from_codepoint(((string.codepoint(c) - 97 - shift + 26) % 26) + 97) else c
  |                                                                                         ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:95
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |   if string.is_lower(c) then string.from_codepoint(((string.codepoint(c) - 97 - shift + 26) % 26) + 97) else c
  |                                                                                               ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:101
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |   if string.is_lower(c) then string.from_codepoint(((string.codepoint(c) - 97 - shift + 26) % 26) + 97) else c
  |                                                                                                     ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:6:101
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
6 |   if string.is_lower(c) then string.from_codepoint(((string.codepoint(c) - 97 - shift + 26) % 26) + 97) else c
  |                                                                                                     ^^
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-caesar-cipher-2.almd:6:110
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
6 |   if string.is_lower(c) then string.from_codepoint(((string.codepoint(c) - 97 - shift + 26) % 26) + 97) else c
  |                                                                                                              ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:2:96
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
2 |   if string.is_lower(c) then string.from_codepoint(((string.codepoint(c) - 97 + shift) % 26) + 97) else c
  |                                                                                                ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:6:101
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
6 |   if string.is_lower(c) then string.from_codepoint(((string.codepoint(c) - 97 - shift + 26) % 26) + 97) else c
  |                                                                                                     ^^

15 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
  let code = string.codepoint(c);
  if string.is_lower(c) then string.from_codepoint(((code - 97 + shift) % 26) + 97) else c
})

fn decrypt(text: String, shift: Int) -> String = string.map(text, (c) => {
  let code = string.codepoint(c);
  if string.is_lower(c) then string.from_codepoint(((code - 97 - shift + 26) % 26) + 97) else c
})
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:3:61
  in operator -
  hint: Use numeric types (Int or Float)
  |
3 |   if string.is_lower(c) then string.from_codepoint(((code - 97 + shift) % 26) + 97) else c
  |                                                             ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:3:66
  in operator +
  hint: Use + with numeric types, String, or List
  |
3 |   if string.is_lower(c) then string.from_codepoint(((code - 97 + shift) % 26) + 97) else c
  |                                                                  ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:3:75
  in operator %
  hint: Use numeric types (Int or Float)
  |
3 |   if string.is_lower(c) then string.from_codepoint(((code - 97 + shift) % 26) + 97) else c
  |                                                                           ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:3:81
  in operator +
  hint: Use + with numeric types, String, or List
  |
3 |   if string.is_lower(c) then string.from_codepoint(((code - 97 + shift) % 26) + 97) else c
  |                                                                                 ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:3:81
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
3 |   if string.is_lower(c) then string.from_codepoint(((code - 97 + shift) % 26) + 97) else c
  |                                                                                 ^^
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-caesar-cipher-3.almd:3:90
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   if string.is_lower(c) then string.from_codepoint(((code - 97 + shift) % 26) + 97) else c
  |                                                                                          ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:8:61
  in operator -
  hint: Use numeric types (Int or Float)
  |
8 |   if string.is_lower(c) then string.from_codepoint(((code - 97 - shift + 26) % 26) + 97) else c
  |                                                             ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:8:66
  in operator -
  hint: Use numeric types (Int or Float)
  |
8 |   if string.is_lower(c) then string.from_codepoint(((code - 97 - shift + 26) % 26) + 97) else c
  |                                                                  ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:8:74
  in operator +
  hint: Use + with numeric types, String, or List
  |
8 |   if string.is_lower(c) then string.from_codepoint(((code - 97 - shift + 26) % 26) + 97) else c
  |                                                                          ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:8:80
  in operator %
  hint: Use numeric types (Int or Float)
  |
8 |   if string.is_lower(c) then string.from_codepoint(((code - 97 - shift + 26) % 26) + 97) else c
  |                                                                                ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:8:86
  in operator +
  hint: Use + with numeric types, String, or List
  |
8 |   if string.is_lower(c) then string.from_codepoint(((code - 97 - shift + 26) % 26) + 97) else c
  |                                                                                      ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:8:86
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
8 |   if string.is_lower(c) then string.from_codepoint(((code - 97 - shift + 26) % 26) + 97) else c
  |                                                                                      ^^
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-caesar-cipher-3.almd:8:95
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
8 |   if string.is_lower(c) then string.from_codepoint(((code - 97 - shift + 26) % 26) + 97) else c
  |                                                                                               ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:3:81
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
3 |   if string.is_lower(c) then string.from_codepoint(((code - 97 + shift) % 26) + 97) else c
  |                                                                                 ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:8:86
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
8 |   if string.is_lower(c) then string.from_codepoint(((code - 97 - shift + 26) % 26) + 97) else c
  |                                                                                      ^^

15 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
