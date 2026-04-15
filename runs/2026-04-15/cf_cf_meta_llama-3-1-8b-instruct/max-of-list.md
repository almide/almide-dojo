# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E0599`

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, xs.first(), (acc, x) => if x > acc then x else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error[E001]: type mismatch in call to list.fold(): expected fn(Option[Int], Int) -> Option[Int] but got fn(Option[Int], Option[Int]) -> Option[Int]
  --> /tmp/dojo-max-of-list-0.almd:3:69
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
3 |   else list.fold(xs, xs.first(), (acc, x) => if x > acc then x else acc)
  |                                                                     ^^^

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
  else list.fold(xs, some(xs.first()), (acc, x) => if x > acc.get() then some(x) else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error[E001]: type mismatch in call to list.fold(): expected fn(Option[Option[Int]], Int) -> Option[Option[Int]] but got fn(Option[Int], Int) -> Option[Int]
  --> /tmp/dojo-max-of-list-1.almd:3:87
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
3 |   else list.fold(xs, some(xs.first()), (acc, x) => if x > acc.get() then some(x) else acc)
  |                                                                                       ^^^
error[E001]: type mismatch in fn 'max_of_list': expected Option[Int] but got Option[Option[Int]]
  --> /tmp/dojo-max-of-list-1.almd:3:87
  in fn 'max_of_list'
  hint: Fix the expression type or change the expected type
  |
3 |   else list.fold(xs, some(xs.first()), (acc, x) => if x > acc.get() then some(x) else acc)
  |                                                                                       ^^^

2 error(s) found
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, none, (acc, x) => if acc.is_none() then some(x) else if x > acc.get() then some(x) else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
Compile error for /tmp/dojo-max-of-list-2.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0599]: no method named `get` found for enum `Option<T>` in the current scope
   --> <generated.rs>:267:86
    |
267 |             if almide_rt_option_is_none(&acc) { Some(x) } else { if (x > acc.clone().get()) { Some(x) } else { acc } }
    |                                                                                      ^^^
    |
help: there is a method `ge` with a similar name, but with different arguments
   --> /rustc/e408947bfd200af42db322daf0fadfe7e26d3bd1/library/core/src/cmp.rs:1456:4


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error; 2 warnings emitted

FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, none, (acc, x) => if acc.is_none() then some(x) else if x > acc.unwrap().get() then some(x) else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
Compile error for /tmp/dojo-max-of-list-3.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0599]: no method named `get` found for type `i64` in the current scope
   --> <generated.rs>:267:95
    |
267 |             if almide_rt_option_is_none(&acc) { Some(x) } else { if (x > acc.clone().unwrap().get()) { Some(x) } else { acc } }
    |                                                                                               ^^^
    |
help: there is a method `ge` with a similar name, but with different arguments
   --> /rustc/e408947bfd200af42db322daf0fadfe7e26d3bd1/library/core/src/cmp.rs:1456:4


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error; 2 warnings emitted

FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
