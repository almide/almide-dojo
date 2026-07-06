# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else 
    match list.fold(xs, Int.min_value, (max, x) => if x > max then x else max) 
    { 
      some(max) 
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error: Expected FatArrow at line 6:17 (got Newline '')
  --> /tmp/dojo-max-of-list-0.almd:6:17
  |
6 |       some(max)
  |                 ^

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
    match list.fold(xs, Int.min_value, (max, x) => if x > max then x else max) 
    { 
      some(list.fold(xs, Int.min_value, (max, x) => if x > max then x else max)) 
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error: Expected RParen at line 6:16 (got Dot '.')
  --> /tmp/dojo-max-of-list-1.almd:6:16
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
  |
6 |       some(list.fold(xs, Int.min_value, (max, x) => if x > max then x else max))
  |                ^

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
    some(list.fold(xs, Int.min_value, (max, x) => if x > max then x else max))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
Compile error for /tmp/dojo-max-of-list-2.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0609]: no field `min_value` on type `Vec<i64>`
   --> <generated.rs>:254:47
    |
254 |         Some((xs.clone()).into_iter().fold(xs.min_value, move |max, x| {
    |                                               ^^^^^^^^^ unknown field


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error; 2 warnings emitted

FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else 
    some(list.fold(xs, int.min_value, (max, x) => if x > max then x else max))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error[E003]: undefined variable 'int'
  --> /tmp/dojo-max-of-list-3.almd:4:24
  in variable int
  hint: Check the variable name
  |
4 |     some(list.fold(xs, int.min_value, (max, x) => if x > max then x else max))
  |                        ^^^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
