# bounded-total

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = 
  fan.bounded(compute.ms(100)) { 
    fn sum_list(xs: List[Int], acc: Int, i: Int) -> Int = 
      if i >= list.len(xs) then acc
      else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
    sum_list(xs, 0, 0) 
  } ?? -1
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-0.almd:3:5
  in nested fn
  here: fn sum_list(xs: List[Int], acc: Int, i: Int) -> Int =
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
3 |     fn sum_list(xs: List[Int], acc: Int, i: Int) -> Int =
  |     ^^

1 error(s) found
FAILED: /tmp/dojo-bounded-total-0.almd
Compile error for /tmp/dojo-bounded-total-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = 
  let sum_list = (xs: List[Int], acc: Int, i: Int) => 
    if i >= list.len(xs) then acc
    else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
  in fan.bounded(compute.ms(100)) { sum_list(xs, 0, 0) } ?? -1
```

**Diagnostic:**

```
error[E002]: undefined function 'sum_list'
  --> /tmp/dojo-bounded-total-1.almd:4:10
  in call to sum_list()
  here: else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
  hint: Check the function name
  |
4 |     else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
  |          ^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-bounded-total-1.almd
Compile error for /tmp/dojo-bounded-total-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = 
  fn sum_list(xs: List[Int], acc: Int, i: Int) -> Int = 
    if i >= list.len(xs) then acc
    else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
  in fan.bounded(compute.ms(100)) { sum_list(xs, 0, 0) } ?? -1
```

**Diagnostic:**

```
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:2:3
  here: fn sum_list(xs: List[Int], acc: Int, i: Int) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   fn sum_list(xs: List[Int], acc: Int, i: Int) -> Int =
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 5:3 (got In 'in')
  --> /tmp/dojo-bounded-total-2.almd:5:3
  here: in fan.bounded(compute.ms(100)) { sum_list(xs, 0, 0) } ?? -1
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |   in fan.bounded(compute.ms(100)) { sum_list(xs, 0, 0) } ?? -1
  |   ^

2 error(s) found
FAILED: /tmp/dojo-bounded-total-2.almd
Compile error for /tmp/dojo-bounded-total-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = 
  let sum_list = fn(xs: List[Int], acc: Int, i: Int) -> Int = 
    if i >= list.len(xs) then acc
    else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
  in fan.bounded(compute.ms(100)) { sum_list(xs, 0, 0) } ?? -1
```

**Diagnostic:**

```
error: Expected expression at line 2:18 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-3.almd:2:18
  here: let sum_list = fn(xs: List[Int], acc: Int, i: Int) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let sum_list = fn(xs: List[Int], acc: Int, i: Int) -> Int =
  |                  ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-bounded-total-3.almd:5:3
  here: in fan.bounded(compute.ms(100)) { sum_list(xs, 0, 0) } ?? -1
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |   in fan.bounded(compute.ms(100)) { sum_list(xs, 0, 0) } ?? -1
  |   ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-bounded-total-3.almd:3:8
  in variable i
  here: if i >= list.len(xs) then acc
  hint: Did you mean `xs`?
  try:
      xs
  |
3 |     if i >= list.len(xs) then acc
  |        ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-bounded-total-3.almd:3:31
  in variable acc
  here: if i >= list.len(xs) then acc
  hint: Check the variable name
  |
3 |     if i >= list.len(xs) then acc
  |                               ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-bounded-total-3.almd:4:23
  in variable acc
  here: else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
  hint: Check the variable name
  |
4 |     else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
  |                       ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-bounded-total-3.almd:4:45
  in variable i
  here: else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
  hint: Did you mean `xs`?
  try:
      xs
  |
4 |     else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
  |                                             ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-bounded-total-3.almd:4:52
  in variable i
  here: else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
  hint: Did you mean `xs`?
  try:
      xs
  |
4 |     else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
  |                                                    ^
error[E002]: undefined function 'sum_list'
  --> /tmp/dojo-bounded-total-3.almd:4:10
  in call to sum_list()
  here: else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
  hint: Check the function name
  |
4 |     else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
  |          ^^^^^^^^

8 error(s) found
FAILED: /tmp/dojo-bounded-total-3.almd
Compile error for /tmp/dojo-bounded-total-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
