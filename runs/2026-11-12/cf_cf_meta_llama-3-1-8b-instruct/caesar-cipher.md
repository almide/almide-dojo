# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
    let codepoints = string.to_list(text).map(string.to_codepoint);
    let shifted = codepoints.map(|codepoint| {
        if codepoint >= 97 && codepoint <= 122 {
            let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(shifted_codepoint) ?? ""
        } else {
            string.from_codepoint(codepoint) ?? ""
        }
    });
    string.from_list(shifted).unwrap_or("")
}

fn decrypt(text: String, shift: Int) -> String {
    let codepoints = string.to_list(text).map(string.to_codepoint);
    let shifted = codepoints.map(|codepoint| {
        if codepoint >= 97 && codepoint <= 122 {
            let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(shifted_codepoint) ?? ""
        } else {
            string.from_codepoint(codepoint) ?? ""
        }
    });
    string.from_list(shifted).unwrap_or("")
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
error: Missing '=' before function body at line 14:48
  --> /tmp/dojo-caesar-cipher-0.almd:14:48
  here: fn decrypt(text: String, shift: Int) -> String {
  hint: Almide requires '=' before the body. Write: fn decrypt(...) -> Type = { ... }
   |
14 | fn decrypt(text: String, shift: Int) -> String {
   |                                                ^

2 error(s) found
FAILED: /tmp/dojo-caesar-cipher-0.almd
  parse error: Missing '=' before function body at line 1:48
  parse error: Missing '=' before function body at line 14:48
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-caesar-cipher-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let codepoints = string.to_list(text).map(string.to_codepoint);
    let shifted = codepoints.map(|codepoint| {
        if codepoint >= 97 && codepoint <= 122 {
            let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
            string.from_codepoint(shifted_codepoint) ?? ""
        } else {
            string.from_codepoint(codepoint) ?? ""
        }
    });
    string.from_list(shifted).unwrap_or("")
}

fn decrypt(text: String, shift: Int) -> String = {
    let codepoints = string.to_list(text).map(string.to_codepoint);
    let shifted = codepoints.map(|codepoint| {
        if codepoint >= 97 && codepoint <= 122 {
            let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(shifted_codepoint) ?? ""
        } else {
            string.from_codepoint(codepoint) ?? ""
        }
    });
    string.from_list(shifted).unwrap_or("")
}
```

**Diagnostic:**

```
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:3:34
  in lambda
  here: let shifted = codepoints.map(|codepoint| {
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
  |
3 |     let shifted = codepoints.map(|codepoint| {
  |                                  ^
error: '&&' is not valid in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:4:28
  in operator
  here: if codepoint >= 97 && codepoint <= 122 {
  hint: Use 'and' for logical AND. Example: if a and b then ...
  try:
      a and b
  |
4 |         if codepoint >= 97 && codepoint <= 122 {
  |                            ^^
error: if requires 'then', not a brace block
  --> /tmp/dojo-caesar-cipher-1.almd:4:48
  in if
  here: if codepoint >= 97 && codepoint <= 122 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
  |
4 |         if codepoint >= 97 && codepoint <= 122 {
  |                                                ^
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:16:34
  in lambda
  here: let shifted = codepoints.map(|codepoint| {
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
   |
16 |     let shifted = codepoints.map(|codepoint| {
   |                                  ^
error: '&&' is not valid in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:17:28
  in operator
  here: if codepoint >= 97 && codepoint <= 122 {
  hint: Use 'and' for logical AND. Example: if a and b then ...
  try:
      a and b
   |
17 |         if codepoint >= 97 && codepoint <= 122 {
   |                            ^^
error: if requires 'then', not a brace block
  --> /tmp/dojo-caesar-cipher-1.almd:17:48
  in if
  here: if codepoint >= 97 && codepoint <= 122 {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
17 |         if codepoint >= 97 && codepoint <= 122 {
   |                                                ^
error[E005]: argument 'f' expects fn(Option[Int]) -> B but got fn(Int) -> String
  --> /tmp/dojo-caesar-cipher-1.almd:3:19
  in call to list.map()
  here: let shifted = codepoints.map(|codepoint| {
  hint: Fix the argument type
  |
3 |     let shifted = codepoints.map(|codepoint| {
  |                   ^^^^^^^^^^
error[E002]: undefined method 'unwrap_or' on string
  --> /tmp/dojo-caesar-cipher-1.almd:11:5
  in method call .unwrap_or()
  here: string.from_list(shifted).unwrap_or("")
  hint: Almide doesn't use method-call syntax. Write `string.<fn>(x)` (or `x |> string.<fn>`) — there is no method `unwrap_or` on `string`. Run `almide explain E002` for examples.
   |
11 |     string.from_list(shifted).unwrap_or("")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'f' expects fn(Option[Int]) -> B but got fn(Int) -> String
  --> /tmp/dojo-caesar-cipher-1.almd:16:19
  in call to list.map()
  here: let shifted = codepoints.map(|codepoint| {
  hint: Fix the argument type
   |
16 |     let shifted = codepoints.map(|codepoint| {
   |                   ^^^^^^^^^^
error[E002]: undefined method 'unwrap_or' on string
  --> /tmp/dojo-caesar-cipher-1.almd:24:5
  in method call .unwrap_or()
  here: string.from_list(shifted).unwrap_or("")
  hint: Almide doesn't use method-call syntax. Write `string.<fn>(x)` (or `x |> string.<fn>`) — there is no method `unwrap_or` on `string`. Run `almide explain E002` for examples.
   |
24 |     string.from_list(shifted).unwrap_or("")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

10 error(s) found
FAILED: /tmp/dojo-caesar-cipher-1.almd
  parse error: '|x|' closure syntax is not valid in Almide
  parse error: '&&' is not valid in Almide
  parse error: if requires 'then', not a brace block
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-caesar-cipher-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let codepoints = string.to_list(text).map(string.to_codepoint);
    let shifted = codepoints.map((x) => {
        if x >= 97 and x <= 122 then {
            let shifted_codepoint = (x - 97 + shift) % 26 + 97;
            string.from_codepoint(shifted_codepoint) ?? ""
        } else {
            string.from_codepoint(x) ?? ""
        }
    });
    string.from_list(shifted).unwrap_or("")
}

fn decrypt(text: String, shift: Int) -> String = {
    let codepoints = string.to_list(text).map(string.to_codepoint);
    let shifted = codepoints.map((x) => {
        if x >= 97 and x <= 122 then {
            let shifted_codepoint = (x - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(shifted_codepoint) ?? ""
        } else {
            string.from_codepoint(x) ?? ""
        }
    });
    string.from_list(shifted).unwrap_or("")
}
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(Option[Int]) -> B but got fn(Int) -> String
  --> /tmp/dojo-caesar-cipher-2.almd:3:19
  in call to list.map()
  here: let shifted = codepoints.map((x) => {
  hint: Fix the argument type
  |
3 |     let shifted = codepoints.map((x) => {
  |                   ^^^^^^^^^^
error[E002]: undefined method 'unwrap_or' on string
  --> /tmp/dojo-caesar-cipher-2.almd:11:5
  in method call .unwrap_or()
  here: string.from_list(shifted).unwrap_or("")
  hint: Almide doesn't use method-call syntax. Write `string.<fn>(x)` (or `x |> string.<fn>`) — there is no method `unwrap_or` on `string`. Run `almide explain E002` for examples.
   |
11 |     string.from_list(shifted).unwrap_or("")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'f' expects fn(Option[Int]) -> B but got fn(Int) -> String
  --> /tmp/dojo-caesar-cipher-2.almd:16:19
  in call to list.map()
  here: let shifted = codepoints.map((x) => {
  hint: Fix the argument type
   |
16 |     let shifted = codepoints.map((x) => {
   |                   ^^^^^^^^^^
error[E002]: undefined method 'unwrap_or' on string
  --> /tmp/dojo-caesar-cipher-2.almd:24:5
  in method call .unwrap_or()
  here: string.from_list(shifted).unwrap_or("")
  hint: Almide doesn't use method-call syntax. Write `string.<fn>(x)` (or `x |> string.<fn>`) — there is no method `unwrap_or` on `string`. Run `almide explain E002` for examples.
   |
24 |     string.from_list(shifted).unwrap_or("")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4 error(s) found
FAILED: /tmp/dojo-caesar-cipher-2.almd
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let codepoints = string.to_list(text).map(string.to_codepoint);
    let shifted = codepoints.map((x) => {
        if x >= 97 and x <= 122 then {
            let shifted_codepoint = (x - 97 + shift) % 26 + 97;
            string.from_codepoint(shifted_codepoint) ?? ""
        } else {
            string.from_codepoint(x) ?? ""
        }
    });
    string.from_list(shifted).or("")
}

fn decrypt(text: String, shift: Int) -> String = {
    let codepoints = string.to_list(text).map(string.to_codepoint);
    let shifted = codepoints.map((x) => {
        if x >= 97 and x <= 122 then {
            let shifted_codepoint = (x - 97 - shift + 26) % 26 + 97;
            string.from_codepoint(shifted_codepoint) ?? ""
        } else {
            string.from_codepoint(x) ?? ""
        }
    });
    string.from_list(shifted).or("")
}
```

**Diagnostic:**

```
error: Expected name at line 11:31 (got Or 'or')
  --> /tmp/dojo-caesar-cipher-3.almd:11:31
  here: string.from_list(shifted).or("")
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |     string.from_list(shifted).or("")
   |                               ^
error: Expected name at line 24:31 (got Or 'or')
  --> /tmp/dojo-caesar-cipher-3.almd:24:31
  here: string.from_list(shifted).or("")
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
24 |     string.from_list(shifted).or("")
   |                               ^
error[E005]: argument 'f' expects fn(Option[Int]) -> B but got fn(Int) -> String
  --> /tmp/dojo-caesar-cipher-3.almd:3:19
  in call to list.map()
  here: let shifted = codepoints.map((x) => {
  hint: Fix the argument type
  |
3 |     let shifted = codepoints.map((x) => {
  |                   ^^^^^^^^^^
error[E005]: argument 'f' expects fn(Option[Int]) -> B but got fn(Int) -> String
  --> /tmp/dojo-caesar-cipher-3.almd:16:19
  in call to list.map()
  here: let shifted = codepoints.map((x) => {
  hint: Fix the argument type
   |
16 |     let shifted = codepoints.map((x) => {
   |                   ^^^^^^^^^^
error[E001]: type mismatch in fn 'encrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-3.almd:3:19
  in fn 'encrypt'
  here: let shifted = codepoints.map((x) => {
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
3 |     let shifted = codepoints.map((x) => {
  |                   ^^^^^^^^^^
error[E001]: type mismatch in fn 'decrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-3.almd:16:19
  in fn 'decrypt'
  here: let shifted = codepoints.map((x) => {
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
16 |     let shifted = codepoints.map((x) => {
   |                   ^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?3])
  --> /tmp/dojo-caesar-cipher-3.almd:3:33
  in this expression with an unconstrained type
  here: let shifted = codepoints.map((x) => {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |     let shifted = codepoints.map((x) => {
  |                                 ^
error[E025]: cannot infer a concrete type for this expression (type List[?7])
  --> /tmp/dojo-caesar-cipher-3.almd:16:33
  in this expression with an unconstrained type
  here: let shifted = codepoints.map((x) => {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
16 |     let shifted = codepoints.map((x) => {
   |                                 ^

8 error(s) found
FAILED: /tmp/dojo-caesar-cipher-3.almd
  parse error: Expected name at line 11:31 (got Or 'or')
  parse error: Expected name at line 24:31 (got Or 'or')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-caesar-cipher-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
