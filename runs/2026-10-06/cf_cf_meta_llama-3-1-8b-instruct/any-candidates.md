# any-candidates

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_port(n: Int) -> Result[Int, String] = 
  if 1024 <= n && n <= 65535 then ok(n) else err("out of range")

effect fn first_valid_port(candidates: List[Int]) -> Int = 
  fan.any(candidates, (x) => parse_port(x) ?? -1)
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 2:16
  --> /tmp/dojo-any-candidates-0.almd:2:16
  here: if 1024 <= n && n <= 65535 then ok(n) else err("out of range")
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
2 |   if 1024 <= n && n <= 65535 then ok(n) else err("out of range")
  |                ^
error[E001]: type mismatch in fan.any callback: expected fn(Int) -> Int but got effect fn(Int) -> Result[Int, String]
  --> /tmp/dojo-any-candidates-0.almd:5:48
  in fan.any callback
  here: fan.any(candidates, (x) => parse_port(x) ?? -1)
  hint: Fix the expression type or change the expected type
  |
5 |   fan.any(candidates, (x) => parse_port(x) ?? -1)
  |                                                ^
error[E041]: implicit propagation of this fn's tail value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-any-candidates-0.almd:5:3
  in implicit propagation
  here: fan.any(candidates, (x) => parse_port(x) ?? -1)
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
  try:
      !
  |
5 |   fan.any(candidates, (x) => parse_port(x) ?? -1)
  |   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

3 error(s) found
FAILED: /tmp/dojo-any-candidates-0.almd
Compile error for /tmp/dojo-any-candidates-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn parse_port(n: Int) -> Result[Int, String] = 
  if 1024 <= n and n <= 65535 then ok(n) else err("out of range")

effect fn first_valid_port(candidates: List[Int]) -> Int = 
  fan.any(candidates, (x) => parse_port(x) ?? -1)!!
```

**Diagnostic:**

```
error[E001]: type mismatch in fan.any callback: expected fn(Int) -> Int but got effect fn(Int) -> Result[?5, String]
  --> /tmp/dojo-any-candidates-1.almd:5:48
  in fan.any callback
  here: fan.any(candidates, (x) => parse_port(x) ?? -1)!!
  hint: Fix the expression type or change the expected type
  |
5 |   fan.any(candidates, (x) => parse_port(x) ?? -1)!!
  |                                                ^
error[E025]: cannot infer a concrete type for this expression (type Result[?5, String])
  --> /tmp/dojo-any-candidates-1.almd:5:3
  in this expression with an unconstrained type
  here: fan.any(candidates, (x) => parse_port(x) ?? -1)!!
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Result[Int, String] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |   fan.any(candidates, (x) => parse_port(x) ?? -1)!!
  |   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

2 error(s) found
FAILED: /tmp/dojo-any-candidates-1.almd
Compile error for /tmp/dojo-any-candidates-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn parse_port(n: Int) -> Result[Int, String] = 
  if 1024 <= n and n <= 65535 then ok(n) else err("out of range")

effect fn first_valid_port(candidates: List[Int]) -> Int = 
  let r: Result[Int, String] = fan.any(candidates, (x) => parse_port(x) ?? -1)
  match r { some(x) => x, none => -1 }
```

**Diagnostic:**

```
error[E048]: pattern `some(..)` destructures an Option, but the subject is `Result[Int, String]`
  --> /tmp/dojo-any-candidates-2.almd:6:9
  in match pattern
  here: match r { some(x) => x, none => -1 }
  hint: Option and Result are separate types: an Option is matched with `some(..)` / `none`, a Result with `ok(..)` / `err(..)`. Write `ok(..)` here.
  try:
      ok(..)
  |
6 |   match r { some(x) => x, none => -1 }
  |         ^
error[E048]: pattern `none` destructures an Option, but the subject is `Result[Int, String]`
  --> /tmp/dojo-any-candidates-2.almd:6:24
  in match pattern
  here: match r { some(x) => x, none => -1 }
  hint: Option and Result are separate types: an Option is matched with `some(..)` / `none`, a Result with `ok(..)` / `err(..)`. Write `err(..)` here. A Result's failure arm carries the error value: `err(e)`.
  try:
      err(..)
  |
6 |   match r { some(x) => x, none => -1 }
  |                        ^
error[E001]: type mismatch in fan.any callback: expected fn(Int) -> Int but got effect fn(Int) -> Result[Int, String]
  --> /tmp/dojo-any-candidates-2.almd:5:77
  in fan.any callback
  here: let r: Result[Int, String] = fan.any(candidates, (x) => parse_port(x) ?? -1)
  hint: Fix the expression type or change the expected type
  |
5 |   let r: Result[Int, String] = fan.any(candidates, (x) => parse_port(x) ?? -1)
  |                                                                             ^

3 error(s) found
FAILED: /tmp/dojo-any-candidates-2.almd
Compile error for /tmp/dojo-any-candidates-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn parse_port(n: Int) -> Result[Int, String] = 
  if 1024 <= n and n <= 65535 then ok(n) else err("out of range")

effect fn first_valid_port(candidates: List[Int]) -> Int = 
  let r: Result[Int, String] = fan.any(candidates, (x) => parse_port(x) ?? -1)
  match r { ok(x) => x, err(_) => -1 }
```

**Diagnostic:**

```
error[E001]: type mismatch in fan.any callback: expected fn(Int) -> Int but got effect fn(Int) -> Result[Int, String]
  --> /tmp/dojo-any-candidates-3.almd:5:77
  in fan.any callback
  here: let r: Result[Int, String] = fan.any(candidates, (x) => parse_port(x) ?? -1)
  hint: Fix the expression type or change the expected type
  |
5 |   let r: Result[Int, String] = fan.any(candidates, (x) => parse_port(x) ?? -1)
  |                                                                             ^

1 error(s) found
FAILED: /tmp/dojo-any-candidates-3.almd
Compile error for /tmp/dojo-any-candidates-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
