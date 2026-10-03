# race-strategies

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E013`

## Attempts

### Attempt 1 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  let mut sum = 0;
  let i = 0;
  while i < n {
    sum += i;
    i += 1;
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) };
  let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) };
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
  here: let mut sum = 0;
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
2 |   let mut sum = 0;
  |       ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-0.almd:5:10
  in assignment-in-expr
  here: sum += i;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
5 |     sum += i;
  |          ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-race-strategies-0.almd:6:8
  in assignment-in-expr
  here: i += 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
6 |     i += 1;
  |        ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:3 (got Ident 'sum')
  --> /tmp/dojo-race-strategies-0.almd:8:3
  here: sum
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   sum
  |   ^
error: Expected Then at line 18:34 (got LBrace '{')
  --> /tmp/dojo-race-strategies-0.almd:18:34
  here: if exact_time < heuristic_time {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
18 |   if exact_time < heuristic_time {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 20:5 (got Else 'else')
  --> /tmp/dojo-race-strategies-0.almd:20:5
  here: } else if exact_time > heuristic_time {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |   } else if exact_time > heuristic_time {
   |     ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-0.almd:16:68
  in tuple destructure
  here: let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) };
  hint: Destructure only tuples: `let (a, b) = pair`
   |
16 |   let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n) };
   |                                                                    ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-0.almd:17:80
  in tuple destructure
  here: let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) };
  hint: Destructure only tuples: `let (a, b) = pair`
   |
17 |   let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n) };
   |                                                                                ^
error[E001]: type mismatch in fn 'exact': expected Int but got Unit
  --> /tmp/dojo-race-strategies-0.almd:3:11
  in fn 'exact'
  here: let i = 0;
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
3 |   let i = 0;
  |           ^

9 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
Compile error for /tmp/dojo-race-strategies-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0;
  var i = 0;
  while i < n {
    sum = sum + i;
    i = i + 1;
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n).time; exact(n) };
  let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) { heuristic(n).time; heuristic(n) };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}
```

**Diagnostic:**

```
error: fan.race arms are separated by `,` or a newline, not `;`, at line 16:75
  --> /tmp/dojo-race-strategies-1.almd:16:75
  here: let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n).time; exact(n) };
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
16 |   let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n).time; exact(n) };
   |                                                                           ^
error: Semicolons are not used in Almide at line 16:87
  --> /tmp/dojo-race-strategies-1.almd:16:87
  here: let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n).time; exact(n) };
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
16 |   let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n).time; exact(n) };
   |                                                                                       ^

2 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
Compile error for /tmp/dojo-race-strategies-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0;
  var i = 0;
  while i < n {
    sum = sum + i;
    i = i + 1;
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    let t = exact(n).time;
    exact(n)
  };
  let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) {
    let t = heuristic(n).time;
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}
```

**Diagnostic:**

```
error: `let` is not allowed inside fan.race at line 17:5
  --> /tmp/dojo-race-strategies-2.almd:17:5
  here: let t = exact(n).time;
  hint: race arms are expressions — wrap statements in a block arm: { let x = f(); g(x) }
   |
17 |     let t = exact(n).time;
   |     ^
error: Semicolons are not used in Almide at line 19:4
  --> /tmp/dojo-race-strategies-2.almd:19:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
19 |   };
   |    ^

2 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
Compile error for /tmp/dojo-race-strategies-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0;
  var i = 0;
  while i < n {
    sum = sum + i;
    i = i + 1;
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    { let t = exact(n).time; exact(n) }
  };
  let (heuristic_time, heuristic_result) = fan.race(compute.ms(1)) {
    { let t = heuristic(n).time; heuristic(n) }
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}
```

**Diagnostic:**

```
error[E013]: no field 'time' on Int — the type has no fields
  --> /tmp/dojo-race-strategies-3.almd:17:21
  in field access .time
  here: { let t = exact(n).time; exact(n) }
  hint: Almide values outside records have no fields. Use the type's stdlib module functions instead.
   |
17 |     { let t = exact(n).time; exact(n) }
   |                     ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-3.almd:17:36
  in tuple destructure
  here: { let t = exact(n).time; exact(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
17 |     { let t = exact(n).time; exact(n) }
   |                                    ^
error[E013]: no field 'time' on Int — the type has no fields
  --> /tmp/dojo-race-strategies-3.almd:20:25
  in field access .time
  here: { let t = heuristic(n).time; heuristic(n) }
  hint: Almide values outside records have no fields. Use the type's stdlib module functions instead.
   |
20 |     { let t = heuristic(n).time; heuristic(n) }
   |                         ^
error[E001]: tuple pattern requires a tuple value, got Result[Int, String]
  --> /tmp/dojo-race-strategies-3.almd:20:44
  in tuple destructure
  here: { let t = heuristic(n).time; heuristic(n) }
  hint: Destructure only tuples: `let (a, b) = pair`
   |
20 |     { let t = heuristic(n).time; heuristic(n) }
   |                                            ^

4 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
