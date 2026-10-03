# bounded-total

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = {
  fn sum(xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  fan.bounded(compute.ms(100)) {
    sum(xs)
  } ?? -1
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-0.almd:2:3
  in nested fn
  here: fn sum(xs: List[Int]) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn sum(xs: List[Int]) -> Int = {
  |   ^^
error: Expected pattern at line 4:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-0.almd:4:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |       | [] => 0
  |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:3 (got Fan 'fan')
  --> /tmp/dojo-bounded-total-0.almd:8:3
  here: fan.bounded(compute.ms(100)) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   fan.bounded(compute.ms(100)) {
  |   ^

3 error(s) found
FAILED: /tmp/dojo-bounded-total-0.almd
Compile error for /tmp/dojo-bounded-total-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = {
  fn sum(xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  let result = fan.bounded(compute.ms(100)) {
    sum(xs)
  }
  match result {
    | ok(x) => x
    | err(_) => -1
  }
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-1.almd:2:3
  in nested fn
  here: fn sum(xs: List[Int]) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn sum(xs: List[Int]) -> Int = {
  |   ^^
error: Expected pattern at line 4:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-1.almd:4:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |       | [] => 0
  |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 11:3 (got Match 'match')
  --> /tmp/dojo-bounded-total-1.almd:11:3
  here: match result {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |   match result {
   |   ^
error[E007]: fan.bounded can only be used inside an effect fn
  --> /tmp/dojo-bounded-total-1.almd:8:16
  in fan.bounded
  here: let result = fan.bounded(compute.ms(100)) {
  hint: Mark the enclosing function as `effect fn`
  |
8 |   let result = fan.bounded(compute.ms(100)) {
  |                ^^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-bounded-total-1.almd:9:9
  in variable xs
  here: sum(xs)
  hint: Check the variable name
  |
9 |     sum(xs)
  |         ^^

5 error(s) found
FAILED: /tmp/dojo-bounded-total-1.almd
Compile error for /tmp/dojo-bounded-total-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = {
  fn sum(xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  effect fn bounded_sum() -> Int = {
    let result = fan.bounded(compute.ms(100)) {
      sum(xs)
    }
    match result {
      | ok(x) => x
      | err(_) => -1
    }
  }
  bounded_sum()
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-2.almd:2:3
  in nested fn
  here: fn sum(xs: List[Int]) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn sum(xs: List[Int]) -> Int = {
  |   ^^
error: Expected pattern at line 4:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:4:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |       | [] => 0
  |       ^
error: Expected pattern at line 13:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-2.almd:13:7
  here: | ok(x) => x
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
13 |       | ok(x) => x
   |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 16:3 (got RBrace '}')
  --> /tmp/dojo-bounded-total-2.almd:16:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |   }
   |   ^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-bounded-total-2.almd:10:11
  in variable xs
  here: sum(xs)
  hint: Check the variable name
   |
10 |       sum(xs)
   |           ^^
error[E041]: implicit propagation of this binding's value was removed — this value is a Result (ADR-0008)
  --> /tmp/dojo-bounded-total-2.almd:9:18
  in implicit propagation
  here: let result = fan.bounded(compute.ms(100)) {
  hint: The auto-? of the 0.54 deprecation window (E041) is gone: a fallible call yields a Result VALUE in every position. Write `expr!` to propagate, or consume the Result as a value (`??`, `?`, match ok/err).
  |
9 |     let result = fan.bounded(compute.ms(100)) {
  |                  ^^^

6 error(s) found
FAILED: /tmp/dojo-bounded-total-2.almd
Compile error for /tmp/dojo-bounded-total-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = {
  fn sum(xs: List[Int]) -> Int = {
    match xs {
      | [] => 0
      | x :: xs => x + sum(xs)
    }
  }
  effect fn bounded_sum() -> Int = {
    let result = fan.bounded(compute.ms(100)) {
      sum(xs)
    } ?? -1
  }
  bounded_sum()
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-3.almd:2:3
  in nested fn
  here: fn sum(xs: List[Int]) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn sum(xs: List[Int]) -> Int = {
  |   ^^
error: Expected pattern at line 4:7 (got Pipe '|')
  --> /tmp/dojo-bounded-total-3.almd:4:7
  here: | [] => 0
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |       | [] => 0
  |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 13:3 (got Ident 'bounded_sum')
  --> /tmp/dojo-bounded-total-3.almd:13:3
  here: bounded_sum()
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |   bounded_sum()
   |   ^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-bounded-total-3.almd:10:11
  in variable xs
  here: sum(xs)
  hint: Check the variable name
   |
10 |       sum(xs)
   |           ^^

4 error(s) found
FAILED: /tmp/dojo-bounded-total-3.almd
Compile error for /tmp/dojo-bounded-total-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
