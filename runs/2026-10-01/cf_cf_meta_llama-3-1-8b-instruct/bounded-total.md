# bounded-total

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E012`

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = {
  fn sum(xs: List[Int], i: Int) -> Int = {
    if list.is_empty(xs) then 0
    else xs.get(i).unwrap_or(0) + sum(xs, i + 1)
  }
  fan.bounded(compute.ms(100)) {
    sum(xs, 0)
  } ?? -1
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-0.almd:2:3
  in nested fn
  here: fn sum(xs: List[Int], i: Int) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn sum(xs: List[Int], i: Int) -> Int = {
  |   ^^

1 error(s) found
FAILED: /tmp/dojo-bounded-total-0.almd
Compile error for /tmp/dojo-bounded-total-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = {
  fn sum(xs: List[Int], i: Int) -> Int = {
    if list.is_empty(xs) then 0
    else xs.get(i).unwrap_or(0) + sum(xs, i + 1)
  }
  fan.bounded(compute.ms(100)) {
    sum(xs, 0)
  } ?? -1
}

// Move the sum function to the top level
fn sum(xs: List[Int], i: Int) -> Int = {
  if list.is_empty(xs) then 0
  else xs.get(i).unwrap_or(0) + sum(xs, i + 1)
}

effect fn safe_total(xs: List[Int]) -> Int = {
  fan.bounded(compute.ms(100)) {
    sum(xs, 0)
  } ?? -1
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-1.almd:2:3
  in nested fn
  here: fn sum(xs: List[Int], i: Int) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn sum(xs: List[Int], i: Int) -> Int = {
  |   ^^
error[E012]: duplicate function 'safe_total'
  at line 17
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ------------------------------------- first definition of 'safe_total' here
...
17 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ^

2 error(s) found
FAILED: /tmp/dojo-bounded-total-1.almd
Compile error for /tmp/dojo-bounded-total-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = {
  fn sum(xs: List[Int], i: Int) -> Int = {
    if list.is_empty(xs) then 0
    else xs.get(i).unwrap_or(0) + sum(xs, i + 1)
  }
  fan.bounded(compute.ms(100)) {
    sum(xs, 0)
  } ?? -1
}

fn sum(xs: List[Int], i: Int) -> Int = {
  if list.is_empty(xs) then 0
  else xs.get(i).unwrap_or(0) + sum(xs, i + 1)
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-2.almd:2:3
  in nested fn
  here: fn sum(xs: List[Int], i: Int) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn sum(xs: List[Int], i: Int) -> Int = {
  |   ^^

1 error(s) found
FAILED: /tmp/dojo-bounded-total-2.almd
Compile error for /tmp/dojo-bounded-total-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = {
  fn sum(xs: List[Int], i: Int) -> Int = {
    if list.is_empty(xs) then 0
    else xs.get(i).unwrap_or(0) + sum(xs, i + 1)
  }
  fan.bounded(compute.ms(100)) {
    sum(xs, 0)
  } ?? -1
}

fn sum(xs: List[Int], i: Int) -> Int = {
  if list.is_empty(xs) then 0
  else xs.get(i).unwrap_or(0) + sum(xs, i + 1)
}

effect fn safe_total(xs: List[Int]) -> Int = {
  fan.bounded(compute.ms(100)) {
    fn sum(xs: List[Int], i: Int) -> Int = {
      if list.is_empty(xs) then 0
      else xs.get(i).unwrap_or(0) + sum(xs, i + 1)
    }
    sum(xs, 0)
  } ?? -1
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-3.almd:2:3
  in nested fn
  here: fn sum(xs: List[Int], i: Int) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn sum(xs: List[Int], i: Int) -> Int = {
  |   ^^
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-3.almd:18:5
  in nested fn
  here: fn sum(xs: List[Int], i: Int) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
   |
18 |     fn sum(xs: List[Int], i: Int) -> Int = {
   |     ^^
error[E012]: duplicate function 'safe_total'
  at line 16
  in fn safe_total
  here: effect fn safe_total(xs: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ------------------------------------- first definition of 'safe_total' here
...
16 | effect fn safe_total(xs: List[Int]) -> Int = {
   | ^

3 error(s) found
FAILED: /tmp/dojo-bounded-total-3.almd
Compile error for /tmp/dojo-bounded-total-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
