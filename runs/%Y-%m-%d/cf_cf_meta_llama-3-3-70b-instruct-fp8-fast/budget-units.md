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
  fan.bounded(count_to, budget, n) |> option.unwrap_or(-1)
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
  --> /tmp/dojo-budget-units-0.almd:3:33
  in call to fan.bounded()
  hint: Available: fan.map, fan.race, fan.any, fan.settle, fan.timeout
  |
3 |   fan.bounded(count_to, budget, n) |> option.unwrap_or(-1)
  |                                 ^

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
  fan.timeout(count_to, budget, n) |> option.unwrap_or(-1)
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
error: fan.timeout() expects 2 arguments but got 3
  --> /tmp/dojo-budget-units-1.almd:3:33
  in call to fan.timeout()
  hint: Usage: fan.timeout(5000, () => expr)
  |
3 |   fan.timeout(count_to, budget, n) |> option.unwrap_or(-1)
  |                                 ^

3 error(s) found
Compile error for /tmp/dojo-budget-units-1.almd:
compile failed
FAILED: /tmp/dojo-budget-units-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  fan.bounded((x) => count_to(x), budget, n) |> option.unwrap_or(-1)
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
  --> /tmp/dojo-budget-units-2.almd:3:43
  in call to fan.bounded()
  hint: Available: fan.map, fan.race, fan.any, fan.settle, fan.timeout
  |
3 |   fan.bounded((x) => count_to(x), budget, n) |> option.unwrap_or(-1)
  |                                           ^

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
  fan.timeout((x) => count_to(x), budget, n) |> option.unwrap_or(-1)
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
error: fan.timeout() expects 2 arguments but got 3
  --> /tmp/dojo-budget-units-3.almd:3:43
  in call to fan.timeout()
  hint: Usage: fan.timeout(5000, () => expr)
  |
3 |   fan.timeout((x) => count_to(x), budget, n) |> option.unwrap_or(-1)
  |                                           ^

3 error(s) found
Compile error for /tmp/dojo-budget-units-3.almd:
compile failed
FAILED: /tmp/dojo-budget-units-3.almd

1/1 test file(s) failed

```
