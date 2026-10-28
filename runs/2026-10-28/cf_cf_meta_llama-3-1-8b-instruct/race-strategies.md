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
  let sum = 0
  while n > 0 {
    sum += n
    n -= 1
  }
  sum
}

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  }
  match (exact_time, heuristic_time) {
    (Some(exact_time), Some(heuristic_time)) => {
      if exact_time < heuristic_time {
        exact(n)
      } else if exact_time > heuristic_time {
        heuristic(n)
      } else {
        exact(n)
      }
    }
    _ => -1
  }
}
```

**Diagnostic:**

```
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
error: fan.race arms are separated by `,` or a newline, not `;`, at line 14:13
  --> /tmp/dojo-race-strategies-0.almd:14:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
14 |     exact(n);
   |             ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 17:3 (got Match 'match')
  --> /tmp/dojo-race-strategies-0.almd:17:3
  here: match (exact_time, heuristic_time) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   match (exact_time, heuristic_time) {
   |   ^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-0.almd:2:13
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

6 error(s) found
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
    let tmp = sum + n
    sum = tmp
    n -= 1
  }
  sum
}

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
    let _ = exact(n);
    let _ = heuristic(n)
  }
  match (exact_time, heuristic_time) {
    (Some(exact_time), Some(heuristic_time)) => {
      if exact_time < heuristic_time {
        exact(n)
      } else if exact_time > heuristic_time {
        heuristic(n)
      } else {
        exact(n)
      }
    }
    _ => -1
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
error: `let` is not allowed inside fan.race at line 15:5
  --> /tmp/dojo-race-strategies-1.almd:15:5
  here: let _ = exact(n);
  hint: race arms are expressions — wrap statements in a block arm: { let x = f(); g(x) }
   |
15 |     let _ = exact(n);
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 18:3 (got Match 'match')
  --> /tmp/dojo-race-strategies-1.almd:18:3
  here: match (exact_time, heuristic_time) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |   match (exact_time, heuristic_time) {
   |   ^
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

5 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
Compile error for /tmp/dojo-race-strategies-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let sum = 0
  while n > 0 {
    let tmp = sum + n
    sum = tmp
    n -= 1
  }
  sum
}

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
    let _ = { exact(n); 0 }
    let _ = { heuristic(n); 0 }
  }
  match (exact_time, heuristic_time) {
    (Some(exact_time), Some(heuristic_time)) => {
      if exact_time < heuristic_time {
        exact(n)
      } else if exact_time > heuristic_time {
        heuristic(n)
      } else {
        exact(n)
      }
    }
    _ => -1
  }
}
```

**Diagnostic:**

```
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-2.almd:6:8
  in assignment-in-expr
  here: n -= 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
6 |     n -= 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:3 (got Ident 'sum')
  --> /tmp/dojo-race-strategies-2.almd:8:3
  here: sum
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   sum
  |   ^
error: `let` is not allowed inside fan.race at line 15:5
  --> /tmp/dojo-race-strategies-2.almd:15:5
  here: let _ = { exact(n); 0 }
  hint: race arms are expressions — wrap statements in a block arm: { let x = f(); g(x) }
   |
15 |     let _ = { exact(n); 0 }
   |     ^
error: Expected name at line 16:9 (got Underscore '_')
  --> /tmp/dojo-race-strategies-2.almd:16:9
  here: let _ = { heuristic(n); 0 }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |     let _ = { heuristic(n); 0 }
   |         ^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-2.almd:2:13
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

5 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
Compile error for /tmp/dojo-race-strategies-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let sum = 0
  while n > 0 {
    let tmp = sum + n
    sum = tmp
    n -= 1
  }
  sum
}

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, heuristic_time) = fan.race(compute.ms(1)) {
    { exact(n); 0 }
    { heuristic(n); 0 }
  }
  match (exact_time, heuristic_time) {
    (Some(exact_time), Some(heuristic_time)) => {
      if exact_time < heuristic_time {
        exact(n)
      } else if exact_time > heuristic_time {
        heuristic(n)
      } else {
        exact(n)
      }
    }
    _ => -1
  }
}
```

**Diagnostic:**

```
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-3.almd:6:8
  in assignment-in-expr
  here: n -= 1
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
6 |     n -= 1
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:3 (got Ident 'sum')
  --> /tmp/dojo-race-strategies-3.almd:8:3
  here: sum
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   sum
  |   ^
error: Expected Then at line 20:38 (got LBrace '{')
  --> /tmp/dojo-race-strategies-3.almd:20:38
  here: if exact_time < heuristic_time {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
20 |       if exact_time < heuristic_time {
   |                                      ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 24:9 (got Else 'else')
  --> /tmp/dojo-race-strategies-3.almd:24:9
  here: } else {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
24 |       } else {
   |         ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-3.almd:16:21
  in tuple destructure
  here: { heuristic(n); 0 }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
16 |     { heuristic(n); 0 }
   |                     ^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-3.almd:2:13
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

6 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
