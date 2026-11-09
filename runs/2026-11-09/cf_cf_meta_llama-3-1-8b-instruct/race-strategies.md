# race-strategies

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let mut sum = 0
  while n > 0 {
    sum += n
    n -= 1
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) }
  let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
  if exact_time < heuristic_time {
    exact_result
  } else if exact_time > heuristic_time {
    heuristic_result
  } else {
    -1
  }
}
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
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-0.almd:4:10
  in assignment-in-expr
  here: sum += n
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
4 |     sum += n
  |          ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-0.almd:5:8
  in assignment-in-expr
  here: n -= 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
5 |     n -= 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:3 (got Ident 'sum')
  --> /tmp/dojo-race-strategies-0.almd:7:3
  here: sum
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |   sum
  |   ^
error[E027]: fan.race was renamed to fan.min, and the clock argument is required
  --> /tmp/dojo-race-strategies-0.almd:15:36
  in fan.race
  here: let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) }
  hint: `fan.min(compute.ms(5)) { a(), b() }` picks the branch that spends the LEAST deterministic computation within the budget (ties go to source order); a dynamic list is `fan.min(compute.ms(5), xs, (x) => ok(f(x)))`. The clock says what "least" is measured on. For the first candidate that SUCCEEDS in source order, write `a() ?? b()`.
   |
15 |   let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) }
   |                                    ^^^
error[E027]: fan.race was renamed to fan.min, and the clock argument is required
  --> /tmp/dojo-race-strategies-0.almd:16:44
  in fan.race
  here: let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
  hint: `fan.min(compute.ms(5)) { a(), b() }` picks the branch that spends the LEAST deterministic computation within the budget (ties go to source order); a dynamic list is `fan.min(compute.ms(5), xs, (x) => ok(f(x)))`. The clock says what "least" is measured on. For the first candidate that SUCCEEDS in source order, write `a() ?? b()`.
   |
16 |   let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
   |                                            ^^^
error: if requires 'then', not a brace block
  --> /tmp/dojo-race-strategies-0.almd:17:34
  in if
  here: if exact_time < heuristic_time {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
17 |   if exact_time < heuristic_time {
   |                                  ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-race-strategies-0.almd:19:41
  in if
  here: } else if exact_time > heuristic_time {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
19 |   } else if exact_time > heuristic_time {
   |                                         ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-0.almd:15:68
  in tuple destructure
  here: let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
15 |   let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) }
   |                                                                    ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-0.almd:16:80
  in tuple destructure
  here: let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
16 |   let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
   |                                                                                ^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-0.almd:2:17
  in fn 'exact'
  here: let mut sum = 0
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let mut sum = 0
  |                 ^

11 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
  parse error: 'let mut' is not valid in Almide
  parse error: Assignments return Unit and can't appear here
  parse error: Assignments return Unit and can't appear here
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0
  while n > 0 {
    sum = sum + n
    n = n - 1
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.min(compute.ms(1), { exact(n) })
  let (heuristic_time, heuristic_result) = fan.min(compute.ms(1), { heuristic(n) })
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}
```

**Diagnostic:**

```
error: fan.min takes a BLOCK of arms, not thunk arguments, at line 15:57
  --> /tmp/dojo-race-strategies-1.almd:15:57
  here: let (exact_time, exact_result) = fan.min(compute.ms(1), { exact(n) })
  hint: fan.min(compute.ms(5)) { exact(p), heuristic(p) } — arms are expressions separated by `,` or a newline, no `() =>` wrappers; a dynamic list goes through the mapper form fan.min(xs, (x) => ok(work(x)))
   |
15 |   let (exact_time, exact_result) = fan.min(compute.ms(1), { exact(n) })
   |                                                         ^
error: fan.min takes a BLOCK of arms, not thunk arguments, at line 16:65
  --> /tmp/dojo-race-strategies-1.almd:16:65
  here: let (heuristic_time, heuristic_result) = fan.min(compute.ms(1), { heuristic(n) })
  hint: fan.min(compute.ms(5)) { exact(p), heuristic(p) } — arms are expressions separated by `,` or a newline, no `() =>` wrappers; a dynamic list goes through the mapper form fan.min(xs, (x) => ok(work(x)))
   |
16 |   let (heuristic_time, heuristic_result) = fan.min(compute.ms(1), { heuristic(n) })
   |                                                                 ^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-race-strategies-1.almd:5:13
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
error[E003]: undefined variable 'exact_time'
  --> /tmp/dojo-race-strategies-1.almd:17:6
  in variable exact_time
  here: if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
  hint: Did you mean `exact`?
  try:
      exact
   |
17 |   if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
   |      ^^^^^^^^^^
error[E003]: undefined variable 'heuristic_time'
  --> /tmp/dojo-race-strategies-1.almd:17:19
  in variable heuristic_time
  here: if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
  hint: Did you mean `heuristic`?
  try:
      heuristic
   |
17 |   if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
   |                   ^^^^^^^^^^^^^^
error[E003]: undefined variable 'exact_result'
  --> /tmp/dojo-race-strategies-1.almd:17:39
  in variable exact_result
  here: if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
  hint: Check the variable name
   |
17 |   if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
   |                                       ^^^^^^^^^^^^
error[E003]: undefined variable 'exact_time'
  --> /tmp/dojo-race-strategies-1.almd:17:60
  in variable exact_time
  here: if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
  hint: Did you mean `exact`?
  try:
      exact
   |
17 |   if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
   |                                                            ^^^^^^^^^^
error[E003]: undefined variable 'heuristic_time'
  --> /tmp/dojo-race-strategies-1.almd:17:73
  in variable heuristic_time
  here: if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
  hint: Did you mean `heuristic`?
  try:
      heuristic
   |
17 |   if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
   |                                                                         ^^^^^^^^^^^^^^
error[E003]: undefined variable 'heuristic_result'
  --> /tmp/dojo-race-strategies-1.almd:17:93
  in variable heuristic_result
  here: if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
  hint: Did you mean `heuristic`?
  try:
      heuristic
   |
17 |   if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
   |                                                                                             ^^^^^^^^^^^^^^^^

9 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
  parse error: fan.min takes a BLOCK of arms, not thunk arguments, at line 15:57
  parse error: fan.min takes a BLOCK of arms, not thunk arguments, at line 16:65
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0
  var n_ = n
  while n_ > 0 {
    sum = sum + n_
    n_ = n_ - 1
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.min(compute.ms(1), { exact(n) })
  let (heuristic_time, heuristic_result) = fan.min(compute.ms(1), { heuristic(n) })
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}
```

**Diagnostic:**

```
error: fan.min takes a BLOCK of arms, not thunk arguments, at line 16:57
  --> /tmp/dojo-race-strategies-2.almd:16:57
  here: let (exact_time, exact_result) = fan.min(compute.ms(1), { exact(n) })
  hint: fan.min(compute.ms(5)) { exact(p), heuristic(p) } — arms are expressions separated by `,` or a newline, no `() =>` wrappers; a dynamic list goes through the mapper form fan.min(xs, (x) => ok(work(x)))
   |
16 |   let (exact_time, exact_result) = fan.min(compute.ms(1), { exact(n) })
   |                                                         ^
error: fan.min takes a BLOCK of arms, not thunk arguments, at line 17:65
  --> /tmp/dojo-race-strategies-2.almd:17:65
  here: let (heuristic_time, heuristic_result) = fan.min(compute.ms(1), { heuristic(n) })
  hint: fan.min(compute.ms(5)) { exact(p), heuristic(p) } — arms are expressions separated by `,` or a newline, no `() =>` wrappers; a dynamic list goes through the mapper form fan.min(xs, (x) => ok(work(x)))
   |
17 |   let (heuristic_time, heuristic_result) = fan.min(compute.ms(1), { heuristic(n) })
   |                                                                 ^
error[E003]: undefined variable 'exact_time'
  --> /tmp/dojo-race-strategies-2.almd:18:6
  in variable exact_time
  here: if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
  hint: Did you mean `exact`?
  try:
      exact
   |
18 |   if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
   |      ^^^^^^^^^^
error[E003]: undefined variable 'heuristic_time'
  --> /tmp/dojo-race-strategies-2.almd:18:19
  in variable heuristic_time
  here: if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
  hint: Did you mean `heuristic`?
  try:
      heuristic
   |
18 |   if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
   |                   ^^^^^^^^^^^^^^
error[E003]: undefined variable 'exact_result'
  --> /tmp/dojo-race-strategies-2.almd:18:39
  in variable exact_result
  here: if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
  hint: Check the variable name
   |
18 |   if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
   |                                       ^^^^^^^^^^^^
error[E003]: undefined variable 'exact_time'
  --> /tmp/dojo-race-strategies-2.almd:18:60
  in variable exact_time
  here: if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
  hint: Did you mean `exact`?
  try:
      exact
   |
18 |   if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
   |                                                            ^^^^^^^^^^
error[E003]: undefined variable 'heuristic_time'
  --> /tmp/dojo-race-strategies-2.almd:18:73
  in variable heuristic_time
  here: if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
  hint: Did you mean `heuristic`?
  try:
      heuristic
   |
18 |   if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
   |                                                                         ^^^^^^^^^^^^^^
error[E003]: undefined variable 'heuristic_result'
  --> /tmp/dojo-race-strategies-2.almd:18:93
  in variable heuristic_result
  here: if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
  hint: Did you mean `heuristic`?
  try:
      heuristic
   |
18 |   if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
   |                                                                                             ^^^^^^^^^^^^^^^^

8 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
  parse error: fan.min takes a BLOCK of arms, not thunk arguments, at line 16:57
  parse error: fan.min takes a BLOCK of arms, not thunk arguments, at line 17:65
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0
  var n_ = n
  while n_ > 0 {
    sum = sum + n_
    n_ = n_ - 1
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.min(compute.ms(1), { exact(n) })
  let (heuristic_time, heuristic_result) = fan.min(compute.ms(1), { heuristic(n) })
  let exact_time = exact_time
  let heuristic_time = heuristic_time
  let exact_result = exact_result
  let heuristic_result = heuristic_result
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}
```

**Diagnostic:**

```
error: fan.min takes a BLOCK of arms, not thunk arguments, at line 16:57
  --> /tmp/dojo-race-strategies-3.almd:16:57
  here: let (exact_time, exact_result) = fan.min(compute.ms(1), { exact(n) })
  hint: fan.min(compute.ms(5)) { exact(p), heuristic(p) } — arms are expressions separated by `,` or a newline, no `() =>` wrappers; a dynamic list goes through the mapper form fan.min(xs, (x) => ok(work(x)))
   |
16 |   let (exact_time, exact_result) = fan.min(compute.ms(1), { exact(n) })
   |                                                         ^
error: fan.min takes a BLOCK of arms, not thunk arguments, at line 17:65
  --> /tmp/dojo-race-strategies-3.almd:17:65
  here: let (heuristic_time, heuristic_result) = fan.min(compute.ms(1), { heuristic(n) })
  hint: fan.min(compute.ms(5)) { exact(p), heuristic(p) } — arms are expressions separated by `,` or a newline, no `() =>` wrappers; a dynamic list goes through the mapper form fan.min(xs, (x) => ok(work(x)))
   |
17 |   let (heuristic_time, heuristic_result) = fan.min(compute.ms(1), { heuristic(n) })
   |                                                                 ^
error[E003]: undefined variable 'exact_time'
  --> /tmp/dojo-race-strategies-3.almd:18:20
  in variable exact_time
  here: let exact_time = exact_time
  hint: Did you mean `exact`?
  try:
      exact
   |
18 |   let exact_time = exact_time
   |                    ^^^^^^^^^^
error[E003]: undefined variable 'heuristic_time'
  --> /tmp/dojo-race-strategies-3.almd:19:24
  in variable heuristic_time
  here: let heuristic_time = heuristic_time
  hint: Did you mean `heuristic`?
  try:
      heuristic
   |
19 |   let heuristic_time = heuristic_time
   |                        ^^^^^^^^^^^^^^
error[E003]: undefined variable 'exact_result'
  --> /tmp/dojo-race-strategies-3.almd:20:22
  in variable exact_result
  here: let exact_result = exact_result
  hint: Check the variable name
   |
20 |   let exact_result = exact_result
   |                      ^^^^^^^^^^^^
error[E003]: undefined variable 'heuristic_result'
  --> /tmp/dojo-race-strategies-3.almd:21:26
  in variable heuristic_result
  here: let heuristic_result = heuristic_result
  hint: Did you mean `heuristic_time`?
  try:
      heuristic_time
   |
21 |   let heuristic_result = heuristic_result
   |                          ^^^^^^^^^^^^^^^^

6 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
  parse error: fan.min takes a BLOCK of arms, not thunk arguments, at line 16:57
  parse error: fan.min takes a BLOCK of arms, not thunk arguments, at line 17:65
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
