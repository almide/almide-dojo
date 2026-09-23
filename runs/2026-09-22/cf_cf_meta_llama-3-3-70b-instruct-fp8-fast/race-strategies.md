# race-strategies

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E009`

## Attempts

### Attempt 1 (FAIL)

```almide
import fan

fn exact(n: Int) -> Int = 
  let acc = ref 0 in
  while acc.get() < n do
    acc.set(acc.get() + acc.get())
  acc.get()

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(compute.ms(1)) { exact(n); heuristic(n) } 
  |> option.unwrap_or(-1)
```

**Diagnostic:**

```
error: 'fan' is auto-available — it is a built-in surface, not a module, at line 1:8
  --> /tmp/dojo-race-strategies-0.almd:1:8
  here: import fan
  hint: Remove the `import fan` line; fan.bounded / fan.race / fan.timeout are always in scope
  |
1 | import fan
  |        ^
error: Expected expression at line 4:19 (got In 'in')
  --> /tmp/dojo-race-strategies-0.almd:4:19
  here: let acc = ref 0 in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |   let acc = ref 0 in
  |                   ^
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-race-strategies-0.almd:5:23
  in while body
  here: while acc.get() < n do
  hint: Almide uses `while cond { ... }` (curly braces). But `while` requires a `var` accumulator — pure/effect fns usually want recursion instead.
  try:
      // Almide `while` needs braces (not `do ... done`):
      var i = 0
      while cond(i) { i = i + 1 }
      
      // For pure fn, prefer recursion over `var` + while:
      fn loop(i: Int, acc: T) -> T =
      if !cond(i) then acc else loop(i + 1, next(acc, i))
  |
5 |   while acc.get() < n do
  |                       ^^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 13:37
  --> /tmp/dojo-race-strategies-0.almd:13:37
  here: fan.race(compute.ms(1)) { exact(n); heuristic(n) }
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
13 |   fan.race(compute.ms(1)) { exact(n); heuristic(n) }
   |                                     ^
error[E003]: undefined variable 'ref'
  --> /tmp/dojo-race-strategies-0.almd:4:13
  in variable ref
  here: let acc = ref 0 in
  hint: Check the variable name
  |
4 |   let acc = ref 0 in
  |             ^^^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-race-strategies-0.almd:6:13
  in this expression with an unconstrained type
  here: acc.set(acc.get() + acc.get())
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
6 |     acc.set(acc.get() + acc.get())
  |             ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?1)
  --> /tmp/dojo-race-strategies-0.almd:6:25
  in this expression with an unconstrained type
  here: acc.set(acc.get() + acc.get())
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
6 |     acc.set(acc.get() + acc.get())
  |                         ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?2)
  --> /tmp/dojo-race-strategies-0.almd:6:5
  in this expression with an unconstrained type
  here: acc.set(acc.get() + acc.get())
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
6 |     acc.set(acc.get() + acc.get())
  |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

8 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
Compile error for /tmp/dojo-race-strategies-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  let acc = 0 in
  let rec loop(i: Int, acc: Int) -> Int =
    if i >= n then acc else loop(i + 1, acc + i)
  loop(0, acc)

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(compute.ms(1)) { 
    exact(n), 
    heuristic(n) 
  } 
  |> option.unwrap_or(-1)
```

**Diagnostic:**

```
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-race-strategies-1.almd:3:7
  in let rec
  here: let rec loop(i: Int, acc: Int) -> Int =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
3 |   let rec loop(i: Int, acc: Int) -> Int =
  |       ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-1.almd:4:8
  in variable i
  here: if i >= n then acc else loop(i + 1, acc + i)
  hint: Did you mean `n`?
  try:
      n
  |
4 |     if i >= n then acc else loop(i + 1, acc + i)
  |        ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-1.almd:4:34
  in variable i
  here: if i >= n then acc else loop(i + 1, acc + i)
  hint: Did you mean `n`?
  try:
      n
  |
4 |     if i >= n then acc else loop(i + 1, acc + i)
  |                                  ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-1.almd:4:47
  in variable i
  here: if i >= n then acc else loop(i + 1, acc + i)
  hint: Did you mean `n`?
  try:
      n
  |
4 |     if i >= n then acc else loop(i + 1, acc + i)
  |                                               ^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-race-strategies-1.almd:4:47
  in call to loop()
  here: if i >= n then acc else loop(i + 1, acc + i)
  hint: Check the function name
  |
4 |     if i >= n then acc else loop(i + 1, acc + i)
  |                                               ^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-race-strategies-1.almd:5:11
  in call to loop()
  here: loop(0, acc)
  hint: Check the function name
  |
5 |   loop(0, acc)
  |           ^^^
error[E005]: argument 'o' expects Option[A] but got Result[Int, String]
  --> /tmp/dojo-race-strategies-1.almd:15:24
  in call to option.unwrap_or()
  here: |> option.unwrap_or(-1)
  hint: the argument is a Result[Int, String] — unwrap it first: `!` propagates the error (effect fn body), `?? fallback` supplies a default, or `match` handles ok/err
   |
20 | }
   | ---------------------------------- fn option.unwrap_or() defined here
...
15 |   |> option.unwrap_or(-1)
   |                        ^

7 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
Compile error for /tmp/dojo-race-strategies-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  let acc = 0 in
  if acc >= n then acc 
  else exact(n - 1) + (n - 1)

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(compute.ms(1)) { 
    exact(n), 
    heuristic(n) 
  } 
  |> result.to_option 
  |> option.unwrap_or(-1)
```

**Diagnostic:**

```
FAILED: /tmp/dojo-race-strategies-2.almd
Compile error for /tmp/dojo-race-strategies-2.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  let acc = 0 in
  let i = 0 in
  while i < n {
    acc = acc + i
    i = i + 1
  }
  acc

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(compute.ms(1)) { 
    exact(n), 
    heuristic(n) 
  } 
  |> result.to_option 
  |> option.unwrap_or(-1)
```

**Diagnostic:**

```
error[E009]: cannot reassign immutable binding 'acc'
  --> /tmp/dojo-race-strategies-3.almd:5:17
  in acc = ...
  here: acc = acc + i
  hint: Use 'var acc = ...' instead of 'let acc = ...' to declare a mutable variable
  try:
      // let acc = ...  →  var acc = ...
      var acc = <initial value>
  |
2 |   let acc = 0
  |   ------------------- 'acc' declared here
...
5 |     acc = acc + i
  |                 ^
error[E009]: cannot reassign immutable binding 'i'
  --> /tmp/dojo-race-strategies-3.almd:6:13
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
6 |     i = i + 1
  |             ^

2 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
