# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E0609`

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, Int.min_value, (acc, x) => max(acc, x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error[E002]: undefined function 'max'
  --> /tmp/dojo-max-of-list-0.almd:3:58
  in call to max()
  hint: Did you mean `x`?
  try:
      // max(...)  →  x(...)
      x(...)
  |
3 |   else list.fold(xs, Int.min_value, (acc, x) => max(acc, x))
  |                                                          ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, Int.min_value, (acc, x) => max_int(acc, x))

fn max_int(a: Int, b: Int) -> Int = 
  if a > b then a else b
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error[E001]: type mismatch in if branches: expected Option[Int] but got Int
  --> /tmp/dojo-max-of-list-1.almd:3:62
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
3 |   else list.fold(xs, Int.min_value, (acc, x) => max_int(acc, x))
  |                                                              ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, some(Int.min_value), (acc, x) => some(max_int(acc.unwrap_or(Int.min_value), x)))

fn max_int(a: Int, b: Int) -> Int = 
  if a > b then a else b
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error[E005]: argument 'f' expects fn(Option[Unknown], Int) -> Option[Unknown] but got fn(fn(Unknown) -> Int, Int) -> Option[Int]
  --> /tmp/dojo-max-of-list-2.almd:3:98
  in call to list.fold()
  hint: Fix the argument type
  |
3 |   else list.fold(xs, some(Int.min_value), (acc, x) => some(max_int(acc.unwrap_or(Int.min_value), x)))
  |                                                                                                  ^
error[E001]: type mismatch in call to list.fold(): expected fn(Option[Unknown], Int) -> Option[Unknown] but got fn(fn(Unknown) -> Int, Int) -> Option[Int]
  --> /tmp/dojo-max-of-list-2.almd:3:98
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
3 |   else list.fold(xs, some(Int.min_value), (acc, x) => some(max_int(acc.unwrap_or(Int.min_value), x)))
  |                                                                                                  ^

2 error(s) found
Compile error for /tmp/dojo-max-of-list-2.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, some(Int.min_value), (acc, x) => 
    match acc {
      some(a) => some(max_int(a, x)),
      none => some(x)
    })

fn max_int(a: Int, b: Int) -> Int = 
  if a > b then a else b
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
Compile error for /tmp/dojo-max-of-list-3.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0609]: no field `min_value` on type `Vec<i64>`
   --> <generated.rs>:254:47
    |
254 |         (xs.clone()).into_iter().fold(Some(xs.min_value), move |acc, x| {
    |                                               ^^^^^^^^^ unknown field


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error; 2 warnings emitted

FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
