# race-cheapest

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fan.race(costs, (cost) => {
    let result = probe(cost)
    ok(result)
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
FAILED: /tmp/dojo-race-cheapest-0.almd
Compile error for /tmp/dojo-race-cheapest-0.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  if list.is_empty(costs) then -1 else {
    let (winning_cost, winning_result) = fan.race(costs, (cost) => {
      let result = probe(cost)
      ok(result)
    }) ?? (-1, -1)
    winning_result
  }
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
error[E001]: tuple pattern requires a tuple value, got Int
  --> /tmp/dojo-race-cheapest-1.almd:6:17
  in tuple destructure
  here: }) ?? (-1, -1)
  hint: Destructure only tuples: `let (a, b) = pair`
  |
6 |     }) ?? (-1, -1)
  |                 ^
error[E001]: type mismatch in ?? fallback: expected Int but got (Int, Int)
  --> /tmp/dojo-race-cheapest-1.almd:6:17
  in ?? fallback
  here: }) ?? (-1, -1)
  hint: Fix the expression type or change the expected type
  |
6 |     }) ?? (-1, -1)
  |                 ^

2 error(s) found
FAILED: /tmp/dojo-race-cheapest-1.almd
Compile error for /tmp/dojo-race-cheapest-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  if list.is_empty(costs) then -1 else {
    let (winning_cost, winning_result) = fan.race(costs, (cost) => {
      let result = probe(cost)
      ok(result)
    }) ?? (ok(-1), ok(-1))
    winning_result.unwrap_or(-1)
  }
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
error[E001]: tuple pattern requires a tuple value, got Int
  --> /tmp/dojo-race-cheapest-2.almd:6:24
  in tuple destructure
  here: }) ?? (ok(-1), ok(-1))
  hint: Destructure only tuples: `let (a, b) = pair`
  |
6 |     }) ?? (ok(-1), ok(-1))
  |                        ^
error[E001]: type mismatch in ?? fallback: expected Int but got (Result[Int, ?5], Result[Int, ?6])
  --> /tmp/dojo-race-cheapest-2.almd:6:24
  in ?? fallback
  here: }) ?? (ok(-1), ok(-1))
  hint: Fix the expression type or change the expected type
  |
6 |     }) ?? (ok(-1), ok(-1))
  |                        ^

2 error(s) found
FAILED: /tmp/dojo-race-cheapest-2.almd
Compile error for /tmp/dojo-race-cheapest-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  if list.is_empty(costs) then -1 else {
    let (winning_cost, winning_result) = fan.race(costs, (cost) => {
      let result = probe(cost)
      ok(result)
    }) ?? (ok(-1), ok(-1))
    let (_, winning_result) = winning_result
    winning_result.unwrap_or(-1)
  }
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
error[E001]: tuple pattern requires a tuple value, got Int
  --> /tmp/dojo-race-cheapest-3.almd:6:24
  in tuple destructure
  here: }) ?? (ok(-1), ok(-1))
  hint: Destructure only tuples: `let (a, b) = pair`
  |
6 |     }) ?? (ok(-1), ok(-1))
  |                        ^
error[E001]: type mismatch in ?? fallback: expected Int but got (Result[Int, ?5], Result[Int, ?6])
  --> /tmp/dojo-race-cheapest-3.almd:6:24
  in ?? fallback
  here: }) ?? (ok(-1), ok(-1))
  hint: Fix the expression type or change the expected type
  |
6 |     }) ?? (ok(-1), ok(-1))
  |                        ^

2 error(s) found
FAILED: /tmp/dojo-race-cheapest-3.almd
Compile error for /tmp/dojo-race-cheapest-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
