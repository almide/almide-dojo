# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) => acc + int.get(n, i).unwrap_or(0)) 
  in sum
```

**Diagnostic:**

```
error[E002]: undefined function 'int.len'
  --> /tmp/dojo-sum-digits-0.almd:2:37
  in call to int.len()
  here: let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) => acc + int.get(n, i).unwrap_or(0))
  hint: Did you mean `int.min`?
  try:
      int.min
  |
2 |   let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) => acc + int.get(n, i).unwrap_or(0))
  |                                     ^^^^^^^
error[E002]: undefined function 'int.get'
  --> /tmp/dojo-sum-digits-0.almd:2:71
  in call to int.get()
  here: let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) => acc + int.get(n, i).unwrap_or(0))
  hint: No function 'get' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
2 |   let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) => acc + int.get(n, i).unwrap_or(0))
  |                                                                       ^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?2)
  --> /tmp/dojo-sum-digits-0.almd:2:71
  in this expression with an unconstrained type
  here: let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) => acc + int.get(n, i).unwrap_or(0))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
2 |   let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) => acc + int.get(n, i).unwrap_or(0))
  |                                                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^

3 error(s) found
FAILED: /tmp/dojo-sum-digits-0.almd
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.range(0, int.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(list.get(int.to_string(n), i).unwrap_or("0")).unwrap())
  in sum
```

**Diagnostic:**

```
error[E002]: undefined function 'int.len'
  --> /tmp/dojo-sum-digits-1.almd:2:37
  in call to int.len()
  here: let sum = list.fold(list.range(0, int.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(list.get(int.to_string(n), i).unwrap_or("0")).unwrap())
  hint: Did you mean `int.min`?
  try:
      int.min
  |
2 |   let sum = list.fold(list.range(0, int.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(list.get(int.to_string(n), i).unwrap_or("0")).unwrap())
  |                                     ^^^^^^^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-1.almd:2:105
  in call to list.get()
  here: let sum = list.fold(list.range(0, int.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(list.get(int.to_string(n), i).unwrap_or("0")).unwrap())
  hint: Fix the argument type
...
2 |   let sum = list.fold(list.range(0, int.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(list.get(int.to_string(n), i).unwrap_or("0")).unwrap())
  |                                                                                                         ^^^^^^^^^^^^^^^^
error[E002]: undefined method 'unwrap' on result
  --> /tmp/dojo-sum-digits-1.almd:2:86
  in method call .unwrap()
  here: let sum = list.fold(list.range(0, int.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(list.get(int.to_string(n), i).unwrap_or("0")).unwrap())
  hint: Almide doesn't use method-call syntax. Write `result.unwrap_or(x)` (or `x |> result.unwrap_or`). Method syntax `x.unwrap()` is not supported.
  try:
      result.unwrap_or(int.parse(list.get(int.to_string(n), i).unwrap_or("0")))
  |
2 |   let sum = list.fold(list.range(0, int.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(list.get(int.to_string(n), i).unwrap_or("0")).unwrap())
  |                                                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

3 error(s) found
FAILED: /tmp/dojo-sum-digits-1.almd
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let str = int.to_string(n)
  in list.fold(list.range(0, string.len(str)), 0, (acc, i) => acc + int.parse(string.get(str, i).unwrap_or("0")))
```

**Diagnostic:**

```
error: operator '+' requires numeric, String, or List types but got Int and Result[Int, String]
  --> /tmp/dojo-sum-digits-2.almd:3:92
  in operator +
  here: list.fold(list.range(0, string.len(str)), 0, (acc, i) => acc + int.parse(string.get(str, i).unwrap_or("0")))
  hint: Unwrap the Result operand first: `!` propagates the error (effect fn body), `?? fallback` supplies a default, or `match` handles ok/err
  |
3 |   list.fold(list.range(0, string.len(str)), 0, (acc, i) => acc + int.parse(string.get(str, i).unwrap_or("0")))
  |                                                                                            ^

1 error(s) found
FAILED: /tmp/dojo-sum-digits-2.almd
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  let str = int.to_string(n)
  in list.fold(list.range(0, string.len(str)), 0, (acc, i) => acc + match int.parse(string.get(str, i).unwrap_or("0")) {
    ok(x) => x,
    err(_) => 0
  })
```
