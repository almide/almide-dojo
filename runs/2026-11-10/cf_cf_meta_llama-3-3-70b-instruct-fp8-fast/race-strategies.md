# race-strategies

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
import fan

fn exact(n: Int) -> Int = 
  let acc = ref 0 in
  while acc.get < n do
    acc.set(acc.get + acc.get)
  acc.get

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(compute.ms(1)) { exact(n); heuristic(n) } 
  ?? -1
```

**Diagnostic:**

```
error: Expected expression at line 4:19 (got In 'in')
  --> /tmp/dojo-race-strategies-0.almd:4:19
  here: let acc = ref 0 in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |   let acc = ref 0 in
  |                   ^
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-race-strategies-0.almd:5:21
  in while body
  here: while acc.get < n do
  hint: Almide uses `while cond { ... }` (curly braces). But `while` requires a `var` accumulator — pure/effect fns usually want recursion instead.
  try:
      // Almide `while` needs braces (not `do ... done`):
      var i = 0
      while cond(i) { i = i + 1 }
      
      // For pure fn, prefer recursion over `var` + while:
      fn loop(i: Int, acc: T) -> T =
      if !cond(i) then acc else loop(i + 1, next(acc, i))
  |
5 |   while acc.get < n do
  |                     ^^
error[E027]: fan.race was renamed to fan.min, and the clock argument is required
  --> /tmp/dojo-race-strategies-0.almd:13:3
  in fan.race
  here: fan.race(compute.ms(1)) { exact(n); heuristic(n) }
  hint: `fan.min(compute.ms(5)) { a(), b() }` picks the branch that spends the LEAST deterministic computation within the budget (ties go to source order); a dynamic list is `fan.min(compute.ms(5), xs, (x) => ok(f(x)))`. The clock says what "least" is measured on. For the first candidate that SUCCEEDS in source order, write `a() ?? b()`.
   |
13 |   fan.race(compute.ms(1)) { exact(n); heuristic(n) }
   |   ^^^
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
  --> /tmp/dojo-race-strategies-0.almd:6:5
  in this expression with an unconstrained type
  here: acc.set(acc.get + acc.get)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
6 |     acc.set(acc.get + acc.get)
  |     ^^^^^^^^^^^^^^^^^^^^^^^^^^

6 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
  parse error: Expected expression at line 4:19 (got In 'in')
  parse error: `while ... do ... done` is Pascal/Ruby syntax
  parse error: fan.race was renamed to fan.min, and the clock argument is required
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
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
  in loop(0, 0)

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.min(compute.ms(1)) { exact(n), heuristic(n) } 
  ?? -1
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
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-race-strategies-1.almd:5:3
  here: in loop(0, 0)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |   in loop(0, 0)
  |   ^
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
  --> /tmp/dojo-race-strategies-1.almd:4:29
  in call to loop()
  here: if i >= n then acc else loop(i + 1, acc + i)
  hint: Check the function name
  |
4 |     if i >= n then acc else loop(i + 1, acc + i)
  |                             ^^^^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-1.almd:4:47
  in fn 'exact'
  here: if i >= n then acc else loop(i + 1, acc + i)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
4 |     if i >= n then acc else loop(i + 1, acc + i)
  |                                               ^

7 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
  parse error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  parse error: Expected expression at line 5:3 (got In 'in')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  let acc = 0 in
  if acc >= n then acc else exact(n - 1) + (n - 1)

fn exact_corrected(n: Int) -> Int = 
  let rec loop(i: Int, acc: Int) = 
    if i >= n then acc else loop(i + 1, acc + i)
  in 
  loop(0, 0)

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(compute.ms(1)) { exact(n), heuristic(n) } 
  ?? -1
```

**Diagnostic:**

```
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-race-strategies-2.almd:6:7
  in let rec
  here: let rec loop(i: Int, acc: Int) =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
6 |   let rec loop(i: Int, acc: Int) =
  |       ^^^
error: Expected expression at line 8:3 (got In 'in')
  --> /tmp/dojo-race-strategies-2.almd:8:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   in
  |   ^
error[E027]: fan.race was renamed to fan.min, and the clock argument is required
  --> /tmp/dojo-race-strategies-2.almd:15:3
  in fan.race
  here: fan.race(compute.ms(1)) { exact(n), heuristic(n) }
  hint: `fan.min(compute.ms(5)) { a(), b() }` picks the branch that spends the LEAST deterministic computation within the budget (ties go to source order); a dynamic list is `fan.min(compute.ms(5), xs, (x) => ok(f(x)))`. The clock says what "least" is measured on. For the first candidate that SUCCEEDS in source order, write `a() ?? b()`.
   |
15 |   fan.race(compute.ms(1)) { exact(n), heuristic(n) }
   |   ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-2.almd:7:8
  in variable i
  here: if i >= n then acc else loop(i + 1, acc + i)
  hint: Did you mean `n`?
  try:
      n
  |
7 |     if i >= n then acc else loop(i + 1, acc + i)
  |        ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-race-strategies-2.almd:7:20
  in variable acc
  here: if i >= n then acc else loop(i + 1, acc + i)
  hint: Check the variable name
  |
7 |     if i >= n then acc else loop(i + 1, acc + i)
  |                    ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-2.almd:7:34
  in variable i
  here: if i >= n then acc else loop(i + 1, acc + i)
  hint: Did you mean `n`?
  try:
      n
  |
7 |     if i >= n then acc else loop(i + 1, acc + i)
  |                                  ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-race-strategies-2.almd:7:41
  in variable acc
  here: if i >= n then acc else loop(i + 1, acc + i)
  hint: Check the variable name
  |
7 |     if i >= n then acc else loop(i + 1, acc + i)
  |                                         ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-2.almd:7:47
  in variable i
  here: if i >= n then acc else loop(i + 1, acc + i)
  hint: Did you mean `n`?
  try:
      n
  |
7 |     if i >= n then acc else loop(i + 1, acc + i)
  |                                               ^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-race-strategies-2.almd:7:29
  in call to loop()
  here: if i >= n then acc else loop(i + 1, acc + i)
  hint: Check the function name
  |
7 |     if i >= n then acc else loop(i + 1, acc + i)
  |                             ^^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-race-strategies-2.almd:9:3
  in call to loop()
  here: loop(0, 0)
  hint: Check the function name
  |
9 |   loop(0, 0)
  |   ^^^^

10 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
  parse error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  parse error: Expected expression at line 8:3 (got In 'in')
  parse error: fan.race was renamed to fan.min, and the clock argument is required
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  if n == 0 then 0 else n + exact(n - 1)

fn exact_corrected(n: Int) -> Int = 
  fn loop(i: Int, acc: Int) -> Int = 
    if i > n then acc else loop(i + 1, acc + i)
  loop(0, 0)

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.min(compute.ms(1)) { exact(n), heuristic(n) } 
  ?? -1
```

**Diagnostic:**

```
error: Expected expression at line 5:3 (got Fn 'fn')
  --> /tmp/dojo-race-strategies-3.almd:5:3
  here: fn loop(i: Int, acc: Int) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |   fn loop(i: Int, acc: Int) -> Int =
  |   ^
error: 'loop' cannot appear at the top level at line 7:3
  --> /tmp/dojo-race-strategies-3.almd:7:3
  here: loop(0, 0)
  hint: Almide has no top-level loops. Define a function with 'fn' or 'effect fn'.
  |
7 |   loop(0, 0)
  |   ^
error[E003]: undefined variable 'n'
  --> /tmp/dojo-race-strategies-3.almd:6:12
  in variable n
  here: if i > n then acc else loop(i + 1, acc + i)
  hint: Did you mean `i`?
  try:
      i
  |
6 |     if i > n then acc else loop(i + 1, acc + i)
  |            ^

3 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
  parse error: Expected expression at line 5:3 (got Fn 'fn')
  parse error: 'loop' cannot appear at the top level at line 7:3
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
