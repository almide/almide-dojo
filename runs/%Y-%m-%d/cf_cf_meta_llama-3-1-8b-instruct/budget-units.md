# budget-units

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  fan.bounded {
    count_to(n)
  } | effect fn timeout() {
    if budget <= 0 {
      return -1
    } else {
      budget = budget - 1
      timeout()
    }
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
Compiling /tmp/dojo-budget-units-0.almd
error: Expected expression at line 5:5 (got Pipe '|')
  --> /tmp/dojo-budget-units-0.almd:5:5
  |
5 |   } | effect fn timeout() {
  |     ^
error: Expected Then at line 6:20 (got LBrace '{')
  --> /tmp/dojo-budget-units-0.almd:6:20
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |     if budget <= 0 {
  |                    ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:7 (got Else 'else')
  --> /tmp/dojo-budget-units-0.almd:8:7
  |
8 |     } else {
  |       ^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-budget-units-0.almd:2:16
  in variable compute
  hint: Check the variable name
  |
2 |   var budget = compute.ms(ms) + compute.us(us)
  |                ^^^^^^^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-budget-units-0.almd:2:33
  in variable compute
  hint: Check the variable name
  |
2 |   var budget = compute.ms(ms) + compute.us(us)
  |                                 ^^^^^^^
error[E003]: undefined variable 'fan'
  --> /tmp/dojo-budget-units-0.almd:3:3
  in variable fan
  hint: Did you mean `n`?
  try:
      // fan  →  n
      n
  |
3 |   fan.bounded {
  |   ^^^

6 error(s) found
Compile error for /tmp/dojo-budget-units-0.almd:
compile failed
FAILED: /tmp/dojo-budget-units-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  fan.bounded {
    count_to(n)
  } then effect fn timeout() {
    if budget <= 0 {
      return -1
    } else {
      budget = budget - 1
      timeout()
    }
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
error: Expected expression at line 5:5 (got Then 'then')
  --> /tmp/dojo-budget-units-1.almd:5:5
  |
5 |   } then effect fn timeout() {
  |     ^
error: Expected Then at line 6:20 (got LBrace '{')
  --> /tmp/dojo-budget-units-1.almd:6:20
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |     if budget <= 0 {
  |                    ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:7 (got Else 'else')
  --> /tmp/dojo-budget-units-1.almd:8:7
  |
8 |     } else {
  |       ^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-budget-units-1.almd:2:16
  in variable compute
  hint: Check the variable name
  |
2 |   var budget = compute.ms(ms) + compute.us(us)
  |                ^^^^^^^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-budget-units-1.almd:2:33
  in variable compute
  hint: Check the variable name
  |
2 |   var budget = compute.ms(ms) + compute.us(us)
  |                                 ^^^^^^^
error[E003]: undefined variable 'fan'
  --> /tmp/dojo-budget-units-1.almd:3:3
  in variable fan
  hint: Did you mean `n`?
  try:
      // fan  →  n
      n
  |
3 |   fan.bounded {
  |   ^^^

6 error(s) found
Compile error for /tmp/dojo-budget-units-1.almd:
compile failed
FAILED: /tmp/dojo-budget-units-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  var timeout = effect fn () {
    if budget <= 0 {
      return -1
    } else {
      budget = budget - 1
      timeout()
    }
  }
  fan.bounded {
    count_to(n)
  } then timeout
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
error: Expected expression at line 3:17 (got Effect 'effect')
  --> /tmp/dojo-budget-units-2.almd:3:17
  |
3 |   var timeout = effect fn () {
  |                 ^
error: Expected Then at line 4:20 (got LBrace '{')
  --> /tmp/dojo-budget-units-2.almd:4:20
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |     if budget <= 0 {
  |                    ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 6:7 (got Else 'else')
  --> /tmp/dojo-budget-units-2.almd:6:7
  |
6 |     } else {
  |       ^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-budget-units-2.almd:2:16
  in variable compute
  hint: Check the variable name
  |
2 |   var budget = compute.ms(ms) + compute.us(us)
  |                ^^^^^^^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-budget-units-2.almd:2:33
  in variable compute
  hint: Check the variable name
  |
2 |   var budget = compute.ms(ms) + compute.us(us)
  |                                 ^^^^^^^

5 error(s) found
Compile error for /tmp/dojo-budget-units-2.almd:
compile failed
FAILED: /tmp/dojo-budget-units-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  var budget = compute.ms(ms) + compute.us(us)
  var timeout = effect fn () {
    if budget <= 0 {
      return -1
    } else {
      budget = budget - 1
      timeout()
    }
  }
  fan.bounded {
    count_to(n)
  } then timeout
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
error: Expected expression at line 3:17 (got Effect 'effect')
  --> /tmp/dojo-budget-units-3.almd:3:17
  |
3 |   var timeout = effect fn () {
  |                 ^
error: Expected Then at line 4:20 (got LBrace '{')
  --> /tmp/dojo-budget-units-3.almd:4:20
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |     if budget <= 0 {
  |                    ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 6:7 (got Else 'else')
  --> /tmp/dojo-budget-units-3.almd:6:7
  |
6 |     } else {
  |       ^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-budget-units-3.almd:2:16
  in variable compute
  hint: Check the variable name
  |
2 |   var budget = compute.ms(ms) + compute.us(us)
  |                ^^^^^^^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-budget-units-3.almd:2:33
  in variable compute
  hint: Check the variable name
  |
2 |   var budget = compute.ms(ms) + compute.us(us)
  |                                 ^^^^^^^

5 error(s) found
Compile error for /tmp/dojo-budget-units-3.almd:
compile failed
FAILED: /tmp/dojo-budget-units-3.almd

1/1 test file(s) failed

```
