# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) => 
    acc + int.to_int(n % 10)) 
  in 
    sum
```

**Diagnostic:**

```
error[E002]: undefined function 'int.len'
  --> /tmp/dojo-sum-digits-0.almd:2:37
  in call to int.len()
  here: let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) =>
  hint: Did you mean `int.min`?
  try:
      int.min
  |
2 |   let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) =>
  |                                     ^^^^^^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-0.almd:3:11
  in call to int.to_int()
  here: acc + int.to_int(n % 10))
  hint: Did you mean `int.to_int8`?
  try:
      int.to_int8
  |
3 |     acc + int.to_int(n % 10))
  |           ^^^^^^^^^^

2 error(s) found
FAILED: /tmp/dojo-sum-digits-0.almd
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) => 
    acc + (n % 10)) 
  in 
    sum
```

**Diagnostic:**

```
error[E002]: undefined function 'int.len'
  --> /tmp/dojo-sum-digits-1.almd:2:37
  in call to int.len()
  here: let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) =>
  hint: Did you mean `int.min`?
  try:
      int.min
  |
2 |   let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) =>
  |                                     ^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-sum-digits-1.almd
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.range(0, list.len(n)), 0, (acc, i) => 
    acc + (n % 10)) 
  in 
    sum
```

**Diagnostic:**

```
error[E005]: argument 'xs' expects List[A] but got Int
  --> /tmp/dojo-sum-digits-2.almd:2:46
  in call to list.len()
  here: let sum = list.fold(list.range(0, list.len(n)), 0, (acc, i) =>
  hint: Fix the argument type
...
2 |   let sum = list.fold(list.range(0, list.len(n)), 0, (acc, i) =>
  |                                              ^

1 error(s) found
FAILED: /tmp/dojo-sum-digits-2.almd
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = list.map(n, (x) => x % 10)
  in 
    list.fold(digits, 0, (acc, x) => acc + x)
```

**Diagnostic:**

```
error[E005]: argument 'xs' expects List[A] but got Int
  --> /tmp/dojo-sum-digits-3.almd:2:25
  in call to list.map()
  here: let digits = list.map(n, (x) => x % 10)
  hint: Fix the argument type
...
2 |   let digits = list.map(n, (x) => x % 10)
  |                         ^
error[E025]: cannot infer a concrete type for this expression (type List[?1])
  --> /tmp/dojo-sum-digits-3.almd:2:16
  in this expression with an unconstrained type
  here: let digits = list.map(n, (x) => x % 10)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
2 |   let digits = list.map(n, (x) => x % 10)
  |                ^^^^^^^^^^^^^^^^^^^^^^^^^^

2 error(s) found
FAILED: /tmp/dojo-sum-digits-3.almd
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
