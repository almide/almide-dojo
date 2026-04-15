# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  text.chars()
    .map((c) => if 'a' <= c && c <= 'z' then
      let code = (c.codepoint() - 97 + shift) % 26 + 97
      string.from_codepoint(code)
    else c)
    .join()

fn decrypt(text: String, shift: Int) -> String =
  text.chars()
    .map((c) => if 'a' <= c && c <= 'z' then
      let code = (c.codepoint() - 97 - shift + 26) % 26 + 97
      string.from_codepoint(code)
    else c)
    .join()
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 3:5 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-0.almd:3:5
  |
3 |     .map((c) => if 'a' <= c && c <= 'z' then
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:5 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-0.almd:11:5
   |
11 |     .map((c) => if 'a' <= c && c <= 'z' then
   |     ^
error[E001]: type mismatch in fn 'encrypt': expected String but got List[String]
  --> /tmp/dojo-caesar-cipher-0.almd:2:3
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  |
2 |   text.chars()
  |   ^^^^
error[E001]: type mismatch in fn 'decrypt': expected String but got List[String]
  --> /tmp/dojo-caesar-cipher-0.almd:10:3
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
   |
10 |   text.chars()
   |   ^^^^

4 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  text.chars()
    .map((c) => if 'a' <= c && c <= 'z' then
      let code = (c.codepoint() - 97 + shift) % 26 + 97
      string.from_codepoint(code)
    else c)
    .join()

fn decrypt(text: String, shift: Int) -> String =
  text.chars()
    .map((c) => if 'a' <= c && c <= 'z' then
      let code = (c.codepoint() - 97 - shift + 26) % 26 + 97
      string.from_codepoint(code)
    else c)
    .join()
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 3:5 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-1.almd:3:5
  |
3 |     .map((c) => if 'a' <= c && c <= 'z' then
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:5 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-1.almd:11:5
   |
11 |     .map((c) => if 'a' <= c && c <= 'z' then
   |     ^
error[E001]: type mismatch in fn 'encrypt': expected String but got List[String]
  --> /tmp/dojo-caesar-cipher-1.almd:2:3
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  |
2 |   text.chars()
  |   ^^^^
error[E001]: type mismatch in fn 'decrypt': expected String but got List[String]
  --> /tmp/dojo-caesar-cipher-1.almd:10:3
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
   |
10 |   text.chars()
   |   ^^^^

4 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  text.chars()
    .map((c) => if 'a' <= c && c <= 'z' then
      let code = (c.codepoint() - 97 + shift) % 26 + 97
      string.from_codepoint(code)
    else c)
    .join()

fn decrypt(text: String, shift: Int) -> String =
  text.chars()
    .map((c) => if 'a' <= c && c <= 'z' then
      let code = (c.codepoint() - 97 - shift + 26) % 26 + 97
      string.from_codepoint(code)
    else c)
    .join()
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 3:5 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-2.almd:3:5
  |
3 |     .map((c) => if 'a' <= c && c <= 'z' then
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:5 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-2.almd:11:5
   |
11 |     .map((c) => if 'a' <= c && c <= 'z' then
   |     ^
error[E001]: type mismatch in fn 'encrypt': expected String but got List[String]
  --> /tmp/dojo-caesar-cipher-2.almd:2:3
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  |
2 |   text.chars()
  |   ^^^^
error[E001]: type mismatch in fn 'decrypt': expected String but got List[String]
  --> /tmp/dojo-caesar-cipher-2.almd:10:3
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
   |
10 |   text.chars()
   |   ^^^^

4 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  text.chars()
    .map((c) => if 'a' <= c && c <= 'z' then
      let code = (c.codepoint() - 97 + shift) % 26 + 97
      string.from_codepoint(code)
    else c)
    .join()

fn decrypt(text: String, shift: Int) -> String =
  text.chars()
    .map((c) => if 'a' <= c && c <= 'z' then
      let code = (c.codepoint() - 97 - shift + 26) % 26 + 97
      string.from_codepoint(code)
    else c)
    .join()
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 3:5 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-3.almd:3:5
  |
3 |     .map((c) => if 'a' <= c && c <= 'z' then
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:5 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-3.almd:11:5
   |
11 |     .map((c) => if 'a' <= c && c <= 'z' then
   |     ^
error[E001]: type mismatch in fn 'encrypt': expected String but got List[String]
  --> /tmp/dojo-caesar-cipher-3.almd:2:3
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  |
2 |   text.chars()
  |   ^^^^
error[E001]: type mismatch in fn 'decrypt': expected String but got List[String]
  --> /tmp/dojo-caesar-cipher-3.almd:10:3
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
   |
10 |   text.chars()
   |   ^^^^

4 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
