# race-strategies

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let acc = 0
  let i = 0
  while i < n {
    acc += i
    i += 1
  }
  acc
}

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n)
  }
  let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) {
    heuristic(n)
  }
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
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-0.almd:5:10
  in assignment-in-expr
  here: acc += i
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
5 |     acc += i
  |          ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-0.almd:6:8
  in assignment-in-expr
  here: i += 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
6 |     i += 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:3 (got Ident 'acc')
  --> /tmp/dojo-race-strategies-0.almd:8:3
  here: acc
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   acc
  |   ^
error: Expected Then at line 20:34 (got LBrace '{')
  --> /tmp/dojo-race-strategies-0.almd:20:34
  here: if exact_time < heuristic_time {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
20 |   if exact_time < heuristic_time {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 22:5 (got Else 'else')
  --> /tmp/dojo-race-strategies-0.almd:22:5
  here: } else if exact_time > heuristic_time {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |   } else if exact_time > heuristic_time {
   |     ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-0.almd:15:11
  in tuple destructure
  here: exact(n)
  hint: Destructure only tuples: `let (a, b) = pair`
   |
15 |     exact(n)
   |           ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-0.almd:18:15
  in tuple destructure
  here: heuristic(n)
  hint: Destructure only tuples: `let (a, b) = pair`
   |
18 |     heuristic(n)
   |               ^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-0.almd:3:11
  in fn 'exact'
  here: let i = 0
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
3 |   let i = 0
  |           ^

8 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
Compile error for /tmp/dojo-race-strategies-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let acc = 0
  let i = 0
  while i < n {
    let tmp = acc + i
    acc = tmp
    let tmp = i + 1
    i = tmp
  }
  acc
}

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n).unwrap() }
  let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).unwrap() }
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
error: Expected Then at line 18:34 (got LBrace '{')
  --> /tmp/dojo-race-strategies-1.almd:18:34
  here: if exact_time < heuristic_time {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
18 |   if exact_time < heuristic_time {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 20:5 (got Else 'else')
  --> /tmp/dojo-race-strategies-1.almd:20:5
  here: } else if exact_time > heuristic_time {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |   } else if exact_time > heuristic_time {
   |     ^
error[E009]: cannot reassign immutable binding 'acc'
  --> /tmp/dojo-race-strategies-1.almd:6:11
  in acc = ...
  here: acc = tmp
  hint: Use 'var acc = ...' instead of 'let acc = ...' to declare a mutable variable
  try:
      // let acc = ...  →  var acc = ...
      var acc = <initial value>
  |
2 |   let acc = 0
  |   ------------------- 'acc' declared here
...
6 |     acc = tmp
  |           ^^^
error[E009]: cannot reassign immutable binding 'i'
  --> /tmp/dojo-race-strategies-1.almd:8:9
  in i = ...
  here: i = tmp
  hint: Use 'var i = ...' instead of 'let i = ...' to declare a mutable variable
  try:
      // let i = ...  →  var i = ...
      var i = <initial value>
  |
3 |   let i = 0
  |   ----------------- 'i' declared here
...
8 |     i = tmp
  |         ^^^
error[E002]: undefined method 'unwrap' on int
  --> /tmp/dojo-race-strategies-1.almd:16:68
  in method call .unwrap()
  here: let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n).unwrap() }
  hint: Almide doesn't use method-call syntax. Write `int.<fn>(x)` (or `x |> int.<fn>`) — there is no method `unwrap` on `int`. Run `almide explain E002` for examples.
   |
16 |   let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n).unwrap() }
   |                                                                    ^
error[E001]: tuple pattern requires a tuple value, got Result[Unknown, String]
  --> /tmp/dojo-race-strategies-1.almd:16:68
  in tuple destructure
  here: let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n).unwrap() }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
16 |   let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n).unwrap() }
   |                                                                    ^
error[E002]: undefined method 'unwrap' on int
  --> /tmp/dojo-race-strategies-1.almd:17:80
  in method call .unwrap()
  here: let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).unwrap() }
  hint: Almide doesn't use method-call syntax. Write `int.<fn>(x)` (or `x |> int.<fn>`) — there is no method `unwrap` on `int`. Run `almide explain E002` for examples.
   |
17 |   let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).unwrap() }
   |                                                                                ^
error[E001]: tuple pattern requires a tuple value, got Result[Unknown, String]
  --> /tmp/dojo-race-strategies-1.almd:17:80
  in tuple destructure
  here: let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).unwrap() }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
17 |   let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).unwrap() }
   |                                                                                ^

8 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
Compile error for /tmp/dojo-race-strategies-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var acc = 0
  var i = 0
  while i < n {
    var tmp = acc + i
    acc = tmp
    var tmp = i + 1
    i = tmp
  }
  acc
}

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = {
  let exact_result = exact(n)
  let heuristic_result = heuristic(n)
  let (exact_time, _) = compute.ms(1) { exact(n) }
  let (heuristic_time, _) = compute.ms(1) { heuristic(n) }
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
error: Expected Then at line 20:34 (got LBrace '{')
  --> /tmp/dojo-race-strategies-2.almd:20:34
  here: if exact_time < heuristic_time {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
20 |   if exact_time < heuristic_time {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 22:5 (got Else 'else')
  --> /tmp/dojo-race-strategies-2.almd:22:5
  here: } else if exact_time > heuristic_time {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |   } else if exact_time > heuristic_time {
   |     ^
error[E001]: tuple pattern requires a tuple value, got Compute
  --> /tmp/dojo-race-strategies-2.almd:18:36
  in tuple destructure
  here: let (exact_time, _) = compute.ms(1) { exact(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
18 |   let (exact_time, _) = compute.ms(1) { exact(n) }
   |                                    ^
error[E001]: tuple pattern requires a tuple value, got Compute
  --> /tmp/dojo-race-strategies-2.almd:19:40
  in tuple destructure
  here: let (heuristic_time, _) = compute.ms(1) { heuristic(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
19 |   let (heuristic_time, _) = compute.ms(1) { heuristic(n) }
   |                                        ^

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
  var i = 0
  while i < n {
    var tmp = acc + i
    acc = tmp
    var tmp = i + 1
    i = tmp
  }
  acc
}

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, _) = compute.ms(1) { exact(n) }
  let (heuristic_time, _) = compute.ms(1) { heuristic(n) }
  if exact_time < heuristic_time then exact(n) else if exact_time > heuristic_time then heuristic(n) else -1
}
```

**Diagnostic:**

```
error[E001]: tuple pattern requires a tuple value, got Compute
  --> /tmp/dojo-race-strategies-3.almd:16:36
  in tuple destructure
  here: let (exact_time, _) = compute.ms(1) { exact(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
16 |   let (exact_time, _) = compute.ms(1) { exact(n) }
   |                                    ^
error[E001]: tuple pattern requires a tuple value, got Compute
  --> /tmp/dojo-race-strategies-3.almd:17:40
  in tuple destructure
  here: let (heuristic_time, _) = compute.ms(1) { heuristic(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
17 |   let (heuristic_time, _) = compute.ms(1) { heuristic(n) }
   |                                        ^

2 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
