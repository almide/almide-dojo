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
    let (winner, _) = fan.race(costs, (cost) => {
      let result = probe(cost)
      ok(result)
    })
    winner
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
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-cheapest-1.almd:5:10
  in tuple destructure
  here: ok(result)
  hint: Destructure only tuples: `let (a, b) = pair`
  |
5 |       ok(result)
  |          ^^^^^^

1 error(s) found
FAILED: /tmp/dojo-race-cheapest-1.almd
Compile error for /tmp/dojo-race-cheapest-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  if list.is_empty(costs) then -1 else {
    let (winner, _) = fan.race(costs, (cost) => {
      let result = probe(cost)
      ok(result)
    })
    match winner {
      some(w) => w,
      none => -1
    }
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
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-cheapest-2.almd:5:10
  in tuple destructure
  here: ok(result)
  hint: Destructure only tuples: `let (a, b) = pair`
  |
5 |       ok(result)
  |          ^^^^^^

1 error(s) found
FAILED: /tmp/dojo-race-cheapest-2.almd
Compile error for /tmp/dojo-race-cheapest-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  if list.is_empty(costs) then -1 else {
    let (winner, _) = fan.race(costs, (cost) => {
      let result = probe(cost)
      ok(result)
    })
    match winner {
      some(w) => w,
      none => -1
    }
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
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-cheapest-3.almd:5:10
  in tuple destructure
  here: ok(result)
  hint: Destructure only tuples: `let (a, b) = pair`
  |
5 |       ok(result)
  |          ^^^^^^

1 error(s) found
FAILED: /tmp/dojo-race-cheapest-3.almd
Compile error for /tmp/dojo-race-cheapest-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
