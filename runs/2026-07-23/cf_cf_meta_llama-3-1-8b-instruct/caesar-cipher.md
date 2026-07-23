# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  text.chars().map(
    (c) => if string.codepoint(c) >= 97 && string.codepoint(c) <= 122
      then string.from_codepoint(((string.codepoint(c) - 97 + shift) % 26) + 97)
      else c
  ).join("")

fn decrypt(text: String, shift: Int) -> String =
  encrypt(text, -shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: '&&' is not valid in Almide at line 3:41
  --> /tmp/dojo-caesar-cipher-0.almd:3:41
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
3 |     (c) => if string.codepoint(c) >= 97 && string.codepoint(c) <= 122
  |                                         ^

1 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  text.chars().map(
    (c) => if string.codepoint(c) >= 97 and string.codepoint(c) <= 122
      then string.from_codepoint(((string.codepoint(c) - 97 + shift) % 26) + 97)
      else c
  ).join("")

fn decrypt(text: String, shift: Int) -> String =
  encrypt(text, -shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:4:58
  in operator -
  hint: Use numeric types (Int or Float)
  |
4 |       then string.from_codepoint(((string.codepoint(c) - 97 + shift) % 26) + 97)
  |                                                          ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:4:63
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       then string.from_codepoint(((string.codepoint(c) - 97 + shift) % 26) + 97)
  |                                                               ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:4:72
  in operator %
  hint: Use numeric types (Int or Float)
  |
4 |       then string.from_codepoint(((string.codepoint(c) - 97 + shift) % 26) + 97)
  |                                                                        ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:4:78
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       then string.from_codepoint(((string.codepoint(c) - 97 + shift) % 26) + 97)
  |                                                                              ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:4:78
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
4 |       then string.from_codepoint(((string.codepoint(c) - 97 + shift) % 26) + 97)
  |                                                                              ^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:4:78
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
4 |       then string.from_codepoint(((string.codepoint(c) - 97 + shift) % 26) + 97)
  |                                                                              ^^

6 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  text.chars().map(
    (c) => match string.codepoint(c) {
      Some(n) => if n >= 97 and n <= 122
        then string.from_codepoint(((n - 97 + shift) % 26) + 97)
        else c
      else c
    }
  ).join("")

fn decrypt(text: String, shift: Int) -> String =
  encrypt(text, 26 - shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected pattern at line 7:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-2.almd:7:7
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
7 |       else c
  |       ^

1 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String =
  text.chars().map(
    (c) => match string.codepoint(c) {
      some(n) => if n >= 97 and n <= 122
        then string.from_codepoint(((n - 97 + shift) % 26) + 97)
        else c
      none => c
    }
  ).join("")

fn decrypt(text: String, shift: Int) -> String =
  encrypt(text, 26 - shift)
```
