# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: import-error
- **diagnostic code**: `E004`

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, Int.MIN_VALUE, (acc, x) => if x > acc then x else acc) |> some
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error: Expected LParen at line 3:84 (got Newline '')
  --> /tmp/dojo-max-of-list-0.almd:3:84
  |
3 |   else list.fold(xs, Int.MIN_VALUE, (acc, x) => if x > acc then x else acc) |> some
  |                                                                                    ^

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
  else list.fold(xs, Int.MIN_VALUE, (acc, x) => if x > acc then x else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
Compile error for /tmp/dojo-max-of-list-1.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0609]: no field `MIN_VALUE` on type `Vec<i64>`
   --> <generated.rs>:254:42
    |
254 |         (xs.clone()).into_iter().fold(xs.MIN_VALUE, move |acc, x| {
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

FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, int.min_value(), (acc, x) => if x > acc then x else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error[E002]: undefined function 'int.min_value'
  --> /tmp/dojo-max-of-list-2.almd:3:35
  in call to int.min_value()
  hint: No function 'min_value' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   else list.fold(xs, int.min_value(), (acc, x) => if x > acc then x else acc)
  |                                   ^

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
  else list.fold(xs, int.min(xs), (acc, x) => if x > acc then x else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error[E004]: int.min() expects 2 argument(s) but got 1
  --> /tmp/dojo-max-of-list-3.almd:3:30
  in call to int.min()
  hint: Check the number of arguments
  try:
      // int.min() takes 2 arg(s) — you passed 1
      int.min(<a: Int>, <b: Int>)
  |
3 |   else list.fold(xs, int.min(xs), (acc, x) => if x > acc then x else acc)
  |                              ^^
error[E005]: argument 'a' expects Int but got List[Int]
  --> /tmp/dojo-max-of-list-3.almd:3:30
  in call to int.min()
  hint: Fix the argument type
  |
3 |   else list.fold(xs, int.min(xs), (acc, x) => if x > acc then x else acc)
  |                              ^^
error[E001]: type mismatch in call to int.min(): expected Int but got List[Int]
  --> /tmp/dojo-max-of-list-3.almd:3:30
  in call to int.min()
  hint: Fix the expression type or change the expected type
  |
3 |   else list.fold(xs, int.min(xs), (acc, x) => if x > acc then x else acc)
  |                              ^^
error[E001]: type mismatch in if branches: expected Option[Int] but got Int
  --> /tmp/dojo-max-of-list-3.almd:3:70
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
3 |   else list.fold(xs, int.min(xs), (acc, x) => if x > acc then x else acc)
  |                                                                      ^^^

4 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
