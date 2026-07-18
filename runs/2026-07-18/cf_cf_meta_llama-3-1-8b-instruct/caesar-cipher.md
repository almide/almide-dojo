# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String
  = let shift_mod = shift % 26
    in string.from_codepoint(
      list.map(
        list.map(
          string.chars(text),
          (c) => if string.is_lower(c) then
                  (string.codepoint(c) - 97 + shift_mod) % 26 + 97
                else
                  string.codepoint(c)
        )
      )
    )

fn decrypt(text: String, shift: Int) -> String
  = let shift_mod = 26 - (shift % 26)
    in string.from_codepoint(
      list.map(
        list.map(
          string.chars(text),
          (c) => if string.is_lower(c) then
                  (string.codepoint(c) - 97 + shift_mod) % 26 + 97
                else
                  string.codepoint(c)
        )
      )
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:3 (got Eq '=')
  --> /tmp/dojo-caesar-cipher-0.almd:2:3
  |
2 |   = let shift_mod = shift % 26
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 16:3 (got Eq '=')
  --> /tmp/dojo-caesar-cipher-0.almd:16:3
   |
16 |   = let shift_mod = 26 - (shift % 26)
   |   ^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String
  = let shift_mod = shift % 26
    in string.from_codepoint(
      list.map(
        list.map(
          string.chars(text),
          (c) => if string.is_lower(c) then
                  (string.codepoint(c) - 97 + shift_mod) % 26 + 97
                else
                  string.codepoint(c)
        )
      )
    )

fn decrypt(text: String, shift: Int) -> String
  = let shift_mod = 26 - (shift % 26)
    in string.from_codepoint(
      list.map(
        list.map(
          string.chars(text),
          (c) => if string.is_lower(c) then
                  (string.codepoint(c) - 97 + shift_mod) % 26 + 97
                else
                  string.codepoint(c)
        )
      )
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:3 (got Eq '=')
  --> /tmp/dojo-caesar-cipher-1.almd:2:3
  |
2 |   = let shift_mod = shift % 26
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 16:3 (got Eq '=')
  --> /tmp/dojo-caesar-cipher-1.almd:16:3
   |
16 |   = let shift_mod = 26 - (shift % 26)
   |   ^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String
  = let shift_mod = shift % 26
    in string.from_codepoint(
      list.map(
        list.map(
          string.chars(text),
          (c) => if string.is_lower(c) then
                  (string.codepoint(c) - 97 + shift_mod) % 26 + 97
                else
                  string.codepoint(c)
        )
      )
    )

fn decrypt(text: String, shift: Int) -> String
  = let shift_mod = 26 - (shift % 26)
    in string.from_codepoint(
      list.map(
        list.map(
          string.chars(text),
          (c) => if string.is_lower(c) then
                  (string.codepoint(c) - 97 + shift_mod) % 26 + 97
                else
                  string.codepoint(c)
        )
      )
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:3 (got Eq '=')
  --> /tmp/dojo-caesar-cipher-2.almd:2:3
  |
2 |   = let shift_mod = shift % 26
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 16:3 (got Eq '=')
  --> /tmp/dojo-caesar-cipher-2.almd:16:3
   |
16 |   = let shift_mod = 26 - (shift % 26)
   |   ^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String
  = let shift_mod = shift % 26
    in string.from_codepoint(
      list.map(
        list.map(
          string.chars(text),
          (c) => if string.is_lower(c) then
                  (string.codepoint(c) - 97 + shift_mod) % 26 + 97
                else
                  string.codepoint(c)
        )
      )
    )

fn decrypt(text: String, shift: Int) -> String
  = let shift_mod = 26 - (shift % 26)
    in string.from_codepoint(
      list.map(
        list.map(
          string.chars(text),
          (c) => if string.is_lower(c) then
                  (string.codepoint(c) - 97 + shift_mod) % 26 + 97
                else
                  string.codepoint(c)
        )
      )
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:3 (got Eq '=')
  --> /tmp/dojo-caesar-cipher-3.almd:2:3
  |
2 |   = let shift_mod = shift % 26
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 16:3 (got Eq '=')
  --> /tmp/dojo-caesar-cipher-3.almd:16:3
   |
16 |   = let shift_mod = 26 - (shift % 26)
   |   ^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
