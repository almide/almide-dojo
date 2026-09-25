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
  let result = sum(xs)
  fan.bounded(compute.ms(100)) {
    result
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
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:3 (got Fan 'fan')
  --> /tmp/dojo-bounded-total-1.almd:9:3
  here: fan.bounded(compute.ms(100)) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |   fan.bounded(compute.ms(100)) {
  |   ^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-bounded-total-1.almd:8:20
  in variable xs
  here: let result = sum(xs)
  hint: Check the variable name
  |
8 |   let result = sum(xs)
  |                    ^^

4 error(s) found
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
  fan.bounded(compute.ms(100)) {
    sum(xs)
  } ?? -1
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
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:3 (got Fan 'fan')
  --> /tmp/dojo-bounded-total-2.almd:8:3
  here: fan.bounded(compute.ms(100)) {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |   fan.bounded(compute.ms(100)) {
  |   ^

3 error(s) found
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
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 11:3 (got Match 'match')
  --> /tmp/dojo-bounded-total-3.almd:11:3
  here: match result {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |   match result {
   |   ^
error[E007]: fan.bounded can only be used inside an effect fn
  --> /tmp/dojo-bounded-total-3.almd:8:16
  in fan.bounded
  here: let result = fan.bounded(compute.ms(100)) {
  hint: Mark the enclosing function as `effect fn`
  |
8 |   let result = fan.bounded(compute.ms(100)) {
  |                ^^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-bounded-total-3.almd:9:9
  in variable xs
  here: sum(xs)
  hint: Check the variable name
  |
9 |     sum(xs)
  |         ^^

5 error(s) found
FAILED: /tmp/dojo-bounded-total-3.almd
Compile error for /tmp/dojo-bounded-total-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
