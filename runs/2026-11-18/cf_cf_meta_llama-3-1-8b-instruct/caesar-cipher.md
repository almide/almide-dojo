# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
    let text = string.to_list(text);
    let result = text.map(|c| {
        let codepoint = string.to_codepoint(c) ?? 0;
        if codepoint >= 97 && codepoint <= 122 {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint) ?? ""
        } else {
            c
        }
    });
    string.from_list(result)
}

fn decrypt(text: String, shift: Int) -> String {
    let text = string.to_list(text);
    let result = text.map(|c| {
        let codepoint = string.to_codepoint(c) ?? 0;
        if codepoint >= 97 && codepoint <= 122 {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint) ?? ""
        } else {
            c
        }
    });
    string.from_list(result)
}
```

**Diagnostic:**

```
error: Missing '=' before function body at line 1:48
  --> /tmp/dojo-caesar-cipher-0.almd:1:48
  here: fn encrypt(text: String, shift: Int) -> String {
  hint: Almide requires '=' before the body. Write: fn encrypt(...) -> Type = { ... }
  |
1 | fn encrypt(text: String, shift: Int) -> String {
  |                                                ^
error: Missing '=' before function body at line 15:48
  --> /tmp/dojo-caesar-cipher-0.almd:15:48
  here: fn decrypt(text: String, shift: Int) -> String {
  hint: Almide requires '=' before the body. Write: fn decrypt(...) -> Type = { ... }
   |
15 | fn decrypt(text: String, shift: Int) -> String {
   |                                                ^

2 error(s) found
FAILED: /tmp/dojo-caesar-cipher-0.almd
  parse error: Missing '=' before function body at line 1:48
  parse error: Missing '=' before function body at line 15:48
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-caesar-cipher-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let text = string.to_list(text);
    let result = text.map(|c| {
        let codepoint = string.to_codepoint(c) ?? 0;
        if codepoint >= 97 && codepoint <= 122 {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint) ?? ""
        } else {
            c
        }
    });
    string.from_list(result)
}

fn decrypt(text: String, shift: Int) -> String = {
    let text = string.to_list(text);
    let result = text.map(|c| {
        let codepoint = string.to_codepoint(c) ?? 0;
        if codepoint >= 97 && codepoint <= 122 {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint) ?? ""
        } else {
            c
        }
    });
    string.from_list(result)
}
```

**Diagnostic:**

```
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:3:27
  in lambda
  here: let result = text.map(|c| {
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
  |
3 |     let result = text.map(|c| {
  |                           ^
error: '&&' is not valid in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:5:28
  in operator
  here: if codepoint >= 97 && codepoint <= 122 {
  hint: Use 'and' for logical AND. Example: if a and b then ...
  try:
      a and b
  |
5 |         if codepoint >= 97 && codepoint <= 122 {
  |                            ^^
error: if requires 'then', not a brace block
  --> /tmp/dojo-caesar-cipher-1.almd:5:48
  in if
  here: if codepoint >= 97 && codepoint <= 122 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
  |
5 |         if codepoint >= 97 && codepoint <= 122 {
  |                                                ^
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:17:27
  in lambda
  here: let result = text.map(|c| {
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
   |
17 |     let result = text.map(|c| {
   |                           ^
error: '&&' is not valid in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:19:28
  in operator
  here: if codepoint >= 97 && codepoint <= 122 {
  hint: Use 'and' for logical AND. Example: if a and b then ...
  try:
      a and b
   |
19 |         if codepoint >= 97 && codepoint <= 122 {
   |                            ^^
error: if requires 'then', not a brace block
  --> /tmp/dojo-caesar-cipher-1.almd:19:48
  in if
  here: if codepoint >= 97 && codepoint <= 122 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
19 |         if codepoint >= 97 && codepoint <= 122 {
   |                                                ^

6 error(s) found
FAILED: /tmp/dojo-caesar-cipher-1.almd
  parse error: '|x|' closure syntax is not valid in Almide
  parse error: '&&' is not valid in Almide
  parse error: if requires 'then', not a brace block
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-caesar-cipher-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let text = string.to_list(text);
    let result = text.map((c) => {
        let codepoint = string.to_codepoint(c) ?? 0;
        if codepoint >= 97 and codepoint <= 122 then {
            let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(new_codepoint) ?? ""
        } else {
            c
        }
    });
    string.from_list(result)
}

fn decrypt(text: String, shift: Int) -> String = {
    let text = string.to_list(text);
    let result = text.map((c) => {
        let codepoint = string.to_codepoint(c) ?? 0;
        if codepoint >= 97 and codepoint <= 122 then {
            let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(new_codepoint) ?? ""
        } else {
            c
        }
    });
    string.from_list(result)
}
```
