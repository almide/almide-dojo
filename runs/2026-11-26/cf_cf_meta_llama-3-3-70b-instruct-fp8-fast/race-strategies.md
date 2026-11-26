# race-strategies

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn exact(n: Int) -> Int = 
  let acc = ref 0 in
  while acc^ < n do
    acc := acc^ + acc^
  done;
  acc^

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(compute.ms(1)) { exact(n); heuristic(n) } ?? -1
```

**Diagnostic:**

```
error: Expected expression at line 2:19 (got In 'in')
  --> /tmp/dojo-race-strategies-0.almd:2:19
  here: let acc = ref 0 in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let acc = ref 0 in
  |                   ^
error: Expected expression at line 3:14 (got LAngle '<')
  --> /tmp/dojo-race-strategies-0.almd:3:14
  here: while acc^ < n do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   while acc^ < n do
  |              ^
error: Expected expression at line 4:9 (got Colon ':')
  --> /tmp/dojo-race-strategies-0.almd:4:9
  here: acc := acc^ + acc^
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |     acc := acc^ + acc^
  |         ^
error: Expected expression at line 8:1 (got Fn 'fn')
  --> /tmp/dojo-race-strategies-0.almd:8:1
  here: fn heuristic(n: Int) -> Int = n * (n - 1) / 2
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 | fn heuristic(n: Int) -> Int = n * (n - 1) / 2
  | ^
error[E027]: fan.race was renamed to fan.min, and the clock argument is required
  --> /tmp/dojo-race-strategies-0.almd:11:3
  in fan.race
  here: fan.race(compute.ms(1)) { exact(n); heuristic(n) } ?? -1
  hint: `fan.min(compute.ms(5)) { a(), b() }` picks the branch that spends the LEAST deterministic computation within the budget (ties go to source order); a dynamic list is `fan.min(compute.ms(5), xs, (x) => ok(f(x)))`. The clock says what "least" is measured on. For the first candidate that SUCCEEDS in source order, write `a() ?? b()`.
   |
11 |   fan.race(compute.ms(1)) { exact(n); heuristic(n) } ?? -1
   |   ^^^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 11:37
  --> /tmp/dojo-race-strategies-0.almd:11:37
  here: fan.race(compute.ms(1)) { exact(n); heuristic(n) } ?? -1
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
11 |   fan.race(compute.ms(1)) { exact(n); heuristic(n) } ?? -1
   |                                     ^
error[E003]: undefined variable 'ref'
  --> /tmp/dojo-race-strategies-0.almd:2:13
  in variable ref
  here: let acc = ref 0 in
  hint: Check the variable name
  |
2 |   let acc = ref 0 in
  |             ^^^
error[E003]: undefined variable 'done'
  --> /tmp/dojo-race-strategies-0.almd:5:3
  in variable done
  here: done;
  hint: Check the variable name
  |
5 |   done;
  |   ^^^^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-0.almd:5:3
  in fn 'exact'
  here: done;
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
5 |   done;
  |   ^^^^

9 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
  parse error: Expected expression at line 2:19 (got In 'in')
  parse error: Expected expression at line 3:14 (got LAngle '<')
  parse error: Expected expression at line 4:9 (got Colon ':')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-strategies-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn exact(n: Int) -> Int = 
  let acc = 0 in
  let i = 0 in
  if i < n 
  then exact(n - 1) + n - 1 
  else acc

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.min(compute.ms(1)) 
  { exact(n), heuristic(n) } ?? -1
```
