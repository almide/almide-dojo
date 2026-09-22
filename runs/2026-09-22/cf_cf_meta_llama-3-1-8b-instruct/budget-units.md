# budget-units

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
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
    Some(x) => x
    None => -1
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
error[E003]: undefined variable 'result'
  --> /tmp/dojo-budget-units-0.almd:4:9
  in variable result
  here: match result {
  hint: Check the variable name
  |
4 |   match result {
  |         ^^^^^^

2 error(s) found
FAILED: /tmp/dojo-budget-units-0.almd
Compile error for /tmp/dojo-budget-units-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  let result = fan.bounded(
    (n) => {
      let i = 0
      let acc = 0
      while i < n { acc = acc + i; i = i + 1 }
      acc
    },
    budget
  )
  match result {
    Some(x) => x
    None => -1
  }
}
```

**Diagnostic:**

```
error: Expected expression at line 3:28 (got Newline '')
  --> /tmp/dojo-budget-units-1.almd:3:28
  here: let result = fan.bounded(
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   let result = fan.bounded(
  |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:6 (got Comma ',')
  --> /tmp/dojo-budget-units-1.almd:9:6
  here: },
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |     },
  |      ^
error[E009]: cannot reassign immutable binding 'acc'
  --> /tmp/dojo-budget-units-1.almd:7:33
  in acc = ...
  here: while i < n { acc = acc + i; i = i + 1 }
  hint: Use 'var acc = ...' instead of 'let acc = ...' to declare a mutable variable
  try:
      // let acc = ...  →  var acc = ...
      var acc = <initial value>
  |
6 |       let acc = 0
  |       ------------------- 'acc' declared here
...
7 |       while i < n { acc = acc + i; i = i + 1 }
  |                                 ^
error[E009]: cannot reassign immutable binding 'i'
  --> /tmp/dojo-budget-units-1.almd:7:44
  in i = ...
  here: while i < n { acc = acc + i; i = i + 1 }
  hint: Use 'var i = ...' instead of 'let i = ...' to declare a mutable variable
  try:
      // let i = ...  →  var i = ...
      var i = <initial value>
  |
5 |       let i = 0
  |       ----------------- 'i' declared here
...
7 |       while i < n { acc = acc + i; i = i + 1 }
  |                                            ^

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
  let result = fan.bounded(
    (n) => {
      var i = 0
      var acc = 0
      while i < n { acc = acc + i; i = i + 1 }
      acc
    },
    budget
  )
  match result {
    Some(x) => x
    None => -1
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
error: Expected expression at line 3:28 (got Newline '')
  --> /tmp/dojo-budget-units-2.almd:3:28
  here: let result = fan.bounded(
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   let result = fan.bounded(
  |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:6 (got Comma ',')
  --> /tmp/dojo-budget-units-2.almd:9:6
  here: },
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |     },
  |      ^

2 error(s) found
FAILED: /tmp/dojo-budget-units-2.almd
Compile error for /tmp/dojo-budget-units-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  let result = fan.bounded(
    (n) => {
      var i = 0
      var acc = 0
      while i < n { acc = acc + i; i = i + 1 }
      acc
    },
    budget
  )
  match result {
    Some(x) => x
    None => -1
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
error: Expected expression at line 3:28 (got Newline '')
  --> /tmp/dojo-budget-units-3.almd:3:28
  here: let result = fan.bounded(
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   let result = fan.bounded(
  |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 9:6 (got Comma ',')
  --> /tmp/dojo-budget-units-3.almd:9:6
  here: },
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |     },
  |      ^

2 error(s) found
FAILED: /tmp/dojo-budget-units-3.almd
Compile error for /tmp/dojo-budget-units-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
