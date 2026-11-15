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
  let (net, disk) = fan.settle { check_net(code); check_disk(free) } in
  match (net, disk) {
    (ok(_), ok(_)) => "healthy",
    (err(_), ok(_)) => "net degraded",
    (ok(_), err(_)) => "disk degraded",
    (err(_), err(_)) => "down"
  }
```

**Diagnostic:**

```
error: fan.settle arms are separated by `,` or a newline, not `;`, at line 8:49
  --> /tmp/dojo-settle-health-0.almd:8:49
  here: let (net, disk) = fan.settle { check_net(code); check_disk(free) } in
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
  |
8 |   let (net, disk) = fan.settle { check_net(code); check_disk(free) } in
  |                                                 ^
error[E003]: undefined variable 'net'
  --> /tmp/dojo-settle-health-0.almd:9:10
  in variable net
  here: match (net, disk) {
  hint: Add `import net` (stdlib: TCP and UDP sockets, name lookup and IP addresses)
Or run `almide fmt` to auto-add missing imports
  try:
      import net
  |
9 |   match (net, disk) {
  |          ^^^
error[E003]: undefined variable 'disk'
  --> /tmp/dojo-settle-health-0.almd:9:15
  in variable disk
  here: match (net, disk) {
  hint: Check the variable name
  |
9 |   match (net, disk) {
  |               ^^^^

3 error(s) found
FAILED: /tmp/dojo-settle-health-0.almd
  parse error: fan.settle arms are separated by `,` or a newline, not `;`, at line 8:49
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

effect fn health(code: Int, free: Int) -> String = 
  let (net_result, disk_result) = fan.settle { 
    check_net(code), 
    check_disk(free) 
  } in
  match (net_result, disk_result) {
    (ok(_), ok(_)) => "healthy",
    (err(_), ok(_)) => "net degraded",
    (ok(_), err(_)) => "disk degraded",
    (err(_), err(_)) => "down"
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
  let (net_result, disk_result) = fan.settle { 
    check_net(code), 
    check_disk(free) 
  }
  match (net_result, disk_result) {
    (ok(_), ok(_)) => "healthy",
    (err(_), ok(_)) => "net degraded",
    (ok(_), err(_)) => "disk degraded",
    (err(_), err(_)) => "down"
  }
```
