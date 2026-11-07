# race-strategies

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  let mut sum = 0
  while sum < n * (n - 1) / 2 do
    sum = sum + n - 1
    n = n - 1
  sum

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(compute.ms(1)) { exact(n); heuristic(n) } ?? -1
```

**Diagnostic:**

```
error: 'let mut' is not valid in Almide
  --> /tmp/dojo-race-strategies-0.almd:2:7
  in let mut
  here: let mut sum = 0
  hint: Use 'var' for mutable variables. Example: var x = 0
  try:
      var x = 0
  |
2 |   let mut sum = 0
  |       ^^^
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-race-strategies-0.almd:3:31
  in while body
  here: while sum < n * (n - 1) / 2 do
  hint: Almide uses `while cond { ... }` (curly braces). But `while` requires a `var` accumulator — pure/effect fns usually want recursion instead.
  try:
      // Almide `while` needs braces (not `do ... done`):
      var i = 0
      while cond(i) { i = i + 1 }
      
      // For pure fn, prefer recursion over `var` + while:
      fn loop(i: Int, acc: T) -> T =
      if !cond(i) then acc else loop(i + 1, next(acc, i))
  |
3 |   while sum < n * (n - 1) / 2 do
  |                               ^^
error[E027]: fan.race was renamed to fan.min, and the clock argument is required
  --> /tmp/dojo-race-strategies-0.almd:12:3
  in fan.race
  here: fan.race(compute.ms(1)) { exact(n); heuristic(n) } ?? -1
  hint: `fan.min(compute.ms(5)) { a(), b() }` picks the branch that spends the LEAST deterministic computation within the budget (ties go to source order); a dynamic list is `fan.min(compute.ms(5), xs, (x) => ok(f(x)))`. The clock says what "least" is measured on. For the first candidate that SUCCEEDS in source order, write `a() ?? b()`.
   |
12 |   fan.race(compute.ms(1)) { exact(n); heuristic(n) } ?? -1
   |   ^^^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 12:37
  --> /tmp/dojo-race-strategies-0.almd:12:37
  here: fan.race(compute.ms(1)) { exact(n); heuristic(n) } ?? -1
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
12 |   fan.race(compute.ms(1)) { exact(n); heuristic(n) } ?? -1
   |                                     ^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-race-strategies-0.almd:5:13
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

5 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
  parse error: 'let mut' is not valid in Almide
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
  var sum = 0
  var i = 0
  while i < n do {
    sum = sum + i
    i = i + 1
  }
  sum

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.min(compute.ms(1)) { 
    exact(n)
    heuristic(n)
  } ?? -1
```

**Diagnostic:**

```
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-race-strategies-1.almd:4:15
  in while body
  here: while i < n do {
  hint: Almide uses `while cond { ... }` (curly braces). But `while` requires a `var` accumulator — pure/effect fns usually want recursion instead.
  try:
      // Almide `while` needs braces (not `do ... done`):
      var i = 0
      while cond(i) { i = i + 1 }
      
      // For pure fn, prefer recursion over `var` + while:
      fn loop(i: Int, acc: T) -> T =
      if !cond(i) then acc else loop(i + 1, next(acc, i))
  |
4 |   while i < n do {
  |               ^^
error: this indented line is not part of `fn exact`: a body without braces is a single expression
  --> /tmp/dojo-race-strategies-1.almd:7:3
  in fn body
  here: }
  hint: `fn exact` ends after its first expression (line 6), so line 7 is read as a new top-level declaration. To run several statements, wrap the body in braces:
  try:
      fn exact(n: Int) -> Int = {
        var sum = 0
        var i = 0
        while i < n do {
          sum = sum + i
          i = i + 1
        }
        sum
      }
  |
1 | fn exact(n: Int) -> Int =
  | ------------- declared here
...
7 |   }
  |   ^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-1.almd:6:13
  in fn 'exact'
  here: i = i + 1
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
6 |     i = i + 1
  |             ^

3 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
  parse error: `while ... do ... done` is Pascal/Ruby syntax
  parse error: this indented line is not part of `fn exact`: a body without braces is a single expression
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0
  var i = 0
  while i < n {
    sum = sum + i
    i = i + 1
  }
  sum
}

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(compute.ms(1)) { 
    exact(n)
    heuristic(n)
  } ?? -1
```

**Diagnostic:**

```
error[E027]: fan.race was renamed to fan.min, and the clock argument is required
  --> /tmp/dojo-race-strategies-2.almd:15:3
  in fan.race
  here: fan.race(compute.ms(1)) {
  hint: `fan.min(compute.ms(5)) { a(), b() }` picks the branch that spends the LEAST deterministic computation within the budget (ties go to source order); a dynamic list is `fan.min(compute.ms(5), xs, (x) => ok(f(x)))`. The clock says what "least" is measured on. For the first candidate that SUCCEEDS in source order, write `a() ?? b()`.
   |
15 |   fan.race(compute.ms(1)) {
   |   ^^^

1 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
  parse error: fan.race was renamed to fan.min, and the clock argument is required
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0
  var i = 0
  while i < n {
    sum = sum + i
    i = i + 1
  }
  sum
}

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.min(compute.ms(1), (x) => exact(n), (x) => heuristic(n)) ?? -1
```

**Diagnostic:**

```
error: fan.min mapper must return a Result, got Int
  --> /tmp/dojo-race-strategies-3.almd:15:60
  in fan.min mapper
  here: fan.min(compute.ms(1), (x) => exact(n), (x) => heuristic(n)) ?? -1
  hint: Return ok(value) to compete and err(reason) to disqualify the element — the mapper-form contract (like fan.map)
   |
15 |   fan.min(compute.ms(1), (x) => exact(n), (x) => heuristic(n)) ?? -1
   |                                                            ^
error[E001]: type mismatch in fan.min mapper list: expected fn(?2) -> Int but got List[?6]
  --> /tmp/dojo-race-strategies-3.almd:15:39
  in fan.min mapper list
  here: fan.min(compute.ms(1), (x) => exact(n), (x) => heuristic(n)) ?? -1
  hint: Fix the expression type or change the expected type
   |
15 |   fan.min(compute.ms(1), (x) => exact(n), (x) => heuristic(n)) ?? -1
   |                                       ^
error[E001]: type mismatch in fan.min mapper: expected fn(?6) -> Int but got fn(?6) -> Result[Int, String]
  --> /tmp/dojo-race-strategies-3.almd:15:60
  in fan.min mapper
  here: fan.min(compute.ms(1), (x) => exact(n), (x) => heuristic(n)) ?? -1
  hint: Fix the expression type or change the expected type
   |
15 |   fan.min(compute.ms(1), (x) => exact(n), (x) => heuristic(n)) ?? -1
   |                                                            ^

3 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
