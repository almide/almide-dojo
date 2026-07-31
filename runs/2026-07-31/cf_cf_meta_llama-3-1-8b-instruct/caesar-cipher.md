# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
  let shift = shift % 26;
  let chars = string.chars(text);
  let encrypted = chars.map(
    (c) => match string.codepoint(c) {
      Some(cp) => {
        if cp >= 97 && cp <= 122 {
          let new_cp = ((cp - 97 + shift) % 26) + 97;
          string.from_codepoint(new_cp)
        } else {
          c
        }
      },
      _ => c
    }
  );
  string.join(encrypted, "")
}

fn decrypt(text: String, shift: Int) -> String {
  let shift = 26 - shift % 26;
  let chars = string.chars(text);
  let decrypted = chars.map(
    (c) => match string.codepoint(c) {
      Some(cp) => {
        if cp >= 97 && cp <= 122 {
          let new_cp = ((cp - 97 - shift) % 26) + 97;
          string.from_codepoint(new_cp)
        } else {
          c
        }
      },
      _ => c
    }
  );
  string.join(decrypted, "")
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
error: Missing '=' before function body at line 20:48
  --> /tmp/dojo-caesar-cipher-0.almd:20:48
  hint: Almide requires '=' before the body. Write: fn decrypt(...) -> Type = { ... }
   |
20 | fn decrypt(text: String, shift: Int) -> String {
   |                                                ^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let shift = shift % 26;
  let chars = string.chars(text);
  let encrypted = chars.map(
    (c) => match string.codepoint(c) {
      Some(cp) => {
        if cp >= 97 && cp <= 122 {
          let new_cp = ((cp - 97 + shift) % 26) + 97;
          string.from_codepoint(new_cp)
        } else {
          c
        }
      },
      _ => c
    }
  );
  string.join(encrypted, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let shift = 26 - shift % 26;
  let chars = string.chars(text);
  let decrypted = chars.map(
    (c) => match string.codepoint(c) {
      Some(cp) => {
        if cp >= 97 && cp <= 122 {
          let new_cp = ((cp - 97 - shift) % 26) + 97;
          string.from_codepoint(new_cp)
        } else {
          c
        }
      },
      _ => c
    }
  );
  string.join(decrypted, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '&&' is not valid in Almide at line 7:21
  --> /tmp/dojo-caesar-cipher-1.almd:7:21
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
7 |         if cp >= 97 && cp <= 122 {
  |                     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:7 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:13:7
   |
13 |       },
   |       ^
error: '&&' is not valid in Almide at line 26:21
  --> /tmp/dojo-caesar-cipher-1.almd:26:21
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
26 |         if cp >= 97 && cp <= 122 {
   |                     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 32:7 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:32:7
   |
32 |       },
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:11:11
  in variable c
  hint: Check the variable name
   |
11 |           c
   |           ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:30:11
  in variable c
  hint: Check the variable name
   |
30 |           c
   |           ^

6 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let shift = shift % 26;
  let chars = string.chars(text);
  let encrypted = chars.map(
    (c) => match string.codepoint(c) {
      some(cp) => {
        if cp >= 97 and cp <= 122 {
          let new_cp = ((cp - 97 + shift) % 26) + 97;
          string.from_codepoint(new_cp)
        } else {
          c
        }
      },
      none => c
    }
  );
  string.join(encrypted, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let shift = 26 - shift % 26;
  let chars = string.chars(text);
  let decrypted = chars.map(
    (c) => match string.codepoint(c) {
      some(cp) => {
        if cp >= 97 and cp <= 122 {
          let new_cp = ((cp - 97 - shift) % 26) + 97;
          string.from_codepoint(new_cp)
        } else {
          c
        }
      },
      none => c
    }
  );
  string.join(decrypted, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected Then at line 7:35 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:7:35
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
7 |         if cp >= 97 and cp <= 122 {
  |                                   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:7 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:13:7
   |
13 |       },
   |       ^
error: Expected Then at line 26:35 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:26:35
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
26 |         if cp >= 97 and cp <= 122 {
   |                                   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 32:7 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:32:7
   |
32 |       },
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:11:11
  in variable c
  hint: Check the variable name
   |
11 |           c
   |           ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:30:11
  in variable c
  hint: Check the variable name
   |
30 |           c
   |           ^

6 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let shift = shift % 26;
  let chars = string.chars(text);
  let encrypted = chars.map(
    (c) => match string.codepoint(c) {
      some(cp) => {
        if cp >= 97 and cp <= 122 then {
          let new_cp = ((cp - 97 + shift) % 26) + 97;
          string.from_codepoint(new_cp)
        } else {
          c
        }
      },
      none => c
    }
  );
  string.join(encrypted, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let shift = 26 - shift % 26;
  let chars = string.chars(text);
  let decrypted = chars.map(
    (c) => match string.codepoint(c) {
      some(cp) => {
        if cp >= 97 and cp <= 122 then {
          let new_cp = ((cp - 97 - shift) % 26) + 97;
          string.from_codepoint(new_cp)
        } else {
          c
        }
      },
      none => c
    }
  );
  string.join(decrypted, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
