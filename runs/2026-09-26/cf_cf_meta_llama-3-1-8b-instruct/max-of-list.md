# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E0308`

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, int.min_value(), (acc, x) => if x > acc then x else acc)
```

**Diagnostic:**

```
error[E001]: type mismatch in if branches: expected Option[Int] but got Int
  --> /tmp/dojo-max-of-list-0.almd:3:74
  in if branches
  here: else list.fold(xs, int.min_value(), (acc, x) => if x > acc then x else acc)
  hint: Both branches of `if/then/else` must have the same type
  |
3 |   else list.fold(xs, int.min_value(), (acc, x) => if x > acc then x else acc)
  |                                                                          ^^^

1 error(s) found
FAILED: /tmp/dojo-max-of-list-0.almd
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, int.min_value(), (acc, x) => if x > acc then some(x) else some(acc))
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got fn(Int, Int) -> Option[Int]
  --> /tmp/dojo-max-of-list-1.almd:3:39
  in call to list.fold()
  here: else list.fold(xs, int.min_value(), (acc, x) => if x > acc then some(x) else some(acc))
  hint: Fix the argument type
...
3 |   else list.fold(xs, int.min_value(), (acc, x) => if x > acc then some(x) else some(acc))
  |                                       ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Int
  --> /tmp/dojo-max-of-list-1.almd:3:39
  in if branches
  here: else list.fold(xs, int.min_value(), (acc, x) => if x > acc then some(x) else some(acc))
  hint: Both branches of `if/then/else` must have the same type
  |
3 |   else list.fold(xs, int.min_value(), (acc, x) => if x > acc then some(x) else some(acc))
  |                                       ^

2 error(s) found
FAILED: /tmp/dojo-max-of-list-1.almd
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, some(int.min_value()), (acc, x) => if x > acc.get() then some(x) else acc)
```

**Diagnostic:**

```
error[E002]: undefined method 'get' on option
  --> /tmp/dojo-max-of-list-2.almd:3:64
  in method call .get()
  here: else list.fold(xs, some(int.min_value()), (acc, x) => if x > acc.get() then some(x) else acc)
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `get` on `option`. Run `almide explain E002` for examples.
  |
3 |   else list.fold(xs, some(int.min_value()), (acc, x) => if x > acc.get() then some(x) else acc)
  |                                                                ^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-max-of-list-2.almd
Compile error for /tmp/dojo-max-of-list-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, some(int.min_value()), (acc, x) => if x > acc then some(x) else acc)
```

**Diagnostic:**

```
FAILED: /tmp/dojo-max-of-list-3.almd
Compile error for /tmp/dojo-max-of-list-3.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0308]: mismatched types
    --> <generated.rs>:4349:135
     |
4349 | ...ide_rt_int_min_value()), |acc, x| if (x > acc.clone()) { Some(x) } else { acc }) }
     |                                          -   ^^^^^^^^^^^ expected `i64`, found `Option<i64>`
     |                                          |
     |                                          expected because this is `i64`
     |
     = note: expected type `i64`
                found enum `Option<i64>`
help: consider using `Option::expect` to unwrap the `Option<i64>` value, panicking if the value is an `Option::None`
     |
4349 |     if almide_rt_list_is_empty(xs) { None::<i64> } else { (xs).iter().cloned().fold(Some(almide_rt_int_min_value()), |acc, x| if (x > acc.clone().expect("REASON")) { Some(x) } else { acc }) }
     |                                                                                                                                                  +++++++++++++++++


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error; 6 warnings emitted

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
