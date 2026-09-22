# settle-health

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

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
    check_disk(free);
  }
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
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 11:3 (got RBrace '}')
  --> /tmp/dojo-settle-health-0.almd:11:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |   }
   |   ^
error[E001]: type mismatch in fn 'health': expected String but got Int
  --> /tmp/dojo-settle-health-0.almd:10:16
  in fn 'health'
  here: check_disk(free);
  hint: Fix the expression type or change the expected type. Or use `int.to_string(x)` to convert Int to String
   |
10 |     check_disk(free);
   |                ^^^^

3 error(s) found
FAILED: /tmp/dojo-settle-health-0.almd
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

effect fn health(code: Int, free: Int) -> String = 
  let (net, disk) = fan.settle {
    check_net(code);
    check_disk(free);
  }
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
  --> /tmp/dojo-settle-health-1.almd:9:20
  here: check_net(code);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
  |
9 |     check_net(code);
  |                    ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 11:3 (got RBrace '}')
  --> /tmp/dojo-settle-health-1.almd:11:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |   }
   |   ^
error[E001]: type mismatch in fn 'health': expected String but got Int
  --> /tmp/dojo-settle-health-1.almd:10:16
  in fn 'health'
  here: check_disk(free);
  hint: Fix the expression type or change the expected type. Or use `int.to_string(x)` to convert Int to String
   |
10 |     check_disk(free);
   |                ^^^^

3 error(s) found
FAILED: /tmp/dojo-settle-health-1.almd
Compile error for /tmp/dojo-settle-health-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn check_net(code: Int) -> Result[Int, String] = 
  if code == 200 then ok(code) else err("net down")

fn check_disk(free: Int) -> Result[Int, String] = 
  if free > 10 then ok(free) else err("disk full")

effect fn health(code: Int, free: Int) -> String = 
  let (net, disk) = fan.settle {
    let net = check_net(code);
    let disk = check_disk(free);
    (net, disk)
  }
  match (net, disk) {
    (ok(_), ok(_)) => "healthy",
    (err(_), ok(_)) => "net degraded",
    (ok(_), err(_)) => "disk degraded",
    (err(_), err(_)) => "down"
  }
```

**Diagnostic:**

```
error: `let` is not allowed inside fan.settle at line 9:5
  --> /tmp/dojo-settle-health-2.almd:9:5
  here: let net = check_net(code);
  hint: arms are expressions — wrap statements in a block arm: { let x = f(); g(x) }
  |
9 |     let net = check_net(code);
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 12:3 (got RBrace '}')
  --> /tmp/dojo-settle-health-2.almd:12:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |   }
   |   ^
error[E003]: undefined variable 'net'
  --> /tmp/dojo-settle-health-2.almd:11:6
  in variable net
  here: (net, disk)
  hint: Check the variable name
   |
11 |     (net, disk)
   |      ^^^
error[E001]: type mismatch in fn 'health': expected String but got (Unknown, Int)
  --> /tmp/dojo-settle-health-2.almd:11:11
  in fn 'health'
  here: (net, disk)
  hint: Fix the expression type or change the expected type
   |
11 |     (net, disk)
   |           ^^^^
error[E041]: implicit propagation of this binding's value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-settle-health-2.almd:10:16
  in implicit propagation
  here: let disk = check_disk(free);
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
  try:
      !
   |
10 |     let disk = check_disk(free);
   |                ^^^^^^^^^^^^^^^^

5 error(s) found
FAILED: /tmp/dojo-settle-health-2.almd
Compile error for /tmp/dojo-settle-health-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn check_net(code: Int) -> Result[Int, String] = 
  if code == 200 then ok(code) else err("net down")

fn check_disk(free: Int) -> Result[Int, String] = 
  if free > 10 then ok(free) else err("disk full")

effect fn health(code: Int, free: Int) -> String = 
  let (net, disk) = fan.settle {
    check_net(code);
    check_disk(free)
  }
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
  --> /tmp/dojo-settle-health-3.almd:9:20
  here: check_net(code);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
  |
9 |     check_net(code);
  |                    ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 11:3 (got RBrace '}')
  --> /tmp/dojo-settle-health-3.almd:11:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |   }
   |   ^
error[E001]: type mismatch in fn 'health': expected String but got Int
  --> /tmp/dojo-settle-health-3.almd:10:16
  in fn 'health'
  here: check_disk(free)
  hint: Fix the expression type or change the expected type. Or use `int.to_string(x)` to convert Int to String
   |
10 |     check_disk(free)
   |                ^^^^

3 error(s) found
FAILED: /tmp/dojo-settle-health-3.almd
Compile error for /tmp/dojo-settle-health-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
