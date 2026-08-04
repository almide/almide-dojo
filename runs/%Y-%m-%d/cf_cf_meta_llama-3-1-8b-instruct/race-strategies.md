# race-strategies

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let acc = 0
  while acc < n {
    acc + 1
  }
  acc
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_cost, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  }
  if exact_cost <= compute.ms(1) {
    exact_result
  } else if heuristic(n) == exact_result {
    exact_result
  } else {
    -1
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-0.almd
error: Expected Then at line 18:34 (got LBrace '{')
  --> /tmp/dojo-race-strategies-0.almd:18:34
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
18 |   if exact_cost <= compute.ms(1) {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 20:5 (got Else 'else')
  --> /tmp/dojo-race-strategies-0.almd:20:5
   |
20 |   } else if heuristic(n) == exact_result {
   |     ^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-race-strategies-0.almd:14:45
  in variable compute
  hint: Check the variable name
   |
14 |   let (exact_cost, exact_result) = fan.race(compute.ms(1)) {
   |                                             ^^^^^^^

3 error(s) found
Compile error for /tmp/dojo-race-strategies-0.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let acc = 0
  while acc < n {
    acc + 1
  }
  acc
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_cost, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  }
  if exact_cost <= compute.ms(1) then exact_result else -1
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-1.almd
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-race-strategies-1.almd:14:45
  in variable compute
  hint: Check the variable name
   |
14 |   let (exact_cost, exact_result) = fan.race(compute.ms(1)) {
   |                                             ^^^^^^^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-race-strategies-1.almd:18:20
  in variable compute
  hint: Check the variable name
   |
18 |   if exact_cost <= compute.ms(1) then exact_result else -1
   |                    ^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-race-strategies-1.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let acc = 0
  while acc < n {
    acc + 1
  }
  acc
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_cost, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  }
  if exact_cost <= compute.ms(1) then exact_result else -1
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-2.almd
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-race-strategies-2.almd:14:45
  in variable compute
  hint: Check the variable name
   |
14 |   let (exact_cost, exact_result) = fan.race(compute.ms(1)) {
   |                                             ^^^^^^^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-race-strategies-2.almd:18:20
  in variable compute
  hint: Check the variable name
   |
18 |   if exact_cost <= compute.ms(1) then exact_result else -1
   |                    ^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-race-strategies-2.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let acc = 0
  while acc < n {
    acc + 1
  }
  acc
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_cost, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  }
  if exact_cost <= compute.ms(1) then exact_result else -1
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-3.almd
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-race-strategies-3.almd:14:45
  in variable compute
  hint: Check the variable name
   |
14 |   let (exact_cost, exact_result) = fan.race(compute.ms(1)) {
   |                                             ^^^^^^^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-race-strategies-3.almd:18:20
  in variable compute
  hint: Check the variable name
   |
18 |   if exact_cost <= compute.ms(1) then exact_result else -1
   |                    ^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-3.almd

1/1 test file(s) failed

```
