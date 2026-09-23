# race-cheapest

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E010`

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fan.race(costs, (cost) => {
    probe(cost) ?? -1
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
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-race-cheapest-0.almd:3:21
  in operator ??
  here: probe(cost) ?? -1
  hint: Use '??' only on Option[T] or Result[T, E] values
  |
3 |     probe(cost) ?? -1
  |                     ^
error: fan.race mapper must return a Result, got Int
  --> /tmp/dojo-race-cheapest-0.almd:3:21
  in fan.race mapper
  here: probe(cost) ?? -1
  hint: Return ok(value) to compete and err(reason) to disqualify the element — the mapper-form contract (like fan.map)
  |
3 |     probe(cost) ?? -1
  |                     ^
error[E001]: type mismatch in fan.race mapper: expected fn(Int) -> Int but got fn(Int) -> Result[Int, String]
  --> /tmp/dojo-race-cheapest-0.almd:3:21
  in fan.race mapper
  here: probe(cost) ?? -1
  hint: Fix the expression type or change the expected type
  |
3 |     probe(cost) ?? -1
  |                     ^

3 error(s) found
FAILED: /tmp/dojo-race-cheapest-0.almd
Compile error for /tmp/dojo-race-cheapest-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fan.race(costs, (cost) => {
    match probe(cost) {
      some(x) => ok(x),
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
error[E010]: non-exhaustive match: missing _
  --> /tmp/dojo-race-cheapest-1.almd:3:17
  in match
  here: match probe(cost) {
  hint: match on Int requires a catch-all '_' pattern
  |
3 |     match probe(cost) {
  |                 ^^^^
error: pattern `some(..)` cannot match Int — the subject is not an Option
  --> /tmp/dojo-race-cheapest-1.almd:3:17
  in match pattern
  here: match probe(cost) {
  hint: the value is already a plain Int. If it comes from an effect-fn call, auto-`?` has unwrapped it — use the value directly, or `?? <default>` on the producing call for a fallback
  |
3 |     match probe(cost) {
  |                 ^^^^
error: pattern `none` cannot match Int — the subject is not an Option
  --> /tmp/dojo-race-cheapest-1.almd:4:21
  in match pattern
  here: some(x) => ok(x),
  hint: the value is already a plain Int. If it comes from an effect-fn call, auto-`?` has unwrapped it — use the value directly, or `?? <default>` on the producing call for a fallback
  |
4 |       some(x) => ok(x),
  |                     ^

3 error(s) found
FAILED: /tmp/dojo-race-cheapest-1.almd
Compile error for /tmp/dojo-race-cheapest-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fan.race(costs, (cost) => {
    match probe(cost) {
      _ => ok(probe(cost))
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
FAILED: /tmp/dojo-race-cheapest-2.almd
Compile error for /tmp/dojo-race-cheapest-2.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fan.race(costs, (cost) => {
    match probe(cost) {
      some(x) => ok(x),
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
error[E010]: non-exhaustive match: missing _
  --> /tmp/dojo-race-cheapest-3.almd:3:17
  in match
  here: match probe(cost) {
  hint: match on Int requires a catch-all '_' pattern
  |
3 |     match probe(cost) {
  |                 ^^^^
error: pattern `some(..)` cannot match Int — the subject is not an Option
  --> /tmp/dojo-race-cheapest-3.almd:3:17
  in match pattern
  here: match probe(cost) {
  hint: the value is already a plain Int. If it comes from an effect-fn call, auto-`?` has unwrapped it — use the value directly, or `?? <default>` on the producing call for a fallback
  |
3 |     match probe(cost) {
  |                 ^^^^
error: pattern `none` cannot match Int — the subject is not an Option
  --> /tmp/dojo-race-cheapest-3.almd:4:21
  in match pattern
  here: some(x) => ok(x),
  hint: the value is already a plain Int. If it comes from an effect-fn call, auto-`?` has unwrapped it — use the value directly, or `?? <default>` on the producing call for a fallback
  |
4 |       some(x) => ok(x),
  |                     ^

3 error(s) found
FAILED: /tmp/dojo-race-cheapest-3.almd
Compile error for /tmp/dojo-race-cheapest-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
