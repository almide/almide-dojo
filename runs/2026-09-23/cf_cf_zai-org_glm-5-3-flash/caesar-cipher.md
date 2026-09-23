# caesar-cipher

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn wrap26(n: Int) -> Int = ((n % 26) + 26) % 26

fn shift_char(c: String, amount: Int) -> String =
  match string.codepoint(c) {
    some(cp) =>
      if cp >= 97 && cp <= 122 then
        string.from_codepoint(97 + wrap26(cp - 97 + amount))
      else
        c
    none => c
  }

fn encrypt(text: String, shift: Int) -> String =
  string.join(list.map(string.chars(text), (c) => shift_char(c, shift % 26)), "")

fn decrypt(text: String, shift: Int) -> String =
  string.join(list.map(string.chars(text), (c) => shift_char(c, (26 - (shift % 26)) % 26)), "")
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 6:19
  --> /tmp/dojo-caesar-cipher-0.almd:6:19
  here: if cp >= 97 && cp <= 122 then
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
6 |       if cp >= 97 && cp <= 122 then
  |                   ^

1 error(s) found
FAILED: /tmp/dojo-caesar-cipher-0.almd
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn wrap26(n: Int) -> Int = ((n % 26) + 26) % 26

fn shift_char(c: String, amount: Int) -> String =
  match string.codepoint(c) {
    some(cp) =>
      if cp >= 97 and cp <= 122 then
        string.from_codepoint(97 + wrap26(cp - 97 + amount))
      else
        c
    none => c
  }

fn encrypt(text: String, shift: Int) -> String =
  string.join(list.map(string.chars(text), (c) => shift_char(c, shift % 26)), "")

fn decrypt(text: String, shift: Int) -> String =
  string.join(list.map(string.chars(text), (c) => shift_char(c, (26 - (shift % 26)) % 26)), "")
```
