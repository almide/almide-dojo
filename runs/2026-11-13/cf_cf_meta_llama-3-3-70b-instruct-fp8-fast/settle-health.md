# settle-health

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn check_net(code: Int) -> Result[Int, String] = 
  if code == 200 then ok(code) else err("net down")

fn check_disk(free: Int) -> Result[Int, String] = 
  if free > 10 then ok(free) else err("disk full")

effect fn health(code: Int, free: Int) -> String = 
  let (net, disk) = fan.settle { 
    check_net(code); 
    check_disk(free) 
  } in
  match (net, disk) {
    (ok(_), ok(_)) => "healthy",
    (err(_), ok(_)) => "net degraded",
    (ok(_), err(_)) => "disk degraded",
    (err(_), err(_)) => "down"
  }
```

**Diagnostic:**

```
error: fan.settle arms are separated by `,` or a newline, not `;`, at line 9:20
  --> /tmp/dojo-settle-health-0.almd:9:20
  here: check_net(code);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
  |
9 |     check_net(code);
  |                    ^
error: this indented line is not part of `effect fn health`: a body without braces is a single expression
  --> /tmp/dojo-settle-health-0.almd:11:3
  in fn body
  here: } in
  hint: `effect fn health` ends after its first expression (line 10), so line 11 is read as a new top-level declaration. To run several statements, wrap the body in braces:
  try:
      effect fn health(code: Int, free: Int) -> String = {
        let (net, disk) = fan.settle {
          check_net(code);
          check_disk(free)
        } in
        match (net, disk) {
          (ok(_), ok(_)) => "healthy",
          (err(_), ok(_)) => "net degraded",
          (ok(_), err(_)) => "disk degraded",
          (err(_), err(_)) => "down"
        }
      }
   |
 7 | effect fn health(code: Int, free: Int) -> String =
   | ------------- declared here
...
11 |   } in
   |   ^
error[E001]: type mismatch in fn 'health': expected String but got Int
  --> /tmp/dojo-settle-health-0.almd:10:5
  in fn 'health'
  here: check_disk(free)
  hint: Fix the expression type or change the expected type. Or use `int.to_string(x)` to convert Int to String
   |
10 |     check_disk(free)
   |     ^^^^^^^^^^^^^^^^
error[E041]: implicit propagation of this fn's tail value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-settle-health-0.almd:10:5
  in implicit propagation
  here: check_disk(free)
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
  try:
      !
   |
10 |     check_disk(free)
   |     ^^^^^^^^^^^^^^^^

4 error(s) found
FAILED: /tmp/dojo-settle-health-0.almd
  parse error: fan.settle arms are separated by `,` or a newline, not `;`, at line 9:20
  parse error: this indented line is not part of `effect fn health`: a body without braces is a single expression
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-settle-health-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn check_net(code: Int) -> Result[Int, String] = 
  if code == 200 then ok(code) else err("net down")

fn check_disk(free: Int) -> Result[Int, String] = 
  if free > 10 then ok(free) else err("disk full")

effect fn health(code: Int, free: Int) -> String = {
  let (net, disk) = fan.settle { 
    check_net(code),
    check_disk(free) 
  } in
  match (net, disk) {
    (ok(_), ok(_)) => "healthy",
    (err(_), ok(_)) => "net degraded",
    (ok(_), err(_)) => "disk degraded",
    (err(_), err(_)) => "down"
  }
}
```

**Diagnostic:**

```
error: Expected expression at line 11:5 (got In 'in')
  --> /tmp/dojo-settle-health-1.almd:11:5
  here: } in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |   } in
   |     ^

1 error(s) found
FAILED: /tmp/dojo-settle-health-1.almd
  parse error: Expected expression at line 11:5 (got In 'in')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-settle-health-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (PASS)

```almide
fn check_net(code: Int) -> Result[Int, String] = 
  if code == 200 then ok(code) else err("net down")

fn check_disk(free: Int) -> Result[Int, String] = 
  if free > 10 then ok(free) else err("disk full")

effect fn health(code: Int, free: Int) -> String = 
  let (net, disk) = fan.settle { 
    check_net(code),
    check_disk(free) 
  }
  match (net, disk) {
    (ok(_), ok(_)) => "healthy",
    (err(_), ok(_)) => "net degraded",
    (ok(_), err(_)) => "disk degraded",
    (err(_), err(_)) => "down"
  }
```
