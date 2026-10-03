# budget-units

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  var result = count_to(n)
  if budget == compute.empty() then result else -1
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
error: unknown unit 'compute.empty'
  --> /tmp/dojo-budget-units-0.almd:4:16
  in call to compute.empty()
  here: if budget == compute.empty() then result else -1
  hint: The unit set is closed: compute.ns / us / ms / s / min / h
  |
4 |   if budget == compute.empty() then result else -1
  |                ^^^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-budget-units-0.almd
Compile error for /tmp/dojo-budget-units-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  var result = count_to(n)
  if budget == compute.ns(0) then result else -1
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
FAILED: /tmp/dojo-budget-units-1.almd
  test: budget admits small work
  at:   /tmp/dojo-budget-units-1.almd:16
  expected: Ok(4950)
  found:    Ok(-1)
  test: microseconds alone admit tiny work
  at:   /tmp/dojo-budget-units-1.almd:20
  expected: Ok(45)
  found:    Ok(-1)
  test: zero budget still admits constant work
  at:   /tmp/dojo-budget-units-1.almd:24
  expected: Ok(0)
  found:    Ok(-1)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  var start_time = env.now()
  var result = count_to(n)
  var end_time = env.now()
  if end_time - start_time <= budget then result else -1
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
error[E003]: undefined variable 'env'
  --> /tmp/dojo-budget-units-2.almd:3:20
  in variable env
  here: var start_time = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
  |
3 |   var start_time = env.now()
  |                    ^^^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-budget-units-2.almd:5:18
  in variable env
  here: var end_time = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
  |
5 |   var end_time = env.now()
  |                  ^^^
error: cannot compare ?1 with Compute — both sides must be Compute
  --> /tmp/dojo-budget-units-2.almd:6:31
  in operator <=
  here: if end_time - start_time <= budget then result else -1
  hint: A bare number is never a time — wrap it: compute.ms(n)
  |
6 |   if end_time - start_time <= budget then result else -1
  |                               ^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-budget-units-2.almd:3:20
  in this expression with an unconstrained type
  here: var start_time = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |   var start_time = env.now()
  |                    ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?1)
  --> /tmp/dojo-budget-units-2.almd:5:18
  in this expression with an unconstrained type
  here: var end_time = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |   var end_time = env.now()
  |                  ^^^^^^^^^

5 error(s) found
FAILED: /tmp/dojo-budget-units-2.almd
Compile error for /tmp/dojo-budget-units-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  import env
  var budget = compute.ms(ms) + compute.us(us)
  var start_time = env.now()
  var result = count_to(n)
  var end_time = env.now()
  if (end_time - start_time) <= budget then result else -1
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
error: Expected expression at line 2:3 (got Import 'import')
  --> /tmp/dojo-budget-units-3.almd:2:3
  here: import env
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   import env
  |   ^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-budget-units-3.almd:4:20
  in variable env
  here: var start_time = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
  |
4 |   var start_time = env.now()
  |                    ^^^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-budget-units-3.almd:6:18
  in variable env
  here: var end_time = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
  |
6 |   var end_time = env.now()
  |                  ^^^
error: cannot compare ?1 with Compute — both sides must be Compute
  --> /tmp/dojo-budget-units-3.almd:7:33
  in operator <=
  here: if (end_time - start_time) <= budget then result else -1
  hint: A bare number is never a time — wrap it: compute.ms(n)
  |
7 |   if (end_time - start_time) <= budget then result else -1
  |                                 ^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-budget-units-3.almd:4:20
  in this expression with an unconstrained type
  here: var start_time = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
4 |   var start_time = env.now()
  |                    ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?1)
  --> /tmp/dojo-budget-units-3.almd:6:18
  in this expression with an unconstrained type
  here: var end_time = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
6 |   var end_time = env.now()
  |                  ^^^^^^^^^

6 error(s) found
FAILED: /tmp/dojo-budget-units-3.almd
Compile error for /tmp/dojo-budget-units-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
