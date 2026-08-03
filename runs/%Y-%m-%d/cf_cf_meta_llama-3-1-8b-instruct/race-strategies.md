# race-strategies

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let sum = 0
  while n > 0 {
    sum = sum + n
    n = n - 1
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
    exact(n)
    heuristic(n)
  }
  match (exact_time, heuristic_time) {
    (Some(t1), Some(t2)) => if t1 <= t2 then exact(n) else heuristic(n)
    _ => -1
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-0.almd
error[E009]: cannot reassign immutable binding 'sum'
  --> /tmp/dojo-race-strategies-0.almd:4:17
  in sum = ...
  hint: Use 'var sum = ...' instead of 'let sum = ...' to declare a mutable variable
  try:
      // let sum = ...  →  var sum = ...
      var sum = <initial value>
  |
2 |   let sum = 0
  |   ------------------- 'sum' declared here
...
4 |     sum = sum + n
  |                 ^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-race-strategies-0.almd:5:13
  in n = ...
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
  |
5 |     n = n - 1
  |             ^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-race-strategies-0.almd:15:47
  in variable compute
  hint: Check the variable name
   |
15 |   let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
   |                                               ^^^^^^^

3 error(s) found
Compile error for /tmp/dojo-race-strategies-0.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0
  var n_ = n
  while n_ > 0 {
    sum = sum + n_
    n_ = n_ - 1
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  import compute
  let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
    exact(n)
    heuristic(n)
  }
  match (exact_time, heuristic_time) {
    (Some(t1), Some(t2)) => if t1 <= t2 then exact(n) else heuristic(n)
    _ => -1
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-1.almd
error: Expected expression at line 16:3 (got Import 'import')
  --> /tmp/dojo-race-strategies-1.almd:16:3
   |
16 |   import compute
   |   ^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-race-strategies-1.almd:17:47
  in variable compute
  hint: Check the variable name
   |
17 |   let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
   |                                               ^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-race-strategies-1.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0
  var n_ = n
  while n_ > 0 {
    sum = sum + n_
    n_ = n_ - 1
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
    exact(n)
    heuristic(n)
  }
  match (exact_time, heuristic_time) {
    (Some(t1), Some(t2)) => if t1 <= t2 then exact(n) else heuristic(n)
    _ => -1
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-2.almd
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-race-strategies-2.almd:16:47
  in variable compute
  hint: Check the variable name
   |
16 |   let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
   |                                               ^^^^^^^

1 error(s) found
Compile error for /tmp/dojo-race-strategies-2.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0
  var n_ = n
  while n_ > 0 {
    sum = sum + n_
    n_ = n_ - 1
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, heuristic_time) = fs.fan.race(fs.compute.ms(1)) {
    exact(n)
    heuristic(n)
  }
  match (exact_time, heuristic_time) {
    (Some(t1), Some(t2)) => if t1 <= t2 then exact(n) else heuristic(n)
    _ => -1
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-race-strategies-3.almd
error: Expected name at line 16:41 (got Fan 'fan')
  --> /tmp/dojo-race-strategies-3.almd:16:41
   |
16 |   let (exact_time, heuristic_time) = fs.fan.race(fs.compute.ms(1)) {
   |                                         ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 20:3 (got Match 'match')
  --> /tmp/dojo-race-strategies-3.almd:20:3
   |
20 |   match (exact_time, heuristic_time) {
   |   ^

2 error(s) found
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed
FAILED: /tmp/dojo-race-strategies-3.almd

1/1 test file(s) failed

```
