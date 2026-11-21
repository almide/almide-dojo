# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E030`

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let codepoints = string.to_list(text).map(string.to_codepoint)
  let shifted = codepoints.map(
    (codepoint) => {
      if (codepoint >= 97 && codepoint <= 122) {
        let base = codepoint - 97
        let shifted_base = (base + shift) % 26
        let shifted_codepoint = shifted_base + 97
        string.from_codepoint(shifted_codepoint) ?? ""
      } else {
        string.from_codepoint(codepoint) ?? ""
      }
    }
  )
  string.from_codepoints(shifted)
}

fn decrypt(text: String, shift: Int) -> String = {
  let codepoints = string.to_list(text).map(string.to_codepoint)
  let shifted = codepoints.map(
    (codepoint) => {
      if (codepoint >= 97 && codepoint <= 122) {
        let base = codepoint - 97
        let shifted_base = (base - shift + 26) % 26
        let shifted_codepoint = shifted_base + 97
        string.from_codepoint(shifted_codepoint) ?? ""
      } else {
        string.from_codepoint(codepoint) ?? ""
      }
    }
  )
  string.from_codepoints(shifted)
}
```

**Diagnostic:**

```
error: '&&' is not valid in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:5:27
  in operator
  here: if (codepoint >= 97 && codepoint <= 122) {
  hint: Use 'and' for logical AND. Example: if a and b then ...
  try:
      a and b
  |
5 |       if (codepoint >= 97 && codepoint <= 122) {
  |                           ^^
error: if requires 'then', not a brace block
  --> /tmp/dojo-caesar-cipher-0.almd:5:48
  in if
  here: if (codepoint >= 97 && codepoint <= 122) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
  |
5 |       if (codepoint >= 97 && codepoint <= 122) {
  |                                                ^
error: '&&' is not valid in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:22:27
  in operator
  here: if (codepoint >= 97 && codepoint <= 122) {
  hint: Use 'and' for logical AND. Example: if a and b then ...
  try:
      a and b
   |
22 |       if (codepoint >= 97 && codepoint <= 122) {
   |                           ^^
error: if requires 'then', not a brace block
  --> /tmp/dojo-caesar-cipher-0.almd:22:48
  in if
  here: if (codepoint >= 97 && codepoint <= 122) {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
22 |       if (codepoint >= 97 && codepoint <= 122) {
   |                                                ^
error[E005]: argument 'f' expects fn(Option[Int]) -> B but got fn(Int) -> String
  --> /tmp/dojo-caesar-cipher-0.almd:3:17
  in call to list.map()
  here: let shifted = codepoints.map(
  hint: Fix the argument type
  |
3 |   let shifted = codepoints.map(
  |                 ^^^^^^^^^^
error[E002]: undefined function 'string.from_codepoints'
  --> /tmp/dojo-caesar-cipher-0.almd:15:3
  in call to string.from_codepoints()
  here: string.from_codepoints(shifted)
  hint: Did you mean `string.from_codepoint`?
  try:
      string.from_codepoint
   |
15 |   string.from_codepoints(shifted)
   |   ^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'f' expects fn(Option[Int]) -> B but got fn(Int) -> String
  --> /tmp/dojo-caesar-cipher-0.almd:20:17
  in call to list.map()
  here: let shifted = codepoints.map(
  hint: Fix the argument type
   |
20 |   let shifted = codepoints.map(
   |                 ^^^^^^^^^^
error[E002]: undefined function 'string.from_codepoints'
  --> /tmp/dojo-caesar-cipher-0.almd:32:3
  in call to string.from_codepoints()
  here: string.from_codepoints(shifted)
  hint: Did you mean `string.from_codepoint`?
  try:
      string.from_codepoint
   |
32 |   string.from_codepoints(shifted)
   |   ^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?3])
  --> /tmp/dojo-caesar-cipher-0.almd:3:31
  in this expression with an unconstrained type
  here: let shifted = codepoints.map(
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |   let shifted = codepoints.map(
  |                               ^
error[E025]: cannot infer a concrete type for this expression (type List[?7])
  --> /tmp/dojo-caesar-cipher-0.almd:20:31
  in this expression with an unconstrained type
  here: let shifted = codepoints.map(
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
20 |   let shifted = codepoints.map(
   |                               ^

10 error(s) found
FAILED: /tmp/dojo-caesar-cipher-0.almd
  parse error: '&&' is not valid in Almide
  parse error: if requires 'then', not a brace block
  parse error: '&&' is not valid in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-caesar-cipher-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let codepoints = string.to_list(text).map(string.to_codepoint)
  let shifted = codepoints.map(
    (codepoint) => {
      if (codepoint >= 97 and codepoint <= 122) then {
        let base = codepoint - 97
        let shifted_base = (base + shift) % 26
        let shifted_codepoint = shifted_base + 97
        string.from_codepoint(shifted_codepoint) ?? ""
      } else {
        string.from_codepoint(codepoint) ?? ""
      }
    }
  )
  string.from_codepoints(shifted)
}

fn decrypt(text: String, shift: Int) -> String = {
  let codepoints = string.to_list(text).map(string.to_codepoint)
  let shifted = codepoints.map(
    (codepoint) => {
      if (codepoint >= 97 and codepoint <= 122) then {
        let base = codepoint - 97
        let shifted_base = (base - shift + 26) % 26
        let shifted_codepoint = shifted_base + 97
        string.from_codepoint(shifted_codepoint) ?? ""
      } else {
        string.from_codepoint(codepoint) ?? ""
      }
    }
  )
  string.from_codepoints(shifted)
}
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(Option[Int]) -> B but got fn(Int) -> String
  --> /tmp/dojo-caesar-cipher-1.almd:3:17
  in call to list.map()
  here: let shifted = codepoints.map(
  hint: Fix the argument type
  |
3 |   let shifted = codepoints.map(
  |                 ^^^^^^^^^^
error[E002]: undefined function 'string.from_codepoints'
  --> /tmp/dojo-caesar-cipher-1.almd:15:3
  in call to string.from_codepoints()
  here: string.from_codepoints(shifted)
  hint: Did you mean `string.from_codepoint`?
  try:
      string.from_codepoint
   |
15 |   string.from_codepoints(shifted)
   |   ^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'f' expects fn(Option[Int]) -> B but got fn(Int) -> String
  --> /tmp/dojo-caesar-cipher-1.almd:20:17
  in call to list.map()
  here: let shifted = codepoints.map(
  hint: Fix the argument type
   |
20 |   let shifted = codepoints.map(
   |                 ^^^^^^^^^^
error[E002]: undefined function 'string.from_codepoints'
  --> /tmp/dojo-caesar-cipher-1.almd:32:3
  in call to string.from_codepoints()
  here: string.from_codepoints(shifted)
  hint: Did you mean `string.from_codepoint`?
  try:
      string.from_codepoint
   |
32 |   string.from_codepoints(shifted)
   |   ^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?3])
  --> /tmp/dojo-caesar-cipher-1.almd:3:31
  in this expression with an unconstrained type
  here: let shifted = codepoints.map(
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |   let shifted = codepoints.map(
  |                               ^
error[E025]: cannot infer a concrete type for this expression (type List[?7])
  --> /tmp/dojo-caesar-cipher-1.almd:20:31
  in this expression with an unconstrained type
  here: let shifted = codepoints.map(
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
20 |   let shifted = codepoints.map(
   |                               ^

6 error(s) found
FAILED: /tmp/dojo-caesar-cipher-1.almd
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let codepoints = string.to_list(text).map(string.to_codepoint)
  let shifted = codepoints.map(
    (codepoint) => {
      if (codepoint >= 97 and codepoint <= 122) then {
        let base = codepoint - 97
        let shifted_base = (base + shift) % 26
        let shifted_codepoint = shifted_base + 97
        string.from_codepoint(shifted_codepoint) ?? ""
      } else {
        string.from_codepoint(codepoint) ?? ""
      }
    }
  )
  let result = string.from_codepoints(shifted)
  result
}

fn decrypt(text: String, shift: Int) -> String = {
  let codepoints = string.to_list(text).map(string.to_codepoint)
  let shifted = codepoints.map(
    (codepoint) => {
      if (codepoint >= 97 and codepoint <= 122) then {
        let base = codepoint - 97
        let shifted_base = (base - shift + 26) % 26
        let shifted_codepoint = shifted_base + 97
        string.from_codepoint(shifted_codepoint) ?? ""
      } else {
        string.from_codepoint(codepoint) ?? ""
      }
    }
  )
  let result = string.from_codepoints(shifted)
  result
}
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(Option[Int]) -> B but got fn(Int) -> String
  --> /tmp/dojo-caesar-cipher-2.almd:3:17
  in call to list.map()
  here: let shifted = codepoints.map(
  hint: Fix the argument type
  |
3 |   let shifted = codepoints.map(
  |                 ^^^^^^^^^^
error[E002]: undefined function 'string.from_codepoints'
  --> /tmp/dojo-caesar-cipher-2.almd:15:16
  in call to string.from_codepoints()
  here: let result = string.from_codepoints(shifted)
  hint: Did you mean `string.from_codepoint`?
  try:
      string.from_codepoint
   |
15 |   let result = string.from_codepoints(shifted)
   |                ^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'f' expects fn(Option[Int]) -> B but got fn(Int) -> String
  --> /tmp/dojo-caesar-cipher-2.almd:21:17
  in call to list.map()
  here: let shifted = codepoints.map(
  hint: Fix the argument type
   |
21 |   let shifted = codepoints.map(
   |                 ^^^^^^^^^^
error[E002]: undefined function 'string.from_codepoints'
  --> /tmp/dojo-caesar-cipher-2.almd:33:16
  in call to string.from_codepoints()
  here: let result = string.from_codepoints(shifted)
  hint: Did you mean `string.from_codepoint`?
  try:
      string.from_codepoint
   |
33 |   let result = string.from_codepoints(shifted)
   |                ^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?3])
  --> /tmp/dojo-caesar-cipher-2.almd:3:31
  in this expression with an unconstrained type
  here: let shifted = codepoints.map(
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |   let shifted = codepoints.map(
  |                               ^
error[E025]: cannot infer a concrete type for this expression (type List[?7])
  --> /tmp/dojo-caesar-cipher-2.almd:21:31
  in this expression with an unconstrained type
  here: let shifted = codepoints.map(
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
21 |   let shifted = codepoints.map(
   |                               ^

6 error(s) found
FAILED: /tmp/dojo-caesar-cipher-2.almd
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let codepoints = string.to_list(text).map(string.to_codepoint)
  let shifted = codepoints.map(
    (codepoint) => {
      match string.from_codepoint(codepoint) {
        some(c) => {
          if (string.to_codepoint(c) >= 97 and string.to_codepoint(c) <= 122) then {
            let base = string.to_codepoint(c) - 97
            let shifted_base = (base + shift) % 26
            let shifted_codepoint = shifted_base + 97
            string.from_codepoint(shifted_codepoint) ?? ""
          } else {
            c
          }
        },
        none => c
      }
    }
  )
  let result = string.from_codepoints(shifted)
  result
}

fn decrypt(text: String, shift: Int) -> String = {
  let codepoints = string.to_list(text).map(string.to_codepoint)
  let shifted = codepoints.map(
    (codepoint) => {
      match string.from_codepoint(codepoint) {
        some(c) => {
          if (string.to_codepoint(c) >= 97 and string.to_codepoint(c) <= 122) then {
            let base = string.to_codepoint(c) - 97
            let shifted_base = (base - shift + 26) % 26
            let shifted_codepoint = shifted_base + 97
            string.from_codepoint(shifted_codepoint) ?? ""
          } else {
            c
          }
        },
        none => c
      }
    }
  )
  let result = string.from_codepoints(shifted)
  result
}
```

**Diagnostic:**

```
error[E030]: operator '>=' is not defined for Option[Int] — ordering applies to Int, Float, String, and Bool
  --> /tmp/dojo-caesar-cipher-3.almd:7:41
  in operator >=
  here: if (string.to_codepoint(c) >= 97 and string.to_codepoint(c) <= 122) then {
  hint: Compare scalar fields explicitly, or use list.sort / list.min / list.max for ordered collections
  |
7 |           if (string.to_codepoint(c) >= 97 and string.to_codepoint(c) <= 122) then {
  |                                         ^^
error[E030]: operator '<=' is not defined for Option[Int] — ordering applies to Int, Float, String, and Bool
  --> /tmp/dojo-caesar-cipher-3.almd:7:74
  in operator <=
  here: if (string.to_codepoint(c) >= 97 and string.to_codepoint(c) <= 122) then {
  hint: Compare scalar fields explicitly, or use list.sort / list.min / list.max for ordered collections
  |
7 |           if (string.to_codepoint(c) >= 97 and string.to_codepoint(c) <= 122) then {
  |                                                                          ^^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:8:49
  in operator -
  here: let base = string.to_codepoint(c) - 97
  hint: Use numeric types (Int or Float)
  |
8 |             let base = string.to_codepoint(c) - 97
  |                                                 ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:9:40
  in operator +
  here: let shifted_base = (base + shift) % 26
  hint: Use + with numeric types, String, List, or Bytes
  |
9 |             let shifted_base = (base + shift) % 26
  |                                        ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:9:49
  in operator %
  here: let shifted_base = (base + shift) % 26
  hint: Use numeric types (Int or Float)
  |
9 |             let shifted_base = (base + shift) % 26
  |                                                 ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:10:52
  in operator +
  here: let shifted_codepoint = shifted_base + 97
  hint: Use + with numeric types, String, List, or Bytes
   |
10 |             let shifted_codepoint = shifted_base + 97
   |                                                    ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:11:35
  in call to string.from_codepoint()
  here: string.from_codepoint(shifted_codepoint) ?? ""
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
11 |             string.from_codepoint(shifted_codepoint) ?? ""
   |                                   ^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:16:17
  in variable c
  here: none => c
  hint: Check the variable name
   |
16 |         none => c
   |                 ^
error[E005]: argument 'f' expects fn(Option[Int]) -> B but got fn(Int) -> String
  --> /tmp/dojo-caesar-cipher-3.almd:3:17
  in call to list.map()
  here: let shifted = codepoints.map(
  hint: Fix the argument type
  |
3 |   let shifted = codepoints.map(
  |                 ^^^^^^^^^^
error[E002]: undefined function 'string.from_codepoints'
  --> /tmp/dojo-caesar-cipher-3.almd:20:16
  in call to string.from_codepoints()
  here: let result = string.from_codepoints(shifted)
  hint: Did you mean `string.from_codepoint`?
  try:
      string.from_codepoint
   |
20 |   let result = string.from_codepoints(shifted)
   |                ^^^^^^^^^^^^^^^^^^^^^^
error[E030]: operator '>=' is not defined for Option[Int] — ordering applies to Int, Float, String, and Bool
  --> /tmp/dojo-caesar-cipher-3.almd:30:41
  in operator >=
  here: if (string.to_codepoint(c) >= 97 and string.to_codepoint(c) <= 122) then {
  hint: Compare scalar fields explicitly, or use list.sort / list.min / list.max for ordered collections
   |
30 |           if (string.to_codepoint(c) >= 97 and string.to_codepoint(c) <= 122) then {
   |                                         ^^
error[E030]: operator '<=' is not defined for Option[Int] — ordering applies to Int, Float, String, and Bool
  --> /tmp/dojo-caesar-cipher-3.almd:30:74
  in operator <=
  here: if (string.to_codepoint(c) >= 97 and string.to_codepoint(c) <= 122) then {
  hint: Compare scalar fields explicitly, or use list.sort / list.min / list.max for ordered collections
   |
30 |           if (string.to_codepoint(c) >= 97 and string.to_codepoint(c) <= 122) then {
   |                                                                          ^^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:31:49
  in operator -
  here: let base = string.to_codepoint(c) - 97
  hint: Use numeric types (Int or Float)
   |
31 |             let base = string.to_codepoint(c) - 97
   |                                                 ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:32:40
  in operator -
  here: let shifted_base = (base - shift + 26) % 26
  hint: Use numeric types (Int or Float)
   |
32 |             let shifted_base = (base - shift + 26) % 26
   |                                        ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:32:48
  in operator +
  here: let shifted_base = (base - shift + 26) % 26
  hint: Use + with numeric types, String, List, or Bytes
   |
32 |             let shifted_base = (base - shift + 26) % 26
   |                                                ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:32:54
  in operator %
  here: let shifted_base = (base - shift + 26) % 26
  hint: Use numeric types (Int or Float)
   |
32 |             let shifted_base = (base - shift + 26) % 26
   |                                                      ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:33:52
  in operator +
  here: let shifted_codepoint = shifted_base + 97
  hint: Use + with numeric types, String, List, or Bytes
   |
33 |             let shifted_codepoint = shifted_base + 97
   |                                                    ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:34:35
  in call to string.from_codepoint()
  here: string.from_codepoint(shifted_codepoint) ?? ""
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
34 |             string.from_codepoint(shifted_codepoint) ?? ""
   |                                   ^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:39:17
  in variable c
  here: none => c
  hint: Check the variable name
   |
39 |         none => c
   |                 ^
error[E005]: argument 'f' expects fn(Option[Int]) -> B but got fn(Int) -> String
  --> /tmp/dojo-caesar-cipher-3.almd:26:17
  in call to list.map()
  here: let shifted = codepoints.map(
  hint: Fix the argument type
   |
26 |   let shifted = codepoints.map(
   |                 ^^^^^^^^^^
error[E002]: undefined function 'string.from_codepoints'
  --> /tmp/dojo-caesar-cipher-3.almd:43:16
  in call to string.from_codepoints()
  here: let result = string.from_codepoints(shifted)
  hint: Did you mean `string.from_codepoint`?
  try:
      string.from_codepoint
   |
43 |   let result = string.from_codepoints(shifted)
   |                ^^^^^^^^^^^^^^^^^^^^^^
error[E037]: operator '>=' compares Option[Int] with Int
  at line 7
  in operator >=
  here: if (string.to_codepoint(c) >= 97 and string.to_codepoint(c) <= 122) then {
  hint: A comparison relates two values of the same type, and nothing converts one side implicitly — convert one side explicitly (`int.to_string(n)`, `int.parse(s)`, `float.from(n)`, `<type>.from(x)` for a sized width), or compare the parts you mean
  |
7 |           if (string.to_codepoint(c) >= 97 and string.to_codepoint(c) <= 122) then {
  |               ^
error[E037]: operator '<=' compares Option[Int] with Int
  at line 7
  in operator <=
  here: if (string.to_codepoint(c) >= 97 and string.to_codepoint(c) <= 122) then {
  hint: A comparison relates two values of the same type, and nothing converts one side implicitly — convert one side explicitly (`int.to_string(n)`, `int.parse(s)`, `float.from(n)`, `<type>.from(x)` for a sized width), or compare the parts you mean
  |
7 |           if (string.to_codepoint(c) >= 97 and string.to_codepoint(c) <= 122) then {
  |                                                ^
error[E037]: operator '>=' compares Option[Int] with Int
  at line 30
  in operator >=
  here: if (string.to_codepoint(c) >= 97 and string.to_codepoint(c) <= 122) then {
  hint: A comparison relates two values of the same type, and nothing converts one side implicitly — convert one side explicitly (`int.to_string(n)`, `int.parse(s)`, `float.from(n)`, `<type>.from(x)` for a sized width), or compare the parts you mean
   |
30 |           if (string.to_codepoint(c) >= 97 and string.to_codepoint(c) <= 122) then {
   |               ^
error[E037]: operator '<=' compares Option[Int] with Int
  at line 30
  in operator <=
  here: if (string.to_codepoint(c) >= 97 and string.to_codepoint(c) <= 122) then {
  hint: A comparison relates two values of the same type, and nothing converts one side implicitly — convert one side explicitly (`int.to_string(n)`, `int.parse(s)`, `float.from(n)`, `<type>.from(x)` for a sized width), or compare the parts you mean
   |
30 |           if (string.to_codepoint(c) >= 97 and string.to_codepoint(c) <= 122) then {
   |                                                ^
error[E025]: cannot infer a concrete type for this expression (type List[?3])
  --> /tmp/dojo-caesar-cipher-3.almd:3:31
  in this expression with an unconstrained type
  here: let shifted = codepoints.map(
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |   let shifted = codepoints.map(
  |                               ^
error[E025]: cannot infer a concrete type for this expression (type List[?7])
  --> /tmp/dojo-caesar-cipher-3.almd:26:31
  in this expression with an unconstrained type
  here: let shifted = codepoints.map(
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
26 |   let shifted = codepoints.map(
   |                               ^

27 error(s) found
FAILED: /tmp/dojo-caesar-cipher-3.almd
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
