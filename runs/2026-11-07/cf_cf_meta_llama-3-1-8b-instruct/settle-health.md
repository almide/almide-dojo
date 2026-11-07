# settle-health

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
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
    let net = check_net(code)
    let disk = check_disk(free)
    (net, disk)
  }
  match (net, disk) {
    (ok(_), ok(_)) => "healthy"
    (err(_), ok(_)) => "net degraded"
    (ok(_), err(_)) => "disk degraded"
    (err(_), err(_)) => "down"
  }
```

**Diagnostic:**

```
error: `let` is not allowed inside fan.settle at line 9:5
  --> /tmp/dojo-settle-health-0.almd:9:5
  here: let net = check_net(code)
  hint: arms are expressions — wrap statements in a block arm: { let x = f(); g(x) }
  |
9 |     let net = check_net(code)
  |     ^
error: this indented line is not part of `effect fn health`: a body without braces is a single expression
  --> /tmp/dojo-settle-health-0.almd:12:3
  in fn body
  here: }
  hint: `effect fn health` ends after its first expression (line 11), so line 12 is read as a new top-level declaration. To run several statements, wrap the body in braces:
  try:
      effect fn health(code: Int, free: Int) -> String = {
        let (net, disk) = fan.settle {
          let net = check_net(code)
          let disk = check_disk(free)
          (net, disk)
        }
        match (net, disk) {
          (ok(_), ok(_)) => "healthy"
          (err(_), ok(_)) => "net degraded"
          (ok(_), err(_)) => "disk degraded"
          (err(_), err(_)) => "down"
        }
      }
   |
 7 | effect fn health(code: Int, free: Int) -> String =
   | ------------- declared here
...
12 |   }
   |   ^
error[E003]: undefined variable 'net'
  --> /tmp/dojo-settle-health-0.almd:11:6
  in variable net
  here: (net, disk)
  hint: Add `import net` (stdlib: TCP and UDP sockets, name lookup and IP addresses)
Or run `almide fmt` to auto-add missing imports
  try:
      import net
   |
11 |     (net, disk)
   |      ^^^
error[E001]: type mismatch in fn 'health': expected String but got (Unknown, Int)
  --> /tmp/dojo-settle-health-0.almd:11:5
  in fn 'health'
  here: (net, disk)
  hint: Fix the expression type or change the expected type
   |
11 |     (net, disk)
   |     ^
error[E041]: implicit propagation of this binding's value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-settle-health-0.almd:10:16
  in implicit propagation
  here: let disk = check_disk(free)
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
  try:
      !
   |
10 |     let disk = check_disk(free)
   |                ^^^^^^^^^^^^^^^^

5 error(s) found
FAILED: /tmp/dojo-settle-health-0.almd
  parse error: `let` is not allowed inside fan.settle at line 9:5
  parse error: this indented line is not part of `effect fn health`: a body without braces is a single expression
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-settle-health-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
effect fn health(code: Int, free: Int) -> String = {
  let (net, disk) = fan.settle {
    let net = check_net(code)
    let disk = check_disk(free)
    (net, disk)
  }
  match (net, disk) {
    (ok(_), ok(_)) => "healthy"
    (err(_), ok(_)) => "net degraded"
    (ok(_), err(_)) => "disk degraded"
    (err(_), err(_)) => "down"
  }
}

fn check_net(code: Int) -> Result[Int, String] = 
  if code == 200 then ok(code) else err("net down")

fn check_disk(free: Int) -> Result[Int, String] = 
  if free > 10 then ok(free) else err("disk full")
```

**Diagnostic:**

```
error: `let` is not allowed inside fan.settle at line 3:5
  --> /tmp/dojo-settle-health-1.almd:3:5
  here: let net = check_net(code)
  hint: arms are expressions — wrap statements in a block arm: { let x = f(); g(x) }
  |
3 |     let net = check_net(code)
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:3 (got Match 'match')
  --> /tmp/dojo-settle-health-1.almd:7:3
  here: match (net, disk) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |   match (net, disk) {
  |   ^
error[E003]: undefined variable 'net'
  --> /tmp/dojo-settle-health-1.almd:5:6
  in variable net
  here: (net, disk)
  hint: Add `import net` (stdlib: TCP and UDP sockets, name lookup and IP addresses)
Or run `almide fmt` to auto-add missing imports
  try:
      import net
  |
5 |     (net, disk)
  |      ^^^
error[E001]: type mismatch in fn 'health': expected String but got (Unknown, Int)
  --> /tmp/dojo-settle-health-1.almd:5:5
  in fn 'health'
  here: (net, disk)
  hint: Fix the expression type or change the expected type
  |
5 |     (net, disk)
  |     ^
error[E041]: implicit propagation of this binding's value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-settle-health-1.almd:4:16
  in implicit propagation
  here: let disk = check_disk(free)
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
  try:
      !
  |
4 |     let disk = check_disk(free)
  |                ^^^^^^^^^^^^^^^^

5 error(s) found
FAILED: /tmp/dojo-settle-health-1.almd
  parse error: `let` is not allowed inside fan.settle at line 3:5
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:3 (got Match 'match')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-settle-health-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (PASS)

```almide
effect fn health(code: Int, free: Int) -> String = {
  let (net, disk) = fan.settle {
    check_net(code)
    check_disk(free)
  }
  match (net, disk) {
    (ok(_), ok(_)) => "healthy"
    (err(_), ok(_)) => "net degraded"
    (ok(_), err(_)) => "disk degraded"
    (err(_), err(_)) => "down"
  }
}

fn check_net(code: Int) -> Result[Int, String] = 
  if code == 200 then ok(code) else err("net down")

fn check_disk(free: Int) -> Result[Int, String] = 
  if free > 10 then ok(free) else err("disk full")
```
