# string-reverse

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  in string.join(list.reverse(chars), "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error: `let ... in <expr>` is OCaml/Haskell syntax
  --> /tmp/dojo-string-reverse-0.almd:3:3
  in let ... in
  hint: In Almide, multiple lets chain by newlines inside a block — no `in` keyword.
  try:
      let x = 1
      let y = 2
      x + y
  |
3 |   in string.join(list.reverse(chars), "")
  |   ^^
error[E001]: type mismatch in fn 'reverse': expected String but got Unit
  --> /tmp/dojo-string-reverse-0.almd:2:28
  in fn 'reverse'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let chars = ...` (a statement, returns Unit).
      // Add `chars` as the trailing expression so the fn returns String:
      //
      //   let chars = <computation>
      //   chars                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
  |
2 |   let chars = string.chars(s)
  |                            ^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  let reversed = list.reverse(chars)
  in string.join(reversed, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error: `let ... in <expr>` is OCaml/Haskell syntax
  --> /tmp/dojo-string-reverse-1.almd:4:3
  in let ... in
  hint: In Almide, multiple lets chain by newlines inside a block — no `in` keyword.
  try:
      let x = 1
      let y = 2
      x + y
  |
4 |   in string.join(reversed, "")
  |   ^^
error[E001]: type mismatch in fn 'reverse': expected String but got Unit
  --> /tmp/dojo-string-reverse-1.almd:3:31
  in fn 'reverse'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let reversed = ...` (a statement, returns Unit).
      // Add `reversed` as the trailing expression so the fn returns String:
      //
      //   let reversed = <computation>
      //   reversed                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
  |
3 |   let reversed = list.reverse(chars)
  |                               ^^^^^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  let reversed = list.reverse(chars)
  string.join(reversed, "")
```
