# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else 
    list.fold(xs, xs.head, (x, y) => if x > y then x else y)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
Compile error for /tmp/dojo-max-of-list-0.almd:
error[E0609]: no field `head` on type `Vec<i64>`
   --> src/main.rs:248:42
    |
248 |         (xs.clone()).into_iter().fold(xs.head, move |x, y| {
    |                                          ^^^^ unknown field


error[E0308]: mismatched types
   --> src/main.rs:250:34
    |
250 |             let y: Option<i64> = y.clone();
    |                    -----------   ^^^^^^^^^ expected `Option<i64>`, found `i64`
    |                    |
    |                    expected due to this
    |
    = note: expected enum `Option<i64>`
               found type `i64`
help: try wrapping the expression in `Some`
    |
250 |             let y: Option<i64> = Some(y.clone());
    |                                  +++++         +


error: could not compile `almide-out` (bin "almide-out" test) due to 2 previous errors; 2 warnings emitted

FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else 
    list.fold(xs, xs.head, (x, y) => if x > y then x else y)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
Compile error for /tmp/dojo-max-of-list-1.almd:
error[E0609]: no field `head` on type `Vec<i64>`
   --> src/main.rs:248:42
    |
248 |         (xs.clone()).into_iter().fold(xs.head, move |x, y| {
    |                                          ^^^^ unknown field


error[E0308]: mismatched types
   --> src/main.rs:250:34
    |
250 |             let y: Option<i64> = y.clone();
    |                    -----------   ^^^^^^^^^ expected `Option<i64>`, found `i64`
    |                    |
    |                    expected due to this
    |
    = note: expected enum `Option<i64>`
               found type `i64`
help: try wrapping the expression in `Some`
    |
250 |             let y: Option<i64> = Some(y.clone());
    |                                  +++++         +


error: could not compile `almide-out` (bin "almide-out" test) due to 2 previous errors; 2 warnings emitted

FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else 
    list.fold(xs, some(xs.head), (x, y) => if x > y then x else y)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error[E001]: type mismatch in call to list.fold(): expected fn(Option[Unknown], Int) -> Option[Unknown] but got fn(Option[Unknown], Option[Unknown]) -> Option[Unknown]
  --> /tmp/dojo-max-of-list-2.almd:4:65
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
4 |     list.fold(xs, some(xs.head), (x, y) => if x > y then x else y)
  |                                                                 ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-2.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else 
    list.fold(xs, some(xs.head), (x, y) => if x > y then x else y)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error[E001]: type mismatch in call to list.fold(): expected fn(Option[Unknown], Int) -> Option[Unknown] but got fn(Option[Unknown], Option[Unknown]) -> Option[Unknown]
  --> /tmp/dojo-max-of-list-3.almd:4:65
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
4 |     list.fold(xs, some(xs.head), (x, y) => if x > y then x else y)
  |                                                                 ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
