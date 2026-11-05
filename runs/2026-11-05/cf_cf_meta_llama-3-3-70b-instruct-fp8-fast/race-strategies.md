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
  if i < n 
  then exact(n - 1) + n - 1 
  else acc

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
FAILED: /tmp/dojo-race-strategies-1.almd
Compile error for /tmp/dojo-race-strategies-1.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
import fan

fn exact(n: Int) -> Int = 
  let acc = 0 in
  let i = 0 in
  if i < n 
  then exact(n - 1) + n - 1 
  else acc

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(compute.ms(1)) { 
    exact(n), 
    heuristic(n) 
  } 
  |> option.unwrap_or(-1)

fn exact(n: Int) -> Int = 
  let acc = 0 in
  let i = 0 in
  if i < n 
  then exact(n - 1) + n - 1 
  else acc

fn exact(n: Int) -> Int = 
  let rec loop(i: Int, acc: Int) = 
    if i < n 
    then loop(i + 1, acc + i) 
    else acc
  in loop(0, 0)

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
  --> /tmp/dojo-race-strategies-2.almd:28:7
  in let rec
  here: let rec loop(i: Int, acc: Int) =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
   |
28 |   let rec loop(i: Int, acc: Int) =
   |       ^^^
error: Expected expression at line 32:3 (got In 'in')
  --> /tmp/dojo-race-strategies-2.almd:32:3
  here: in loop(0, 0)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
32 |   in loop(0, 0)
   |   ^
error[E012]: duplicate function 'exact'
  at line 20
  in fn exact
  here: fn exact(n: Int) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 3 | fn exact(n: Int) -> Int =
   | -------------------------------- first definition of 'exact' here
...
20 | fn exact(n: Int) -> Int =
   | ^
error[E012]: duplicate function 'exact'
  at line 27
  in fn exact
  here: fn exact(n: Int) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 3 | fn exact(n: Int) -> Int =
   | -------------------------------- first definition of 'exact' here
...
27 | fn exact(n: Int) -> Int =
   | ^
error[E012]: duplicate function 'heuristic'
  at line 34
  in fn heuristic
  here: fn heuristic(n: Int) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
10 | fn heuristic(n: Int) -> Int =
   | ------------------------------------ first definition of 'heuristic' here
...
34 | fn heuristic(n: Int) -> Int =
   | ^
error[E012]: duplicate function 'best_effort'
  at line 37
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
13 | effect fn best_effort(n: Int) -> Int =
   | -------------------------------------- first definition of 'best_effort' here
...
37 | effect fn best_effort(n: Int) -> Int =
   | ^
error[E005]: argument 'o' expects Option[A] but got Result[Int, String]
  --> /tmp/dojo-race-strategies-2.almd:18:24
  in call to option.unwrap_or()
  here: |> option.unwrap_or(-1)
  hint: the argument is a Result[Int, String] — unwrap it first: `!` propagates the error (effect fn body), `?? fallback` supplies a default, or `match` handles ok/err
   |
24 |   then exact(n - 1) + n - 1
   | ---------------------------------- fn option.unwrap_or() defined here
...
18 |   |> option.unwrap_or(-1)
   |                        ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-2.almd:29:8
  in variable i
  here: if i < n
  hint: Did you mean `n`?
  try:
      n
   |
29 |     if i < n
   |        ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-2.almd:30:15
  in variable i
  here: then loop(i + 1, acc + i)
  hint: Did you mean `n`?
  try:
      n
   |
30 |     then loop(i + 1, acc + i)
   |               ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-race-strategies-2.almd:30:22
  in variable acc
  here: then loop(i + 1, acc + i)
  hint: Check the variable name
   |
30 |     then loop(i + 1, acc + i)
   |                      ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-2.almd:30:28
  in variable i
  here: then loop(i + 1, acc + i)
  hint: Did you mean `n`?
  try:
      n
   |
30 |     then loop(i + 1, acc + i)
   |                            ^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-race-strategies-2.almd:30:10
  in call to loop()
  here: then loop(i + 1, acc + i)
  hint: Check the function name
   |
30 |     then loop(i + 1, acc + i)
   |          ^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-race-strategies-2.almd:31:10
  in variable acc
  here: else acc
  hint: Check the variable name
   |
31 |     else acc
   |          ^^^
error[E005]: argument 'o' expects Option[A] but got Result[Int, String]
  --> /tmp/dojo-race-strategies-2.almd:42:24
  in call to option.unwrap_or()
  here: |> option.unwrap_or(-1)
  hint: the argument is a Result[Int, String] — unwrap it first: `!` propagates the error (effect fn body), `?? fallback` supplies a default, or `match` handles ok/err
   |
24 |   then exact(n - 1) + n - 1
   | ---------------------------------- fn option.unwrap_or() defined here
...
42 |   |> option.unwrap_or(-1)
   |                        ^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-2.almd:31:10
  in fn 'exact'
  here: else acc
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
31 |     else acc
   |          ^^^

15 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
Compile error for /tmp/dojo-race-strategies-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
import fan

fn exact(n: Int) -> Int = 
  let acc = 0 in
  let i = 0 in
  if i < n 
  then exact(n - 1) + n - 1 
  else acc

fn exact_corrected(n: Int) -> Int = 
  let rec loop(i: Int, acc: Int) = 
    if i < n 
    then loop(i + 1, acc + i) 
    else acc
  in loop(0, 0)

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(compute.ms(1)) { 
    exact_corrected(n), 
    heuristic(n) 
  } 
  |> option.unwrap_or(-1)
```

**Diagnostic:**

```
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-race-strategies-3.almd:11:7
  in let rec
  here: let rec loop(i: Int, acc: Int) =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
   |
11 |   let rec loop(i: Int, acc: Int) =
   |       ^^^
error: Expected expression at line 15:3 (got In 'in')
  --> /tmp/dojo-race-strategies-3.almd:15:3
  here: in loop(0, 0)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   in loop(0, 0)
   |   ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-3.almd:12:8
  in variable i
  here: if i < n
  hint: Did you mean `n`?
  try:
      n
   |
12 |     if i < n
   |        ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-3.almd:13:15
  in variable i
  here: then loop(i + 1, acc + i)
  hint: Did you mean `n`?
  try:
      n
   |
13 |     then loop(i + 1, acc + i)
   |               ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-race-strategies-3.almd:13:22
  in variable acc
  here: then loop(i + 1, acc + i)
  hint: Check the variable name
   |
13 |     then loop(i + 1, acc + i)
   |                      ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-race-strategies-3.almd:13:28
  in variable i
  here: then loop(i + 1, acc + i)
  hint: Did you mean `n`?
  try:
      n
   |
13 |     then loop(i + 1, acc + i)
   |                            ^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-race-strategies-3.almd:13:10
  in call to loop()
  here: then loop(i + 1, acc + i)
  hint: Check the function name
   |
13 |     then loop(i + 1, acc + i)
   |          ^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-race-strategies-3.almd:14:10
  in variable acc
  here: else acc
  hint: Check the variable name
   |
14 |     else acc
   |          ^^^
error[E005]: argument 'o' expects Option[A] but got Result[Int, String]
  --> /tmp/dojo-race-strategies-3.almd:25:24
  in call to option.unwrap_or()
  here: |> option.unwrap_or(-1)
  hint: the argument is a Result[Int, String] — unwrap it first: `!` propagates the error (effect fn body), `?? fallback` supplies a default, or `match` handles ok/err
   |
24 |   }
   | ---------------------------------- fn option.unwrap_or() defined here
...
25 |   |> option.unwrap_or(-1)
   |                        ^
error[E001]: type mismatch in fn 'exact_corrected': expected Int but got Unit
  --> /tmp/dojo-race-strategies-3.almd:14:10
  in fn 'exact_corrected'
  here: else acc
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
14 |     else acc
   |          ^^^

10 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
