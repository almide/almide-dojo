# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = n.abs() / 10 in 
  (n.abs() % 10) + digits
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: `let ... in <expr>` is OCaml/Haskell syntax
  --> /tmp/dojo-sum-digits-0.almd:2:29
  in let ... in
  hint: In Almide, multiple lets chain by newlines inside a block — no `in` keyword.
  try:
      let x = 1
      let y = 2
      x + y
  |
2 |   let digits = n.abs() / 10 in
  |                             ^^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Unit
  --> /tmp/dojo-sum-digits-0.almd:2:26
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let digits = ...` (a statement, returns Unit).
      // Add `digits` as the trailing expression so the fn returns Int:
      //
      //   let digits = <computation>
      //   digits                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
  |
2 |   let digits = n.abs() / 10 in
  |                          ^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = n.abs() / 10 in 
  (n.abs() % 10) + digits
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: `let ... in <expr>` is OCaml/Haskell syntax
  --> /tmp/dojo-sum-digits-1.almd:2:29
  in let ... in
  hint: In Almide, multiple lets chain by newlines inside a block — no `in` keyword.
  try:
      let x = 1
      let y = 2
      x + y
  |
2 |   let digits = n.abs() / 10 in
  |                             ^^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Unit
  --> /tmp/dojo-sum-digits-1.almd:2:26
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let digits = ...` (a statement, returns Unit).
      // Add `digits` as the trailing expression so the fn returns Int:
      //
      //   let digits = <computation>
      //   digits                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
  |
2 |   let digits = n.abs() / 10 in
  |                          ^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = n.abs() / 10 in 
  (n.abs() % 10) + digits
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: `let ... in <expr>` is OCaml/Haskell syntax
  --> /tmp/dojo-sum-digits-2.almd:2:29
  in let ... in
  hint: In Almide, multiple lets chain by newlines inside a block — no `in` keyword.
  try:
      let x = 1
      let y = 2
      x + y
  |
2 |   let digits = n.abs() / 10 in
  |                             ^^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Unit
  --> /tmp/dojo-sum-digits-2.almd:2:26
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let digits = ...` (a statement, returns Unit).
      // Add `digits` as the trailing expression so the fn returns Int:
      //
      //   let digits = <computation>
      //   digits                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
  |
2 |   let digits = n.abs() / 10 in
  |                          ^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = Pvt 
  let digits = n.abs() / 10 
  digits + (n.abs() % 10)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 3:3 (got Ident 'digits')
  --> /tmp/dojo-sum-digits-3.almd:3:3
  |
3 |   digits + (n.abs() % 10)
  |   ^
error[E003]: undefined variable 'n'
  --> /tmp/dojo-sum-digits-3.almd:2:16
  in variable n
  hint: Check the variable name
  |
2 |   let digits = n.abs() / 10
  |                ^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Pvt
  --> /tmp/dojo-sum-digits-3.almd:1:32
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  |
1 | fn sum_digits(n: Int) -> Int = Pvt
  |                                ^^^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
