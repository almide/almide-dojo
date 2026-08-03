# race-cheapest

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E010`

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fan.race(costs, (cost) => {
    match probe(cost) {
      some(result) => ok(result),
      none => err("probe failed")
    }
  }) ?? -1
}

fn probe(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-cheapest-0.almd
error[E010]: non-exhaustive match: missing _
  --> /tmp/dojo-race-cheapest-0.almd:3:17
  in match
  hint: match on Int requires a catch-all '_' pattern
  |
3 |     match probe(cost) {
  |                 ^^^^
error: fan.race() expects 1 argument but got 2
  --> /tmp/dojo-race-cheapest-0.almd:5:19
  in call to fan.race()
  hint: Usage: fan.race([fn() => a, fn() => b])
  |
5 |       none => err("probe failed")
  |                   ^^^^^^^^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-race-cheapest-0.almd:
compile failed
FAILED: /tmp/dojo-race-cheapest-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fan.race(costs, (cost) => {
    match probe(cost) {
      some(result) => ok(result),
      none => err("probe failed")
    }
  }) ?? -1
}

fn probe(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-cheapest-1.almd
error[E010]: non-exhaustive match: missing _
  --> /tmp/dojo-race-cheapest-1.almd:3:17
  in match
  hint: match on Int requires a catch-all '_' pattern
  |
3 |     match probe(cost) {
  |                 ^^^^
error: fan.race() expects 1 argument but got 2
  --> /tmp/dojo-race-cheapest-1.almd:5:19
  in call to fan.race()
  hint: Usage: fan.race([fn() => a, fn() => b])
  |
5 |       none => err("probe failed")
  |                   ^^^^^^^^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-race-cheapest-1.almd:
compile failed
FAILED: /tmp/dojo-race-cheapest-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fan.race(costs, (cost) => {
    match probe(cost) {
      some(result) => ok(result),
      none => err("probe failed")
    }
  }) ?? -1
}

fn probe(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-cheapest-2.almd
error[E010]: non-exhaustive match: missing _
  --> /tmp/dojo-race-cheapest-2.almd:3:17
  in match
  hint: match on Int requires a catch-all '_' pattern
  |
3 |     match probe(cost) {
  |                 ^^^^
error: fan.race() expects 1 argument but got 2
  --> /tmp/dojo-race-cheapest-2.almd:5:19
  in call to fan.race()
  hint: Usage: fan.race([fn() => a, fn() => b])
  |
5 |       none => err("probe failed")
  |                   ^^^^^^^^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-race-cheapest-2.almd:
compile failed
FAILED: /tmp/dojo-race-cheapest-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fan.race(costs, (cost) => {
    match probe(cost) {
      some(result) => ok(result),
      none => err("probe failed")
    }
  }) ?? -1
}

fn probe(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-cheapest-3.almd
error[E010]: non-exhaustive match: missing _
  --> /tmp/dojo-race-cheapest-3.almd:3:17
  in match
  hint: match on Int requires a catch-all '_' pattern
  |
3 |     match probe(cost) {
  |                 ^^^^
error: fan.race() expects 1 argument but got 2
  --> /tmp/dojo-race-cheapest-3.almd:5:19
  in call to fan.race()
  hint: Usage: fan.race([fn() => a, fn() => b])
  |
5 |       none => err("probe failed")
  |                   ^^^^^^^^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-race-cheapest-3.almd:
compile failed
FAILED: /tmp/dojo-race-cheapest-3.almd

1/1 test file(s) failed

```
