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
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:3 (got Fan 'fan')
  --> /tmp/dojo-bounded-total-0.almd:9:3
  here: fan.bounded(compute.ms(100)) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |   fan.bounded(compute.ms(100)) {
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

  let budget = compute.ms(100)
  fan.bounded(budget) {
    sum(xs)
  } ?? -1
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
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 10:3 (got Fan 'fan')
  --> /tmp/dojo-bounded-total-1.almd:10:3
  here: fan.bounded(budget) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |   fan.bounded(budget) {
   |   ^

3 error(s) found
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

  let budget = compute.ms(100)
  let result = fan.bounded(budget) {
    sum(xs)
  }
  result ?? -1
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
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 13:3 (got Ident 'result')
  --> /tmp/dojo-bounded-total-2.almd:13:3
  here: result ?? -1
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |   result ?? -1
   |   ^
error[E007]: fan.bounded can only be used inside an effect fn
  --> /tmp/dojo-bounded-total-2.almd:10:16
  in fan.bounded
  here: let result = fan.bounded(budget) {
  hint: Mark the enclosing function as `effect fn`
   |
10 |   let result = fan.bounded(budget) {
   |                ^^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-bounded-total-2.almd:11:9
  in variable xs
  here: sum(xs)
  hint: Check the variable name
   |
11 |     sum(xs)
   |         ^^

5 error(s) found
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

  let budget = compute.ms(100)
  effect fn bounded_sum() -> Int = {
    fan.bounded(budget) {
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
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 16:3 (got Ident 'bounded_sum')
  --> /tmp/dojo-bounded-total-3.almd:16:3
  here: bounded_sum()
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |   bounded_sum()
   |   ^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-bounded-total-3.almd:12:11
  in variable xs
  here: sum(xs)
  hint: Check the variable name
   |
12 |       sum(xs)
   |           ^^

4 error(s) found
FAILED: /tmp/dojo-bounded-total-3.almd
Compile error for /tmp/dojo-bounded-total-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
