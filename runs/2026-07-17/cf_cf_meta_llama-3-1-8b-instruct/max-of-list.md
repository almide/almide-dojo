# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else 
    list.fold(xs, Int.min_value, (acc, x) => 
      if x > acc then x else acc
    ) |>
    some
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error: Expected LParen at line 7:9 (got Newline '')
  --> /tmp/dojo-max-of-list-0.almd:7:9
  |
7 |     some
  |         ^

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
  else 
    list.fold(xs, Int.min_value, (acc, x) => 
      if x > acc then x else acc
    ) |>
    some(_)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error[E001]: type mismatch in pipe call: expected Option[?3] but got fn(Unknown) -> Option[Int]
  --> /tmp/dojo-max-of-list-1.almd:7:10
  in pipe call
  hint: Fix the expression type or change the expected type
  |
7 |     some(_)
  |          ^

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
  else 
    list.fold(xs, Int.min_value, (acc, x) => 
      if x > acc then x else acc
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
Compile error for /tmp/dojo-max-of-list-2.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0609]: no field `min_value` on type `Vec<i64>`
   --> <generated.rs>:254:42
    |
254 |         (xs.clone()).into_iter().fold(xs.min_value, move |acc, x| {
    |                                          ^^^^^^^^^ unknown field


error[E0308]: mismatched types
   --> <generated.rs>:256:34
    |
256 |             let x: Option<i64> = x.clone();
    |                    -----------   ^^^^^^^^^ expected `Option<i64>`, found `i64`
    |                    |
    |                    expected due to this
    |
    = note: expected enum `Option<i64>`
               found type `i64`
help: try wrapping the expression in `Some`
    |
256 |             let x: Option<i64> = Some(x.clone());
    |                                  +++++         +


error: could not compile `almide-generated` (bin "almide-generated" test) due to 2 previous errors; 2 warnings emitted

FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else 
    list.fold(xs, int.min_value, (acc, x) => 
      if x > acc then x else acc
    ).some
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error: Expected name at line 6:7 (got Some 'some')
  --> /tmp/dojo-max-of-list-3.almd:6:7
  |
6 |     ).some
  |       ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
