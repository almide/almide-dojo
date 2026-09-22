# race-strategies

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
import fan

fn exact(n: Int) -> Int = 
  let sum = ref 0 in
  while sum.get < n * (n - 1) / 2 do {
    sum.set(sum.get + sum.get / n)
  };
  sum.get

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

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
  here: let sum = ref 0 in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |   let sum = ref 0 in
  |                   ^
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-race-strategies-0.almd:5:35
  in while body
  here: while sum.get < n * (n - 1) / 2 do {
  hint: Almide uses `while cond { ... }` (curly braces). But `while` requires a `var` accumulator — pure/effect fns usually want recursion instead.
  try:
      // Almide `while` needs braces (not `do ... done`):
      var i = 0
      while cond(i) { i = i + 1 }
      
      // For pure fn, prefer recursion over `var` + while:
      fn loop(i: Int, acc: T) -> T =
      if !cond(i) then acc else loop(i + 1, next(acc, i))
  |
5 |   while sum.get < n * (n - 1) / 2 do {
  |                                   ^^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:3 (got RBrace '}')
  --> /tmp/dojo-race-strategies-0.almd:7:3
  here: };
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |   };
  |   ^
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
  here: let sum = ref 0 in
  hint: Check the variable name
  |
4 |   let sum = ref 0 in
  |             ^^^

6 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
Compile error for /tmp/dojo-race-strategies-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  let sum = 0 in
  let rec loop(i: Int, acc: Int) -> Int =
    if i < n then loop(i + 1, acc + i) else acc
  in loop(0, sum)

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

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
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-race-strategies-1.almd:5:3
  here: in loop(0, sum)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |   in loop(0, sum)
  |   ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-1.almd:4:8
  in variable i
  here: if i < n then loop(i + 1, acc + i) else acc
  hint: Did you mean `n`?
  try:
      n
  |
4 |     if i < n then loop(i + 1, acc + i) else acc
  |        ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-1.almd:4:24
  in variable i
  here: if i < n then loop(i + 1, acc + i) else acc
  hint: Did you mean `n`?
  try:
      n
  |
4 |     if i < n then loop(i + 1, acc + i) else acc
  |                        ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-race-strategies-1.almd:4:31
  in variable acc
  here: if i < n then loop(i + 1, acc + i) else acc
  hint: Check the variable name
  |
4 |     if i < n then loop(i + 1, acc + i) else acc
  |                               ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-1.almd:4:37
  in variable i
  here: if i < n then loop(i + 1, acc + i) else acc
  hint: Did you mean `n`?
  try:
      n
  |
4 |     if i < n then loop(i + 1, acc + i) else acc
  |                                     ^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-race-strategies-1.almd:4:37
  in call to loop()
  here: if i < n then loop(i + 1, acc + i) else acc
  hint: Check the function name
  |
4 |     if i < n then loop(i + 1, acc + i) else acc
  |                                     ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-race-strategies-1.almd:4:45
  in variable acc
  here: if i < n then loop(i + 1, acc + i) else acc
  hint: Check the variable name
  |
4 |     if i < n then loop(i + 1, acc + i) else acc
  |                                             ^^^
error[E005]: argument 'o' expects Option[A] but got Result[Int, String]
  --> /tmp/dojo-race-strategies-1.almd:14:24
  in call to option.unwrap_or()
  here: |> option.unwrap_or(-1)
  hint: the argument is a Result[Int, String] — unwrap it first: `!` propagates the error (effect fn body), `?? fallback` supplies a default, or `match` handles ok/err
   |
20 | test "race zero" {
   | ---------------------------------- fn option.unwrap_or() defined here
...
14 |   |> option.unwrap_or(-1)
   |                        ^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-1.almd:4:45
  in fn 'exact'
  here: if i < n then loop(i + 1, acc + i) else acc
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
4 |     if i < n then loop(i + 1, acc + i) else acc
  |                                             ^^^

10 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
Compile error for /tmp/dojo-race-strategies-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  let rec loop(i: Int, acc: Int) -> Int =
    if i < n then loop(i + 1, acc + i) else acc
  in loop(0, 0)

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

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
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-race-strategies-2.almd:2:7
  in let rec
  here: let rec loop(i: Int, acc: Int) -> Int =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
2 |   let rec loop(i: Int, acc: Int) -> Int =
  |       ^^^
error: Expected expression at line 4:3 (got In 'in')
  --> /tmp/dojo-race-strategies-2.almd:4:3
  here: in loop(0, 0)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |   in loop(0, 0)
  |   ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-2.almd:3:8
  in variable i
  here: if i < n then loop(i + 1, acc + i) else acc
  hint: Did you mean `n`?
  try:
      n
  |
3 |     if i < n then loop(i + 1, acc + i) else acc
  |        ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-2.almd:3:24
  in variable i
  here: if i < n then loop(i + 1, acc + i) else acc
  hint: Did you mean `n`?
  try:
      n
  |
3 |     if i < n then loop(i + 1, acc + i) else acc
  |                        ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-race-strategies-2.almd:3:31
  in variable acc
  here: if i < n then loop(i + 1, acc + i) else acc
  hint: Check the variable name
  |
3 |     if i < n then loop(i + 1, acc + i) else acc
  |                               ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-2.almd:3:37
  in variable i
  here: if i < n then loop(i + 1, acc + i) else acc
  hint: Did you mean `n`?
  try:
      n
  |
3 |     if i < n then loop(i + 1, acc + i) else acc
  |                                     ^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-race-strategies-2.almd:3:37
  in call to loop()
  here: if i < n then loop(i + 1, acc + i) else acc
  hint: Check the function name
  |
3 |     if i < n then loop(i + 1, acc + i) else acc
  |                                     ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-race-strategies-2.almd:3:45
  in variable acc
  here: if i < n then loop(i + 1, acc + i) else acc
  hint: Check the variable name
  |
3 |     if i < n then loop(i + 1, acc + i) else acc
  |                                             ^^^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-2.almd:3:45
  in fn 'exact'
  here: if i < n then loop(i + 1, acc + i) else acc
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
3 |     if i < n then loop(i + 1, acc + i) else acc
  |                                             ^^^

9 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
Compile error for /tmp/dojo-race-strategies-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  if n == 0 then 0 else n + exact(n - 1)

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

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
FAILED: /tmp/dojo-race-strategies-3.almd
Compile error for /tmp/dojo-race-strategies-3.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
