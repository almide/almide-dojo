# settle-health

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **state**: `measured`
- **success**: yes
- **retries**: 1
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
  here: check_disk(free)
  hint: Fix the expression type or change the expected type. Or use `int.to_string(x)` to convert Int to String
   |
10 |     check_disk(free)
   |                ^^^^

3 error(s) found
FAILED: /tmp/dojo-settle-health-0.almd
Compile error for /tmp/dojo-settle-health-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn check_net(code: Int) -> Result[Int, String] =
  if code == 200 then ok(code) else err("net down")

fn check_disk(free: Int) -> Result[Int, String] =
  if free > 10 then ok(free) else err("disk full")

effect fn health(code: Int, free: Int) -> String =
  let (net, disk) = fan.settle {
    check_net(code)
    check_disk(free)
  }
  match (net, disk) {
    (ok(_), ok(_)) => "healthy",
    (err(_), ok(_)) => "net degraded",
    (ok(_), err(_)) => "disk degraded",
    (err(_), err(_)) => "down"
  }
```
