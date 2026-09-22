# race-cheapest

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fn probe(n: Int) -> Int = {
    var i = 0
    var acc = 0
    while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
    acc
  }

  fan.race(costs, (x) => ok(probe(x))) ?? -1
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-race-cheapest-0.almd:2:3
  in nested fn
  here: fn probe(n: Int) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn probe(n: Int) -> Int = {
  |   ^^

1 error(s) found
FAILED: /tmp/dojo-race-cheapest-0.almd
Compile error for /tmp/dojo-race-cheapest-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn probe(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  acc
}

effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fan.race(costs, (x) => ok(probe(x))) ?? -1
}
```

**Diagnostic:**

```
FAILED: /tmp/dojo-race-cheapest-1.almd
Compile error for /tmp/dojo-race-cheapest-1.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn probe(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  acc
}

effect fn cheapest_probe(costs: List[Int]) -> Int = {
  if list.is_empty(costs) then -1
  else fan.race(costs, (x) => ok(probe(x))) ?? -1
}
```

**Diagnostic:**

```
FAILED: /tmp/dojo-race-cheapest-2.almd
Compile error for /tmp/dojo-race-cheapest-2.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn probe(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  acc
}

effect fn cheapest_probe(costs: List[Int]) -> Int = {
  if list.is_empty(costs) then -1
  else fan.race(costs, (x) => ok(probe(x))) ?? -1
}
```

**Diagnostic:**

```
FAILED: /tmp/dojo-race-cheapest-3.almd
Compile error for /tmp/dojo-race-cheapest-3.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
