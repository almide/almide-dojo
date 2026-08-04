# race-strategies

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
import fan

fn exact(n: Int) -> Int = 
  let mut sum = 0
  while sum < n * (n - 1) / 2 do
    sum = sum + n
  sum

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(compute.ms(1)) { exact(n); heuristic(n) } 
  |> option.unwrap_or(-1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-0.almd
error: Expected identifier at line 1:8 (got Fan 'fan')
  --> /tmp/dojo-race-strategies-0.almd:1:8
  |
1 | import fan
  |        ^
error: 'let mut' is not valid in Almide at line 4:7
  --> /tmp/dojo-race-strategies-0.almd:4:7
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
4 |   let mut sum = 0
  |       ^
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-race-strategies-0.almd:5:31
  in while body
  hint: Almide uses `while cond { ... }` (curly braces). But `while` requires a `var` accumulator — pure/effect fns usually want recursion instead.
  try:
      // Almide `while` needs braces (not `do ... done`):
      var i = 0
      while cond(i) { i = i + 1 }
      
      // For pure fn, prefer recursion over `var` + while:
      fn loop(i: Int, acc: T) -> T =
      if !cond(i) then acc else loop(i + 1, next(acc, i))
  |
5 |   while sum < n * (n - 1) / 2 do
  |                               ^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:27 (got LBrace '{')
  --> /tmp/dojo-race-strategies-0.almd:13:27
   |
13 |   fan.race(compute.ms(1)) { exact(n); heuristic(n) }
   |                           ^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-race-strategies-0.almd:6:11
  in variable sum
  hint: Check the variable name
  |
6 |     sum = sum + n
  |           ^^^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-race-strategies-0.almd:7:3
  in variable sum
  hint: Check the variable name
  |
7 |   sum
  |   ^^^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-race-strategies-0.almd:13:12
  in variable compute
  hint: Check the variable name
   |
13 |   fan.race(compute.ms(1)) { exact(n); heuristic(n) }
   |            ^^^^^^^

7 error(s) found
Compile error for /tmp/dojo-race-strategies-0.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  let sum = 0
  let i = 0
  let rec loop(i: Int, sum: Int) -> Int = 
    if i >= n then sum else loop(i + 1, sum + i)
  loop(i, sum)

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(fan.compute.ms(1)) { exact(n); heuristic(n) } 
  |> option.unwrap_or(-1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-1.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-race-strategies-1.almd:4:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
4 |   let rec loop(i: Int, sum: Int) -> Int =
  |       ^^^
error: 'loop' is not valid in Almide at line 5:29
  --> /tmp/dojo-race-strategies-1.almd:5:29
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
  |
5 |     if i >= n then sum else loop(i + 1, sum + i)
  |                             ^
error: 'loop' is not valid in Almide at line 6:3
  --> /tmp/dojo-race-strategies-1.almd:6:3
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
  |
6 |   loop(i, sum)
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:31 (got LBrace '{')
  --> /tmp/dojo-race-strategies-1.almd:12:31
   |
12 |   fan.race(fan.compute.ms(1)) { exact(n); heuristic(n) }
   |                               ^
error[E003]: undefined variable 'fan'
  --> /tmp/dojo-race-strategies-1.almd:12:12
  in variable fan
  hint: Did you mean `n`?
  try:
      // fan  →  n
      n
   |
12 |   fan.race(fan.compute.ms(1)) { exact(n); heuristic(n) }
   |            ^^^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-1.almd:3:11
  in fn 'exact'
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

6 error(s) found
Compile error for /tmp/dojo-race-strategies-1.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  let sum = 0
  let i = 0
  if i >= n then sum 
  else exact(n - 1) + i

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  import fan
  fan.race(fan.compute.ms(1)) { exact(n); heuristic(n) } 
  |> option.unwrap_or(-1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-2.almd
error: Expected expression at line 11:3 (got Import 'import')
  --> /tmp/dojo-race-strategies-2.almd:11:3
   |
11 |   import fan
   |   ^

1 error(s) found
Compile error for /tmp/dojo-race-strategies-2.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  let sum = 0
  let i = 0
  if i >= n then sum 
  else exact(n - 1) + i

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(fan.compute.ms(1)) { exact(n); heuristic(n) } 
  |> option.unwrap_or(-1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:31 (got LBrace '{')
  --> /tmp/dojo-race-strategies-3.almd:11:31
   |
11 |   fan.race(fan.compute.ms(1)) { exact(n); heuristic(n) }
   |                               ^
error[E003]: undefined variable 'fan'
  --> /tmp/dojo-race-strategies-3.almd:11:12
  in variable fan
  hint: Did you mean `n`?
  try:
      // fan  →  n
      n
   |
11 |   fan.race(fan.compute.ms(1)) { exact(n); heuristic(n) }
   |            ^^^

2 error(s) found
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-3.almd

1/1 test file(s) failed

```
