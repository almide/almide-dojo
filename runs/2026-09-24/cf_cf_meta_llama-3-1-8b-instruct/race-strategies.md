# race-strategies

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let acc = 0
  while acc < n {
    acc = acc + 1
  }
  acc
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) }
  let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
  if exact_time < heuristic_time {
    exact_result
  } else if exact_time > heuristic_time {
    heuristic_result
  } else {
    -1
  }
}
```

**Diagnostic:**

```
error: Expected Then at line 16:34 (got LBrace '{')
  --> /tmp/dojo-race-strategies-0.almd:16:34
  here: if exact_time < heuristic_time {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
16 |   if exact_time < heuristic_time {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 18:5 (got Else 'else')
  --> /tmp/dojo-race-strategies-0.almd:18:5
  here: } else if exact_time > heuristic_time {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |   } else if exact_time > heuristic_time {
   |     ^
error[E009]: cannot reassign immutable binding 'acc'
  --> /tmp/dojo-race-strategies-0.almd:4:17
  in acc = ...
  here: acc = acc + 1
  hint: Use 'var acc = ...' instead of 'let acc = ...' to declare a mutable variable
  try:
      // let acc = ...  →  var acc = ...
      var acc = <initial value>
  |
2 |   let acc = 0
  |   ------------------- 'acc' declared here
...
4 |     acc = acc + 1
  |                 ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-0.almd:14:68
  in tuple destructure
  here: let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
14 |   let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) }
   |                                                                    ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-0.almd:15:80
  in tuple destructure
  here: let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
15 |   let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
   |                                                                                ^

5 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
Compile error for /tmp/dojo-race-strategies-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var acc = 0
  while acc < n {
    acc = acc + 1
  }
  acc
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) }
  let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
  match (exact_time, heuristic_time) {
    | (Some(x), Some(y)) => if x < y then exact_result else heuristic_result
    | (Some(x), _) => exact_result
    | (_, Some(y)) => heuristic_result
    | _ => -1
  }
}
```

**Diagnostic:**

```
error: Expected pattern at line 17:5 (got Pipe '|')
  --> /tmp/dojo-race-strategies-1.almd:17:5
  here: | (Some(x), Some(y)) => if x < y then exact_result else heuristic_result
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
17 |     | (Some(x), Some(y)) => if x < y then exact_result else heuristic_result
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 22:1 (got RBrace '}')
  --> /tmp/dojo-race-strategies-1.almd:22:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 | }
   | ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-1.almd:14:68
  in tuple destructure
  here: let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
14 |   let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) }
   |                                                                    ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-1.almd:15:80
  in tuple destructure
  here: let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
15 |   let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
   |                                                                                ^

4 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
Compile error for /tmp/dojo-race-strategies-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var acc = 0
  while acc < n {
    acc = acc + 1
  }
  acc
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) }
  let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
  match (exact_time, heuristic_time) {
    | (Some(x), Some(y)) => if x < y then exact_result else heuristic_result
    | Some(_) => exact_result
    | Some(_) => exact_result
    | _ => -1
  }
}
```

**Diagnostic:**

```
error: Expected pattern at line 17:5 (got Pipe '|')
  --> /tmp/dojo-race-strategies-2.almd:17:5
  here: | (Some(x), Some(y)) => if x < y then exact_result else heuristic_result
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
17 |     | (Some(x), Some(y)) => if x < y then exact_result else heuristic_result
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 22:1 (got RBrace '}')
  --> /tmp/dojo-race-strategies-2.almd:22:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 | }
   | ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-2.almd:14:68
  in tuple destructure
  here: let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
14 |   let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) }
   |                                                                    ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-2.almd:15:80
  in tuple destructure
  here: let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
15 |   let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
   |                                                                                ^

4 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
Compile error for /tmp/dojo-race-strategies-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var acc = 0
  while acc < n {
    acc = acc + 1
  }
  acc
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) }
  let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
  match (exact_time, heuristic_time) {
    | (Some(x), Some(y)) => if x < y then exact_result else heuristic_result
    | Some(_) => exact_result
    | _ => -1
  }
}
```

**Diagnostic:**

```
error: Expected pattern at line 17:5 (got Pipe '|')
  --> /tmp/dojo-race-strategies-3.almd:17:5
  here: | (Some(x), Some(y)) => if x < y then exact_result else heuristic_result
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
17 |     | (Some(x), Some(y)) => if x < y then exact_result else heuristic_result
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 21:1 (got RBrace '}')
  --> /tmp/dojo-race-strategies-3.almd:21:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 | }
   | ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-3.almd:14:68
  in tuple destructure
  here: let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
14 |   let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) }
   |                                                                    ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-3.almd:15:80
  in tuple destructure
  here: let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
15 |   let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
   |                                                                                ^

4 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
