# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E012`

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, Int.min_value, (acc, x) => if x > acc then x else acc) |>
    some(_)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error[E001]: type mismatch in pipe call: expected Option[?3] but got fn(Unknown) -> Option[Int]
  --> /tmp/dojo-max-of-list-0.almd:4:10
  in pipe call
  hint: Fix the expression type or change the expected type
  |
4 |     some(_)
  |          ^

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
  else list.fold(xs, Int.min_value, (acc, x) => if x > acc then x else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
Compile error for /tmp/dojo-max-of-list-1.almd:
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

FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, Int.min_value, (acc, x) => if x > acc then Some(x) else Some(acc))
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


error[E0308]: mismatched types
   --> <generated.rs>:257:49
    |
257 |             if (x.clone() > acc.clone()) { Some(x) } else { Some(acc) }
    |                                            ---- ^ expected `i64`, found `Option<i64>`
    |                                            |
    |                                            arguments to this enum variant are incorrect
    |
    = note: expected type `i64`
               found enum `Option<i64>`
help: the type constructed contains `Option<i64>` due to the type of the argument passed
   --> <generated.rs>:257:44
    |
257 |             if (x.clone() > acc.clone()) { Some(x) } else { Some(acc) }
    |                                            ^^^^^-^
    |                                                 |
    |                                                 this argument influences the type of `Some`
note: tuple variant defined here
   --> /rustc/2d8144b7880597b6e6d3dfd63a9a9efae3f533d3/library/core/src/option.rs:605:4
help: consider using `Option::expect` to unwrap the `Option<i64>` value, panicking if the value is an `Option::None`
    |
257 |             if (x.clone() > acc.clone()) { Some(x.expect("REASON")) } else { Some(acc) }
    |                                                  +++++++++++++++++


error[E0308]: mismatched types
   --> <generated.rs>:257:66
    |
257 |             if (x.clone() > acc.clone()) { Some(x) } else { Some(acc) }
    |                                                             ---- ^^^ expected `i64`, found `Option<i64>`
    |                                                             |
    |                                                             arguments to this enum variant are incorrect
    |
    = note: expected type `i64`
               found enum `Option<i64>`
help: the type constructed contains `Option<i64>` due to the type of the argument passed
   --> <generated.rs>:257:61
    |
257 |             if (x.clone() > acc.clone()) { Some(x) } else { Some(acc) }
    |                                                             ^^^^^---^
    |                                                                  |
    |                                                                  this argument influences the type of `Some`
note: tuple variant defined here
   --> /rustc/2d8144b7880597b6e6d3dfd63a9a9efae3f533d3/library/core/src/option.rs:605:4
help: consider using `Option::expect` to unwrap the `Option<i64>` value, panicking if the value is an `Option::None`
    |
257 |             if (x.clone() > acc.clone()) { Some(x) } else { Some(acc.expect("REASON")) }
    |                                                                     +++++++++++++++++


error: could not compile `almide-generated` (bin "almide-generated" test) due to 4 previous errors; 2 warnings emitted

FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, Int.min_value, (acc, x) => if x > acc then Some(x) else acc)

fn max_of_list(xs: List[Int]) -> Option[Int] = 
  match list.fold(xs, Int.min_value, (acc, x) => if x > acc then Some(x) else acc) {
    some(x) => some(x)
    none => none
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error[E012]: duplicate function 'max_of_list'
  at line 5
  in fn max_of_list
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
  |
1 | fn max_of_list(xs: List[Int]) -> Option[Int] =
  | -------------------------------------- first definition of 'max_of_list' here
...
5 | fn max_of_list(xs: List[Int]) -> Option[Int] =
  | ^^^^^^^^^^^^^^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
