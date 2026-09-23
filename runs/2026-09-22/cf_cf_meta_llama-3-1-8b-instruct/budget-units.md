# budget-units

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E029`

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  var result = count_to(n)
  if budget.exhausted() then -1 else result
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
error[E002]: undefined method 'exhausted' on Compute
  --> /tmp/dojo-budget-units-0.almd:4:6
  in method call .exhausted()
  here: if budget.exhausted() then -1 else result
  hint: No function `exhausted` takes a Compute receiver: UFCS resolves `x.exhausted(…)` to `exhausted(x, …)`. Define `fn exhausted(Compute, …)`, or call the intended module function directly.
  |
4 |   if budget.exhausted() then -1 else result
  |      ^^^^^^

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
  if budget.exhausted() then -1 else result
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}

fn exhausted(budget: Compute) -> Bool = {
  budget.exhausted()
}
```

**Diagnostic:**

```
error[E029]: unknown type 'Compute'
  at line 11
  in parameter 'budget'
  here: acc
  hint: no `type Compute` is declared (or imported) in this program — declare it, or check the spelling
   |
11 |   acc
   |   ^^^^^^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-budget-units-1.almd
Compile error for /tmp/dojo-budget-units-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  var result = count_to(n)
  if budget.exhausted() then -1 else result
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}

fn exhausted(budget: Int) -> Bool = {
  budget == 0
}
```

**Diagnostic:**

```
error[E005]: argument 'budget' expects Int but got Compute
  --> /tmp/dojo-budget-units-2.almd:4:6
  in call to exhausted()
  here: if budget.exhausted() then -1 else result
  hint: Fix the argument type
   |
14 | fn exhausted(budget: Int) -> Bool = {
   | --------------------------- fn exhausted() defined here
...
4 |   if budget.exhausted() then -1 else result
  |      ^^^^^^

1 error(s) found
FAILED: /tmp/dojo-budget-units-2.almd
Compile error for /tmp/dojo-budget-units-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  var result = count_to(n)
  if budget.exhausted() then -1 else result
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}

fn exhausted(budget: Compute) -> Bool = {
  budget.exhausted()
}
```

**Diagnostic:**

```
error[E029]: unknown type 'Compute'
  at line 11
  in parameter 'budget'
  here: acc
  hint: no `type Compute` is declared (or imported) in this program — declare it, or check the spelling
   |
11 |   acc
   |   ^^^^^^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-budget-units-3.almd
Compile error for /tmp/dojo-budget-units-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
