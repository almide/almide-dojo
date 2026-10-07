# budget-units

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  var result = count_to(n)
  if budget == compute.empty() then result else -1
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
error: unknown unit 'compute.empty'
  --> /tmp/dojo-budget-units-0.almd:4:16
  in call to compute.empty()
  here: if budget == compute.empty() then result else -1
  hint: The unit set is closed: compute.ns / us / ms / s / min / h
  |
4 |   if budget == compute.empty() then result else -1
  |                ^^^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-budget-units-0.almd
Compile error for /tmp/dojo-budget-units-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  var result = count_to(n)
  if budget == compute.ns(0) then result else -1
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
FAILED: /tmp/dojo-budget-units-1.almd
  test: budget admits small work
  at:   /tmp/dojo-budget-units-1.almd:16
  expected: Ok(4950)
  found:    Ok(-1)
  test: microseconds alone admit tiny work
  at:   /tmp/dojo-budget-units-1.almd:20
  expected: Ok(45)
  found:    Ok(-1)
  test: zero budget still admits constant work
  at:   /tmp/dojo-budget-units-1.almd:24
  expected: Ok(0)
  found:    Ok(-1)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  var result = count_to(n)
  if budget == compute.ns(0) then result else -1
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
FAILED: /tmp/dojo-budget-units-2.almd
  test: budget admits small work
  at:   /tmp/dojo-budget-units-2.almd:16
  expected: Ok(4950)
  found:    Ok(-1)
  test: microseconds alone admit tiny work
  at:   /tmp/dojo-budget-units-2.almd:20
  expected: Ok(45)
  found:    Ok(-1)
  test: zero budget still admits constant work
  at:   /tmp/dojo-budget-units-2.almd:24
  expected: Ok(0)
  found:    Ok(-1)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  var result = count_to(n)
  if budget == compute.ns(0) then result else -1
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
FAILED: /tmp/dojo-budget-units-3.almd
  test: budget admits small work
  at:   /tmp/dojo-budget-units-3.almd:16
  expected: Ok(4950)
  found:    Ok(-1)
  test: microseconds alone admit tiny work
  at:   /tmp/dojo-budget-units-3.almd:20
  expected: Ok(45)
  found:    Ok(-1)
  test: zero budget still admits constant work
  at:   /tmp/dojo-budget-units-3.almd:24
  expected: Ok(0)
  found:    Ok(-1)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
