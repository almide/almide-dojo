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
  try {
    fan.bounded(count_to(n), budget)
  } catch {
    _ => -1
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
error: 'catch' is not valid in Almide at line 5:5
  --> /tmp/dojo-budget-units-0.almd:5:5
  hint: Almide has no try/catch. Use 'match' on Result values instead.
  |
5 |   } catch {
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:1 (got RBrace '}')
  --> /tmp/dojo-budget-units-0.almd:8:1
  |
8 | }
  | ^
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
error[E003]: undefined variable 'try'
  --> /tmp/dojo-budget-units-0.almd:3:3
  in variable try
  hint: Check the variable name
  |
3 |   try {
  |   ^^^
error: fan.bounded() can only be used inside an effect fn
  --> /tmp/dojo-budget-units-0.almd:4:30
  in call to fan.bounded()
  hint: Mark the enclosing function as `effect fn`
  |
4 |     fan.bounded(count_to(n), budget)
  |                              ^^^^^^
error: unknown function 'fan.bounded'
  --> /tmp/dojo-budget-units-0.almd:4:30
  in call to fan.bounded()
  hint: Available: fan.map, fan.race, fan.any, fan.settle, fan.timeout
  |
4 |     fan.bounded(count_to(n), budget)
  |                              ^^^^^^
error[E001]: type mismatch in fn 'run_with_budget': expected Int but got Unit
  --> /tmp/dojo-budget-units-0.almd:4:30
  in fn 'run_with_budget'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
4 |     fan.bounded(count_to(n), budget)
  |                              ^^^^^^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?2]
  --> /tmp/dojo-budget-units-0.almd:19:19
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
19 |   assert_eq(r, ok(4950))
   |                   ^^^^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?3]
  --> /tmp/dojo-budget-units-0.almd:23:19
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
23 |   assert_eq(r, ok(45))
   |                   ^^
error[E001]: type mismatch in call to assert_eq(): expected Int but got Result[Int, ?4]
  --> /tmp/dojo-budget-units-0.almd:27:19
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
27 |   assert_eq(r, ok(0))
   |                   ^

11 error(s) found
Compile error for /tmp/dojo-budget-units-0.almd:
compile failed
FAILED: /tmp/dojo-budget-units-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  match fan.bounded(count_to(n), budget) {
    | ok(r) => r
    | err(_) => -1
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
error: Expected pattern at line 4:5 (got Pipe '|')
  --> /tmp/dojo-budget-units-1.almd:4:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |     | ok(r) => r
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:1 (got RBrace '}')
  --> /tmp/dojo-budget-units-1.almd:7:1
  |
7 | }
  | ^
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
  match fan.bounded(count_to(n), budget) {
    | ok(r) => r
    | err(_) => -1
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
error: Expected pattern at line 4:5 (got Pipe '|')
  --> /tmp/dojo-budget-units-2.almd:4:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |     | ok(r) => r
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:1 (got RBrace '}')
  --> /tmp/dojo-budget-units-2.almd:7:1
  |
7 | }
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
  match fan.bounded(count_to(n), budget) {
    | ok(r) => r
    | err(_) => -1
  }
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}

effect fn main() -> Int = {
  run_with_budget(100, 500, 1000)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-budget-units-3.almd
error: Expected pattern at line 4:5 (got Pipe '|')
  --> /tmp/dojo-budget-units-3.almd:4:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |     | ok(r) => r
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:1 (got RBrace '}')
  --> /tmp/dojo-budget-units-3.almd:7:1
  |
7 | }
  | ^
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

4 error(s) found
Compile error for /tmp/dojo-budget-units-3.almd:
compile failed
FAILED: /tmp/dojo-budget-units-3.almd

1/1 test file(s) failed

```
