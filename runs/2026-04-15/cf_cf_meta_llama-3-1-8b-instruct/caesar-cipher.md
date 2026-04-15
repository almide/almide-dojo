# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.from_codepoint(
    list.map(
      string.chars(text),
      (c) => match c {
        some(c) => if c >= 'a' && c <= 'z' then
          string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
        else c
        none => none
      }
    )
  )

fn decrypt(text: String, shift: Int) -> String =
  encrypt(text, -shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: '&&' is not valid in Almide at line 6:32
  --> /tmp/dojo-caesar-cipher-0.almd:6:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
6 |         some(c) => if c >= 'a' && c <= 'z' then
  |                                ^

1 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.from_codepoint(
    list.map(
      string.chars(text),
      (c) => match c {
        some(c) => if c >= 'a' and c < 'z' then
          string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
        else c
        none => none
      }
    )
  )

fn decrypt(text: String, shift: Int) -> String =
  encrypt(text, shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:7:56
  in operator -
  hint: Use numeric types (Int or Float)
  |
7 |           string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                        ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:7:61
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |           string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                             ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:7:70
  in operator %
  hint: Use numeric types (Int or Float)
  |
7 |           string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                                      ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:7:75
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |           string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                                           ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:7:75
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |           string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                                           ^^
error[E005]: argument 'n' expects Int but got List[String]
  --> /tmp/dojo-caesar-cipher-1.almd:9:17
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
9 |         none => none
  |                 ^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:7:75
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |           string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                                           ^^
error[E001]: type mismatch in match arm: expected String but got Option[?1]
  --> /tmp/dojo-caesar-cipher-1.almd:9:17
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
9 |         none => none
  |                 ^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got List[String]
  --> /tmp/dojo-caesar-cipher-1.almd:9:17
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
9 |         none => none
  |                 ^^^^

9 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.from_codepoint(
    list.map(
      string.chars(text),
      (c) => match c {
        some(c) => if c >= 'a' and c < 'z' then
          string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
        else c
      }
    )
  )

fn decrypt(text: String, shift: Int) -> String =
  encrypt(text, 26 - shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:7:56
  in operator -
  hint: Use numeric types (Int or Float)
  |
7 |           string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                        ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:7:61
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |           string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                             ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:7:70
  in operator %
  hint: Use numeric types (Int or Float)
  |
7 |           string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                                      ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:7:75
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |           string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                                           ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:7:75
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |           string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                                           ^^
error[E005]: argument 'n' expects Int but got List[String]
  --> /tmp/dojo-caesar-cipher-2.almd:8:14
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
8 |         else c
  |              ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:7:75
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |           string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                                           ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got List[String]
  --> /tmp/dojo-caesar-cipher-2.almd:8:14
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
8 |         else c
  |              ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.from_codepoint(
    list.map(
      string.chars(text),
      (c) => match c {
        some(c) => if c >= 'a' and c <'z' then
          string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
        else
          string.from_codepoint(string.codepoint(c))
      }
    )
  )

fn decrypt(text: String, shift: Int) -> String =
  encrypt(text, 26 - shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:7:56
  in operator -
  hint: Use numeric types (Int or Float)
  |
7 |           string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                        ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:7:61
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |           string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                             ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:7:70
  in operator %
  hint: Use numeric types (Int or Float)
  |
7 |           string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                                      ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:7:75
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |           string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                                           ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:7:75
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |           string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                                           ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:9:50
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
9 |           string.from_codepoint(string.codepoint(c))
  |                                                  ^
error[E005]: argument 'n' expects Int but got List[String]
  --> /tmp/dojo-caesar-cipher-3.almd:9:50
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
9 |           string.from_codepoint(string.codepoint(c))
  |                                                  ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:7:75
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |           string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
  |                                                                           ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:9:50
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
9 |           string.from_codepoint(string.codepoint(c))
  |                                                  ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got List[String]
  --> /tmp/dojo-caesar-cipher-3.almd:9:50
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
9 |           string.from_codepoint(string.codepoint(c))
  |                                                  ^

10 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
