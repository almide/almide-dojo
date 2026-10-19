# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, Int.min_value, (acc, x) => if x > acc then x else acc) |>
         some
```

**Diagnostic:**

```
error[E003]: undefined variable 'Int'
  --> /tmp/dojo-max-of-list-0.almd:3:22
  in variable Int
  here: else list.fold(xs, Int.min_value, (acc, x) => if x > acc then x else acc) |>
  hint: Check the variable name
  |
3 |   else list.fold(xs, Int.min_value, (acc, x) => if x > acc then x else acc) |>
  |                      ^^^

1 error(s) found
FAILED: /tmp/dojo-max-of-list-0.almd
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[int]) -> Option[int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc) |>
         some
```

**Diagnostic:**

```
error: Expected type name at line 1:25 (got Ident 'int')
  --> /tmp/dojo-max-of-list-1.almd:1:25
  here: fn max_of_list(xs: List[int]) -> Option[int] =
  hint: Type names must start with an uppercase letter, e.g. Int, String, MyType
  |
1 | fn max_of_list(xs: List[int]) -> Option[int] =
  |                         ^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-max-of-list-1.almd:6:50
  in empty list `[]` with no element-type context
  here: test "max_of_list empty" { assert_eq(max_of_list([]), none) }
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
  |
6 | test "max_of_list empty" { assert_eq(max_of_list([]), none) }
  |                                                  ^
error[E025]: cannot infer a concrete type for this expression (type Option[?1])
  --> /tmp/dojo-max-of-list-1.almd:6:55
  in this expression with an unconstrained type
  here: test "max_of_list empty" { assert_eq(max_of_list([]), none) }
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
6 | test "max_of_list empty" { assert_eq(max_of_list([]), none) }
  |                                                       ^^^^

3 error(s) found
FAILED: /tmp/dojo-max-of-list-1.almd
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc) |>
         some
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(fn() -> Int, Int) -> fn() -> Int but got fn(fn() -> Int, Int) -> Int
  --> /tmp/dojo-max-of-list-2.almd:3:37
  in call to list.fold()
  here: else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc) |>
  hint: Fix the argument type
...
3 |   else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc) |>
  |                                     ^
error[E001]: type mismatch in if branches: expected Int but got fn() -> Int
  --> /tmp/dojo-max-of-list-2.almd:3:72
  in if branches
  here: else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc) |>
  hint: This names a FUNCTION and the position expects what CALLING it produces — the call was never made. Add the parentheses.
  |
3 |   else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc) |>
  |                                                                        ^^^
error[E001]: type mismatch in fn 'max_of_list': expected Option[Int] but got Option[fn() -> Int]
  --> /tmp/dojo-max-of-list-2.almd:4:10
  in fn 'max_of_list'
  here: some
  hint: Fix the expression type or change the expected type
  |
4 |          some
  |          ^^^^

3 error(s) found
FAILED: /tmp/dojo-max-of-list-2.almd
Compile error for /tmp/dojo-max-of-list-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(fn() -> Int, Int) -> fn() -> Int but got fn(fn() -> Int, Int) -> Int
  --> /tmp/dojo-max-of-list-3.almd:3:37
  in call to list.fold()
  here: else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  hint: Fix the argument type
...
3 |   else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  |                                     ^
error[E001]: type mismatch in if branches: expected Int but got fn() -> Int
  --> /tmp/dojo-max-of-list-3.almd:3:72
  in if branches
  here: else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  hint: This names a FUNCTION and the position expects what CALLING it produces — the call was never made. Add the parentheses.
  |
3 |   else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  |                                                                        ^^^
error[E001]: type mismatch in if branches: expected Option[Int] but got fn() -> Int
  --> /tmp/dojo-max-of-list-3.almd:3:37
  in if branches
  here: else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  hint: Both branches of `if/then/else` must have the same type
  |
3 |   else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  |                                     ^

3 error(s) found
FAILED: /tmp/dojo-max-of-list-3.almd
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
