# race-strategies

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let sum = 0
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
  --> /tmp/dojo-race-strategies-0.almd:2:13
  in fn 'exact'
  here: let sum = 0
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let sum = 0
  |             ^

10 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
  parse error: Assignments return Unit and can't appear here
  parse error: Assignments return Unit and can't appear here
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:3 (got Ident 'sum')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let sum = 0
  let i = 0
  while i < n {
    sum += i
    i += 1
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.min(compute.ms(1), { exact(n) })
  let (heuristic_time, heuristic_result) = fan.min(compute.ms(1), { heuristic(n) })
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
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-1.almd:5:10
  in assignment-in-expr
  here: sum += i
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
5 |     sum += i
  |          ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-1.almd:6:8
  in assignment-in-expr
  here: i += 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
6 |     i += 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:3 (got Ident 'sum')
  --> /tmp/dojo-race-strategies-1.almd:8:3
  here: sum
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   sum
  |   ^
error: fan.min takes a BLOCK of arms, not thunk arguments, at line 16:57
  --> /tmp/dojo-race-strategies-1.almd:16:57
  here: let (exact_time, exact_result) = fan.min(compute.ms(1), { exact(n) })
  hint: fan.min(compute.ms(5)) { exact(p), heuristic(p) } — arms are expressions separated by `,` or a newline, no `() =>` wrappers; a dynamic list goes through the mapper form fan.min(xs, (x) => ok(work(x)))
   |
16 |   let (exact_time, exact_result) = fan.min(compute.ms(1), { exact(n) })
   |                                                         ^
error: fan.min takes a BLOCK of arms, not thunk arguments, at line 17:65
  --> /tmp/dojo-race-strategies-1.almd:17:65
  here: let (heuristic_time, heuristic_result) = fan.min(compute.ms(1), { heuristic(n) })
  hint: fan.min(compute.ms(5)) { exact(p), heuristic(p) } — arms are expressions separated by `,` or a newline, no `() =>` wrappers; a dynamic list goes through the mapper form fan.min(xs, (x) => ok(work(x)))
   |
17 |   let (heuristic_time, heuristic_result) = fan.min(compute.ms(1), { heuristic(n) })
   |                                                                 ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-race-strategies-1.almd:18:34
  in if
  here: if exact_time < heuristic_time {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
18 |   if exact_time < heuristic_time {
   |                                  ^
error: if requires 'then', not a brace block
  --> /tmp/dojo-race-strategies-1.almd:20:41
  in if
  here: } else if exact_time > heuristic_time {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
20 |   } else if exact_time > heuristic_time {
   |                                         ^
error[E003]: undefined variable 'exact_time'
  --> /tmp/dojo-race-strategies-1.almd:18:6
  in variable exact_time
  here: if exact_time < heuristic_time {
  hint: Did you mean `exact`?
  try:
      exact
   |
18 |   if exact_time < heuristic_time {
   |      ^^^^^^^^^^
error[E003]: undefined variable 'heuristic_time'
  --> /tmp/dojo-race-strategies-1.almd:18:19
  in variable heuristic_time
  here: if exact_time < heuristic_time {
  hint: Did you mean `heuristic`?
  try:
      heuristic
   |
18 |   if exact_time < heuristic_time {
   |                   ^^^^^^^^^^^^^^
error[E003]: undefined variable 'exact_result'
  --> /tmp/dojo-race-strategies-1.almd:19:5
  in variable exact_result
  here: exact_result
  hint: Check the variable name
   |
19 |     exact_result
   |     ^^^^^^^^^^^^
error[E003]: undefined variable 'exact_time'
  --> /tmp/dojo-race-strategies-1.almd:20:13
  in variable exact_time
  here: } else if exact_time > heuristic_time {
  hint: Did you mean `exact`?
  try:
      exact
   |
20 |   } else if exact_time > heuristic_time {
   |             ^^^^^^^^^^
error[E003]: undefined variable 'heuristic_time'
  --> /tmp/dojo-race-strategies-1.almd:20:26
  in variable heuristic_time
  here: } else if exact_time > heuristic_time {
  hint: Did you mean `heuristic`?
  try:
      heuristic
   |
20 |   } else if exact_time > heuristic_time {
   |                          ^^^^^^^^^^^^^^
error[E003]: undefined variable 'heuristic_result'
  --> /tmp/dojo-race-strategies-1.almd:21:5
  in variable heuristic_result
  here: heuristic_result
  hint: Did you mean `heuristic`?
  try:
      heuristic
   |
21 |     heuristic_result
   |     ^^^^^^^^^^^^^^^^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-1.almd:3:11
  in fn 'exact'
  here: let i = 0
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

14 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
  parse error: Assignments return Unit and can't appear here
  parse error: Assignments return Unit and can't appear here
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:3 (got Ident 'sum')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let sum = 0
  let i = 0
  while i < n {
    let tmp = sum + i
    sum = tmp
    i += 1
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.min(compute.ms(1), exact(n))
  let (heuristic_time, heuristic_result) = fan.min(compute.ms(1), heuristic(n))
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}
```

**Diagnostic:**

```
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-2.almd:7:8
  in assignment-in-expr
  here: i += 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |     i += 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:3 (got Ident 'sum')
  --> /tmp/dojo-race-strategies-2.almd:9:3
  here: sum
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |   sum
  |   ^
error: fan.min takes a BLOCK of arms, not thunk arguments, at line 17:57
  --> /tmp/dojo-race-strategies-2.almd:17:57
  here: let (exact_time, exact_result) = fan.min(compute.ms(1), exact(n))
  hint: fan.min(compute.ms(5)) { exact(p), heuristic(p) } — arms are expressions separated by `,` or a newline, no `() =>` wrappers; a dynamic list goes through the mapper form fan.min(xs, (x) => ok(work(x)))
   |
17 |   let (exact_time, exact_result) = fan.min(compute.ms(1), exact(n))
   |                                                         ^
error: fan.min takes a BLOCK of arms, not thunk arguments, at line 18:65
  --> /tmp/dojo-race-strategies-2.almd:18:65
  here: let (heuristic_time, heuristic_result) = fan.min(compute.ms(1), heuristic(n))
  hint: fan.min(compute.ms(5)) { exact(p), heuristic(p) } — arms are expressions separated by `,` or a newline, no `() =>` wrappers; a dynamic list goes through the mapper form fan.min(xs, (x) => ok(work(x)))
   |
18 |   let (heuristic_time, heuristic_result) = fan.min(compute.ms(1), heuristic(n))
   |                                                                 ^
error[E003]: undefined variable 'exact_time'
  --> /tmp/dojo-race-strategies-2.almd:19:6
  in variable exact_time
  here: if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
  hint: Did you mean `exact`?
  try:
      exact
   |
19 |   if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
   |      ^^^^^^^^^^
error[E003]: undefined variable 'heuristic_time'
  --> /tmp/dojo-race-strategies-2.almd:19:19
  in variable heuristic_time
  here: if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
  hint: Did you mean `heuristic`?
  try:
      heuristic
   |
19 |   if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
   |                   ^^^^^^^^^^^^^^
error[E003]: undefined variable 'exact_result'
  --> /tmp/dojo-race-strategies-2.almd:19:39
  in variable exact_result
  here: if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
  hint: Check the variable name
   |
19 |   if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
   |                                       ^^^^^^^^^^^^
error[E003]: undefined variable 'exact_time'
  --> /tmp/dojo-race-strategies-2.almd:19:60
  in variable exact_time
  here: if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
  hint: Did you mean `exact`?
  try:
      exact
   |
19 |   if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
   |                                                            ^^^^^^^^^^
error[E003]: undefined variable 'heuristic_time'
  --> /tmp/dojo-race-strategies-2.almd:19:73
  in variable heuristic_time
  here: if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
  hint: Did you mean `heuristic`?
  try:
      heuristic
   |
19 |   if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
   |                                                                         ^^^^^^^^^^^^^^
error[E003]: undefined variable 'heuristic_result'
  --> /tmp/dojo-race-strategies-2.almd:19:93
  in variable heuristic_result
  here: if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
  hint: Did you mean `heuristic`?
  try:
      heuristic
   |
19 |   if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
   |                                                                                             ^^^^^^^^^^^^^^^^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-2.almd:3:11
  in fn 'exact'
  here: let i = 0
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

11 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
  parse error: Assignments return Unit and can't appear here
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:3 (got Ident 'sum')
  parse error: fan.min takes a BLOCK of arms, not thunk arguments, at line 17:57
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let sum = 0
  let i = 0
  while i < n {
    let tmp = sum + i
    sum = tmp
    i += 1
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.min(compute.ms(1), {
    let sum = 0
    let i = 0
    let start_time = compute.now()
    while i < n {
      let tmp = sum + i
      sum = tmp
      i += 1
    }
    let end_time = compute.now()
    let exact_time = end_time - start_time
    exact_result = sum
    (exact_time, exact_result)
  });
  let (heuristic_time, heuristic_result) = fan.min(compute.ms(1), {
    let start_time = compute.now()
    let heuristic_result = heuristic(n)
    let end_time = compute.now()
    let heuristic_time = end_time - start_time
    (heuristic_time, heuristic_result)
  });
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}
```

**Diagnostic:**

```
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-3.almd:7:8
  in assignment-in-expr
  here: i += 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |     i += 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:3 (got Ident 'sum')
  --> /tmp/dojo-race-strategies-3.almd:9:3
  here: sum
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |   sum
  |   ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-3.almd:24:10
  in assignment-in-expr
  here: i += 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
24 |       i += 1
   |          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 30:4 (got RParen ')')
  --> /tmp/dojo-race-strategies-3.almd:30:4
  here: });
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
30 |   });
   |    ^
error: unknown unit 'compute.now'
  --> /tmp/dojo-race-strategies-3.almd:26:20
  in call to compute.now()
  here: let end_time = compute.now()
  hint: The unit set is closed: compute.ns / us / ms / s / min / h
   |
26 |     let end_time = compute.now()
   |                    ^^^^^^^^^^^^^
error[E003]: undefined variable 'start_time'
  --> /tmp/dojo-race-strategies-3.almd:27:33
  in variable start_time
  here: let exact_time = end_time - start_time
  hint: Check the variable name
   |
27 |     let exact_time = end_time - start_time
   |                                 ^^^^^^^^^^
error: operator '-' needs two Compute values, found Compute and Unknown
  --> /tmp/dojo-race-strategies-3.almd:27:33
  in operator -
  here: let exact_time = end_time - start_time
  hint: A bare number is never a time — wrap it: compute.ms(n)
   |
27 |     let exact_time = end_time - start_time
   |                                 ^^^^^^^^^^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-race-strategies-3.almd:28:20
  in variable sum
  here: exact_result = sum
  hint: Check the variable name
   |
28 |     exact_result = sum
   |                    ^^^
error[E003]: cannot assign to undefined binding 'exact_result'
  --> /tmp/dojo-race-strategies-3.almd:28:20
  in exact_result = ...
  here: exact_result = sum
  hint: No `let`/`var` named 'exact_result' is in scope to assign to. Declare it first: `var exact_result = ...`
   |
28 |     exact_result = sum
   |                    ^^^
error[E003]: undefined variable 'exact_result'
  --> /tmp/dojo-race-strategies-3.almd:29:18
  in variable exact_result
  here: (exact_time, exact_result)
  hint: Check the variable name
   |
29 |     (exact_time, exact_result)
   |                  ^^^^^^^^^^^^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-3.almd:3:11
  in fn 'exact'
  here: let i = 0
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
error[E001]: type mismatch in fn 'best_effort': expected Int but got (Compute, Unknown)
  --> /tmp/dojo-race-strategies-3.almd:29:5
  in fn 'best_effort'
  here: (exact_time, exact_result)
  hint: Fix the expression type or change the expected type
   |
29 |     (exact_time, exact_result)
   |     ^

12 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
  parse error: Assignments return Unit and can't appear here
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:3 (got Ident 'sum')
  parse error: Assignments return Unit and can't appear here
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
