# max-of-list

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else some(list.reduce(xs, list.first(xs).unwrap_or(0), (x, y) => if x > y then x else y))
```

**Diagnostic:**

```
error[E004]: list.reduce() expects 2 argument(s) but got 3
  --> /tmp/dojo-max-of-list-0.almd:3:89
  in call to list.reduce()
  here: else some(list.reduce(xs, list.first(xs).unwrap_or(0), (x, y) => if x > y then x else y))
  hint: Check the number of arguments
  try:
      // list.reduce() takes 2 arg(s) — you passed 3
      list.reduce(<xs: List[A]>, <f: fn(A, A) -> A>)
  |
3 |   else some(list.reduce(xs, list.first(xs).unwrap_or(0), (x, y) => if x > y then x else y))
  |                                                                                         ^
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got Int
  --> /tmp/dojo-max-of-list-0.almd:3:29
  in call to list.reduce()
  here: else some(list.reduce(xs, list.first(xs).unwrap_or(0), (x, y) => if x > y then x else y))
  hint: Fix the argument type
...
3 |   else some(list.reduce(xs, list.first(xs).unwrap_or(0), (x, y) => if x > y then x else y))
  |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in fn 'max_of_list': expected Option[Int] but got Option[Option[Int]]
  --> /tmp/dojo-max-of-list-0.almd:3:29
  in fn 'max_of_list'
  here: else some(list.reduce(xs, list.first(xs).unwrap_or(0), (x, y) => if x > y then x else y))
  hint: Fix the expression type or change the expected type
  |
3 |   else some(list.reduce(xs, list.first(xs).unwrap_or(0), (x, y) => if x > y then x else y))
  |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
  else some(list.reduce(xs, (x, y) => if x > y then x else y))
```

**Diagnostic:**

```
error[E001]: type mismatch in fn 'max_of_list': expected Option[Int] but got Option[Option[Int]]
  --> /tmp/dojo-max-of-list-1.almd:3:60
  in fn 'max_of_list'
  here: else some(list.reduce(xs, (x, y) => if x > y then x else y))
  hint: Fix the expression type or change the expected type
  |
3 |   else some(list.reduce(xs, (x, y) => if x > y then x else y))
  |                                                            ^

1 error(s) found
FAILED: /tmp/dojo-max-of-list-1.almd
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (PASS)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.reduce(xs, (x, y) => if x > y then x else y)
```
