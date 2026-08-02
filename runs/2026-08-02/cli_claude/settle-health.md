# settle-health

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

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
