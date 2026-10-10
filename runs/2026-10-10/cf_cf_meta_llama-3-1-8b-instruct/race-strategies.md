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
  let sum = 0
  while n > 0 {
    sum += n
    n -= 1
  }
  sum
}

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = {
  let start = env.now()
  let result = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  }
  let end = env.now()
  if result.is_empty() {
    -1
  } else {
    result.min_by(|a, b| a.cost() - b.cost()).unwrap().value()
  }
}
```

**Diagnostic:**

```
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
error: fan.race arms are separated by `,` or a newline, not `;`, at line 15:13
  --> /tmp/dojo-race-strategies-0.almd:15:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
15 |     exact(n);
   |             ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 19:3 (got If 'if')
  --> /tmp/dojo-race-strategies-0.almd:19:3
  here: if result.is_empty() {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 |   if result.is_empty() {
   |   ^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-0.almd:13:15
  in variable env
  here: let start = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
13 |   let start = env.now()
   |               ^^^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-0.almd:18:13
  in variable env
  here: let end = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
18 |   let end = env.now()
   |             ^^^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-0.almd:2:13
  in fn 'exact'
  here: let sum = 0
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let sum = 0
  |             ^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-race-strategies-0.almd:13:15
  in this expression with an unconstrained type
  here: let start = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
13 |   let start = env.now()
   |               ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?1)
  --> /tmp/dojo-race-strategies-0.almd:18:13
  in this expression with an unconstrained type
  here: let end = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
18 |   let end = env.now()
   |             ^^^^^^^^^

10 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
Compile error for /tmp/dojo-race-strategies-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let sum = 0
  while n > 0 {
    let tmp = sum
    sum = tmp + n
    n -= 1
  }
  sum
}

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = {
  import env
  let start = env.now()
  let result = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  }
  let end = env.now()
  if result.is_empty() {
    -1
  } else {
    result.min_by(|a, b| a.cost() - b.cost()).unwrap().value()
  }
}
```

**Diagnostic:**

```
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-1.almd:6:8
  in assignment-in-expr
  here: n -= 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
6 |     n -= 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:3 (got Ident 'sum')
  --> /tmp/dojo-race-strategies-1.almd:8:3
  here: sum
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   sum
  |   ^
error: Expected expression at line 14:3 (got Import 'import')
  --> /tmp/dojo-race-strategies-1.almd:14:3
  here: import env
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   import env
   |   ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 17:13
  --> /tmp/dojo-race-strategies-1.almd:17:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
17 |     exact(n);
   |             ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 21:3 (got If 'if')
  --> /tmp/dojo-race-strategies-1.almd:21:3
  here: if result.is_empty() {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   if result.is_empty() {
   |   ^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-1.almd:15:15
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
  --> /tmp/dojo-race-strategies-1.almd:20:13
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
  --> /tmp/dojo-race-strategies-1.almd:2:13
  in fn 'exact'
  here: let sum = 0
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let sum = 0
  |             ^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-race-strategies-1.almd:15:15
  in this expression with an unconstrained type
  here: let start = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
15 |   let start = env.now()
   |               ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?1)
  --> /tmp/dojo-race-strategies-1.almd:20:13
  in this expression with an unconstrained type
  here: let end = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
20 |   let end = env.now()
   |             ^^^^^^^^^

10 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
Compile error for /tmp/dojo-race-strategies-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let sum = 0
  while n > 0 {
    let tmp = sum
    sum = tmp + n
    n = n - 1
  }
  sum
}

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = {
  import env
  let start = env.now()
  let result = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  }
  let end = env.now()
  if result.is_empty() {
    -1
  } else {
    result.min_by(|a, b| a.cost() - b.cost()).unwrap().value()
  }
}
```

**Diagnostic:**

```
error: Expected expression at line 14:3 (got Import 'import')
  --> /tmp/dojo-race-strategies-2.almd:14:3
  here: import env
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   import env
   |   ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 17:13
  --> /tmp/dojo-race-strategies-2.almd:17:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
17 |     exact(n);
   |             ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 21:3 (got If 'if')
  --> /tmp/dojo-race-strategies-2.almd:21:3
  here: if result.is_empty() {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   if result.is_empty() {
   |   ^
error[E009]: cannot reassign immutable binding 'sum'
  --> /tmp/dojo-race-strategies-2.almd:5:17
  in sum = ...
  here: sum = tmp + n
  hint: Use 'var sum = ...' instead of 'let sum = ...' to declare a mutable variable
  try:
      // let sum = ...  →  var sum = ...
      var sum = <initial value>
  |
2 |   let sum = 0
  |   ------------------- 'sum' declared here
...
5 |     sum = tmp + n
  |                 ^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-race-strategies-2.almd:6:13
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
  --> /tmp/dojo-race-strategies-2.almd:15:15
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
  --> /tmp/dojo-race-strategies-2.almd:20:13
  in variable env
  here: let end = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
20 |   let end = env.now()
   |             ^^^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-race-strategies-2.almd:15:15
  in this expression with an unconstrained type
  here: let start = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
15 |   let start = env.now()
   |               ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?1)
  --> /tmp/dojo-race-strategies-2.almd:20:13
  in this expression with an unconstrained type
  here: let end = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
20 |   let end = env.now()
   |             ^^^^^^^^^

9 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
Compile error for /tmp/dojo-race-strategies-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0
  while n > 0 {
    let tmp = sum
    sum = tmp + n
    n = n - 1
  }
  sum
}

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = {
  import env
  let start = env.now()
  let result = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  }
  let end = env.now()
  if result.is_empty() {
    -1
  } else {
    result.min_by(|a, b| a.cost() - b.cost()).unwrap().value()
  }
}
```

**Diagnostic:**

```
error: Expected expression at line 14:3 (got Import 'import')
  --> /tmp/dojo-race-strategies-3.almd:14:3
  here: import env
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   import env
   |   ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 17:13
  --> /tmp/dojo-race-strategies-3.almd:17:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
17 |     exact(n);
   |             ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 21:3 (got If 'if')
  --> /tmp/dojo-race-strategies-3.almd:21:3
  here: if result.is_empty() {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   if result.is_empty() {
   |   ^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-race-strategies-3.almd:6:13
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
  --> /tmp/dojo-race-strategies-3.almd:15:15
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
  --> /tmp/dojo-race-strategies-3.almd:20:13
  in variable env
  here: let end = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
20 |   let end = env.now()
   |             ^^^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-race-strategies-3.almd:15:15
  in this expression with an unconstrained type
  here: let start = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
15 |   let start = env.now()
   |               ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?1)
  --> /tmp/dojo-race-strategies-3.almd:20:13
  in this expression with an unconstrained type
  here: let end = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
20 |   let end = env.now()
   |             ^^^^^^^^^

8 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
