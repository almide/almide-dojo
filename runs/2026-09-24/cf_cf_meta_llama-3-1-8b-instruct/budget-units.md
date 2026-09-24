# budget-units

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  var result = count_to(n)
  if budget == compute.empty then -1
  else result
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
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-budget-units-0.almd:4:16
  in variable compute
  here: if budget == compute.empty then -1
  hint: Check the variable name
  |
4 |   if budget == compute.empty then -1
  |                ^^^^^^^
error: cannot compare Compute with Unknown — both sides must be Compute
  --> /tmp/dojo-budget-units-0.almd:4:16
  in operator ==
  here: if budget == compute.empty then -1
  hint: A bare number is never a time — wrap it: compute.ms(n)
  |
4 |   if budget == compute.empty then -1
  |                ^^^^^^^

2 error(s) found
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
  if budget == compute.empty then -1
  else result
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
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-budget-units-1.almd:4:16
  in variable compute
  here: if budget == compute.empty then -1
  hint: Check the variable name
  |
4 |   if budget == compute.empty then -1
  |                ^^^^^^^
error: cannot compare Compute with Unknown — both sides must be Compute
  --> /tmp/dojo-budget-units-1.almd:4:16
  in operator ==
  here: if budget == compute.empty then -1
  hint: A bare number is never a time — wrap it: compute.ms(n)
  |
4 |   if budget == compute.empty then -1
  |                ^^^^^^^

2 error(s) found
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
  if budget == compute.empty then -1
  else result
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
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-budget-units-2.almd:4:16
  in variable compute
  here: if budget == compute.empty then -1
  hint: Check the variable name
  |
4 |   if budget == compute.empty then -1
  |                ^^^^^^^
error: cannot compare Compute with Unknown — both sides must be Compute
  --> /tmp/dojo-budget-units-2.almd:4:16
  in operator ==
  here: if budget == compute.empty then -1
  hint: A bare number is never a time — wrap it: compute.ms(n)
  |
4 |   if budget == compute.empty then -1
  |                ^^^^^^^

2 error(s) found
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
  if budget == compute.empty then -1
  else result
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
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-budget-units-3.almd:4:16
  in variable compute
  here: if budget == compute.empty then -1
  hint: Check the variable name
  |
4 |   if budget == compute.empty then -1
  |                ^^^^^^^
error: cannot compare Compute with Unknown — both sides must be Compute
  --> /tmp/dojo-budget-units-3.almd:4:16
  in operator ==
  here: if budget == compute.empty then -1
  hint: A bare number is never a time — wrap it: compute.ms(n)
  |
4 |   if budget == compute.empty then -1
  |                ^^^^^^^

2 error(s) found
FAILED: /tmp/dojo-budget-units-3.almd
Compile error for /tmp/dojo-budget-units-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
