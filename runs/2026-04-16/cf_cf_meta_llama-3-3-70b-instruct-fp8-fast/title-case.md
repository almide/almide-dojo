# title-case

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String =
  let parts = string.split(s, " ")
  in string.join(list.map(parts, (word) => string.capitalize(string.to_lower(word))), " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-0.almd
error: `let ... in <expr>` is OCaml/Haskell syntax
  --> /tmp/dojo-title-case-0.almd:3:3
  in let ... in
  hint: In Almide, multiple lets chain by newlines inside a block — no `in` keyword.
  try:
      let x = 1
      let y = 2
      x + y
  |
3 |   in string.join(list.map(parts, (word) => string.capitalize(string.to_lower(word))), " ")
  |   ^^
error[E001]: type mismatch in fn 'title_case': expected String but got Unit
  --> /tmp/dojo-title-case-0.almd:2:31
  in fn 'title_case'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let parts = ...` (a statement, returns Unit).
      // Add `parts` as the trailing expression so the fn returns String:
      //
      //   let parts = <computation>
      //   parts                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
  |
2 |   let parts = string.split(s, " ")
  |                               ^^^

2 error(s) found
Compile error for /tmp/dojo-title-case-0.almd:
compile failed
FAILED: /tmp/dojo-title-case-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn title_case(s: String) -> String =
  let parts = string.split(s, " ")
  let capitalized = list.map(parts, (word) => string.capitalize(string.to_lower(word)))
  in string.join(capitalized, " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-1.almd
error: `let ... in <expr>` is OCaml/Haskell syntax
  --> /tmp/dojo-title-case-1.almd:4:3
  in let ... in
  hint: In Almide, multiple lets chain by newlines inside a block — no `in` keyword.
  try:
      let x = 1
      let y = 2
      x + y
  |
4 |   in string.join(capitalized, " ")
  |   ^^
error[E001]: type mismatch in fn 'title_case': expected String but got Unit
  --> /tmp/dojo-title-case-1.almd:3:81
  in fn 'title_case'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let capitalized = ...` (a statement, returns Unit).
      // Add `capitalized` as the trailing expression so the fn returns String:
      //
      //   let capitalized = <computation>
      //   capitalized                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
  |
3 |   let capitalized = list.map(parts, (word) => string.capitalize(string.to_lower(word)))
  |                                                                                 ^^^^

2 error(s) found
Compile error for /tmp/dojo-title-case-1.almd:
compile failed
FAILED: /tmp/dojo-title-case-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn title_case(s: String) -> String =
  let parts = string.split(s, " ")
  let capitalized = list.map(parts, (word) => string.capitalize(string.to_lower(word)))
  string.join(capitalized, " ")
```
