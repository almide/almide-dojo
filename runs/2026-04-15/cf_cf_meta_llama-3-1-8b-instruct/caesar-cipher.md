# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.from_codepoint(
    list.map(
      string.chars(text),
      (c) => (if string.codepoint(c) >= 97 && string.codepoint(c) <= 122 then
        string.from_codepoint(
          (string.codepoint(c) - 97 + shift) % 26 + 97
        )
      else c
      )
    )
  )

fn decrypt(text: String, shift: Int) -> String =
  string.from_codepoint(
    list.map(
      string.chars(text),
      (c) => (if string.codepoint(c) >= 97 && string.codepoint(c) <= 122 then
        string.from_codepoint(
          (string.codepoint(c) - 97 - shift + 26) % 26 + 97
        )
      else c
      )
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: '&&' is not valid in Almide at line 5:44
  --> /tmp/dojo-caesar-cipher-0.almd:5:44
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |       (c) => (if string.codepoint(c) >= 97 && string.codepoint(c) <= 122 then
  |                                            ^
error: '&&' is not valid in Almide at line 18:44
  --> /tmp/dojo-caesar-cipher-0.almd:18:44
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
18 |       (c) => (if string.codepoint(c) >= 97 && string.codepoint(c) <= 122 then
   |                                            ^

2 error(s) found
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
      (c) => (if string.codepoint(c) >= 97 and string.codepoint(c) < 122 then
        string.from_codepoint(
          (string.codepoint(c) - 97 + shift) % 26 + 97
        )
      else c
      )
    )
  )

fn decrypt(text: String, shift: Int) -> String =
  string.from_codepoint(
    list.map(
      string.chars(text),
      (c) => (if string.codepoint(c) >= 97 and string.codepoint(c) < 122 then
        string.from_codepoint(
          (string.codepoint(c) - 97 - shift + 26) % 26 + 97
        )
      else c
      )
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Expected ')' to close parenthesized expression opened at line 5:14
  --> /tmp/dojo-caesar-cipher-1.almd:9:13
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
5 |       (c) => (if string.codepoint(c) >= 97 and string.codepoint(c) < 122 then
  |              --------------- '(' opened here
...
9 |       else c
  |             ^
error: Expected ')' to close parenthesized expression opened at line 18:14
  --> /tmp/dojo-caesar-cipher-1.almd:22:13
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
18 |       (c) => (if string.codepoint(c) >= 97 and string.codepoint(c) < 122 then
   |              --------------- '(' opened here
...
22 |       else c
   |             ^

2 error(s) found
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
      (c) => (if string.codepoint(c) >= 97 and string.codepoint(c) < 122 then
        string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
      else c
      )
    )
  )

fn decrypt(text: String, shift: Int) -> String =
  string.from_codepoint(
    list.map(
      string.chars(text),
      (c) => (if string.codepoint(c) >= 97 and string.codepoint(c) < 122 then
        string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
      else c
      )
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected ')' to close parenthesized expression opened at line 5:14
  --> /tmp/dojo-caesar-cipher-2.almd:7:13
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
5 |       (c) => (if string.codepoint(c) >= 97 and string.codepoint(c) < 122 then
  |              --------------- '(' opened here
...
7 |       else c
  |             ^
error: Expected ')' to close parenthesized expression opened at line 16:14
  --> /tmp/dojo-caesar-cipher-2.almd:18:13
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
16 |       (c) => (if string.codepoint(c) >= 97 and string.codepoint(c) < 122 then
   |              --------------- '(' opened here
...
18 |       else c
   |             ^

2 error(s) found
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
      (c) => (if string.codepoint(c) >= 97 and string.codepoint(c) < 122 then
        string.from_codepoint((string.codepoint(c) - 97 + shift) % 26 + 97)
      else c
      )
    )
  )

fn decrypt(text: String, shift: Int) -> String =
  string.from_codepoint(
    list.map(
      string.chars(text),
      (c) => (if string.codepoint(c) >= 97 and string.codepoint(c) < 122 then
        string.from_codepoint((string.codepoint(c) - 97 - shift + 26) % 26 + 97)
      else c
      )
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected ')' to close parenthesized expression opened at line 5:14
  --> /tmp/dojo-caesar-cipher-3.almd:7:13
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
5 |       (c) => (if string.codepoint(c) >= 97 and string.codepoint(c) < 122 then
  |              --------------- '(' opened here
...
7 |       else c
  |             ^
error: Expected ')' to close parenthesized expression opened at line 16:14
  --> /tmp/dojo-caesar-cipher-3.almd:18:13
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
16 |       (c) => (if string.codepoint(c) >= 97 and string.codepoint(c) < 122 then
   |              --------------- '(' opened here
...
18 |       else c
   |             ^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
