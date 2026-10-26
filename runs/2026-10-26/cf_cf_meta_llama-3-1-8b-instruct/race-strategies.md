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
  let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n) }
  let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
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
error: Expected Then at line 16:34 (got LBrace '{')
  --> /tmp/dojo-race-strategies-0.almd:16:34
  here: if exact_cost < heuristic_cost {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
16 |   if exact_cost < heuristic_cost {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 18:5 (got Else 'else')
  --> /tmp/dojo-race-strategies-0.almd:18:5
  here: } else if exact_cost == heuristic_cost {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |   } else if exact_cost == heuristic_cost {
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
  here: let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
14 |   let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n) }
   |                                                                    ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-0.almd:15:80
  in tuple destructure
  here: let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
15 |   let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
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
  let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n).cost() }
  let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).cost() }
  if exact_cost < heuristic_cost {
    exact_result
  } else if exact_cost == heuristic_cost {
    exact_result
  } else {
    -1
  }
}

trait Cost {
  fn cost() -> Int
}

impl Cost for Int {
  fn cost() -> Int = {
    1
  }
}

impl Cost for Result[Int, String] {
  fn cost() -> Int = {
    1
  }
}
```

**Diagnostic:**

```
error: Expected Then at line 16:34 (got LBrace '{')
  --> /tmp/dojo-race-strategies-1.almd:16:34
  here: if exact_cost < heuristic_cost {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
16 |   if exact_cost < heuristic_cost {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 18:5 (got Else 'else')
  --> /tmp/dojo-race-strategies-1.almd:18:5
  here: } else if exact_cost == heuristic_cost {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |   } else if exact_cost == heuristic_cost {
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 27:1 (got RBrace '}')
  --> /tmp/dojo-race-strategies-1.almd:27:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
27 | }
   | ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 33:1 (got RBrace '}')
  --> /tmp/dojo-race-strategies-1.almd:33:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
33 | }
   | ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 39:1 (got RBrace '}')
  --> /tmp/dojo-race-strategies-1.almd:39:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
39 | }
   | ^
error[E012]: duplicate function 'cost'
  at line 30
  in fn cost
  here: fn cost() -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
26 |   fn cost() -> Int
   |   ------------------------------- first definition of 'cost' here
...
30 |   fn cost() -> Int = {
   |   ^
error[E012]: duplicate function 'cost'
  at line 36
  in fn cost
  here: fn cost() -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
26 |   fn cost() -> Int
   |   ------------------------------- first definition of 'cost' here
...
36 |   fn cost() -> Int = {
   |   ^
error[E004]: cost() expects 0 argument(s) but got 1
  --> /tmp/dojo-race-strategies-1.almd:14:68
  in call to cost()
  here: let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n).cost() }
  hint: Check the number of arguments
  try:
      // cost() takes 0 arg(s) — you passed 1
      cost()
   |
14 |   let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n).cost() }
   |                                                                    ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-1.almd:14:68
  in tuple destructure
  here: let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n).cost() }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
14 |   let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n).cost() }
   |                                                                    ^
error[E004]: cost() expects 0 argument(s) but got 1
  --> /tmp/dojo-race-strategies-1.almd:15:80
  in call to cost()
  here: let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).cost() }
  hint: Check the number of arguments
  try:
      // cost() takes 0 arg(s) — you passed 1
      cost()
   |
15 |   let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).cost() }
   |                                                                                ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-1.almd:15:80
  in tuple destructure
  here: let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).cost() }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
15 |   let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).cost() }
   |                                                                                ^
error[E057]: fn 'cost' has no body
  at line 26
  in fn cost
  here: fn cost() -> Int
  hint: Write the body after '=': `fn cost(...) -> T = expr` (or `= { ... }`). Only @extern / @intrinsic declarations may omit it
   |
26 |   fn cost() -> Int
   |   ^

12 error(s) found
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
  let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n).cost() }
  let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).cost() }
  if exact_cost < heuristic_cost {
    exact_result
  } else if exact_cost == heuristic_cost {
    exact_result
  } else {
    -1
  }
}

trait Cost {
  fn cost() -> Int
}

impl Cost for Int {
  fn cost() -> Int = 1
}

impl Cost for Result[Int, String] {
  fn cost() -> Int = 1
}

fn cost() -> Int = 1
```

**Diagnostic:**

```
error: Expected Then at line 16:34 (got LBrace '{')
  --> /tmp/dojo-race-strategies-2.almd:16:34
  here: if exact_cost < heuristic_cost {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
16 |   if exact_cost < heuristic_cost {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 18:5 (got Else 'else')
  --> /tmp/dojo-race-strategies-2.almd:18:5
  here: } else if exact_cost == heuristic_cost {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |   } else if exact_cost == heuristic_cost {
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 27:1 (got RBrace '}')
  --> /tmp/dojo-race-strategies-2.almd:27:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
27 | }
   | ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 31:1 (got RBrace '}')
  --> /tmp/dojo-race-strategies-2.almd:31:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
31 | }
   | ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 35:1 (got RBrace '}')
  --> /tmp/dojo-race-strategies-2.almd:35:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
35 | }
   | ^
error[E012]: duplicate function 'cost'
  at line 30
  in fn cost
  here: fn cost() -> Int = 1
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
26 |   fn cost() -> Int
   |   ------------------------------- first definition of 'cost' here
...
30 |   fn cost() -> Int = 1
   |   ^
error[E012]: duplicate function 'cost'
  at line 34
  in fn cost
  here: fn cost() -> Int = 1
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
26 |   fn cost() -> Int
   |   ------------------------------- first definition of 'cost' here
...
34 |   fn cost() -> Int = 1
   |   ^
error[E012]: duplicate function 'cost'
  at line 37
  in fn cost
  here: fn cost() -> Int = 1
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
26 |   fn cost() -> Int
   |   ------------------------------- first definition of 'cost' here
...
37 | fn cost() -> Int = 1
   | ^
error[E004]: cost() expects 0 argument(s) but got 1
  --> /tmp/dojo-race-strategies-2.almd:14:68
  in call to cost()
  here: let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n).cost() }
  hint: Check the number of arguments
  try:
      // cost() takes 0 arg(s) — you passed 1
      cost()
   |
14 |   let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n).cost() }
   |                                                                    ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-2.almd:14:68
  in tuple destructure
  here: let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n).cost() }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
14 |   let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n).cost() }
   |                                                                    ^
error[E004]: cost() expects 0 argument(s) but got 1
  --> /tmp/dojo-race-strategies-2.almd:15:80
  in call to cost()
  here: let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).cost() }
  hint: Check the number of arguments
  try:
      // cost() takes 0 arg(s) — you passed 1
      cost()
   |
15 |   let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).cost() }
   |                                                                                ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-2.almd:15:80
  in tuple destructure
  here: let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).cost() }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
15 |   let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).cost() }
   |                                                                                ^
error[E057]: fn 'cost' has no body
  at line 26
  in fn cost
  here: fn cost() -> Int
  hint: Write the body after '=': `fn cost(...) -> T = expr` (or `= { ... }`). Only @extern / @intrinsic declarations may omit it
   |
26 |   fn cost() -> Int
   |   ^

13 error(s) found
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
  let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n).cost() }
  let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).cost() }
  if exact_cost < heuristic_cost {
    exact_result
  } else if exact_cost == heuristic_cost {
    exact_result
  } else {
    -1
  }
}

trait Cost {
  fn cost() -> Int
}

impl Cost for Int {
  fn cost() -> Int = 1
}

impl Cost for Result[Int, String] {
  fn cost() -> Int = 1
}

fn cost() -> Int = 1

import compute

fn cost() -> Int = 1
```

**Diagnostic:**

```
error: Expected Then at line 16:34 (got LBrace '{')
  --> /tmp/dojo-race-strategies-3.almd:16:34
  here: if exact_cost < heuristic_cost {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
16 |   if exact_cost < heuristic_cost {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 18:5 (got Else 'else')
  --> /tmp/dojo-race-strategies-3.almd:18:5
  here: } else if exact_cost == heuristic_cost {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |   } else if exact_cost == heuristic_cost {
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 27:1 (got RBrace '}')
  --> /tmp/dojo-race-strategies-3.almd:27:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
27 | }
   | ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 31:1 (got RBrace '}')
  --> /tmp/dojo-race-strategies-3.almd:31:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
31 | }
   | ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 35:1 (got RBrace '}')
  --> /tmp/dojo-race-strategies-3.almd:35:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
35 | }
   | ^
error: Unexpected token at top level at line 39:1
  --> /tmp/dojo-race-strategies-3.almd:39:1
  here: import compute
  hint: All imports must come before other declarations.
   |
39 | import compute
   | ^
error[E012]: duplicate function 'cost'
  at line 30
  in fn cost
  here: fn cost() -> Int = 1
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
26 |   fn cost() -> Int
   |   ------------------------------- first definition of 'cost' here
...
30 |   fn cost() -> Int = 1
   |   ^
error[E012]: duplicate function 'cost'
  at line 34
  in fn cost
  here: fn cost() -> Int = 1
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
26 |   fn cost() -> Int
   |   ------------------------------- first definition of 'cost' here
...
34 |   fn cost() -> Int = 1
   |   ^
error[E012]: duplicate function 'cost'
  at line 37
  in fn cost
  here: fn cost() -> Int = 1
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
26 |   fn cost() -> Int
   |   ------------------------------- first definition of 'cost' here
...
37 | fn cost() -> Int = 1
   | ^
error[E012]: duplicate function 'cost'
  at line 41
  in fn cost
  here: fn cost() -> Int = 1
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
26 |   fn cost() -> Int
   |   ------------------------------- first definition of 'cost' here
...
41 | fn cost() -> Int = 1
   | ^
error[E004]: cost() expects 0 argument(s) but got 1
  --> /tmp/dojo-race-strategies-3.almd:14:68
  in call to cost()
  here: let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n).cost() }
  hint: Check the number of arguments
  try:
      // cost() takes 0 arg(s) — you passed 1
      cost()
   |
14 |   let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n).cost() }
   |                                                                    ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-3.almd:14:68
  in tuple destructure
  here: let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n).cost() }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
14 |   let (exact_cost, exact_result) = fan.race(compute.ms(1)) { exact(n).cost() }
   |                                                                    ^
error[E004]: cost() expects 0 argument(s) but got 1
  --> /tmp/dojo-race-strategies-3.almd:15:80
  in call to cost()
  here: let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).cost() }
  hint: Check the number of arguments
  try:
      // cost() takes 0 arg(s) — you passed 1
      cost()
   |
15 |   let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).cost() }
   |                                                                                ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-3.almd:15:80
  in tuple destructure
  here: let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).cost() }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
15 |   let (heuristic_cost, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).cost() }
   |                                                                                ^
error[E057]: fn 'cost' has no body
  at line 26
  in fn cost
  here: fn cost() -> Int
  hint: Write the body after '=': `fn cost(...) -> T = expr` (or `= { ... }`). Only @extern / @intrinsic declarations may omit it
   |
26 |   fn cost() -> Int
   |   ^

15 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
