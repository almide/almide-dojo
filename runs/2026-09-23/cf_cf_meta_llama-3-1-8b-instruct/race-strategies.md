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
  let mut sum = 0;
  let i = n - 1;
  while i >= 0 {
    sum += i;
    i -= 1;
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let start = env.now();
  let result = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  let end = env.now();
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
  here: let mut sum = 0;
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
2 |   let mut sum = 0;
  |       ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-0.almd:5:10
  in assignment-in-expr
  here: sum += i;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
5 |     sum += i;
  |          ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-0.almd:6:8
  in assignment-in-expr
  here: i -= 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
6 |     i -= 1;
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:3 (got Ident 'sum')
  --> /tmp/dojo-race-strategies-0.almd:8:3
  here: sum
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   sum
  |   ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 18:13
  --> /tmp/dojo-race-strategies-0.almd:18:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
18 |     exact(n);
   |             ^
error: Semicolons are not used in Almide at line 20:4
  --> /tmp/dojo-race-strategies-0.almd:20:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
20 |   };
   |    ^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-0.almd:16:15
  in variable env
  here: let start = env.now();
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
16 |   let start = env.now();
   |               ^^^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-0.almd:3:15
  in fn 'exact'
  here: let i = n - 1;
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
3 |   let i = n - 1;
  |               ^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-race-strategies-0.almd:16:15
  in this expression with an unconstrained type
  here: let start = env.now();
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
16 |   let start = env.now();
   |               ^^^^^^^^^

9 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
Compile error for /tmp/dojo-race-strategies-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0;
  let i = n - 1;
  while i >= 0 {
    sum = sum + i;
    i = i - 1;
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  import env
  let start = env.now();
  let result = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  let end = env.now();
  if result.is_none() {
    -1
  } else {
    result.unwrap()
  }
}
```

**Diagnostic:**

```
error: Expected expression at line 16:3 (got Import 'import')
  --> /tmp/dojo-race-strategies-1.almd:16:3
  here: import env
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |   import env
   |   ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 19:13
  --> /tmp/dojo-race-strategies-1.almd:19:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
19 |     exact(n);
   |             ^
error: Semicolons are not used in Almide at line 21:4
  --> /tmp/dojo-race-strategies-1.almd:21:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
21 |   };
   |    ^
error[E009]: cannot reassign immutable binding 'i'
  --> /tmp/dojo-race-strategies-1.almd:6:13
  in i = ...
  here: i = i - 1;
  hint: Use 'var i = ...' instead of 'let i = ...' to declare a mutable variable
  try:
      // let i = ...  →  var i = ...
      var i = <initial value>
  |
3 |   let i = n - 1;
  |   ----------------- 'i' declared here
...
6 |     i = i - 1;
  |             ^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-1.almd:17:15
  in variable env
  here: let start = env.now();
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
17 |   let start = env.now();
   |               ^^^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-race-strategies-1.almd:17:15
  in this expression with an unconstrained type
  here: let start = env.now();
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
17 |   let start = env.now();
   |               ^^^^^^^^^

6 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
Compile error for /tmp/dojo-race-strategies-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0;
  var i = n - 1;
  while i >= 0 {
    sum = sum + i;
    i = i - 1;
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  import env, compute, fan
  let start = env.now();
  let result = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  let end = env.now();
  if result.is_none() {
    -1
  } else {
    result.unwrap()
  }
}
```

**Diagnostic:**

```
error: Expected expression at line 16:3 (got Import 'import')
  --> /tmp/dojo-race-strategies-2.almd:16:3
  here: import env, compute, fan
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |   import env, compute, fan
   |   ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 19:13
  --> /tmp/dojo-race-strategies-2.almd:19:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
19 |     exact(n);
   |             ^
error: Semicolons are not used in Almide at line 21:4
  --> /tmp/dojo-race-strategies-2.almd:21:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
21 |   };
   |    ^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-2.almd:17:15
  in variable env
  here: let start = env.now();
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
17 |   let start = env.now();
   |               ^^^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-race-strategies-2.almd:17:15
  in this expression with an unconstrained type
  here: let start = env.now();
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
17 |   let start = env.now();
   |               ^^^^^^^^^

5 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
Compile error for /tmp/dojo-race-strategies-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0;
  var i = n - 1;
  while i >= 0 {
    sum = sum + i;
    i = i - 1;
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  import env, compute, fan
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
error: Expected expression at line 16:3 (got Import 'import')
  --> /tmp/dojo-race-strategies-3.almd:16:3
  here: import env, compute, fan
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |   import env, compute, fan
   |   ^
error: Expected Then at line 23:23 (got LBrace '{')
  --> /tmp/dojo-race-strategies-3.almd:23:23
  here: if result.is_none() {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
23 |   if result.is_none() {
   |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 25:5 (got Else 'else')
  --> /tmp/dojo-race-strategies-3.almd:25:5
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
25 |   } else {
   |     ^
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
error[E041]: implicit propagation of this binding's value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-race-strategies-3.almd:18:16
  in implicit propagation
  here: let result = fan.race(compute.ms(1)) {
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
   |
18 |   let result = fan.race(compute.ms(1)) {
   |                ^^^

8 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
