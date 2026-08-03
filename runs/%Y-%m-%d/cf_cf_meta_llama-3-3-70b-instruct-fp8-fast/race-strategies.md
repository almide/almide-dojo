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
  let sum = ref(0) in
  while sum.get() < n * (n - 1) / 2 do {
    sum.set(sum.get() + sum.get() / n)
  };
  sum.get()

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  } |> option.unwrap_or(-1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-0.almd
error: Expected identifier at line 1:8 (got Fan 'fan')
  --> /tmp/dojo-race-strategies-0.almd:1:8
  |
1 | import fan
  |        ^
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-race-strategies-0.almd:5:37
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
5 |   while sum.get() < n * (n - 1) / 2 do {
  |                                     ^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:3 (got RBrace '}')
  --> /tmp/dojo-race-strategies-0.almd:7:3
  |
7 |   };
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:27 (got LBrace '{')
  --> /tmp/dojo-race-strategies-0.almd:13:27
   |
13 |   fan.race(compute.ms(1)) {
   |                           ^
error[E002]: undefined function 'ref'
  --> /tmp/dojo-race-strategies-0.almd:4:17
  in call to ref()
  hint: Check the function name
  |
4 |   let sum = ref(0)
  |                 ^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-race-strategies-0.almd:13:12
  in variable compute
  hint: Check the variable name
   |
13 |   fan.race(compute.ms(1)) {
   |            ^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-race-strategies-0.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  let rec loop(i: Int, acc: Int) -> Int = 
    if i >= n then acc else loop(i + 1, acc + i)
  in loop(0, 0)

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(fan.compute.ms(1)) {
    exact(n);
    heuristic(n)
  } |> option.unwrap_or(-1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-1.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-race-strategies-1.almd:2:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
2 |   let rec loop(i: Int, acc: Int) -> Int =
  |       ^^^
error: 'loop' is not valid in Almide at line 3:29
  --> /tmp/dojo-race-strategies-1.almd:3:29
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
  |
3 |     if i >= n then acc else loop(i + 1, acc + i)
  |                             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:31 (got LBrace '{')
  --> /tmp/dojo-race-strategies-1.almd:9:31
  |
9 |   fan.race(fan.compute.ms(1)) {
  |                               ^
error[E003]: undefined variable 'fan'
  --> /tmp/dojo-race-strategies-1.almd:9:12
  in variable fan
  hint: Did you mean `n`?
  try:
      // fan  →  n
      n
  |
9 |   fan.race(fan.compute.ms(1)) {
  |            ^^^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-1.almd:2:3
  in fn 'exact'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let rec loop(i: Int, acc: Int) -> Int =
  |   ^^^

5 error(s) found
Compile error for /tmp/dojo-race-strategies-1.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  if n == 0 then 0 else n + exact(n - 1)

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(fan.compute.ms(1)) {
    exact(n);
    heuristic(n)
  } |> option.unwrap_or(-1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:31 (got LBrace '{')
  --> /tmp/dojo-race-strategies-2.almd:7:31
  |
7 |   fan.race(fan.compute.ms(1)) {
  |                               ^
error[E003]: undefined variable 'fan'
  --> /tmp/dojo-race-strategies-2.almd:7:12
  in variable fan
  hint: Did you mean `n`?
  try:
      // fan  →  n
      n
  |
7 |   fan.race(fan.compute.ms(1)) {
  |            ^^^

2 error(s) found
Compile error for /tmp/dojo-race-strategies-2.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  if n == 0 then 0 else n + exact(n - 1)

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  import fan
  fan.race(compute.ms(1)) {
    exact(n)
  } 
  |> option.unwrap_or(-1) 
  |> (x) => x 
  |> ((_) => 
    fan.race(compute.ms(1)) {
      heuristic(n)
    } 
    |> option.unwrap_or(-1)) 
  |> (x) => if x == -1 then -1 else x
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-3.almd
error: Expected expression at line 7:3 (got Import 'import')
  --> /tmp/dojo-race-strategies-3.almd:7:3
  |
7 |   import fan
  |   ^

1 error(s) found
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-3.almd

1/1 test file(s) failed

```
