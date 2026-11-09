# budget-units

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

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
  budget.expired()
}
```

**Diagnostic:**

```
error[E002]: undefined method 'expired' on Compute
  --> /tmp/dojo-budget-units-1.almd:15:3
  in method call .expired()
  here: budget.expired()
  hint: No function `expired` takes a Compute receiver: UFCS resolves `x.expired(…)` to `expired(x, …)`. Define `fn expired(Compute, …)`, or call the intended module function directly.
   |
15 |   budget.expired()
   |   ^^^^^^

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

fn exhausted(budget: Compute) -> Bool = {
  budget.expired()
}

fn expired(budget: Compute, time: Time) -> Bool = {
  time > budget
}
```

**Diagnostic:**

```
error[E029]: unknown type 'Time'
  --> /tmp/dojo-budget-units-2.almd:18:35
  in parameter 'time'
  here: fn expired(budget: Compute, time: Time) -> Bool = {
  hint: no `type Time` is declared (or imported) in this program — declare it, or check the spelling
   |
18 | fn expired(budget: Compute, time: Time) -> Bool = {
   |                                   ^^^^
error[E004]: expired() expects 2 argument(s) but got 1
  --> /tmp/dojo-budget-units-2.almd:15:3
  in call to expired()
  here: budget.expired()
  hint: Check the number of arguments
  try:
      // expired() takes 2 arg(s) — you passed 1
      expired(<budget: Compute>, <time: Time>)
   |
15 |   budget.expired()
   |   ^^^^^^
error: cannot compare Time with Compute — both sides must be Compute
  --> /tmp/dojo-budget-units-2.almd:19:10
  in operator >
  here: time > budget
  hint: A bare number is never a time — wrap it: compute.ms(n)
   |
19 |   time > budget
   |          ^^^^^^

3 error(s) found
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
  if budget.expired(compute.now()) then -1 else result
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}

fn expired(budget: Compute, time: Time) -> Bool = {
  time > budget
}

fn compute.now() -> Time = {
  compute.us(0)
}
```

**Diagnostic:**

```
error: Expected LParen at line 18:11 (got Dot '.')
  --> /tmp/dojo-budget-units-3.almd:18:11
  here: fn compute.now() -> Time = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 | fn compute.now() -> Time = {
   |           ^
error[E029]: unknown type 'Time'
  --> /tmp/dojo-budget-units-3.almd:14:35
  in parameter 'time'
  here: fn expired(budget: Compute, time: Time) -> Bool = {
  hint: no `type Time` is declared (or imported) in this program — declare it, or check the spelling
   |
14 | fn expired(budget: Compute, time: Time) -> Bool = {
   |                                   ^^^^
error: unknown unit 'compute.now'
  --> /tmp/dojo-budget-units-3.almd:4:21
  in call to compute.now()
  here: if budget.expired(compute.now()) then -1 else result
  hint: The unit set is closed: compute.ns / us / ms / s / min / h
  |
4 |   if budget.expired(compute.now()) then -1 else result
  |                     ^^^^^^^^^^^^^
error[E005]: argument 'time' expects Time but got Compute
  --> /tmp/dojo-budget-units-3.almd:4:6
  in call to expired()
  here: if budget.expired(compute.now()) then -1 else result
  hint: 'Time' is not a known type. To use it as a type parameter, declare it: fn expired[Time](...)
   |
14 | fn expired(budget: Compute, time: Time) -> Bool = {
   | ------------------------- fn expired() defined here
...
4 |   if budget.expired(compute.now()) then -1 else result
  |      ^^^^^^
error: cannot compare Time with Compute — both sides must be Compute
  --> /tmp/dojo-budget-units-3.almd:15:10
  in operator >
  here: time > budget
  hint: A bare number is never a time — wrap it: compute.ms(n)
   |
15 |   time > budget
   |          ^^^^^^

5 error(s) found
FAILED: /tmp/dojo-budget-units-3.almd
  parse error: Expected LParen at line 18:11 (got Dot '.')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-budget-units-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
