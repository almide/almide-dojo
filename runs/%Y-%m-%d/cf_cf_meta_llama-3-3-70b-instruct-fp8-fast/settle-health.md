# settle-health

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
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
  let (net, disk) = fan.settle { check_net(code); check_disk(free) }
  match (net, disk) {
    (ok(_), ok(_)) => "healthy",
    (err(_), ok(_)) => "net degraded",
    (ok(_), err(_)) => "disk degraded",
    (err(_), err(_)) => "down"
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-settle-health-0.almd
error[E003]: undefined variable 'fan'
  --> /tmp/dojo-settle-health-0.almd:8:21
  in variable fan
  hint: Check the variable name
  |
8 |   let (net, disk) = fan.settle { check_net(code); check_disk(free) }
  |                     ^^^

1 error(s) found
Compile error for /tmp/dojo-settle-health-0.almd:
compile failed
FAILED: /tmp/dojo-settle-health-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn check_net(code: Int) -> Result[Int, String] = 
  if code == 200 then ok(code) else err("net down")

fn check_disk(free: Int) -> Result[Int, String] = 
  if free > 10 then ok(free) else err("disk full")

effect fn health(code: Int, free: Int) -> String = 
  let (net, disk) = effect.fan.settle { check_net(code); check_disk(free) }
  match (net, disk) {
    (ok(_), ok(_)) => "healthy",
    (err(_), ok(_)) => "net degraded",
    (ok(_), err(_)) => "disk degraded",
    (err(_), err(_)) => "down"
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-settle-health-1.almd
error: Expected expression at line 8:21 (got Effect 'effect')
  --> /tmp/dojo-settle-health-1.almd:8:21
  |
8 |   let (net, disk) = effect.fan.settle { check_net(code); check_disk(free) }
  |                     ^
error[E003]: undefined variable 'net'
  --> /tmp/dojo-settle-health-1.almd:9:10
  in variable net
  hint: Check the variable name
  |
9 |   match (net, disk) {
  |          ^^^
error[E003]: undefined variable 'disk'
  --> /tmp/dojo-settle-health-1.almd:9:15
  in variable disk
  hint: Check the variable name
  |
9 |   match (net, disk) {
  |               ^^^^

3 error(s) found
Compile error for /tmp/dojo-settle-health-1.almd:
compile failed
FAILED: /tmp/dojo-settle-health-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn check_net(code: Int) -> Result[Int, String] = 
  if code == 200 then ok(code) else err("net down")

fn check_disk(free: Int) -> Result[Int, String] = 
  if free > 10 then ok(free) else err("disk full")

effect fn health(code: Int, free: Int) -> String = 
  let result = effect.fan.settle { check_net(code); check_disk(free) }
  match result {
    (ok(_), ok(_)) => "healthy",
    (err(_), ok(_)) => "net degraded",
    (ok(_), err(_)) => "disk degraded",
    (err(_), err(_)) => "down"
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-settle-health-2.almd
error: Expected expression at line 8:16 (got Effect 'effect')
  --> /tmp/dojo-settle-health-2.almd:8:16
  |
8 |   let result = effect.fan.settle { check_net(code); check_disk(free) }
  |                ^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-settle-health-2.almd:9:9
  in variable result
  hint: Check the variable name
  |
9 |   match result {
  |         ^^^^^^

2 error(s) found
Compile error for /tmp/dojo-settle-health-2.almd:
compile failed
FAILED: /tmp/dojo-settle-health-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn check_net(code: Int) -> Result[Int, String] = 
  if code == 200 then ok(code) else err("net down")

fn check_disk(free: Int) -> Result[Int, String] = 
  if free > 10 then ok(free) else err("disk full")

effect fn health(code: Int, free: Int) -> String = 
  let (net, disk) = effect.fan.settle { check_net(code); check_disk(free) }
  match (net, disk) {
    (ok(_), ok(_)) => "healthy",
    (err(_), ok(_)) => "net degraded",
    (ok(_), err(_)) => "disk degraded",
    (err(_), err(_)) => "down"
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-settle-health-3.almd
error: Expected expression at line 8:21 (got Effect 'effect')
  --> /tmp/dojo-settle-health-3.almd:8:21
  |
8 |   let (net, disk) = effect.fan.settle { check_net(code); check_disk(free) }
  |                     ^
error[E003]: undefined variable 'net'
  --> /tmp/dojo-settle-health-3.almd:9:10
  in variable net
  hint: Check the variable name
  |
9 |   match (net, disk) {
  |          ^^^
error[E003]: undefined variable 'disk'
  --> /tmp/dojo-settle-health-3.almd:9:15
  in variable disk
  hint: Check the variable name
  |
9 |   match (net, disk) {
  |               ^^^^

3 error(s) found
Compile error for /tmp/dojo-settle-health-3.almd:
compile failed
FAILED: /tmp/dojo-settle-health-3.almd

1/1 test file(s) failed

```
