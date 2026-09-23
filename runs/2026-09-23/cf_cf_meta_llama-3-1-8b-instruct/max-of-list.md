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
  else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc) |>
         some
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(fn() -> Int, Int) -> fn() -> Int but got fn(fn() -> Int, Int) -> Int
  --> /tmp/dojo-max-of-list-0.almd:3:37
  in call to list.fold()
  here: else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc) |>
  hint: Fix the argument type
...
3 |   else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc) |>
  |                                     ^
error[E001]: type mismatch in if branches: expected Int but got fn() -> Int
  --> /tmp/dojo-max-of-list-0.almd:3:72
  in if branches
  here: else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc) |>
  hint: Both branches of `if/then/else` must have the same type
  |
3 |   else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc) |>
  |                                                                        ^^^
error[E001]: type mismatch in fn 'max_of_list': expected Option[Int] but got Option[fn() -> Int]
  --> /tmp/dojo-max-of-list-0.almd:4:10
  in fn 'max_of_list'
  here: some
  hint: Fix the expression type or change the expected type
  |
4 |          some
  |          ^^^^

3 error(s) found
FAILED: /tmp/dojo-max-of-list-0.almd
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(fn() -> Int, Int) -> fn() -> Int but got fn(fn() -> Int, Int) -> Int
  --> /tmp/dojo-max-of-list-1.almd:3:37
  in call to list.fold()
  here: else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  hint: Fix the argument type
...
3 |   else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  |                                     ^
error[E001]: type mismatch in if branches: expected Int but got fn() -> Int
  --> /tmp/dojo-max-of-list-1.almd:3:72
  in if branches
  here: else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  hint: Both branches of `if/then/else` must have the same type
  |
3 |   else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  |                                                                        ^^^
error[E001]: type mismatch in if branches: expected Option[Int] but got fn() -> Int
  --> /tmp/dojo-max-of-list-1.almd:3:37
  in if branches
  here: else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  hint: Both branches of `if/then/else` must have the same type
  |
3 |   else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  |                                     ^

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
  else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(fn() -> Int, Int) -> fn() -> Int but got fn(fn() -> Int, Int) -> Int
  --> /tmp/dojo-max-of-list-2.almd:3:37
  in call to list.fold()
  here: else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  hint: Fix the argument type
...
3 |   else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  |                                     ^
error[E001]: type mismatch in if branches: expected Int but got fn() -> Int
  --> /tmp/dojo-max-of-list-2.almd:3:72
  in if branches
  here: else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  hint: Both branches of `if/then/else` must have the same type
  |
3 |   else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  |                                                                        ^^^
error[E001]: type mismatch in if branches: expected Option[Int] but got fn() -> Int
  --> /tmp/dojo-max-of-list-2.almd:3:37
  in if branches
  here: else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  hint: Both branches of `if/then/else` must have the same type
  |
3 |   else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  |                                     ^

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
  hint: Both branches of `if/then/else` must have the same type
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
