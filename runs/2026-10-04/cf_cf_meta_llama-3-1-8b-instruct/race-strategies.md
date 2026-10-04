# race-strategies

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let mut sum = 0
  while n > 0 {
    sum += n
    n -= 1
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let start = env.now()
  let result = fan.race(compute.ms(1)) {
    exact(n)
    heuristic(n)
  }
  let end = env.now()
  if result.is_none() {
    -1
  } else {
    result.unwrap()
  }
}
```

**Diagnostic:**

```
error: 'let mut' is not valid in Almide at line 2:7
  --> /tmp/dojo-race-strategies-0.almd:2:7
  here: let mut sum = 0
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
2 |   let mut sum = 0
  |       ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-0.almd:4:10
  in assignment-in-expr
  here: sum += n
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
4 |     sum += n
  |          ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-0.almd:5:8
  in assignment-in-expr
  here: n -= 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
5 |     n -= 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:3 (got Ident 'sum')
  --> /tmp/dojo-race-strategies-0.almd:7:3
  here: sum
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |   sum
  |   ^
error: Expected Then at line 21:23 (got LBrace '{')
  --> /tmp/dojo-race-strategies-0.almd:21:23
  here: if result.is_none() {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
21 |   if result.is_none() {
   |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 23:5 (got Else 'else')
  --> /tmp/dojo-race-strategies-0.almd:23:5
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
23 |   } else {
   |     ^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-0.almd:15:15
  in variable env
  here: let start = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
15 |   let start = env.now()
   |               ^^^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-0.almd:20:13
  in variable env
  here: let end = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
20 |   let end = env.now()
   |             ^^^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-0.almd:1:27
  in fn 'exact'
  here: fn exact(n: Int) -> Int = {
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
1 | fn exact(n: Int) -> Int = {
  |                           ^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-race-strategies-0.almd:15:15
  in this expression with an unconstrained type
  here: let start = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
15 |   let start = env.now()
   |               ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?1)
  --> /tmp/dojo-race-strategies-0.almd:20:13
  in this expression with an unconstrained type
  here: let end = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
20 |   let end = env.now()
   |             ^^^^^^^^^
error[E041]: implicit propagation of this binding's value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-race-strategies-0.almd:16:16
  in implicit propagation
  here: let result = fan.race(compute.ms(1)) {
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
   |
16 |   let result = fan.race(compute.ms(1)) {
   |                ^^^

12 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
Compile error for /tmp/dojo-race-strategies-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0
  while n > 0 {
    let r = sum
    sum = sum + n
    n = n - 1
    r
  }
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

import env

effect fn best_effort(n: Int) -> Int = {
  let start = env.now()
  let result = fan.race(compute.ms(1)) {
    exact(n)
    heuristic(n)
  } ?? -1
  let end = env.now()
  result
}
```

**Diagnostic:**

```
error: Unexpected token at top level at line 15:1
  --> /tmp/dojo-race-strategies-1.almd:15:1
  here: import env
  hint: All imports must come before other declarations.
   |
15 | import env
   | ^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-race-strategies-1.almd:6:13
  in n = ...
  here: n = n - 1
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
  |
6 |     n = n - 1
  |             ^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-1.almd:18:15
  in variable env
  here: let start = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
18 |   let start = env.now()
   |               ^^^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-1.almd:23:13
  in variable env
  here: let end = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
23 |   let end = env.now()
   |             ^^^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-1.almd:7:5
  in fn 'exact'
  here: r
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
7 |     r
  |     ^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-race-strategies-1.almd:18:15
  in this expression with an unconstrained type
  here: let start = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
18 |   let start = env.now()
   |               ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?1)
  --> /tmp/dojo-race-strategies-1.almd:23:13
  in this expression with an unconstrained type
  here: let end = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
23 |   let end = env.now()
   |             ^^^^^^^^^

7 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
Compile error for /tmp/dojo-race-strategies-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0
  var n_ = n
  while n_ > 0 {
    let r = sum
    sum = sum + n_
    n_ = n_ - 1
    r
  }
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

import env

effect fn best_effort(n: Int) -> Int = {
  import env
  let start = env.now()
  let result = fan.race(compute.ms(1)) {
    exact(n)
    heuristic(n)
  } ?? -1
  let end = env.now()
  result
}
```

**Diagnostic:**

```
error: Unexpected token at top level at line 16:1
  --> /tmp/dojo-race-strategies-2.almd:16:1
  here: import env
  hint: All imports must come before other declarations.
   |
16 | import env
   | ^
error: Expected expression at line 19:3 (got Import 'import')
  --> /tmp/dojo-race-strategies-2.almd:19:3
  here: import env
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 |   import env
   |   ^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-2.almd:20:15
  in variable env
  here: let start = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
20 |   let start = env.now()
   |               ^^^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-2.almd:25:13
  in variable env
  here: let end = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
25 |   let end = env.now()
   |             ^^^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-2.almd:8:5
  in fn 'exact'
  here: r
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
8 |     r
  |     ^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-race-strategies-2.almd:20:15
  in this expression with an unconstrained type
  here: let start = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
20 |   let start = env.now()
   |               ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?1)
  --> /tmp/dojo-race-strategies-2.almd:25:13
  in this expression with an unconstrained type
  here: let end = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
25 |   let end = env.now()
   |             ^^^^^^^^^

7 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
Compile error for /tmp/dojo-race-strategies-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0
  var n_ = n
  while n_ > 0 {
    let r = sum
    sum = sum + n_
    n_ = n_ - 1
    r
  }
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

import env

effect fn best_effort(n: Int) -> Int = {
  import env
  let start = env.now()
  let result = fan.race(compute.ms(1)) {
    exact(n)
    heuristic(n)
  } ?? -1
  let end = env.now()
  result
}
```

**Diagnostic:**

```
error: Unexpected token at top level at line 16:1
  --> /tmp/dojo-race-strategies-3.almd:16:1
  here: import env
  hint: All imports must come before other declarations.
   |
16 | import env
   | ^
error: Expected expression at line 19:3 (got Import 'import')
  --> /tmp/dojo-race-strategies-3.almd:19:3
  here: import env
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 |   import env
   |   ^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-3.almd:20:15
  in variable env
  here: let start = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
20 |   let start = env.now()
   |               ^^^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-3.almd:25:13
  in variable env
  here: let end = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
25 |   let end = env.now()
   |             ^^^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-3.almd:8:5
  in fn 'exact'
  here: r
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
8 |     r
  |     ^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-race-strategies-3.almd:20:15
  in this expression with an unconstrained type
  here: let start = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
20 |   let start = env.now()
   |               ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?1)
  --> /tmp/dojo-race-strategies-3.almd:25:13
  in this expression with an unconstrained type
  here: let end = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
25 |   let end = env.now()
   |             ^^^^^^^^^

7 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
