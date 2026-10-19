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
  while acc < n {
    acc = acc + 1
  }
  acc
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

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
    result.min_by(|a, b| a.cost() - b.cost()).unwrap()
  }
}
```

**Diagnostic:**

```
error: fan.race arms are separated by `,` or a newline, not `;`, at line 16:13
  --> /tmp/dojo-race-strategies-0.almd:16:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
16 |     exact(n);
   |             ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 20:3 (got If 'if')
  --> /tmp/dojo-race-strategies-0.almd:20:3
  here: if result.is_empty() {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |   if result.is_empty() {
   |   ^
error[E009]: cannot reassign immutable binding 'acc'
  --> /tmp/dojo-race-strategies-0.almd:4:17
  in acc = ...
  here: acc = acc + 1
  hint: Use 'var acc = ...' instead of 'let acc = ...' to declare a mutable variable
  try:
      // let acc = ...  →  var acc = ...
      var acc = <initial value>
  |
2 |   let acc = 0
  |   ------------------- 'acc' declared here
...
4 |     acc = acc + 1
  |                 ^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-0.almd:14:15
  in variable env
  here: let start = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
14 |   let start = env.now()
   |               ^^^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-0.almd:19:13
  in variable env
  here: let end = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
19 |   let end = env.now()
   |             ^^^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-race-strategies-0.almd:14:15
  in this expression with an unconstrained type
  here: let start = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
14 |   let start = env.now()
   |               ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?1)
  --> /tmp/dojo-race-strategies-0.almd:19:13
  in this expression with an unconstrained type
  here: let end = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
19 |   let end = env.now()
   |             ^^^^^^^^^

7 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
Compile error for /tmp/dojo-race-strategies-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var acc = 0
  while acc < n {
    acc = acc + 1
  }
  acc
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

import env

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
    result.min_by(|a, b| a.cost() - b.cost()).unwrap()
  }
}
```

**Diagnostic:**

```
error: Unexpected token at top level at line 13:1
  --> /tmp/dojo-race-strategies-1.almd:13:1
  here: import env
  hint: All imports must come before other declarations.
   |
13 | import env
   | ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 18:13
  --> /tmp/dojo-race-strategies-1.almd:18:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
18 |     exact(n);
   |             ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 22:3 (got If 'if')
  --> /tmp/dojo-race-strategies-1.almd:22:3
  here: if result.is_empty() {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |   if result.is_empty() {
   |   ^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-1.almd:16:15
  in variable env
  here: let start = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
16 |   let start = env.now()
   |               ^^^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-1.almd:21:13
  in variable env
  here: let end = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
21 |   let end = env.now()
   |             ^^^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-race-strategies-1.almd:16:15
  in this expression with an unconstrained type
  here: let start = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
16 |   let start = env.now()
   |               ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?1)
  --> /tmp/dojo-race-strategies-1.almd:21:13
  in this expression with an unconstrained type
  here: let end = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
21 |   let end = env.now()
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
  var acc = 0
  while acc < n {
    acc = acc + 1
  }
  acc
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

import env

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
    result.min_by(|a, b| a.cost() - b.cost()).unwrap()
  }
}
```

**Diagnostic:**

```
error: Unexpected token at top level at line 13:1
  --> /tmp/dojo-race-strategies-2.almd:13:1
  here: import env
  hint: All imports must come before other declarations.
   |
13 | import env
   | ^
error: Expected expression at line 16:3 (got Import 'import')
  --> /tmp/dojo-race-strategies-2.almd:16:3
  here: import env
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |   import env
   |   ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 19:13
  --> /tmp/dojo-race-strategies-2.almd:19:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
19 |     exact(n);
   |             ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 23:3 (got If 'if')
  --> /tmp/dojo-race-strategies-2.almd:23:3
  here: if result.is_empty() {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
23 |   if result.is_empty() {
   |   ^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-2.almd:17:15
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
  --> /tmp/dojo-race-strategies-2.almd:22:13
  in variable env
  here: let end = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
22 |   let end = env.now()
   |             ^^^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-race-strategies-2.almd:17:15
  in this expression with an unconstrained type
  here: let start = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
17 |   let start = env.now()
   |               ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?1)
  --> /tmp/dojo-race-strategies-2.almd:22:13
  in this expression with an unconstrained type
  here: let end = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
22 |   let end = env.now()
   |             ^^^^^^^^^

8 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
Compile error for /tmp/dojo-race-strategies-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var acc = 0
  while acc < n {
    acc = acc + 1
  }
  acc
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

import env

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
    result.min_by(|a, b| a.cost() - b.cost()).unwrap()
  }
}

import env

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
    result.min_by(|a, b| a.cost() - b.cost()).unwrap()
  }
}
```

**Diagnostic:**

```
error: Unexpected token at top level at line 13:1
  --> /tmp/dojo-race-strategies-3.almd:13:1
  here: import env
  hint: All imports must come before other declarations.
   |
13 | import env
   | ^
error: Expected expression at line 16:3 (got Import 'import')
  --> /tmp/dojo-race-strategies-3.almd:16:3
  here: import env
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |   import env
   |   ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 19:13
  --> /tmp/dojo-race-strategies-3.almd:19:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
19 |     exact(n);
   |             ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 23:3 (got If 'if')
  --> /tmp/dojo-race-strategies-3.almd:23:3
  here: if result.is_empty() {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
23 |   if result.is_empty() {
   |   ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 35:13
  --> /tmp/dojo-race-strategies-3.almd:35:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
35 |     exact(n);
   |             ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 39:3 (got If 'if')
  --> /tmp/dojo-race-strategies-3.almd:39:3
  here: if result.is_empty() {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
39 |   if result.is_empty() {
   |   ^
error[E012]: duplicate function 'best_effort'
  at line 32
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
15 | effect fn best_effort(n: Int) -> Int = {
   | -------------------------------------- first definition of 'best_effort' here
...
32 | effect fn best_effort(n: Int) -> Int = {
   | ^
error[E012]: duplicate top-level binding 'end'
  at line 38
  in let end
  here: let end = env.now()
  hint: 'end' is already declared at module scope — rename one, or merge the two initializers
   |
22 |   let end = env.now()
   |   ------------------------- 'end' first declared here
...
38 |   let end = env.now()
   |   ^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-3.almd:17:15
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
  --> /tmp/dojo-race-strategies-3.almd:22:13
  in variable env
  here: let end = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
22 |   let end = env.now()
   |             ^^^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-3.almd:33:15
  in variable env
  here: let start = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
33 |   let start = env.now()
   |               ^^^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-3.almd:38:13
  in variable env
  here: let end = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
38 |   let end = env.now()
   |             ^^^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-race-strategies-3.almd:17:15
  in this expression with an unconstrained type
  here: let start = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
17 |   let start = env.now()
   |               ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?1)
  --> /tmp/dojo-race-strategies-3.almd:22:13
  in this expression with an unconstrained type
  here: let end = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
22 |   let end = env.now()
   |             ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?2)
  --> /tmp/dojo-race-strategies-3.almd:33:15
  in this expression with an unconstrained type
  here: let start = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
33 |   let start = env.now()
   |               ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?3)
  --> /tmp/dojo-race-strategies-3.almd:38:13
  in this expression with an unconstrained type
  here: let end = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
38 |   let end = env.now()
   |             ^^^^^^^^^

16 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
