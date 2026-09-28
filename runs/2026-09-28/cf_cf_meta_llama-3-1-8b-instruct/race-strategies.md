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
  let mut sum = 0
  while n > 0 {
    sum += n
    n -= 1
  }
  sum
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
error: 'let mut' is not valid in Almide at line 2:7
  --> /tmp/dojo-race-strategies-0.almd:2:7
  here: let mut sum = 0
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
2 |   let mut sum = 0
  |       ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-0.almd:4:10
  in assignment-in-expr
  here: sum += n
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
4 |     sum += n
  |          ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-0.almd:5:8
  in assignment-in-expr
  here: n -= 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
5 |     n -= 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:3 (got Ident 'sum')
  --> /tmp/dojo-race-strategies-0.almd:7:3
  here: sum
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |   sum
  |   ^
error: Expected Then at line 17:34 (got LBrace '{')
  --> /tmp/dojo-race-strategies-0.almd:17:34
  here: if exact_time < heuristic_time {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
17 |   if exact_time < heuristic_time {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 19:5 (got Else 'else')
  --> /tmp/dojo-race-strategies-0.almd:19:5
  here: } else if exact_time > heuristic_time {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 |   } else if exact_time > heuristic_time {
   |     ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-0.almd:15:68
  in tuple destructure
  here: let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
15 |   let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) }
   |                                                                    ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-0.almd:16:80
  in tuple destructure
  here: let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
16 |   let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
   |                                                                                ^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-0.almd:1:27
  in fn 'exact'
  here: fn exact(n: Int) -> Int = {
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
1 | fn exact(n: Int) -> Int = {
  |                           ^

9 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
Compile error for /tmp/dojo-race-strategies-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let sum = 0
  while n > 0 {
    let r = sum + n
    sum = r
    n -= 1
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

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
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-1.almd:6:8
  in assignment-in-expr
  here: n -= 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
6 |     n -= 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:3 (got Ident 'sum')
  --> /tmp/dojo-race-strategies-1.almd:8:3
  here: sum
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   sum
  |   ^
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
error[E002]: undefined method 'unwrap' on int
  --> /tmp/dojo-race-strategies-1.almd:16:62
  in method call .unwrap()
  here: let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n).unwrap() }
  hint: Almide doesn't use method-call syntax. Write `int.<fn>(x)` (or `x |> int.<fn>`) — there is no method `unwrap` on `int`. Run `almide explain E002` for examples.
   |
16 |   let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n).unwrap() }
   |                                                              ^^^^^^^^^^^^^^^^^
error[E001]: tuple pattern requires a tuple value, got Result[Unknown, String]
  --> /tmp/dojo-race-strategies-1.almd:16:68
  in tuple destructure
  here: let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n).unwrap() }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
16 |   let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n).unwrap() }
   |                                                                    ^
error[E002]: undefined method 'unwrap' on int
  --> /tmp/dojo-race-strategies-1.almd:17:70
  in method call .unwrap()
  here: let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).unwrap() }
  hint: Almide doesn't use method-call syntax. Write `int.<fn>(x)` (or `x |> int.<fn>`) — there is no method `unwrap` on `int`. Run `almide explain E002` for examples.
   |
17 |   let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).unwrap() }
   |                                                                      ^^^^^^^^^^^^^^^^^^^^^
error[E001]: tuple pattern requires a tuple value, got Result[Unknown, String]
  --> /tmp/dojo-race-strategies-1.almd:17:80
  in tuple destructure
  here: let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).unwrap() }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
17 |   let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).unwrap() }
   |                                                                                ^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-1.almd:2:13
  in fn 'exact'
  here: let sum = 0
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let sum = 0
  |             ^

9 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
Compile error for /tmp/dojo-race-strategies-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let sum = 0
  let i = 0
  while i < n {
    let r = sum + i
    sum = r
    i += 1
  }
  sum
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
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-2.almd:7:8
  in assignment-in-expr
  here: i += 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |     i += 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:3 (got Ident 'sum')
  --> /tmp/dojo-race-strategies-2.almd:9:3
  here: sum
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |   sum
  |   ^
error: Expected Then at line 19:34 (got LBrace '{')
  --> /tmp/dojo-race-strategies-2.almd:19:34
  here: if exact_time < heuristic_time {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
19 |   if exact_time < heuristic_time {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 21:5 (got Else 'else')
  --> /tmp/dojo-race-strategies-2.almd:21:5
  here: } else if exact_time > heuristic_time {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   } else if exact_time > heuristic_time {
   |     ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-2.almd:17:68
  in tuple destructure
  here: let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
17 |   let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) }
   |                                                                    ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-2.almd:18:80
  in tuple destructure
  here: let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
18 |   let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) }
   |                                                                                ^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-2.almd:3:11
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

7 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
Compile error for /tmp/dojo-race-strategies-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let sum = 0
  let i = 0
  while i < n {
    let r = sum + i
    sum = r
    i += 1
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

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
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-3.almd:7:8
  in assignment-in-expr
  here: i += 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |     i += 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:3 (got Ident 'sum')
  --> /tmp/dojo-race-strategies-3.almd:9:3
  here: sum
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |   sum
  |   ^
error: Expected Then at line 19:34 (got LBrace '{')
  --> /tmp/dojo-race-strategies-3.almd:19:34
  here: if exact_time < heuristic_time {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
19 |   if exact_time < heuristic_time {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 21:5 (got Else 'else')
  --> /tmp/dojo-race-strategies-3.almd:21:5
  here: } else if exact_time > heuristic_time {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   } else if exact_time > heuristic_time {
   |     ^
error[E002]: undefined method 'unwrap' on int
  --> /tmp/dojo-race-strategies-3.almd:17:62
  in method call .unwrap()
  here: let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n).unwrap() }
  hint: Almide doesn't use method-call syntax. Write `int.<fn>(x)` (or `x |> int.<fn>`) — there is no method `unwrap` on `int`. Run `almide explain E002` for examples.
   |
17 |   let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n).unwrap() }
   |                                                              ^^^^^^^^^^^^^^^^^
error[E001]: tuple pattern requires a tuple value, got Result[Unknown, String]
  --> /tmp/dojo-race-strategies-3.almd:17:68
  in tuple destructure
  here: let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n).unwrap() }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
17 |   let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n).unwrap() }
   |                                                                    ^
error[E002]: undefined method 'unwrap' on int
  --> /tmp/dojo-race-strategies-3.almd:18:70
  in method call .unwrap()
  here: let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).unwrap() }
  hint: Almide doesn't use method-call syntax. Write `int.<fn>(x)` (or `x |> int.<fn>`) — there is no method `unwrap` on `int`. Run `almide explain E002` for examples.
   |
18 |   let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).unwrap() }
   |                                                                      ^^^^^^^^^^^^^^^^^^^^^
error[E001]: tuple pattern requires a tuple value, got Result[Unknown, String]
  --> /tmp/dojo-race-strategies-3.almd:18:80
  in tuple destructure
  here: let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).unwrap() }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
18 |   let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).unwrap() }
   |                                                                                ^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-3.almd:3:11
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

9 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
