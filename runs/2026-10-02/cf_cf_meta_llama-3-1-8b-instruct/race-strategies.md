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
  let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n) }
  let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
  if exact_cost <= heuristic_cost {
    exact_result
  } else if heuristic_cost <= exact_cost {
    heuristic_result
  } else {
    -1
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
error: Expected Then at line 17:35 (got LBrace '{')
  --> /tmp/dojo-race-strategies-0.almd:17:35
  here: if exact_cost <= heuristic_cost {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
17 |   if exact_cost <= heuristic_cost {
   |                                   ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 19:5 (got Else 'else')
  --> /tmp/dojo-race-strategies-0.almd:19:5
  here: } else if heuristic_cost <= exact_cost {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 |   } else if heuristic_cost <= exact_cost {
   |     ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-0.almd:15:68
  in tuple destructure
  here: let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
15 |   let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n) }
   |                                                                    ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-0.almd:16:80
  in tuple destructure
  here: let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
16 |   let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
   |                                                                                ^
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

8 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
Compile error for /tmp/dojo-race-strategies-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let acc = 0
  let r = while n > 0 {
    acc += n
    n -= 1
  }
  r
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_cost, exact_result) = fan.race(compute.ms(1)) { let r = exact(n); r }
  let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { let r = heuristic(n); r }
  if exact_cost <= heuristic_cost {
    exact_result
  } else if heuristic_cost <= exact_cost {
    heuristic_result
  } else {
    -1
  }
}
```

**Diagnostic:**

```
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-1.almd:4:10
  in assignment-in-expr
  here: acc += n
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
4 |     acc += n
  |          ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-1.almd:5:8
  in assignment-in-expr
  here: n -= 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
5 |     n -= 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:3 (got Ident 'r')
  --> /tmp/dojo-race-strategies-1.almd:7:3
  here: r
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |   r
  |   ^
error: `let` is not allowed inside fan.race at line 15:62
  --> /tmp/dojo-race-strategies-1.almd:15:62
  here: let (exact_cost, exact_result) = fan.race(compute.ms(1)) { let r = exact(n); r }
  hint: race arms are expressions — wrap statements in a block arm: { let x = f(); g(x) }
   |
15 |   let (exact_cost, exact_result) = fan.race(compute.ms(1)) { let r = exact(n); r }
   |                                                              ^
error: Expected name at line 16:7 (got LParen '(')
  --> /tmp/dojo-race-strategies-1.almd:16:7
  here: let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { let r = heuristic(n); r }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |   let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { let r = heuristic(n); r }
   |       ^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-1.almd:2:13
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

6 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
Compile error for /tmp/dojo-race-strategies-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let acc = 0
  let r = while n > 0 {
    acc = acc + n
    n = n - 1
  }
  acc
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n) }
  let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
  if exact_cost <= heuristic_cost {
    exact_result
  } else if heuristic_cost <= exact_cost {
    heuristic_result
  } else {
    -1
  }
}
```

**Diagnostic:**

```
error: Expected Then at line 17:35 (got LBrace '{')
  --> /tmp/dojo-race-strategies-2.almd:17:35
  here: if exact_cost <= heuristic_cost {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
17 |   if exact_cost <= heuristic_cost {
   |                                   ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 19:5 (got Else 'else')
  --> /tmp/dojo-race-strategies-2.almd:19:5
  here: } else if heuristic_cost <= exact_cost {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 |   } else if heuristic_cost <= exact_cost {
   |     ^
error[E009]: cannot reassign immutable binding 'acc'
  --> /tmp/dojo-race-strategies-2.almd:4:17
  in acc = ...
  here: acc = acc + n
  hint: Use 'var acc = ...' instead of 'let acc = ...' to declare a mutable variable
  try:
      // let acc = ...  →  var acc = ...
      var acc = <initial value>
  |
2 |   let acc = 0
  |   ------------------- 'acc' declared here
...
4 |     acc = acc + n
  |                 ^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-race-strategies-2.almd:5:13
  in n = ...
  here: n = n - 1
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
  |
5 |     n = n - 1
  |             ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-2.almd:15:68
  in tuple destructure
  here: let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
15 |   let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n) }
   |                                                                    ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-2.almd:16:80
  in tuple destructure
  here: let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
16 |   let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
   |                                                                                ^

6 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
Compile error for /tmp/dojo-race-strategies-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var acc = 0
  var n_ = n
  while n_ > 0 {
    acc = acc + n_
    n_ = n_ - 1
  }
  acc
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n).cost() }
  let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).cost() }
  if exact_cost <= heuristic_cost {
    exact_result
  } else if heuristic_cost <= exact_cost {
    heuristic_result
  } else {
    -1
  }
}

trait Cost {
  fn cost(): Int
}

effect fn compute(ms: Int) -> fn() -> Int = {
  let start = env.now()
  fn() -> Int = {
    let end = env.now()
    if end - start > ms {
      -1
    } else {
      end - start
    }
  }
}

impl Cost for Int {
  fn cost(): Int = 0
}

impl Cost for Result[Int, String] {
  fn cost(): Int = 0
}
```

**Diagnostic:**

```
error: Expected Then at line 18:35 (got LBrace '{')
  --> /tmp/dojo-race-strategies-3.almd:18:35
  here: if exact_cost <= heuristic_cost {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
18 |   if exact_cost <= heuristic_cost {
   |                                   ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 20:5 (got Else 'else')
  --> /tmp/dojo-race-strategies-3.almd:20:5
  here: } else if heuristic_cost <= exact_cost {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |   } else if heuristic_cost <= exact_cost {
   |     ^
error: Expected Arrow at line 28:12 (got Colon ':')
  --> /tmp/dojo-race-strategies-3.almd:28:12
  here: fn cost(): Int
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
28 |   fn cost(): Int
   |            ^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-race-strategies-3.almd:33:3
  in nested fn
  here: fn() -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
   |
33 |   fn() -> Int = {
   |   ^^
error: Expected Then at line 35:25 (got LBrace '{')
  --> /tmp/dojo-race-strategies-3.almd:35:25
  here: if end - start > ms {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
35 |     if end - start > ms {
   |                         ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 37:7 (got Else 'else')
  --> /tmp/dojo-race-strategies-3.almd:37:7
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
37 |     } else {
   |       ^
error: Expected Arrow at line 44:12 (got Colon ':')
  --> /tmp/dojo-race-strategies-3.almd:44:12
  here: fn cost(): Int = 0
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
44 |   fn cost(): Int = 0
   |            ^
error: Expected Arrow at line 48:12 (got Colon ':')
  --> /tmp/dojo-race-strategies-3.almd:48:12
  here: fn cost(): Int = 0
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
48 |   fn cost(): Int = 0
   |            ^
error[E002]: undefined method 'cost' on int
  --> /tmp/dojo-race-strategies-3.almd:16:62
  in method call .cost()
  here: let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n).cost() }
  hint: Almide doesn't use method-call syntax. Write `int.<fn>(x)` (or `x |> int.<fn>`) — there is no method `cost` on `int`. Run `almide explain E002` for examples.
   |
16 |   let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n).cost() }
   |                                                              ^^^^^^^^^^^^^^^
error[E001]: tuple pattern requires a tuple value, got Result[Unknown, String]
  --> /tmp/dojo-race-strategies-3.almd:16:68
  in tuple destructure
  here: let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n).cost() }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
16 |   let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n).cost() }
   |                                                                    ^
error[E002]: undefined method 'cost' on int
  --> /tmp/dojo-race-strategies-3.almd:17:70
  in method call .cost()
  here: let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).cost() }
  hint: Almide doesn't use method-call syntax. Write `int.<fn>(x)` (or `x |> int.<fn>`) — there is no method `cost` on `int`. Run `almide explain E002` for examples.
   |
17 |   let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).cost() }
   |                                                                      ^^^^^^^^^^^^^^^^^^^
error[E001]: tuple pattern requires a tuple value, got Result[Unknown, String]
  --> /tmp/dojo-race-strategies-3.almd:17:80
  in tuple destructure
  here: let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).cost() }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
17 |   let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).cost() }
   |                                                                                ^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-3.almd:32:15
  in variable env
  here: let start = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
32 |   let start = env.now()
   |               ^^^
error[E003]: undefined variable 'env'
  --> /tmp/dojo-race-strategies-3.almd:34:15
  in variable env
  here: let end = env.now()
  hint: Add `import env` (stdlib: environment variables)
Or run `almide fmt` to auto-add missing imports
  try:
      import env
   |
34 |     let end = env.now()
   |               ^^^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-race-strategies-3.almd:32:15
  in this expression with an unconstrained type
  here: let start = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
32 |   let start = env.now()
   |               ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?1)
  --> /tmp/dojo-race-strategies-3.almd:34:15
  in this expression with an unconstrained type
  here: let end = env.now()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
34 |     let end = env.now()
   |               ^^^^^^^^^

16 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
