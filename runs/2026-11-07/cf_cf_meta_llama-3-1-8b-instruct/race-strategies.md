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
  let acc = 0
  while n > 0 {
    acc += n
    n -= 1
  }
  acc
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
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-0.almd:4:10
  in assignment-in-expr
  here: acc += n
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
4 |     acc += n
  |          ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-0.almd:5:8
  in assignment-in-expr
  here: n -= 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
5 |     n -= 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:3 (got Ident 'acc')
  --> /tmp/dojo-race-strategies-0.almd:7:3
  here: acc
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |   acc
  |   ^
error[E027]: fan.race was renamed to fan.min, and the clock argument is required
  --> /tmp/dojo-race-strategies-0.almd:16:16
  in fan.race
  here: let result = fan.race(compute.ms(1)) {
  hint: `fan.min(compute.ms(5)) { a(), b() }` picks the branch that spends the LEAST deterministic computation within the budget (ties go to source order); a dynamic list is `fan.min(compute.ms(5), xs, (x) => ok(f(x)))`. The clock says what "least" is measured on. For the first candidate that SUCCEEDS in source order, write `a() ?? b()`.
   |
16 |   let result = fan.race(compute.ms(1)) {
   |                ^^^
error: if requires 'then', not a brace block
  --> /tmp/dojo-race-strategies-0.almd:21:23
  in if
  here: if result.is_none() {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
21 |   if result.is_none() {
   |                       ^
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
error[E002]: undefined method 'is_none' on int
  --> /tmp/dojo-race-strategies-0.almd:21:6
  in method call .is_none()
  here: if result.is_none() {
  hint: `result` here is your local binding, not the `result` module — a local wins over a module of the same name in member position too. So this asks for a method `is_none` on the local's type (int), and there is none. Rename the binding, then call `result.is_none(..)` on it
   |
16 |   let result = fan.race(compute.ms(1)) {
   | ------------------- `result` bound here
...
21 |   if result.is_none() {
   |      ^^^^^^^^^^^^^^^^
error[E002]: undefined method 'unwrap' on int
  --> /tmp/dojo-race-strategies-0.almd:24:5
  in method call .unwrap()
  here: result.unwrap()
  hint: `result` here is your local binding, not the `result` module — a local wins over a module of the same name in member position too. So this asks for a method `unwrap` on the local's type (int), and there is none. Rename the binding, then call `result.unwrap(..)` on it
   |
16 |   let result = fan.race(compute.ms(1)) {
   | ------------------- `result` bound here
...
24 |     result.unwrap()
   |     ^^^^^^^^^^^^^^^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-0.almd:2:13
  in fn 'exact'
  here: let acc = 0
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let acc = 0
  |             ^
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

13 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
  parse error: Assignments return Unit and can't appear here
  parse error: Assignments return Unit and can't appear here
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:3 (got Ident 'acc')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let acc = 0
  let i = 0
  while i < n {
    acc += i
    i += 1
  }
  acc
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  import env
  let start = env.now()
  let result = fan.min(compute.ms(1)) {
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
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-1.almd:5:10
  in assignment-in-expr
  here: acc += i
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
5 |     acc += i
  |          ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-1.almd:6:8
  in assignment-in-expr
  here: i += 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
6 |     i += 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:3 (got Ident 'acc')
  --> /tmp/dojo-race-strategies-1.almd:8:3
  here: acc
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   acc
  |   ^
error: Expected expression at line 16:3 (got Import 'import')
  --> /tmp/dojo-race-strategies-1.almd:16:3
  here: import env
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |   import env
   |   ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-race-strategies-1.almd:23:23
  in if
  here: if result.is_none() {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
23 |   if result.is_none() {
   |                       ^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-1.almd:17:15
  in variable env
  here: let start = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
17 |   let start = env.now()
   |               ^^^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-1.almd:22:13
  in variable env
  here: let end = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
22 |   let end = env.now()
   |             ^^^
error[E002]: undefined method 'is_none' on int
  --> /tmp/dojo-race-strategies-1.almd:23:6
  in method call .is_none()
  here: if result.is_none() {
  hint: `result` here is your local binding, not the `result` module — a local wins over a module of the same name in member position too. So this asks for a method `is_none` on the local's type (int), and there is none. Rename the binding, then call `result.is_none(..)` on it
   |
18 |   let result = fan.min(compute.ms(1)) {
   | ------------------- `result` bound here
...
23 |   if result.is_none() {
   |      ^^^^^^^^^^^^^^^^
error[E002]: undefined method 'unwrap' on int
  --> /tmp/dojo-race-strategies-1.almd:26:5
  in method call .unwrap()
  here: result.unwrap()
  hint: `result` here is your local binding, not the `result` module — a local wins over a module of the same name in member position too. So this asks for a method `unwrap` on the local's type (int), and there is none. Rename the binding, then call `result.unwrap(..)` on it
   |
18 |   let result = fan.min(compute.ms(1)) {
   | ------------------- `result` bound here
...
26 |     result.unwrap()
   |     ^^^^^^^^^^^^^^^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-1.almd:3:11
  in fn 'exact'
  here: let i = 0
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
3 |   let i = 0
  |           ^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-race-strategies-1.almd:17:15
  in this expression with an unconstrained type
  here: let start = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
17 |   let start = env.now()
   |               ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?1)
  --> /tmp/dojo-race-strategies-1.almd:22:13
  in this expression with an unconstrained type
  here: let end = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
22 |   let end = env.now()
   |             ^^^^^^^^^
error[E041]: implicit propagation of this binding's value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-race-strategies-1.almd:18:16
  in implicit propagation
  here: let result = fan.min(compute.ms(1)) {
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
   |
18 |   let result = fan.min(compute.ms(1)) {
   |                ^^^

13 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
  parse error: Assignments return Unit and can't appear here
  parse error: Assignments return Unit and can't appear here
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:3 (got Ident 'acc')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let acc = 0
  let i = 0
  while i < n {
    let tmp = acc + i
    acc = tmp
    i += 1
  }
  acc
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  import env
  let start = env.now()
  let result = fan.min(compute.ms(1)) {
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
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-2.almd:7:8
  in assignment-in-expr
  here: i += 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |     i += 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:3 (got Ident 'acc')
  --> /tmp/dojo-race-strategies-2.almd:9:3
  here: acc
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |   acc
  |   ^
error: Expected expression at line 17:3 (got Import 'import')
  --> /tmp/dojo-race-strategies-2.almd:17:3
  here: import env
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   import env
   |   ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-race-strategies-2.almd:24:23
  in if
  here: if result.is_none() {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
24 |   if result.is_none() {
   |                       ^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-2.almd:18:15
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
  --> /tmp/dojo-race-strategies-2.almd:23:13
  in variable env
  here: let end = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
23 |   let end = env.now()
   |             ^^^
error[E002]: undefined method 'is_none' on int
  --> /tmp/dojo-race-strategies-2.almd:24:6
  in method call .is_none()
  here: if result.is_none() {
  hint: `result` here is your local binding, not the `result` module — a local wins over a module of the same name in member position too. So this asks for a method `is_none` on the local's type (int), and there is none. Rename the binding, then call `result.is_none(..)` on it
   |
19 |   let result = fan.min(compute.ms(1)) {
   | ------------------- `result` bound here
...
24 |   if result.is_none() {
   |      ^^^^^^^^^^^^^^^^
error[E002]: undefined method 'unwrap' on int
  --> /tmp/dojo-race-strategies-2.almd:27:5
  in method call .unwrap()
  here: result.unwrap()
  hint: `result` here is your local binding, not the `result` module — a local wins over a module of the same name in member position too. So this asks for a method `unwrap` on the local's type (int), and there is none. Rename the binding, then call `result.unwrap(..)` on it
   |
19 |   let result = fan.min(compute.ms(1)) {
   | ------------------- `result` bound here
...
27 |     result.unwrap()
   |     ^^^^^^^^^^^^^^^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-2.almd:3:11
  in fn 'exact'
  here: let i = 0
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
3 |   let i = 0
  |           ^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-race-strategies-2.almd:18:15
  in this expression with an unconstrained type
  here: let start = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
18 |   let start = env.now()
   |               ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?1)
  --> /tmp/dojo-race-strategies-2.almd:23:13
  in this expression with an unconstrained type
  here: let end = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
23 |   let end = env.now()
   |             ^^^^^^^^^
error[E041]: implicit propagation of this binding's value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-race-strategies-2.almd:19:16
  in implicit propagation
  here: let result = fan.min(compute.ms(1)) {
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
   |
19 |   let result = fan.min(compute.ms(1)) {
   |                ^^^

12 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
  parse error: Assignments return Unit and can't appear here
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:3 (got Ident 'acc')
  parse error: Expected expression at line 17:3 (got Import 'import')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let acc = 0
  let i = 0
  while i < n {
    let tmp = acc + i
    acc = tmp
    i = i + 1
  }
  acc
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  import env
  let start = env.now()
  let result = fan.min(compute.ms(1)) {
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
error: Expected expression at line 17:3 (got Import 'import')
  --> /tmp/dojo-race-strategies-3.almd:17:3
  here: import env
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   import env
   |   ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-race-strategies-3.almd:24:23
  in if
  here: if result.is_none() {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
24 |   if result.is_none() {
   |                       ^
error[E009]: cannot reassign immutable binding 'acc'
  --> /tmp/dojo-race-strategies-3.almd:6:11
  in acc = ...
  here: acc = tmp
  hint: Use 'var acc = ...' instead of 'let acc = ...' to declare a mutable variable
  try:
      // let acc = ...  →  var acc = ...
      var acc = <initial value>
  |
2 |   let acc = 0
  |   ------------------- 'acc' declared here
...
6 |     acc = tmp
  |           ^^^
error[E009]: cannot reassign immutable binding 'i'
  --> /tmp/dojo-race-strategies-3.almd:7:13
  in i = ...
  here: i = i + 1
  hint: Use 'var i = ...' instead of 'let i = ...' to declare a mutable variable
  try:
      // let i = ...  →  var i = ...
      var i = <initial value>
  |
3 |   let i = 0
  |   ----------------- 'i' declared here
...
7 |     i = i + 1
  |             ^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-3.almd:18:15
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
  --> /tmp/dojo-race-strategies-3.almd:23:13
  in variable env
  here: let end = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
23 |   let end = env.now()
   |             ^^^
error[E002]: undefined method 'is_none' on int
  --> /tmp/dojo-race-strategies-3.almd:24:6
  in method call .is_none()
  here: if result.is_none() {
  hint: `result` here is your local binding, not the `result` module — a local wins over a module of the same name in member position too. So this asks for a method `is_none` on the local's type (int), and there is none. Rename the binding, then call `result.is_none(..)` on it
   |
19 |   let result = fan.min(compute.ms(1)) {
   | ------------------- `result` bound here
...
24 |   if result.is_none() {
   |      ^^^^^^^^^^^^^^^^
error[E002]: undefined method 'unwrap' on int
  --> /tmp/dojo-race-strategies-3.almd:27:5
  in method call .unwrap()
  here: result.unwrap()
  hint: `result` here is your local binding, not the `result` module — a local wins over a module of the same name in member position too. So this asks for a method `unwrap` on the local's type (int), and there is none. Rename the binding, then call `result.unwrap(..)` on it
   |
19 |   let result = fan.min(compute.ms(1)) {
   | ------------------- `result` bound here
...
27 |     result.unwrap()
   |     ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-race-strategies-3.almd:18:15
  in this expression with an unconstrained type
  here: let start = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
18 |   let start = env.now()
   |               ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?1)
  --> /tmp/dojo-race-strategies-3.almd:23:13
  in this expression with an unconstrained type
  here: let end = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
23 |   let end = env.now()
   |             ^^^^^^^^^
error[E041]: implicit propagation of this binding's value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-race-strategies-3.almd:19:16
  in implicit propagation
  here: let result = fan.min(compute.ms(1)) {
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
   |
19 |   let result = fan.min(compute.ms(1)) {
   |                ^^^

11 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
  parse error: Expected expression at line 17:3 (got Import 'import')
  parse error: if requires 'then', not a brace block
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
