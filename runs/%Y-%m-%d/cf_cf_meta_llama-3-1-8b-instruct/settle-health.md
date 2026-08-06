# settle-health

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn check_net(code: Int) -> Result[Int, String] = {
  if code == 200 then ok(code) else err("net down")
}

fn check_disk(free: Int) -> Result[Int, String] = {
  if free > 10 then ok(free) else err("disk full")
}

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
```

**Diagnostic:**

```
Compiling /tmp/dojo-settle-health-0.almd
error[E003]: undefined variable 'fan'
  --> /tmp/dojo-settle-health-0.almd:10:21
  in variable fan
  hint: Check the variable name
   |
10 |   let (net, disk) = fan.settle {
   |                     ^^^

1 error(s) found
Compile error for /tmp/dojo-settle-health-0.almd:
compile failed
FAILED: /tmp/dojo-settle-health-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn check_net(code: Int) -> Result[Int, String] = {
  if code == 200 then ok(code) else err("net down")
}

fn check_disk(free: Int) -> Result[Int, String] = {
  if free > 10 then ok(free) else err("disk full")
}

effect fn health(code: Int, free: Int) -> String = {
  let (net, disk) = result.settle {
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
```

**Diagnostic:**

```
Compiling /tmp/dojo-settle-health-1.almd
error[E003]: undefined variable 'result'
  --> /tmp/dojo-settle-health-1.almd:10:21
  in variable result
  hint: Check the variable name
   |
10 |   let (net, disk) = result.settle {
   |                     ^^^^^^

1 error(s) found
Compile error for /tmp/dojo-settle-health-1.almd:
compile failed
FAILED: /tmp/dojo-settle-health-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn check_net(code: Int) -> Result[Int, String] = {
  if code == 200 then ok(code) else err("net down")
}

fn check_disk(free: Int) -> Result[Int, String] = {
  if free > 10 then ok(free) else err("disk full")
}

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
```

**Diagnostic:**

```
Compiling /tmp/dojo-settle-health-2.almd
error[E003]: undefined variable 'fan'
  --> /tmp/dojo-settle-health-2.almd:10:21
  in variable fan
  hint: Check the variable name
   |
10 |   let (net, disk) = fan.settle {
   |                     ^^^

1 error(s) found
Compile error for /tmp/dojo-settle-health-2.almd:
compile failed
FAILED: /tmp/dojo-settle-health-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn check_net(code: Int) -> Result[Int, String] = {
  if code == 200 then ok(code) else err("net down")
}

fn check_disk(free: Int) -> Result[Int, String] = {
  if free > 10 then ok(free) else err("disk full")
}

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
```

**Diagnostic:**

```
Compiling /tmp/dojo-settle-health-3.almd
error[E003]: undefined variable 'fan'
  --> /tmp/dojo-settle-health-3.almd:10:21
  in variable fan
  hint: Check the variable name
   |
10 |   let (net, disk) = fan.settle {
   |                     ^^^

1 error(s) found
Compile error for /tmp/dojo-settle-health-3.almd:
compile failed
FAILED: /tmp/dojo-settle-health-3.almd

1/1 test file(s) failed

```
