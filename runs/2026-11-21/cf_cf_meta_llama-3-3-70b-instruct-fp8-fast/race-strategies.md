# race-strategies

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
import fan

fn exact(n: Int) -> Int = 
  let mut sum = 0
  while sum < n * (n - 1) / 2
  do
    sum = sum + n
  sum

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(compute.ms(1)) { exact(n); heuristic(n) } 
  ?? -1
```

**Diagnostic:**

```
error: 'let mut' is not valid in Almide
  --> /tmp/dojo-race-strategies-0.almd:4:7
  in let mut
  here: let mut sum = 0
  hint: Use 'var' for mutable variables. Example: var x = 0
  try:
      var x = 0
  |
4 |   let mut sum = 0
  |       ^^^
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-race-strategies-0.almd:6:3
  in while body
  here: do
  hint: Almide uses `while cond { ... }` (curly braces). But `while` requires a `var` accumulator — pure/effect fns usually want recursion instead.
  try:
      // Almide `while` needs braces (not `do ... done`):
      var i = 0
      while cond(i) { i = i + 1 }
      
      // For pure fn, prefer recursion over `var` + while:
      fn loop(i: Int, acc: T) -> T =
      if !cond(i) then acc else loop(i + 1, next(acc, i))
  |
6 |   do
  |   ^^
error[E027]: fan.race was renamed to fan.min, and the clock argument is required
  --> /tmp/dojo-race-strategies-0.almd:14:3
  in fan.race
  here: fan.race(compute.ms(1)) { exact(n); heuristic(n) }
  hint: `fan.min(compute.ms(5)) { a(), b() }` picks the branch that spends the LEAST deterministic computation within the budget (ties go to source order); a dynamic list is `fan.min(compute.ms(5), xs, (x) => ok(f(x)))`. The clock says what "least" is measured on. For the first candidate that SUCCEEDS in source order, write `a() ?? b()`.
   |
14 |   fan.race(compute.ms(1)) { exact(n); heuristic(n) }
   |   ^^^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 14:37
  --> /tmp/dojo-race-strategies-0.almd:14:37
  here: fan.race(compute.ms(1)) { exact(n); heuristic(n) }
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
14 |   fan.race(compute.ms(1)) { exact(n); heuristic(n) }
   |                                     ^

4 error(s) found
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
import fan

fn exact(n: Int) -> Int = 
  let rec loop(i: Int, acc: Int) -> Int = 
    if i >= n then acc else loop(i + 1, acc + i)
  loop(0, 0)

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.min(compute.ms(1)) { 
    exact(n), 
    heuristic(n) 
  } ?? -1
```

**Diagnostic:**

```
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-race-strategies-1.almd:4:7
  in let rec
  here: let rec loop(i: Int, acc: Int) -> Int =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
4 |   let rec loop(i: Int, acc: Int) -> Int =
  |       ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-1.almd:5:8
  in variable i
  here: if i >= n then acc else loop(i + 1, acc + i)
  hint: Did you mean `n`?
  try:
      n
  |
5 |     if i >= n then acc else loop(i + 1, acc + i)
  |        ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-race-strategies-1.almd:5:20
  in variable acc
  here: if i >= n then acc else loop(i + 1, acc + i)
  hint: Check the variable name
  |
5 |     if i >= n then acc else loop(i + 1, acc + i)
  |                    ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-1.almd:5:34
  in variable i
  here: if i >= n then acc else loop(i + 1, acc + i)
  hint: Did you mean `n`?
  try:
      n
  |
5 |     if i >= n then acc else loop(i + 1, acc + i)
  |                                  ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-race-strategies-1.almd:5:41
  in variable acc
  here: if i >= n then acc else loop(i + 1, acc + i)
  hint: Check the variable name
  |
5 |     if i >= n then acc else loop(i + 1, acc + i)
  |                                         ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-1.almd:5:47
  in variable i
  here: if i >= n then acc else loop(i + 1, acc + i)
  hint: Did you mean `n`?
  try:
      n
  |
5 |     if i >= n then acc else loop(i + 1, acc + i)
  |                                               ^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-race-strategies-1.almd:5:29
  in call to loop()
  here: if i >= n then acc else loop(i + 1, acc + i)
  hint: Check the function name
  |
5 |     if i >= n then acc else loop(i + 1, acc + i)
  |                             ^^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-race-strategies-1.almd:6:3
  in call to loop()
  here: loop(0, 0)
  hint: Check the function name
  |
6 |   loop(0, 0)
  |   ^^^^

8 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
  parse error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  if n == 0 then 0 else n + exact(n - 1)

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(compute.ms(1)) { 
    exact(n), 
    heuristic(n) 
  } ?? -1
```

**Diagnostic:**

```
error[E027]: fan.race was renamed to fan.min, and the clock argument is required
  --> /tmp/dojo-race-strategies-2.almd:8:3
  in fan.race
  here: fan.race(compute.ms(1)) {
  hint: `fan.min(compute.ms(5)) { a(), b() }` picks the branch that spends the LEAST deterministic computation within the budget (ties go to source order); a dynamic list is `fan.min(compute.ms(5), xs, (x) => ok(f(x)))`. The clock says what "least" is measured on. For the first candidate that SUCCEEDS in source order, write `a() ?? b()`.
  |
8 |   fan.race(compute.ms(1)) {
  |   ^^^

1 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
  parse error: fan.race was renamed to fan.min, and the clock argument is required
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (PASS)

```almide
fn exact(n: Int) -> Int = 
  if n == 0 then 0 else n + exact(n - 1)

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.min(compute.ms(1)) { 
    exact(n), 
    heuristic(n) 
  } ?? -1
```
