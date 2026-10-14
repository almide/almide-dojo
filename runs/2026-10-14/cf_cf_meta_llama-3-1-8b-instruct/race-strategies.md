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
    acc += 1
  }
  acc
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_cost, exact_result) = fan.race(compute.ms(1)) {
    exact(n)
  }
  let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) {
    heuristic(n)
  }
  if exact_cost < heuristic_cost {
    exact_result
  } else if exact_cost == heuristic_cost {
    exact_result
  } else {
    -1
  }
}
```

**Diagnostic:**

```
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-0.almd:4:10
  in assignment-in-expr
  here: acc += 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
4 |     acc += 1
  |          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 6:3 (got Ident 'acc')
  --> /tmp/dojo-race-strategies-0.almd:6:3
  here: acc
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
6 |   acc
  |   ^
error: Expected Then at line 20:34 (got LBrace '{')
  --> /tmp/dojo-race-strategies-0.almd:20:34
  here: if exact_cost < heuristic_cost {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
20 |   if exact_cost < heuristic_cost {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 22:5 (got Else 'else')
  --> /tmp/dojo-race-strategies-0.almd:22:5
  here: } else if exact_cost == heuristic_cost {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |   } else if exact_cost == heuristic_cost {
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
  --> /tmp/dojo-race-strategies-0.almd:2:13
  in fn 'exact'
  here: let acc = 0
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let acc = 0
  |             ^

7 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
Compile error for /tmp/dojo-race-strategies-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

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
  let (exact_cost, exact_result) = fan.race(compute.ms(1)) {
    let result = exact(n)
    (compute.ms(), result)
  }
  let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) {
    let result = heuristic(n)
    (compute.ms(), result)
  }
  if exact_cost < heuristic_cost {
    exact_result
  } else if exact_cost == heuristic_cost {
    exact_result
  } else {
    -1
  }
}
```

**Diagnostic:**

```
error: `let` is not allowed inside fan.race at line 15:5
  --> /tmp/dojo-race-strategies-1.almd:15:5
  here: let result = exact(n)
  hint: race arms are expressions — wrap statements in a block arm: { let x = f(); g(x) }
   |
15 |     let result = exact(n)
   |     ^
error: Expected name at line 18:7 (got LParen '(')
  --> /tmp/dojo-race-strategies-1.almd:18:7
  here: let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |   let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) {
   |       ^
error[E009]: cannot reassign immutable binding 'acc'
  --> /tmp/dojo-race-strategies-1.almd:4:17
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

3 error(s) found
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
  let (exact_cost, exact_result) = fan.race(compute.ms(1)) {
    exact(n)
  }
  let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) {
    heuristic(n)
  }
  if exact_cost < heuristic_cost {
    exact_result
  } else if exact_cost == heuristic_cost {
    exact_result
  } else {
    -1
  }
}
```

**Diagnostic:**

```
error: Expected Then at line 20:34 (got LBrace '{')
  --> /tmp/dojo-race-strategies-2.almd:20:34
  here: if exact_cost < heuristic_cost {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
20 |   if exact_cost < heuristic_cost {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 22:5 (got Else 'else')
  --> /tmp/dojo-race-strategies-2.almd:22:5
  here: } else if exact_cost == heuristic_cost {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |   } else if exact_cost == heuristic_cost {
   |     ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-2.almd:15:11
  in tuple destructure
  here: exact(n)
  hint: Destructure only tuples: `let (a, b) = pair`
   |
15 |     exact(n)
   |           ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-2.almd:18:15
  in tuple destructure
  here: heuristic(n)
  hint: Destructure only tuples: `let (a, b) = pair`
   |
18 |     heuristic(n)
   |               ^

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
  let (exact_cost, exact_result) = fan.race(compute.ms(1)) {
    let (exact_result, _) = exact(n)
    (exact_result, exact_result)
  }
  let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) {
    let (heuristic_result, _) = heuristic(n)
    (heuristic_result, heuristic_result)
  }
  if exact_cost < heuristic_cost {
    exact_result
  } else if exact_cost == heuristic_cost {
    exact_result
  } else {
    -1
  }
}
```

**Diagnostic:**

```
error: `let` is not allowed inside fan.race at line 15:5
  --> /tmp/dojo-race-strategies-3.almd:15:5
  here: let (exact_result, _) = exact(n)
  hint: race arms are expressions — wrap statements in a block arm: { let x = f(); g(x) }
   |
15 |     let (exact_result, _) = exact(n)
   |     ^
error: Expected name at line 18:7 (got LParen '(')
  --> /tmp/dojo-race-strategies-3.almd:18:7
  here: let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |   let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) {
   |       ^

2 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
