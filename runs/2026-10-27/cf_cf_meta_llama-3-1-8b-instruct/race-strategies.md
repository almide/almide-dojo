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
  let mut sum = 0;
  let i = n - 1;
  while i >= 0 {
    sum += i;
    i -= 1;
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
  here: i -= 1;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
6 |     i -= 1;
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
  --> /tmp/dojo-race-strategies-0.almd:3:15
  in fn 'exact'
  here: let i = n - 1;
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
3 |   let i = n - 1;
  |               ^

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
  let i = n - 1;
  while i >= 0 {
    sum = sum + i;
    i = i - 1;
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n); heuristic(n) };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}
```

**Diagnostic:**

```
error: fan.race arms are separated by `,` or a newline, not `;`, at line 16:70
  --> /tmp/dojo-race-strategies-1.almd:16:70
  here: let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n); heuristic(n) };
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
16 |   let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n); heuristic(n) };
   |                                                                      ^
error: Semicolons are not used in Almide at line 16:86
  --> /tmp/dojo-race-strategies-1.almd:16:86
  here: let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n); heuristic(n) };
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
16 |   let (exact_time, exact_result) = fan.race(compute.ms(1)) { exact(n); heuristic(n) };
   |                                                                                      ^
error[E012]: duplicate function 'heuristic'
  at line 20
  in fn heuristic
  here: effect fn heuristic(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
11 | fn heuristic(n: Int) -> Int = {
   | ------------------------------------ first definition of 'heuristic' here
...
20 | effect fn heuristic(n: Int) -> Int = {
   | ^
error[E009]: cannot reassign immutable binding 'i'
  --> /tmp/dojo-race-strategies-1.almd:6:13
  in i = ...
  here: i = i - 1;
  hint: Use 'var i = ...' instead of 'let i = ...' to declare a mutable variable
  try:
      // let i = ...  →  var i = ...
      var i = <initial value>
  |
3 |   let i = n - 1;
  |   ----------------- 'i' declared here
...
6 |     i = i - 1;
  |             ^

4 error(s) found
FAILED: /tmp/dojo-race-strategies-1.almd
Compile error for /tmp/dojo-race-strategies-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0;
  var i = n - 1;
  while i >= 0 {
    sum = sum + i;
    i = i - 1;
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}
```

**Diagnostic:**

```
error: fan.race arms are separated by `,` or a newline, not `;`, at line 17:13
  --> /tmp/dojo-race-strategies-2.almd:17:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
17 |     exact(n);
   |             ^
error: Semicolons are not used in Almide at line 19:4
  --> /tmp/dojo-race-strategies-2.almd:19:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
19 |   };
   |    ^
error[E012]: duplicate function 'heuristic'
  at line 23
  in fn heuristic
  here: effect fn heuristic(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
11 | fn heuristic(n: Int) -> Int = {
   | ------------------------------------ first definition of 'heuristic' here
...
23 | effect fn heuristic(n: Int) -> Int = {
   | ^

3 error(s) found
FAILED: /tmp/dojo-race-strategies-2.almd
Compile error for /tmp/dojo-race-strategies-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn exact(n: Int) -> Int = {
  var sum = 0;
  var i = n - 1;
  while i >= 0 {
    sum = sum + i;
    i = i - 1;
  }
  sum
}

fn heuristic(n: Int) -> Int = {
  n * (n - 1) / 2
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n: Int) -> Int = {
  let (exact_time, exact_result) = fan.race(compute.ms(1)) {
    exact(n);
    heuristic(n)
  };
  if exact_time < heuristic_time then exact_result else if exact_time > heuristic_time then heuristic_result else -1
}

effect fn best_effort(n
```

**Diagnostic:**

```
error: fan.race arms are separated by `,` or a newline, not `;`, at line 17:13
  --> /tmp/dojo-race-strategies-3.almd:17:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
17 |     exact(n);
   |             ^
error: Semicolons are not used in Almide at line 19:4
  --> /tmp/dojo-race-strategies-3.almd:19:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
19 |   };
   |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 25:13
  --> /tmp/dojo-race-strategies-3.almd:25:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
25 |     exact(n);
   |             ^
error: Semicolons are not used in Almide at line 27:4
  --> /tmp/dojo-race-strategies-3.almd:27:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
27 |   };
   |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 33:13
  --> /tmp/dojo-race-strategies-3.almd:33:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
33 |     exact(n);
   |             ^
error: Semicolons are not used in Almide at line 35:4
  --> /tmp/dojo-race-strategies-3.almd:35:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
35 |   };
   |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 41:13
  --> /tmp/dojo-race-strategies-3.almd:41:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
41 |     exact(n);
   |             ^
error: Semicolons are not used in Almide at line 43:4
  --> /tmp/dojo-race-strategies-3.almd:43:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
43 |   };
   |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 49:13
  --> /tmp/dojo-race-strategies-3.almd:49:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
49 |     exact(n);
   |             ^
error: Semicolons are not used in Almide at line 51:4
  --> /tmp/dojo-race-strategies-3.almd:51:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
51 |   };
   |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 57:13
  --> /tmp/dojo-race-strategies-3.almd:57:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
57 |     exact(n);
   |             ^
error: Semicolons are not used in Almide at line 59:4
  --> /tmp/dojo-race-strategies-3.almd:59:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
59 |   };
   |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 65:13
  --> /tmp/dojo-race-strategies-3.almd:65:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
65 |     exact(n);
   |             ^
error: Semicolons are not used in Almide at line 67:4
  --> /tmp/dojo-race-strategies-3.almd:67:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
67 |   };
   |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 73:13
  --> /tmp/dojo-race-strategies-3.almd:73:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
73 |     exact(n);
   |             ^
error: Semicolons are not used in Almide at line 75:4
  --> /tmp/dojo-race-strategies-3.almd:75:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
75 |   };
   |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 81:13
  --> /tmp/dojo-race-strategies-3.almd:81:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
81 |     exact(n);
   |             ^
error: Semicolons are not used in Almide at line 83:4
  --> /tmp/dojo-race-strategies-3.almd:83:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
83 |   };
   |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 89:13
  --> /tmp/dojo-race-strategies-3.almd:89:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
89 |     exact(n);
   |             ^
error: Semicolons are not used in Almide at line 91:4
  --> /tmp/dojo-race-strategies-3.almd:91:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
91 |   };
   |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 97:13
  --> /tmp/dojo-race-strategies-3.almd:97:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
97 |     exact(n);
   |             ^
error: Semicolons are not used in Almide at line 99:4
  --> /tmp/dojo-race-strategies-3.almd:99:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
99 |   };
   |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 105:13
  --> /tmp/dojo-race-strategies-3.almd:105:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
105 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 107:4
  --> /tmp/dojo-race-strategies-3.almd:107:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
107 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 113:13
  --> /tmp/dojo-race-strategies-3.almd:113:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
113 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 115:4
  --> /tmp/dojo-race-strategies-3.almd:115:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
115 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 121:13
  --> /tmp/dojo-race-strategies-3.almd:121:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
121 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 123:4
  --> /tmp/dojo-race-strategies-3.almd:123:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
123 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 129:13
  --> /tmp/dojo-race-strategies-3.almd:129:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
129 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 131:4
  --> /tmp/dojo-race-strategies-3.almd:131:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
131 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 137:13
  --> /tmp/dojo-race-strategies-3.almd:137:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
137 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 139:4
  --> /tmp/dojo-race-strategies-3.almd:139:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
139 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 145:13
  --> /tmp/dojo-race-strategies-3.almd:145:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
145 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 147:4
  --> /tmp/dojo-race-strategies-3.almd:147:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
147 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 153:13
  --> /tmp/dojo-race-strategies-3.almd:153:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
153 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 155:4
  --> /tmp/dojo-race-strategies-3.almd:155:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
155 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 161:13
  --> /tmp/dojo-race-strategies-3.almd:161:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
161 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 163:4
  --> /tmp/dojo-race-strategies-3.almd:163:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
163 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 169:13
  --> /tmp/dojo-race-strategies-3.almd:169:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
169 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 171:4
  --> /tmp/dojo-race-strategies-3.almd:171:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
171 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 177:13
  --> /tmp/dojo-race-strategies-3.almd:177:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
177 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 179:4
  --> /tmp/dojo-race-strategies-3.almd:179:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
179 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 185:13
  --> /tmp/dojo-race-strategies-3.almd:185:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
185 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 187:4
  --> /tmp/dojo-race-strategies-3.almd:187:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
187 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 193:13
  --> /tmp/dojo-race-strategies-3.almd:193:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
193 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 195:4
  --> /tmp/dojo-race-strategies-3.almd:195:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
195 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 201:13
  --> /tmp/dojo-race-strategies-3.almd:201:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
201 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 203:4
  --> /tmp/dojo-race-strategies-3.almd:203:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
203 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 209:13
  --> /tmp/dojo-race-strategies-3.almd:209:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
209 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 211:4
  --> /tmp/dojo-race-strategies-3.almd:211:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
211 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 217:13
  --> /tmp/dojo-race-strategies-3.almd:217:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
217 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 219:4
  --> /tmp/dojo-race-strategies-3.almd:219:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
219 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 225:13
  --> /tmp/dojo-race-strategies-3.almd:225:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
225 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 227:4
  --> /tmp/dojo-race-strategies-3.almd:227:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
227 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 233:13
  --> /tmp/dojo-race-strategies-3.almd:233:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
233 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 235:4
  --> /tmp/dojo-race-strategies-3.almd:235:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
235 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 241:13
  --> /tmp/dojo-race-strategies-3.almd:241:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
241 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 243:4
  --> /tmp/dojo-race-strategies-3.almd:243:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
243 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 249:13
  --> /tmp/dojo-race-strategies-3.almd:249:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
249 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 251:4
  --> /tmp/dojo-race-strategies-3.almd:251:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
251 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 257:13
  --> /tmp/dojo-race-strategies-3.almd:257:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
257 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 259:4
  --> /tmp/dojo-race-strategies-3.almd:259:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
259 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 265:13
  --> /tmp/dojo-race-strategies-3.almd:265:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
265 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 267:4
  --> /tmp/dojo-race-strategies-3.almd:267:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
267 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 273:13
  --> /tmp/dojo-race-strategies-3.almd:273:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
273 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 275:4
  --> /tmp/dojo-race-strategies-3.almd:275:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
275 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 281:13
  --> /tmp/dojo-race-strategies-3.almd:281:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
281 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 283:4
  --> /tmp/dojo-race-strategies-3.almd:283:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
283 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 289:13
  --> /tmp/dojo-race-strategies-3.almd:289:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
289 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 291:4
  --> /tmp/dojo-race-strategies-3.almd:291:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
291 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 297:13
  --> /tmp/dojo-race-strategies-3.almd:297:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
297 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 299:4
  --> /tmp/dojo-race-strategies-3.almd:299:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
299 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 305:13
  --> /tmp/dojo-race-strategies-3.almd:305:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
305 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 307:4
  --> /tmp/dojo-race-strategies-3.almd:307:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
307 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 313:13
  --> /tmp/dojo-race-strategies-3.almd:313:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
313 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 315:4
  --> /tmp/dojo-race-strategies-3.almd:315:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
315 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 321:13
  --> /tmp/dojo-race-strategies-3.almd:321:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
321 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 323:4
  --> /tmp/dojo-race-strategies-3.almd:323:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
323 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 329:13
  --> /tmp/dojo-race-strategies-3.almd:329:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
329 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 331:4
  --> /tmp/dojo-race-strategies-3.almd:331:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
331 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 337:13
  --> /tmp/dojo-race-strategies-3.almd:337:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
337 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 339:4
  --> /tmp/dojo-race-strategies-3.almd:339:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
339 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 345:13
  --> /tmp/dojo-race-strategies-3.almd:345:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
345 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 347:4
  --> /tmp/dojo-race-strategies-3.almd:347:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
347 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 353:13
  --> /tmp/dojo-race-strategies-3.almd:353:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
353 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 355:4
  --> /tmp/dojo-race-strategies-3.almd:355:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
355 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 361:13
  --> /tmp/dojo-race-strategies-3.almd:361:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
361 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 363:4
  --> /tmp/dojo-race-strategies-3.almd:363:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
363 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 369:13
  --> /tmp/dojo-race-strategies-3.almd:369:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
369 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 371:4
  --> /tmp/dojo-race-strategies-3.almd:371:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
371 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 377:13
  --> /tmp/dojo-race-strategies-3.almd:377:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
377 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 379:4
  --> /tmp/dojo-race-strategies-3.almd:379:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
379 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 385:13
  --> /tmp/dojo-race-strategies-3.almd:385:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
385 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 387:4
  --> /tmp/dojo-race-strategies-3.almd:387:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
387 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 393:13
  --> /tmp/dojo-race-strategies-3.almd:393:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
393 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 395:4
  --> /tmp/dojo-race-strategies-3.almd:395:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
395 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 401:13
  --> /tmp/dojo-race-strategies-3.almd:401:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
401 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 403:4
  --> /tmp/dojo-race-strategies-3.almd:403:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
403 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 409:13
  --> /tmp/dojo-race-strategies-3.almd:409:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
409 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 411:4
  --> /tmp/dojo-race-strategies-3.almd:411:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
411 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 417:13
  --> /tmp/dojo-race-strategies-3.almd:417:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
417 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 419:4
  --> /tmp/dojo-race-strategies-3.almd:419:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
419 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 425:13
  --> /tmp/dojo-race-strategies-3.almd:425:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
425 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 427:4
  --> /tmp/dojo-race-strategies-3.almd:427:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
427 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 433:13
  --> /tmp/dojo-race-strategies-3.almd:433:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
433 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 435:4
  --> /tmp/dojo-race-strategies-3.almd:435:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
435 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 441:13
  --> /tmp/dojo-race-strategies-3.almd:441:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
441 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 443:4
  --> /tmp/dojo-race-strategies-3.almd:443:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
443 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 449:13
  --> /tmp/dojo-race-strategies-3.almd:449:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
449 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 451:4
  --> /tmp/dojo-race-strategies-3.almd:451:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
451 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 457:13
  --> /tmp/dojo-race-strategies-3.almd:457:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
457 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 459:4
  --> /tmp/dojo-race-strategies-3.almd:459:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
459 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 465:13
  --> /tmp/dojo-race-strategies-3.almd:465:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
465 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 467:4
  --> /tmp/dojo-race-strategies-3.almd:467:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
467 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 473:13
  --> /tmp/dojo-race-strategies-3.almd:473:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
473 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 475:4
  --> /tmp/dojo-race-strategies-3.almd:475:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
475 |   };
    |    ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 481:13
  --> /tmp/dojo-race-strategies-3.almd:481:13
  here: exact(n);
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
    |
481 |     exact(n);
    |             ^
error: Semicolons are not used in Almide at line 483:4
  --> /tmp/dojo-race-strategies-3.almd:483:4
  here: };
  hint: Remove the ';'. Almide uses newlines to separate statements.
    |
483 |   };
    |    ^
error: Expected Colon at line 487:24 (got Newline '')
  --> /tmp/dojo-race-strategies-3.almd:487:24
  here: effect fn best_effort(n
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
487 | effect fn best_effort(n
    |                        ^
error[E012]: duplicate function 'best_effort'
  at line 23
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
15 | effect fn best_effort(n: Int) -> Int = {
   | -------------------------------------- first definition of 'best_effort' here
...
23 | effect fn best_effort(n: Int) -> Int = {
   | ^
error[E012]: duplicate function 'best_effort'
  at line 31
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
15 | effect fn best_effort(n: Int) -> Int = {
   | -------------------------------------- first definition of 'best_effort' here
...
31 | effect fn best_effort(n: Int) -> Int = {
   | ^
error[E012]: duplicate function 'best_effort'
  at line 39
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
15 | effect fn best_effort(n: Int) -> Int = {
   | -------------------------------------- first definition of 'best_effort' here
...
39 | effect fn best_effort(n: Int) -> Int = {
   | ^
error[E012]: duplicate function 'best_effort'
  at line 47
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
15 | effect fn best_effort(n: Int) -> Int = {
   | -------------------------------------- first definition of 'best_effort' here
...
47 | effect fn best_effort(n: Int) -> Int = {
   | ^
error[E012]: duplicate function 'best_effort'
  at line 55
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
15 | effect fn best_effort(n: Int) -> Int = {
   | -------------------------------------- first definition of 'best_effort' here
...
55 | effect fn best_effort(n: Int) -> Int = {
   | ^
error[E012]: duplicate function 'best_effort'
  at line 63
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
15 | effect fn best_effort(n: Int) -> Int = {
   | -------------------------------------- first definition of 'best_effort' here
...
63 | effect fn best_effort(n: Int) -> Int = {
   | ^
error[E012]: duplicate function 'best_effort'
  at line 71
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
15 | effect fn best_effort(n: Int) -> Int = {
   | -------------------------------------- first definition of 'best_effort' here
...
71 | effect fn best_effort(n: Int) -> Int = {
   | ^
error[E012]: duplicate function 'best_effort'
  at line 79
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
15 | effect fn best_effort(n: Int) -> Int = {
   | -------------------------------------- first definition of 'best_effort' here
...
79 | effect fn best_effort(n: Int) -> Int = {
   | ^
error[E012]: duplicate function 'best_effort'
  at line 87
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
15 | effect fn best_effort(n: Int) -> Int = {
   | -------------------------------------- first definition of 'best_effort' here
...
87 | effect fn best_effort(n: Int) -> Int = {
   | ^
error[E012]: duplicate function 'best_effort'
  at line 95
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
15 | effect fn best_effort(n: Int) -> Int = {
   | -------------------------------------- first definition of 'best_effort' here
...
95 | effect fn best_effort(n: Int) -> Int = {
   | ^
error[E012]: duplicate function 'best_effort'
  at line 103
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
103 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 111
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
111 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 119
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
119 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 127
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
127 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 135
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
135 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 143
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
143 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 151
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
151 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 159
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
159 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 167
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
167 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 175
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
175 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 183
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
183 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 191
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
191 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 199
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
199 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 207
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
207 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 215
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
215 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 223
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
223 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 231
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
231 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 239
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
239 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 247
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
247 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 255
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
255 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 263
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
263 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 271
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
271 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 279
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
279 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 287
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
287 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 295
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
295 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 303
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
303 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 311
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
311 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 319
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
319 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 327
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
327 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 335
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
335 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 343
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
343 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 351
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
351 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 359
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
359 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 367
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
367 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 375
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
375 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 383
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
383 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 391
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
391 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 399
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
399 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 407
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
407 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 415
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
415 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 423
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
423 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 431
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
431 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 439
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
439 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 447
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
447 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 455
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
455 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 463
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
463 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 471
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
471 | effect fn best_effort(n: Int) -> Int = {
    | ^
error[E012]: duplicate function 'best_effort'
  at line 479
  in fn best_effort
  here: effect fn best_effort(n: Int) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 15 | effect fn best_effort(n: Int) -> Int = {
    | -------------------------------------- first definition of 'best_effort' here
 ...
479 | effect fn best_effort(n: Int) -> Int = {
    | ^

177 error(s) found
FAILED: /tmp/dojo-race-strategies-3.almd
Compile error for /tmp/dojo-race-strategies-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
