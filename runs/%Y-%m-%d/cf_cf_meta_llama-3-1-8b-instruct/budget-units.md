# budget-units

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  let result = fan.bounded(count_to(n), budget)
  if result.is_exhausted() then -1 else result.get()
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
error[E002]: undefined function 'count_to'
  --> /tmp/dojo-budget-units-0.almd:3:37
  in call to count_to()
  hint: Check the function name
  |
3 |   let result = fan.bounded(count_to(n), budget)
  |                                     ^
error: fan.bounded() can only be used inside an effect fn
  --> /tmp/dojo-budget-units-0.almd:3:41
  in call to fan.bounded()
  hint: Mark the enclosing function as `effect fn`
  |
3 |   let result = fan.bounded(count_to(n), budget)
  |                                         ^^^^^^
error: unknown function 'fan.bounded'
  --> /tmp/dojo-budget-units-0.almd:3:41
  in call to fan.bounded()
  hint: Available: fan.map, fan.race, fan.any, fan.settle, fan.timeout
  |
3 |   let result = fan.bounded(count_to(n), budget)
  |                                         ^^^^^^
error[E002]: undefined function 'result.is_exhausted'
  --> /tmp/dojo-budget-units-0.almd:4:25
  in call to result.is_exhausted()
  hint: No function 'is_exhausted' in module 'result'. See docs/CHEATSHEET.md for available functions
  |
4 |   if result.is_exhausted() then -1 else result.get()
  |                         ^
error[E002]: undefined function 'result.get'
  --> /tmp/dojo-budget-units-0.almd:4:51
  in call to result.get()
  hint: No function 'get' in module 'result'. See docs/CHEATSHEET.md for available functions
  |
4 |   if result.is_exhausted() then -1 else result.get()
  |                                                   ^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?2]
  --> /tmp/dojo-budget-units-0.almd:9:19
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
  |
9 |   assert_eq(r, ok(4950))
  |                   ^^^^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?3]
  --> /tmp/dojo-budget-units-0.almd:13:19
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
13 |   assert_eq(r, ok(45))
   |                   ^^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?4]
  --> /tmp/dojo-budget-units-0.almd:17:19
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
17 |   assert_eq(r, ok(0))
   |                   ^

10 error(s) found
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
  match result {
    ok(r) => r,
    err(_) => -1
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
  match result {
    ok(r) => r,
    err(_) => -1
  }
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}

import compute
import fan
```

**Diagnostic:**

```
Compiling /tmp/dojo-budget-units-2.almd
error: Unexpected token at top level at line 17:1
  --> /tmp/dojo-budget-units-2.almd:17:1
  hint: All imports must come before other declarations.
   |
17 | import compute
   | ^
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

4 error(s) found
Compile error for /tmp/dojo-budget-units-2.almd:
compile failed
FAILED: /tmp/dojo-budget-units-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  let result = fan.bounded(count_to(n), budget)
  match result {
    ok(r) => r,
    err(_) => -1
  }
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}

import compute
import fan

fn main() {
  let result = run_with_budget(1000, 500, 100)
  print(result)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-budget-units-3.almd
error: Unexpected token at top level at line 17:1
  --> /tmp/dojo-budget-units-3.almd:17:1
  hint: All imports must come before other declarations.
   |
17 | import compute
   | ^
error: Expected Arrow at line 20:11 (got LBrace '{')
  --> /tmp/dojo-budget-units-3.almd:20:11
   |
20 | fn main() {
   |           ^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-budget-units-3.almd:2:16
  in variable compute
  hint: Check the variable name
  |
2 |   let budget = compute.ms(ms) + compute.us(us)
  |                ^^^^^^^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-budget-units-3.almd:2:33
  in variable compute
  hint: Check the variable name
  |
2 |   let budget = compute.ms(ms) + compute.us(us)
  |                                 ^^^^^^^
error: unknown function 'fan.bounded'
  --> /tmp/dojo-budget-units-3.almd:3:41
  in call to fan.bounded()
  hint: Available: fan.map, fan.race, fan.any, fan.settle, fan.timeout
  |
3 |   let result = fan.bounded(count_to(n), budget)
  |                                         ^^^^^^

5 error(s) found
Compile error for /tmp/dojo-budget-units-3.almd:
compile failed
FAILED: /tmp/dojo-budget-units-3.almd

1/1 test file(s) failed

```
