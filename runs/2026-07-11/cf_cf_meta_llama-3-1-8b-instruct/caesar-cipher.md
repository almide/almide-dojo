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
    string.chars(text)
      .map(
        (c) => if string.codepoint(c) >= 97 && string.codepoint(c) <= 122
          then string.from_codepoint(
            (string.codepoint(c) - 97 + shift) % 26 + 97
          )
          else c
      )
      .join("")
  )

fn decrypt(text: String, shift: Int) -> String =
  encrypt(text, 26 - shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: Expected ')' to close function call opened at line 2:24
  --> /tmp/dojo-caesar-cipher-0.almd:4:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   string.from_codepoint(
  |                        --------------- '(' opened here
...
4 |       .map(
  |       ^

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
    string.chars(text)
      .map(
        (c) => if string.codepoint(c) >= 97 && string.codepoint(c) <= 122
          then string.from_codepoint(
            ((string.codepoint(c) - 97 + shift) % 26 + 97)
          )
          else c
      )
      .join("")
  )

fn decrypt(text: String, shift: Int) -> String =
  encrypt(text, 26 - shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Expected ')' to close function call opened at line 2:24
  --> /tmp/dojo-caesar-cipher-1.almd:4:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   string.from_codepoint(
  |                        --------------- '(' opened here
...
4 |       .map(
  |       ^

1 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.from_codepoint(
    string.chars(text)
      .map(
        (c) => if string.codepoint(c) >= 97 && string.codepoint(c) <= 122
          then string.from_codepoint(
            ((string.codepoint(c) - 97 + shift) % 26 + 97)
          )
          else c
      )
      .join("")
  )

fn decrypt(text: String, shift: Int) -> String =
  encrypt(text, 26 - shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected ')' to close function call opened at line 2:24
  --> /tmp/dojo-caesar-cipher-2.almd:4:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   string.from_codepoint(
  |                        --------------- '(' opened here
...
4 |       .map(
  |       ^

1 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.from_codepoint(
    string.chars(text)
      .map(
        (c) => if string.codepoint(c) >= 97 && string.codepoint(c) <= 122
          then string.from_codepoint(
            ((string.codepoint(c) - 97 + shift) % 26 + 97)
          )
          else string.from_codepoint(string.codepoint(c))
      )
      .join("")
  )

fn decrypt(text: String, shift: Int) -> String =
  encrypt(text, shift)
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected ')' to close function call opened at line 2:24
  --> /tmp/dojo-caesar-cipher-3.almd:4:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   string.from_codepoint(
  |                        --------------- '(' opened here
...
4 |       .map(
  |       ^

1 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
