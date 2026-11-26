# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let text = string.to_list(text)
  let result = list.map(text, (c) => {
    let codepoint = string.to_codepoint(c) ?? 0
    if (codepoint >= 97 && codepoint <= 122) {
      let new_codepoint = (codepoint - 97 + shift) % 26 + 97
      string.from_codepoint(new_codepoint) ?? ""
    } else {
      c
    }
  })
  string.from_list(result)
}

fn decrypt(text: String, shift: Int) -> String = {
  let text = string.to_list(text)
  let result = list.map(text, (c) => {
    let codepoint = string.to_codepoint(c) ?? 0
    if (codepoint >= 97 && codepoint <= 122) {
      let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
      string.from_codepoint(new_codepoint) ?? ""
    } else {
      c
    }
  })
  string.from_list(result)
}
```

**Diagnostic:**

```
error: '&&' is not valid in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:5:25
  in operator
  here: if (codepoint >= 97 && codepoint <= 122) {
  hint: Use 'and' for logical AND. Example: if a and b then ...
  try:
      a and b
  |
5 |     if (codepoint >= 97 && codepoint <= 122) {
  |                         ^^
error: if requires 'then', not a brace block
  --> /tmp/dojo-caesar-cipher-0.almd:5:46
  in if
  here: if (codepoint >= 97 && codepoint <= 122) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
  |
5 |     if (codepoint >= 97 && codepoint <= 122) {
  |                                              ^
error: '&&' is not valid in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:19:25
  in operator
  here: if (codepoint >= 97 && codepoint <= 122) {
  hint: Use 'and' for logical AND. Example: if a and b then ...
  try:
      a and b
   |
19 |     if (codepoint >= 97 && codepoint <= 122) {
   |                         ^^
error: if requires 'then', not a brace block
  --> /tmp/dojo-caesar-cipher-0.almd:19:46
  in if
  here: if (codepoint >= 97 && codepoint <= 122) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
19 |     if (codepoint >= 97 && codepoint <= 122) {
   |                                              ^

4 error(s) found
FAILED: /tmp/dojo-caesar-cipher-0.almd
  parse error: '&&' is not valid in Almide
  parse error: if requires 'then', not a brace block
  parse error: '&&' is not valid in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-caesar-cipher-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let text = string.to_list(text)
  let result = list.map(text, (c) => {
    let codepoint = string.to_codepoint(c) ?? 0
    if (codepoint >= 97 and codepoint <= 122) then {
      let new_codepoint = (codepoint - 97 + shift) % 26 + 97
      string.from_codepoint(new_codepoint) ?? ""
    } else {
      c
    }
  })
  string.from_list(result)
}

fn decrypt(text: String, shift: Int) -> String = {
  let text = string.to_list(text)
  let result = list.map(text, (c) => {
    let codepoint = string.to_codepoint(c) ?? 0
    if (codepoint >= 97 and codepoint <= 122) then {
      let new_codepoint = (codepoint - 97 - shift + 26) % 26 + 97
      string.from_codepoint(new_codepoint) ?? ""
    } else {
      c
    }
  })
  string.from_list(result)
}
```
