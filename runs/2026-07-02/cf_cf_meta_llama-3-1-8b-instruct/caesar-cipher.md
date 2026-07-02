# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
  let codepoints = string.chars(text)
    .map(|c| string.codepoint(c))
    .filter(|&cp| cp >= 97 && cp <= 122)
    .map(|cp| (cp + shift) % 26 + 97)
    .map(|cp| string.from_codepoint(cp))
    .collect::<List[String]>()
  string.join(codepoints, "")
}

fn decrypt(text: String, shift: Int) -> String {
  let codepoints = string.chars(text)
    .map(|c| string.codepoint(c))
    .filter(|&cp| cp >= 97 && cp <= 122)
    .map(|cp| (cp - shift + 26) % 26 + 97)
    .map(|cp| string.from_codepoint(cp))
    .collect::<List[String]>()
  string.join(codepoints, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: Missing '=' before function body at line 1:48
  --> /tmp/dojo-caesar-cipher-0.almd:1:48
  hint: Almide requires '=' before the body. Write: fn encrypt(...) -> Type = { ... }

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let codepoints = string.chars(text)
    .map(|c| string.codepoint(c))
    .filter(|&cp| cp >= 97 && cp <= 122)
    .map(|cp| (cp + shift) % 26 + 97)
    .map(|cp| string.from_codepoint(cp))
    .collect::<List[String]>()
  string.join(codepoints, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let codepoints = string.chars(text)
    .map(|c| string.codepoint(c))
    .filter(|&cp| cp >= 97 && cp <= 122)
    .map(|cp| (cp - shift + 26) % 26 + 97)
    .map(|cp| string.from_codepoint(cp))
    .collect::<List[String]>()
  string.join(codepoints, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Expected expression at line 3:5 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-1.almd:3:5
error: Expected '}' to close block opened at line 1:50
  --> /tmp/dojo-caesar-cipher-1.almd:4:14
  hint: Add '}' or check for a missing delimiter inside the block

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let codepoints = string.chars(text)
    .map(|c| string.codepoint(c))
    .filter(|&cp| cp >= 97 && cp <= 122)
    .map(|cp| (cp + shift) % 26 + 97)
    .map(|cp| string.from_codepoint(cp))
    .collect()
  string.join(codepoints, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let codepoints = string.chars(text)
    .map(|c| string.codepoint(c))
    .filter(|&cp| cp >= 97 && cp <= 122)
    .map(|cp| (cp - shift + 26) % 26 + 97)
    .map(|cp| string.from_codepoint(cp))
    .collect()
  string.join(codepoints, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected expression at line 3:5 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-2.almd:3:5
error: Expected '}' to close block opened at line 1:50
  --> /tmp/dojo-caesar-cipher-2.almd:4:14
  hint: Add '}' or check for a missing delimiter inside the block

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let codepoints = string.chars(text)
    .map(|c| string.codepoint(c))
    .filter(|&cp| cp >= 97 && cp <= 122)
    .map(|cp| (cp + shift) % 26 + 97)
    .map(|cp| string.from_codepoint(cp))
    .collect()
  string.join(codepoints, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let codepoints = string.chars(text)
    .map(|c| string.codepoint(c))
    .filter(|&cp| cp >= 97 && cp <= 122)
    .map(|cp| (cp - shift + 26) % 26 + 97)
    .map(|cp| string.from_codepoint(cp))
    .collect()
  string.join(codepoints, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected expression at line 3:5 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-3.almd:3:5
error: Expected '}' to close block opened at line 1:50
  --> /tmp/dojo-caesar-cipher-3.almd:4:14
  hint: Add '}' or check for a missing delimiter inside the block

```
