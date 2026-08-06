# bounded-total

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = 
  fan.bounded(compute.ms(100)) { 
    fn sum_list(xs: List[Int], acc: Int, i: Int) -> Int = 
      if i >= list.len(xs) then acc
      else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
    sum_list(xs, 0, 0) 
  } ?? -1
```

**Diagnostic:**

```
Compiling /tmp/dojo-bounded-total-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:32 (got LBrace '{')
  --> /tmp/dojo-bounded-total-0.almd:2:32
  |
2 |   fan.bounded(compute.ms(100)) {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 6:5 (got Ident 'sum_list')
  --> /tmp/dojo-bounded-total-0.almd:6:5
  |
6 |     sum_list(xs, 0, 0)
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
  fan.timeout(compute.ms(100)) { 
    fn sum_list(xs: List[Int], acc: Int, i: Int) -> Int = 
      if i >= list.len(xs) then acc
      else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
    sum_list(xs, 0, 0) 
  } ?? -1
```

**Diagnostic:**

```
Compiling /tmp/dojo-bounded-total-1.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:32 (got LBrace '{')
  --> /tmp/dojo-bounded-total-1.almd:2:32
  |
2 |   fan.timeout(compute.ms(100)) {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 6:5 (got Ident 'sum_list')
  --> /tmp/dojo-bounded-total-1.almd:6:5
  |
6 |     sum_list(xs, 0, 0)
  |     ^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-bounded-total-1.almd:2:15
  in variable compute
  hint: Check the variable name
  |
2 |   fan.timeout(compute.ms(100)) {
  |               ^^^^^^^
error: fan.timeout() expects 2 arguments but got 1
  --> /tmp/dojo-bounded-total-1.almd:2:15
  in call to fan.timeout()
  hint: Usage: fan.timeout(5000, () => expr)
  |
2 |   fan.timeout(compute.ms(100)) {
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
    fn sum_list(xs: List[Int], acc: Int, i: Int) -> Int = 
      if i >= list.len(xs) then acc
      else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
    sum_list(xs, 0, 0) 
  } ?? -1
```

**Diagnostic:**

```
Compiling /tmp/dojo-bounded-total-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:32 (got LBrace '{')
  --> /tmp/dojo-bounded-total-2.almd:2:32
  |
2 |   fan.bounded(compute.ms(100)) {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 6:5 (got Ident 'sum_list')
  --> /tmp/dojo-bounded-total-2.almd:6:5
  |
6 |     sum_list(xs, 0, 0)
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
  fan.timeout(compute.ms(100)) { 
    fn sum_list(xs: List[Int], acc: Int, i: Int) -> Int = 
      if i >= list.len(xs) then acc
      else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
    sum_list(xs, 0, 0) 
  } ?? -1
```

**Diagnostic:**

```
Compiling /tmp/dojo-bounded-total-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:32 (got LBrace '{')
  --> /tmp/dojo-bounded-total-3.almd:2:32
  |
2 |   fan.timeout(compute.ms(100)) {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 6:5 (got Ident 'sum_list')
  --> /tmp/dojo-bounded-total-3.almd:6:5
  |
6 |     sum_list(xs, 0, 0)
  |     ^
error[E003]: undefined variable 'compute'
  --> /tmp/dojo-bounded-total-3.almd:2:15
  in variable compute
  hint: Check the variable name
  |
2 |   fan.timeout(compute.ms(100)) {
  |               ^^^^^^^
error: fan.timeout() expects 2 arguments but got 1
  --> /tmp/dojo-bounded-total-3.almd:2:15
  in call to fan.timeout()
  hint: Usage: fan.timeout(5000, () => expr)
  |
2 |   fan.timeout(compute.ms(100)) {
  |               ^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-bounded-total-3.almd:
compile failed
FAILED: /tmp/dojo-bounded-total-3.almd

1/1 test file(s) failed

```
