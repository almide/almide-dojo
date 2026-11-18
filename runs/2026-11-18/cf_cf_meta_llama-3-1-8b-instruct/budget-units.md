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

fn exhausted(compute: Compute) -> Bool = {
  compute.expired()
}
```

**Diagnostic:**

```
error[E002]: undefined method 'expired' on Compute
  --> /tmp/dojo-budget-units-1.almd:15:3
  in method call .expired()
  here: compute.expired()
  hint: No function `expired` takes a Compute receiver: UFCS resolves `x.expired(…)` to `expired(x, …)`. Define `fn expired(Compute, …)`, or call the intended module function directly.
   |
15 |   compute.expired()
   |   ^^^^^^^

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

fn exhausted(compute: Compute) -> Bool = {
  compute.expired()
}

effect fn expired(compute: Compute, deadline: Time) -> Bool = {
  compute.expired(deadline)
}
```

**Diagnostic:**

```
error[E029]: unknown type 'Time'
  --> /tmp/dojo-budget-units-2.almd:18:47
  in parameter 'deadline'
  here: effect fn expired(compute: Compute, deadline: Time) -> Bool = {
  hint: no `type Time` is declared (or imported) in this program — declare it, or check the spelling
   |
18 | effect fn expired(compute: Compute, deadline: Time) -> Bool = {
   |                                               ^^^^
error[E006]: cannot call effect function 'expired' from a pure function
  --> /tmp/dojo-budget-units-2.almd:15:3
  in call to expired()
  here: compute.expired()
  hint: Mark the calling function as `effect fn`, and propagate the call's error with `!`: `expired()!` (the call's type is `Result[Bool, String]`)
   |
18 | effect fn expired(compute: Compute, deadline: Time) -> Bool = {
   | ------------------------------------ 'expired' declared as effect fn here
...
15 |   compute.expired()
   |   ^^^^^^^
error[E004]: expired() expects 2 argument(s) but got 1
  --> /tmp/dojo-budget-units-2.almd:15:3
  in call to expired()
  here: compute.expired()
  hint: Check the number of arguments
  try:
      // expired() takes 2 arg(s) — you passed 1
      expired(<compute: Compute>, <deadline: Time>)
   |
15 |   compute.expired()
   |   ^^^^^^^
error[E041]: implicit propagation of this fn's tail value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-budget-units-2.almd:19:3
  in implicit propagation
  here: compute.expired(deadline)
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
  try:
      !
   |
19 |   compute.expired(deadline)
   |   ^^^^^^^^^^^^^^^^^^^^^^^^^

4 error(s) found
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
  if budget.expired()! then -1 else result
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}

effect fn expired(compute: Compute, deadline: Time) -> Bool = {
  compute.expired(deadline)
}
```

**Diagnostic:**

```
error[E029]: unknown type 'Time'
  --> /tmp/dojo-budget-units-3.almd:14:47
  in parameter 'deadline'
  here: effect fn expired(compute: Compute, deadline: Time) -> Bool = {
  hint: no `type Time` is declared (or imported) in this program — declare it, or check the spelling
   |
14 | effect fn expired(compute: Compute, deadline: Time) -> Bool = {
   |                                               ^^^^
error[E004]: expired() expects 2 argument(s) but got 1
  --> /tmp/dojo-budget-units-3.almd:4:6
  in call to expired()
  here: if budget.expired()! then -1 else result
  hint: Check the number of arguments
  try:
      // expired() takes 2 arg(s) — you passed 1
      expired(<compute: Compute>, <deadline: Time>)
  |
4 |   if budget.expired()! then -1 else result
  |      ^^^^^^
error[E041]: implicit propagation of this fn's tail value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-budget-units-3.almd:15:3
  in implicit propagation
  here: compute.expired(deadline)
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
  try:
      !
   |
15 |   compute.expired(deadline)
   |   ^^^^^^^^^^^^^^^^^^^^^^^^^

3 error(s) found
FAILED: /tmp/dojo-budget-units-3.almd
Compile error for /tmp/dojo-budget-units-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
