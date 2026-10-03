# race-cheapest

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

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
  match costs {
    | [] => -1
    | _ => fan.race(costs, (cost) => {
      let result = probe(cost)
      ok(result)
    }) ?? -1
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
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-race-cheapest-1.almd:3:5
  here: | [] => -1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | [] => -1
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:6 (got RParen ')')
  --> /tmp/dojo-race-cheapest-1.almd:7:6
  here: }) ?? -1
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |     }) ?? -1
  |      ^
error[E003]: undefined variable 'cost'
  --> /tmp/dojo-race-cheapest-1.almd:5:26
  in variable cost
  here: let result = probe(cost)
  hint: Did you mean `costs`?
  try:
      costs
  |
5 |       let result = probe(cost)
  |                          ^^^^

3 error(s) found
FAILED: /tmp/dojo-race-cheapest-1.almd
Compile error for /tmp/dojo-race-cheapest-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  match costs {
    | [] => -1
    | _ => fan.race(costs, (cost) => {
      let result = probe(cost)
      ok(result)
    }) ?? -1
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
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-race-cheapest-2.almd:3:5
  here: | [] => -1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | [] => -1
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:6 (got RParen ')')
  --> /tmp/dojo-race-cheapest-2.almd:7:6
  here: }) ?? -1
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |     }) ?? -1
  |      ^
error[E003]: undefined variable 'cost'
  --> /tmp/dojo-race-cheapest-2.almd:5:26
  in variable cost
  here: let result = probe(cost)
  hint: Did you mean `costs`?
  try:
      costs
  |
5 |       let result = probe(cost)
  |                          ^^^^

3 error(s) found
FAILED: /tmp/dojo-race-cheapest-2.almd
Compile error for /tmp/dojo-race-cheapest-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  match costs {
    | [] => -1
    | _ => fan.race(costs, (cost) => {
      let result = probe(cost)
      ok(result)
    }) ?? -1
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
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-race-cheapest-3.almd:3:5
  here: | [] => -1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | [] => -1
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:6 (got RParen ')')
  --> /tmp/dojo-race-cheapest-3.almd:7:6
  here: }) ?? -1
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |     }) ?? -1
  |      ^
error[E003]: undefined variable 'cost'
  --> /tmp/dojo-race-cheapest-3.almd:5:26
  in variable cost
  here: let result = probe(cost)
  hint: Did you mean `costs`?
  try:
      costs
  |
5 |       let result = probe(cost)
  |                          ^^^^

3 error(s) found
FAILED: /tmp/dojo-race-cheapest-3.almd
Compile error for /tmp/dojo-race-cheapest-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
