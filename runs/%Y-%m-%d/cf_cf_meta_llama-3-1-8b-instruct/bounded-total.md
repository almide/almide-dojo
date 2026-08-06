# bounded-total

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int =
  fan.bounded(compute.ms(100)) {
    sum(xs)
  } ?? -1

fn sum(xs: List[Int]) -> Int =
  match xs {
    | [] => 0
    | x :: xs' => x + sum(xs')
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-bounded-total-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:32 (got LBrace '{')
  --> /tmp/dojo-bounded-total-0.almd:2:32
  |
2 |   fan.bounded(compute.ms(100)) {
  |                                ^
error: Expected pattern at line 8:5 (got Pipe '|')
  --> /tmp/dojo-bounded-total-0.almd:8:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
8 |     | [] => 0
  |     ^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-bounded-total-0.almd:2:15
  in variable compute
  hint: Check the variable name
  |
2 |   fan.bounded(compute.ms(100)) {
  |               ^^^^^^^
error: unknown function 'fan.bounded'
  --> /tmp/dojo-bounded-total-0.almd:2:15
  in call to fan.bounded()
  hint: Available: fan.map, fan.race, fan.any, fan.settle, fan.timeout
  |
2 |   fan.bounded(compute.ms(100)) {
  |               ^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-bounded-total-0.almd:
compile failed
FAILED: /tmp/dojo-bounded-total-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int =
  fan.bounded(compute.ms(100)) {
    sum(xs)
  } ?? -1

fn sum(xs: List[Int]) -> Int =
  match xs {
    | none => 0
    | some(x) => x + sum(list.drop(xs, 1))
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-bounded-total-1.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:32 (got LBrace '{')
  --> /tmp/dojo-bounded-total-1.almd:2:32
  |
2 |   fan.bounded(compute.ms(100)) {
  |                                ^
error: Expected pattern at line 8:5 (got Pipe '|')
  --> /tmp/dojo-bounded-total-1.almd:8:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
8 |     | none => 0
  |     ^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-bounded-total-1.almd:2:15
  in variable compute
  hint: Check the variable name
  |
2 |   fan.bounded(compute.ms(100)) {
  |               ^^^^^^^
error: unknown function 'fan.bounded'
  --> /tmp/dojo-bounded-total-1.almd:2:15
  in call to fan.bounded()
  hint: Available: fan.map, fan.race, fan.any, fan.settle, fan.timeout
  |
2 |   fan.bounded(compute.ms(100)) {
  |               ^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-bounded-total-1.almd:
compile failed
FAILED: /tmp/dojo-bounded-total-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int =
  fan.bounded(compute.ms(100)) {
    sum(xs)
  } ?? -1

fn sum(xs: List[Int]) -> Int =
  match xs {
    | none => 0
    | some(x) => x + sum(list.drop(xs, 1))
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-bounded-total-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:32 (got LBrace '{')
  --> /tmp/dojo-bounded-total-2.almd:2:32
  |
2 |   fan.bounded(compute.ms(100)) {
  |                                ^
error: Expected pattern at line 8:5 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:8:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
8 |     | none => 0
  |     ^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-bounded-total-2.almd:2:15
  in variable compute
  hint: Check the variable name
  |
2 |   fan.bounded(compute.ms(100)) {
  |               ^^^^^^^
error: unknown function 'fan.bounded'
  --> /tmp/dojo-bounded-total-2.almd:2:15
  in call to fan.bounded()
  hint: Available: fan.map, fan.race, fan.any, fan.settle, fan.timeout
  |
2 |   fan.bounded(compute.ms(100)) {
  |               ^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-bounded-total-2.almd:
compile failed
FAILED: /tmp/dojo-bounded-total-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int =
  fan.bounded(compute.ms(100)) {
    sum(xs)
  } ?? -1

fn sum(xs: List[Int]) -> Int =
  match xs {
    | none => 0
    | some(x) => x + sum(list.drop(xs, 1))
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-bounded-total-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:32 (got LBrace '{')
  --> /tmp/dojo-bounded-total-3.almd:2:32
  |
2 |   fan.bounded(compute.ms(100)) {
  |                                ^
error: Expected pattern at line 8:5 (got Pipe '|')
  --> /tmp/dojo-bounded-total-3.almd:8:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
8 |     | none => 0
  |     ^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-bounded-total-3.almd:2:15
  in variable compute
  hint: Check the variable name
  |
2 |   fan.bounded(compute.ms(100)) {
  |               ^^^^^^^
error: unknown function 'fan.bounded'
  --> /tmp/dojo-bounded-total-3.almd:2:15
  in call to fan.bounded()
  hint: Available: fan.map, fan.race, fan.any, fan.settle, fan.timeout
  |
2 |   fan.bounded(compute.ms(100)) {
  |               ^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-bounded-total-3.almd:
compile failed
FAILED: /tmp/dojo-bounded-total-3.almd

1/1 test file(s) failed

```
