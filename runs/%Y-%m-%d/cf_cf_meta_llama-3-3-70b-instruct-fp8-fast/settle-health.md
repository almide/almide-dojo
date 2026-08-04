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
Compiling /tmp/dojo-settle-health-0.almd
error[E003]: undefined variable 'fan'
  --> /tmp/dojo-settle-health-0.almd:8:21
  in variable fan
  hint: Check the variable name
  |
8 |   let (net, disk) = fan.settle {
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
  let (net, disk) = value.fan_settle { 
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
Compiling /tmp/dojo-settle-health-1.almd
error[E003]: undefined variable 'value'
  --> /tmp/dojo-settle-health-1.almd:8:21
  in variable value
  hint: Check the variable name
  |
8 |   let (net, disk) = value.fan_settle {
  |                     ^^^^^

1 error(s) found
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
Compiling /tmp/dojo-settle-health-2.almd
error[E003]: undefined variable 'fan'
  --> /tmp/dojo-settle-health-2.almd:8:21
  in variable fan
  hint: Check the variable name
  |
8 |   let (net, disk) = fan.settle {
  |                     ^^^

1 error(s) found
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
  let (net, disk) = effect.fan.settle { 
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
Compiling /tmp/dojo-settle-health-3.almd
error: Expected expression at line 8:21 (got Effect 'effect')
  --> /tmp/dojo-settle-health-3.almd:8:21
  |
8 |   let (net, disk) = effect.fan.settle {
  |                     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:3 (got RBrace '}')
  --> /tmp/dojo-settle-health-3.almd:11:3
   |
11 |   }
   |   ^
error[E001]: type mismatch in fn 'health': expected String but got Int
  --> /tmp/dojo-settle-health-3.almd:10:16
  in fn 'health'
  hint: Fix the expression type or change the expected type. Or use `int.to_string(x)` to convert Int to String
   |
10 |     check_disk(free)
   |                ^^^^

3 error(s) found
Compile error for /tmp/dojo-settle-health-3.almd:
compile failed
FAILED: /tmp/dojo-settle-health-3.almd

1/1 test file(s) failed

```
