# deadline-guard

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn square_plus_one(n: Int) -> Int = 
  n * n + 1

effect fn within_deadline(n: Int) -> Int = 
  fan.timeout(duration.s(2)) { 
    square_plus_one(n) 
  } ?? 0
```

**Diagnostic:**

```
FAILED: /tmp/dojo-deadline-guard-0.almd
Compile error for /tmp/dojo-deadline-guard-0.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn square_plus_one(n: Int) -> Int = 
  n * n + 1

effect fn within_deadline(n: Int) -> Int = 
  fan.timeout(duration.s(2)) { 
    square_plus_one(n) 
  } ?? 0
```

**Diagnostic:**

```
FAILED: /tmp/dojo-deadline-guard-1.almd
Compile error for /tmp/dojo-deadline-guard-1.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn square_plus_one(n: Int) -> Int = 
  n * n + 1

effect fn within_deadline(n: Int) -> Int = 
  fan.timeout(duration.s(2)) { 
    effect { square_plus_one(n) } 
  } ?? 0
```

**Diagnostic:**

```
error: Expected expression at line 6:5 (got Effect 'effect')
  --> /tmp/dojo-deadline-guard-2.almd:6:5
  here: effect { square_plus_one(n) }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
6 |     effect { square_plus_one(n) }
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:3 (got RBrace '}')
  --> /tmp/dojo-deadline-guard-2.almd:7:3
  here: } ?? 0
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |   } ?? 0
  |   ^
error[E001]: type mismatch in fn 'within_deadline': expected Int but got Unit
  --> /tmp/dojo-deadline-guard-2.almd:5:30
  in fn 'within_deadline'
  here: fan.timeout(duration.s(2)) {
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
5 |   fan.timeout(duration.s(2)) {
  |                              ^

3 error(s) found
FAILED: /tmp/dojo-deadline-guard-2.almd
Compile error for /tmp/dojo-deadline-guard-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn square_plus_one(n: Int) -> Int = 
  n * n + 1

effect fn within_deadline(n: Int) -> Int = 
  fan.timeout(duration.s(2)) { square_plus_one(n) } ?? 0
```

**Diagnostic:**

```
FAILED: /tmp/dojo-deadline-guard-3.almd
Compile error for /tmp/dojo-deadline-guard-3.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
