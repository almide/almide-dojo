# budget-units

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  let result = fan.bounded(count_to(n), budget)
  if result == 0 then -1 else result
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
  --> /tmp/dojo-budget-units-0.almd:3:41
  in call to fan.bounded()
  hint: Available: fan.map, fan.race, fan.any, fan.settle, fan.timeout
  |
3 |   let result = fan.bounded(count_to(n), budget)
  |                                         ^^^^^^

3 error(s) found
Compile error for /tmp/dojo-budget-units-0.almd:
compile failed
FAILED: /tmp/dojo-budget-units-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  let result = fan.bounded(count_to(n), budget)
  if result == 0 then -1 else result
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
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-budget-units-1.almd:2:16
  in variable compute
  hint: Check the variable name
  |
2 |   let budget = compute.ms(ms) + compute.us(us)
  |                ^^^^^^^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-budget-units-1.almd:2:33
  in variable compute
  hint: Check the variable name
  |
2 |   let budget = compute.ms(ms) + compute.us(us)
  |                                 ^^^^^^^
error: unknown function 'fan.bounded'
  --> /tmp/dojo-budget-units-1.almd:3:41
  in call to fan.bounded()
  hint: Available: fan.map, fan.race, fan.any, fan.settle, fan.timeout
  |
3 |   let result = fan.bounded(count_to(n), budget)
  |                                         ^^^^^^

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
  let result = fan.bounded(count_to(n), budget)
  if result == 0 then -1 else result
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
  --> /tmp/dojo-budget-units-2.almd:3:41
  in call to fan.bounded()
  hint: Available: fan.map, fan.race, fan.any, fan.settle, fan.timeout
  |
3 |   let result = fan.bounded(count_to(n), budget)
  |                                         ^^^^^^

3 error(s) found
Compile error for /tmp/dojo-budget-units-2.almd:
compile failed
FAILED: /tmp/dojo-budget-units-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute::ms(ms) + compute::us(us)
  let result = fan::bounded(count_to(n), budget)
  if result == 0 then -1 else result
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
error: '::' is not valid in Almide at line 2:23
  --> /tmp/dojo-budget-units-3.almd:2:23
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
  |
2 |   let budget = compute::ms(ms) + compute::us(us)
  |                       ^
error: Expected LBrace at line 3:19 (got Colon ':')
  --> /tmp/dojo-budget-units-3.almd:3:19
  |
3 |   let result = fan::bounded(count_to(n), budget)
  |                   ^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-budget-units-3.almd:2:16
  in variable compute
  hint: Check the variable name
  |
2 |   let budget = compute::ms(ms) + compute::us(us)
  |                ^^^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-budget-units-3.almd:4:6
  in variable result
  hint: Check the variable name
  |
4 |   if result == 0 then -1 else result
  |      ^^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-budget-units-3.almd:4:31
  in variable result
  hint: Check the variable name
  |
4 |   if result == 0 then -1 else result
  |                               ^^^^^^

5 error(s) found
Compile error for /tmp/dojo-budget-units-3.almd:
compile failed
FAILED: /tmp/dojo-budget-units-3.almd

1/1 test file(s) failed

```
