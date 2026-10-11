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
  if list.is_empty(costs) { -1 }
  else {
    let (winning_cost, _) = fan.race(costs, (cost) => {
      let result = probe(cost)
      ok(result)
    }) ?? (-1, -1)
    winning_cost
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
error: Expected Then at line 2:27 (got LBrace '{')
  --> /tmp/dojo-race-cheapest-1.almd:2:27
  here: if list.is_empty(costs) { -1 }
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if list.is_empty(costs) { -1 }
  |                           ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 3:3 (got Else 'else')
  --> /tmp/dojo-race-cheapest-1.almd:3:3
  here: else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   else {
  |   ^

2 error(s) found
FAILED: /tmp/dojo-race-cheapest-1.almd
Compile error for /tmp/dojo-race-cheapest-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  if list.is_empty(costs) then -1
  else {
    let (winning_cost, _) = fan.race(costs, (cost) => {
      let result = probe(cost)
      ok(result)
    }) ?? (-1, -1)
    winning_cost
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
  --> /tmp/dojo-race-cheapest-2.almd:7:17
  in tuple destructure
  here: }) ?? (-1, -1)
  hint: Destructure only tuples: `let (a, b) = pair`
  |
7 |     }) ?? (-1, -1)
  |                 ^
error[E001]: type mismatch in ?? fallback: expected Int but got (Int, Int)
  --> /tmp/dojo-race-cheapest-2.almd:7:17
  in ?? fallback
  here: }) ?? (-1, -1)
  hint: Fix the expression type or change the expected type
  |
7 |     }) ?? (-1, -1)
  |                 ^

2 error(s) found
FAILED: /tmp/dojo-race-cheapest-2.almd
Compile error for /tmp/dojo-race-cheapest-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  if list.is_empty(costs) then -1
  else {
    let (winning_cost, _) = fan.race(costs, (cost) => {
      let result = probe(cost)
      ok(result)
    }) ?? (-1, -1)
    match winning_cost {
      some(cost) => cost,
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
error[E001]: tuple pattern requires a tuple value, got Int
  --> /tmp/dojo-race-cheapest-3.almd:7:17
  in tuple destructure
  here: }) ?? (-1, -1)
  hint: Destructure only tuples: `let (a, b) = pair`
  |
7 |     }) ?? (-1, -1)
  |                 ^
error[E001]: type mismatch in ?? fallback: expected Int but got (Int, Int)
  --> /tmp/dojo-race-cheapest-3.almd:7:17
  in ?? fallback
  here: }) ?? (-1, -1)
  hint: Fix the expression type or change the expected type
  |
7 |     }) ?? (-1, -1)
  |                 ^

2 error(s) found
FAILED: /tmp/dojo-race-cheapest-3.almd
Compile error for /tmp/dojo-race-cheapest-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
