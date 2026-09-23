# budget-units

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E012`

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

fn exhausted(budget: Compute, elapsed: Int) -> Bool = {
  budget.elapsed() >= budget
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
error[E012]: duplicate function 'count_to'
  at line 18
  in fn count_to
  here: fn count_to(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 7 | fn count_to(n: Int) -> Int = {
   | ----------------------------------- first definition of 'count_to' here
...
18 | fn count_to(n: Int) -> Int = {
   | ^^^^^^^^^^^
error[E004]: exhausted() expects 2 argument(s) but got 1
  --> /tmp/dojo-budget-units-1.almd:4:6
  in call to exhausted()
  here: if budget.exhausted() then -1 else result
  hint: Check the number of arguments
  try:
      // exhausted() takes 2 arg(s) — you passed 1
      exhausted(<budget: Compute>, <elapsed: Int>)
  |
4 |   if budget.exhausted() then -1 else result
  |      ^^^^^^
error[E002]: undefined method 'elapsed' on Compute
  --> /tmp/dojo-budget-units-1.almd:15:3
  in method call .elapsed()
  here: budget.elapsed() >= budget
  hint: No function `elapsed` takes a Compute receiver: UFCS resolves `x.elapsed(…)` to `elapsed(x, …)`. Define `fn elapsed(Compute, …)`, or call the intended module function directly.
   |
15 |   budget.elapsed() >= budget
   |   ^^^^^^
error: cannot compare Unknown with Compute — both sides must be Compute
  --> /tmp/dojo-budget-units-1.almd:15:23
  in operator >=
  here: budget.elapsed() >= budget
  hint: A bare number is never a time — wrap it: compute.ms(n)
   |
15 |   budget.elapsed() >= budget
   |                       ^^^^^^
error[E029]: unknown type 'Compute'
  at line 11
  in parameter 'budget'
  here: acc
  hint: no `type Compute` is declared (or imported) in this program — declare it, or check the spelling
   |
11 |   acc
   |   ^^^^^^^^^^^^^^^^^^

5 error(s) found
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
  if elapsed(budget, result) then -1 else result
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}

fn elapsed(budget: Compute, elapsed: Int) -> Bool = {
  elapsed >= budget
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
error[E012]: duplicate function 'count_to'
  at line 18
  in fn count_to
  here: fn count_to(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 7 | fn count_to(n: Int) -> Int = {
   | ----------------------------------- first definition of 'count_to' here
...
18 | fn count_to(n: Int) -> Int = {
   | ^^^^^^^^^^^
error: cannot compare Int with Compute — both sides must be Compute
  --> /tmp/dojo-budget-units-2.almd:15:14
  in operator >=
  here: elapsed >= budget
  hint: A bare number is never a time — wrap it: compute.ms(n)
   |
15 |   elapsed >= budget
   |              ^^^^^^
error[E029]: unknown type 'Compute'
  at line 11
  in parameter 'budget'
  here: acc
  hint: no `type Compute` is declared (or imported) in this program — declare it, or check the spelling
   |
11 |   acc
   |   ^^^^^^^^^^^^^^^^^^

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
  if elapsed(budget, result) then -1 else result
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}

fn elapsed(budget: Compute, elapsed: Compute) -> Bool = {
  budget >= elapsed
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
error[E012]: duplicate function 'count_to'
  at line 18
  in fn count_to
  here: fn count_to(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 7 | fn count_to(n: Int) -> Int = {
   | ----------------------------------- first definition of 'count_to' here
...
18 | fn count_to(n: Int) -> Int = {
   | ^^^^^^^^^^^
error[E005]: argument 'elapsed' expects Compute but got Int
  --> /tmp/dojo-budget-units-3.almd:4:22
  in call to elapsed()
  here: if elapsed(budget, result) then -1 else result
  hint: 'Compute' is not a known type. To use it as a type parameter, declare it: fn elapsed[Compute](...)
   |
14 | fn elapsed(budget: Compute, elapsed: Compute) -> Bool = {
   | ------------------------- fn elapsed() defined here
...
4 |   if elapsed(budget, result) then -1 else result
  |                      ^^^^^^
error[E029]: unknown type 'Compute'
  at line 11
  in parameter 'budget'
  here: acc
  hint: no `type Compute` is declared (or imported) in this program — declare it, or check the spelling
   |
11 |   acc
   |   ^^^^^^^^^^^^^^^^^^

3 error(s) found
FAILED: /tmp/dojo-budget-units-3.almd
Compile error for /tmp/dojo-budget-units-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
