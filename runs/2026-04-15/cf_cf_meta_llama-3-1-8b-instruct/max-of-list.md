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
    list.fold(xs, xs.head, (max, x) => if x > max then x else max)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
Compile error for /tmp/dojo-max-of-list-0.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0609]: no field `head` on type `Vec<i64>`
   --> <generated.rs>:248:42
    |
248 |         (xs.clone()).into_iter().fold(xs.head, move |max, x| {
    |                                          ^^^^ unknown field


error[E0308]: mismatched types
   --> <generated.rs>:250:34
    |
250 |             let x: Option<i64> = x.clone();
    |                    -----------   ^^^^^^^^^ expected `Option<i64>`, found `i64`
    |                    |
    |                    expected due to this
    |
    = note: expected enum `Option<i64>`
               found type `i64`
help: try wrapping the expression in `Some`
    |
250 |             let x: Option<i64> = Some(x.clone());
    |                                  +++++         +


error: could not compile `almide-generated` (bin "almide-generated" test) due to 2 previous errors; 2 warnings emitted

FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else 
    list.fold(xs, some(xs.head), (max, x) => if x > max.unwrap() then some(x) else max)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
Compile error for /tmp/dojo-max-of-list-1.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0609]: no field `head` on type `Vec<i64>`
   --> <generated.rs>:248:47
    |
248 |         (xs.clone()).into_iter().fold(Some(xs.head), move |max, x| {
    |                                               ^^^^ unknown field


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error; 2 warnings emitted

FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else 
    some(xs.fold((x) => x, (max, x) => if x > max then x else max))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error[E001]: type mismatch in call to list.fold(): expected fn(fn(?1) -> ?1, Int) -> fn(?1) -> ?1 but got fn(fn(?1) -> ?1, fn(?1) -> ?1) -> fn(?1) -> ?1
  --> /tmp/dojo-max-of-list-2.almd:4:10
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
4 |     some(xs.fold((x) => x, (max, x) => if x > max then x else max))
  |          ^^
error[E001]: type mismatch in fn 'max_of_list': expected Option[Int] but got Option[fn(?1) -> ?1]
  --> /tmp/dojo-max-of-list-2.almd:4:10
  in fn 'max_of_list'
  hint: Fix the expression type or change the expected type
  |
4 |     some(xs.fold((x) => x, (max, x) => if x > max then x else max))
  |          ^^

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
  else 
    some(xs.fold((x) => x, (max, x) => if x > max then x else max))(0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error[E001]: type mismatch in call to list.fold(): expected fn(fn(?1) -> ?1, Int) -> fn(?1) -> ?1 but got fn(fn(?1) -> ?1, fn(?1) -> ?1) -> fn(?1) -> ?1
  --> /tmp/dojo-max-of-list-3.almd:4:10
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
4 |     some(xs.fold((x) => x, (max, x) => if x > max then x else max))(0)
  |          ^^
error[E001]: type mismatch in function call: expected Option[fn(?1) -> ?1] but got fn(Int) -> Option[Int]
  --> /tmp/dojo-max-of-list-3.almd:4:10
  in function call
  hint: Fix the expression type or change the expected type
  |
4 |     some(xs.fold((x) => x, (max, x) => if x > max then x else max))(0)
  |          ^^

2 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
