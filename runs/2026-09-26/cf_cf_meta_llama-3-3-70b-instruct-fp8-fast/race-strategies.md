# race-strategies

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
import fan

fn exact(n: Int) -> Int = 
  let acc = ref 0 in
  while acc^ < n do
    acc := acc^ + acc^
  acc^

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(compute.ms(1)) { exact(n); heuristic(n) } 
  |> option.unwrap_or(-1)
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
error: Expected expression at line 5:14 (got LAngle '<')
  --> /tmp/dojo-race-strategies-0.almd:5:14
  here: while acc^ < n do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |   while acc^ < n do
  |              ^
error: Expected expression at line 6:9 (got Colon ':')
  --> /tmp/dojo-race-strategies-0.almd:6:9
  here: acc := acc^ + acc^
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
6 |     acc := acc^ + acc^
  |         ^
error: Expected expression at line 9:1 (got Fn 'fn')
  --> /tmp/dojo-race-strategies-0.almd:9:1
  here: fn heuristic(n: Int) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 | fn heuristic(n: Int) -> Int =
  | ^
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

6 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
Compile error for /tmp/dojo-race-strategies-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
import fan

fn exact(n: Int) -> Int = 
  let acc = 0 in
  let i = 0 in
  while i < n do
    acc + i
  end
  |> (x) => x

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
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-race-strategies-1.almd:6:15
  in while body
  here: while i < n do
  hint: Almide uses `while cond { ... }` (curly braces). But `while` requires a `var` accumulator — pure/effect fns usually want recursion instead.
  try:
      // Almide `while` needs braces (not `do ... done`):
      var i = 0
      while cond(i) { i = i + 1 }
      
      // For pure fn, prefer recursion over `var` + while:
      fn loop(i: Int, acc: T) -> T =
      if !cond(i) then acc else loop(i + 1, next(acc, i))
  |
6 |   while i < n do
  |               ^^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-race-strategies-1.almd:8:3
  in variable end
  here: end
  hint: Did you mean `n`?
  try:
      n
  |
8 |   end
  |   ^^^
error[E005]: argument 'o' expects Option[A] but got Result[Int, String]
  --> /tmp/dojo-race-strategies-1.almd:19:24
  in call to option.unwrap_or()
  here: |> option.unwrap_or(-1)
  hint: the argument is a Result[Int, String] — unwrap it first: `!` propagates the error (effect fn body), `?? fallback` supplies a default, or `match` handles ok/err
   |
24 | }
   | ---------------------------------- fn option.unwrap_or() defined here
...
19 |   |> option.unwrap_or(-1)
   |                        ^

3 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
Compile error for /tmp/dojo-race-strategies-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
import fan

fn exact(n: Int) -> Int = 
  let rec loop(i: Int, acc: Int) -> Int = 
    if i < n then loop(i + 1, acc + i) else acc
  in loop(0, 0)

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
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-race-strategies-2.almd:4:7
  in let rec
  here: let rec loop(i: Int, acc: Int) -> Int =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
4 |   let rec loop(i: Int, acc: Int) -> Int =
  |       ^^^
error: Expected expression at line 6:3 (got In 'in')
  --> /tmp/dojo-race-strategies-2.almd:6:3
  here: in loop(0, 0)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
6 |   in loop(0, 0)
  |   ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-2.almd:5:8
  in variable i
  here: if i < n then loop(i + 1, acc + i) else acc
  hint: Did you mean `n`?
  try:
      n
  |
5 |     if i < n then loop(i + 1, acc + i) else acc
  |        ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-2.almd:5:24
  in variable i
  here: if i < n then loop(i + 1, acc + i) else acc
  hint: Did you mean `n`?
  try:
      n
  |
5 |     if i < n then loop(i + 1, acc + i) else acc
  |                        ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-race-strategies-2.almd:5:31
  in variable acc
  here: if i < n then loop(i + 1, acc + i) else acc
  hint: Check the variable name
  |
5 |     if i < n then loop(i + 1, acc + i) else acc
  |                               ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-2.almd:5:37
  in variable i
  here: if i < n then loop(i + 1, acc + i) else acc
  hint: Did you mean `n`?
  try:
      n
  |
5 |     if i < n then loop(i + 1, acc + i) else acc
  |                                     ^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-race-strategies-2.almd:5:19
  in call to loop()
  here: if i < n then loop(i + 1, acc + i) else acc
  hint: Check the function name
  |
5 |     if i < n then loop(i + 1, acc + i) else acc
  |                   ^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-race-strategies-2.almd:5:45
  in variable acc
  here: if i < n then loop(i + 1, acc + i) else acc
  hint: Check the variable name
  |
5 |     if i < n then loop(i + 1, acc + i) else acc
  |                                             ^^^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-2.almd:5:45
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
5 |     if i < n then loop(i + 1, acc + i) else acc
  |                                             ^^^

9 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
Compile error for /tmp/dojo-race-strategies-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
import fan

fn exact(n: Int) -> Int = 
  if n == 0 then 0 else n + exact(n - 1)

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
FAILED: /tmp/dojo-race-strategies-3.almd
Compile error for /tmp/dojo-race-strategies-3.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
