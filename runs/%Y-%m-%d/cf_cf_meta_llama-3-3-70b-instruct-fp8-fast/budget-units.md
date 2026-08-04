# budget-units

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  fan.bounded(budget, count_to(n)) |> option.unwrap_or(-1)
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
Compiling /tmp/dojo-budget-units-0.almd
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-budget-units-0.almd:2:16
  in variable compute
  hint: Check the variable name
  |
2 |   let budget = compute.ms(ms) + compute.us(us)
  |                ^^^^^^^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-budget-units-0.almd:2:33
  in variable compute
  hint: Check the variable name
  |
2 |   let budget = compute.ms(ms) + compute.us(us)
  |                                 ^^^^^^^
error: unknown function 'fan.bounded'
  --> /tmp/dojo-budget-units-0.almd:3:32
  in call to fan.bounded()
  hint: Available: fan.map, fan.race, fan.any, fan.settle, fan.timeout
  |
3 |   fan.bounded(budget, count_to(n)) |> option.unwrap_or(-1)
  |                                ^

3 error(s) found
Compile error for /tmp/dojo-budget-units-0.almd:
compile failed
FAILED: /tmp/dojo-budget-units-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = time.ms(ms) + time.us(us)
  fan.timeout(budget, count_to(n)) |> option.unwrap_or(-1)
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
Compiling /tmp/dojo-budget-units-1.almd
error[E003]: undefined variable 'time'
  --> /tmp/dojo-budget-units-1.almd:2:16
  in variable time
  hint: Check the variable name
  |
2 |   let budget = time.ms(ms) + time.us(us)
  |                ^^^^
error[E003]: undefined variable 'time'
  --> /tmp/dojo-budget-units-1.almd:2:30
  in variable time
  hint: Check the variable name
  |
2 |   let budget = time.ms(ms) + time.us(us)
  |                              ^^^^
error[E005]: argument 'o' expects Option[A] but got Result[Unknown, String]
  --> /tmp/dojo-budget-units-1.almd:3:57
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
3 |   fan.timeout(budget, count_to(n)) |> option.unwrap_or(-1)
  |                                                         ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[Int] but got Result[Unknown, String]
  --> /tmp/dojo-budget-units-1.almd:3:57
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
3 |   fan.timeout(budget, count_to(n)) |> option.unwrap_or(-1)
  |                                                         ^

4 error(s) found
Compile error for /tmp/dojo-budget-units-1.almd:
compile failed
FAILED: /tmp/dojo-budget-units-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  match fan.bounded(budget, count_to(n)) {
    some(v) => v
    none => -1
  }
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
Compiling /tmp/dojo-budget-units-2.almd
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-budget-units-2.almd:2:16
  in variable compute
  hint: Check the variable name
  |
2 |   let budget = compute.ms(ms) + compute.us(us)
  |                ^^^^^^^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-budget-units-2.almd:2:33
  in variable compute
  hint: Check the variable name
  |
2 |   let budget = compute.ms(ms) + compute.us(us)
  |                                 ^^^^^^^
error: unknown function 'fan.bounded'
  --> /tmp/dojo-budget-units-2.almd:3:38
  in call to fan.bounded()
  hint: Available: fan.map, fan.race, fan.any, fan.settle, fan.timeout
  |
3 |   match fan.bounded(budget, count_to(n)) {
  |                                      ^

3 error(s) found
Compile error for /tmp/dojo-budget-units-2.almd:
compile failed
FAILED: /tmp/dojo-budget-units-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = time.ms(ms) + time.us(us)
  match fan.timeout(budget, count_to(n)) {
    some(v) => v
    none => -1
  }
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
Compiling /tmp/dojo-budget-units-3.almd
error[E003]: undefined variable 'time'
  --> /tmp/dojo-budget-units-3.almd:2:16
  in variable time
  hint: Check the variable name
  |
2 |   let budget = time.ms(ms) + time.us(us)
  |                ^^^^
error[E003]: undefined variable 'time'
  --> /tmp/dojo-budget-units-3.almd:2:30
  in variable time
  hint: Check the variable name
  |
2 |   let budget = time.ms(ms) + time.us(us)
  |                              ^^^^
error[E010]: non-exhaustive match: missing ok(_), err(_)
  --> /tmp/dojo-budget-units-3.almd:3:38
  in match
  hint: Add arms for ok(_), err(_), or use '_'
  |
3 |   match fan.timeout(budget, count_to(n)) {
  |                                      ^

3 error(s) found
Compile error for /tmp/dojo-budget-units-3.almd:
compile failed
FAILED: /tmp/dojo-budget-units-3.almd

1/1 test file(s) failed

```
