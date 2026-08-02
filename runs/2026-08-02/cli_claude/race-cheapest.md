# race-cheapest

- **model**: `cli:claude`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
import fan

fn probe(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  acc
}

effect fn cheapest_probe(costs: List[Int]) -> Int =
  fan.race(costs, (x) => ok(probe(x))) ?? -1
```

**Diagnostic:**

```
error: 'fan' is auto-available — it is a built-in surface, not a module, at line 1:8
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-race-cheapest-0.almd:1:8
  here: import fan
  hint: Remove the `import fan` line; fan.bounded / fan.race / fan.timeout are always in scope
  |
1 | import fan
  |        ^

1 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-race-cheapest-0.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-race-cheapest-0.almd

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn probe(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  acc
}

effect fn cheapest_probe(costs: List[Int]) -> Int =
  fan.race(costs, (x) => ok(probe(x))) ?? -1
```
