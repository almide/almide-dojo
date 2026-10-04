# budget-units

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  let result = fan.bounded(count_to(n), budget)
  match result {
    | some(x) => x
    | none => -1
  }
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
error: fan.bounded takes a BLOCK, not a thunk argument, at line 3:39
  --> /tmp/dojo-budget-units-0.almd:3:39
  here: let result = fan.bounded(count_to(n), budget)
  hint: fan.bounded(compute.ms(100)) { work(x) } — drop the `() =>` wrapper; the braces are the region
  |
3 |   let result = fan.bounded(count_to(n), budget)
  |                                       ^
error: Expected pattern at line 5:5 (got Pipe '|')
  --> /tmp/dojo-budget-units-0.almd:5:5
  here: | some(x) => x
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
5 |     | some(x) => x
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:1 (got RBrace '}')
  --> /tmp/dojo-budget-units-0.almd:8:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 | }
  | ^

3 error(s) found
FAILED: /tmp/dojo-budget-units-0.almd
Compile error for /tmp/dojo-budget-units-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  let result = fan.bounded { count_to(n) } (budget)
  match result {
    | some(x) => x
    | none => -1
  }
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
error: Expected LParen at line 3:28 (got LBrace '{')
  --> /tmp/dojo-budget-units-1.almd:3:28
  here: let result = fan.bounded { count_to(n) } (budget)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   let result = fan.bounded { count_to(n) } (budget)
  |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 4:3 (got Match 'match')
  --> /tmp/dojo-budget-units-1.almd:4:3
  here: match result {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |   match result {
  |   ^
error[E003]: undefined variable 'budget'
  --> /tmp/dojo-budget-units-1.almd:3:45
  in variable budget
  here: let result = fan.bounded { count_to(n) } (budget)
  hint: Check the variable name
  |
3 |   let result = fan.bounded { count_to(n) } (budget)
  |                                             ^^^^^^
error[E002]: this expression is not a function — it has type Unit
  --> /tmp/dojo-budget-units-1.almd:2:44
  in function call
  here: let budget = compute.ms(ms) + compute.us(us)
  hint: Only functions and closures can be called; this is a value. Remove the call, or call something that names a function.
  |
2 |   let budget = compute.ms(ms) + compute.us(us)
  |                                            ^^

4 error(s) found
FAILED: /tmp/dojo-budget-units-1.almd
Compile error for /tmp/dojo-budget-units-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  let result = fan.bounded(count_to(n))(budget)
  match result {
    | some(x) => x
    | none => -1
  }
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
error: fan.bounded requires a body block at line 3:40
  --> /tmp/dojo-budget-units-2.almd:3:40
  here: let result = fan.bounded(count_to(n))(budget)
  hint: fan.bounded(compute.ms(100)) { work(x) }
  |
3 |   let result = fan.bounded(count_to(n))(budget)
  |                                        ^
error: Expected pattern at line 5:5 (got Pipe '|')
  --> /tmp/dojo-budget-units-2.almd:5:5
  here: | some(x) => x
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
5 |     | some(x) => x
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:1 (got RBrace '}')
  --> /tmp/dojo-budget-units-2.almd:8:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 | }
  | ^

3 error(s) found
FAILED: /tmp/dojo-budget-units-2.almd
Compile error for /tmp/dojo-budget-units-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  let result = fan.bounded(count_to(n))(budget)
  match result {
    | none => -1
    | some(x) => x
  }
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
error: fan.bounded requires a body block at line 3:40
  --> /tmp/dojo-budget-units-3.almd:3:40
  here: let result = fan.bounded(count_to(n))(budget)
  hint: fan.bounded(compute.ms(100)) { work(x) }
  |
3 |   let result = fan.bounded(count_to(n))(budget)
  |                                        ^
error: Expected pattern at line 5:5 (got Pipe '|')
  --> /tmp/dojo-budget-units-3.almd:5:5
  here: | none => -1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
5 |     | none => -1
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:1 (got RBrace '}')
  --> /tmp/dojo-budget-units-3.almd:8:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 | }
  | ^

3 error(s) found
FAILED: /tmp/dojo-budget-units-3.almd
Compile error for /tmp/dojo-budget-units-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
