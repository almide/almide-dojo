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
  if list.is_empty(xs) then 
    none
  else 
    some(list.reduce(xs, (x) => x, (a, b) => if a > b then a else b))
```

**Diagnostic:**

```
error[E004]: list.reduce() expects 2 argument(s) but got 3
  --> /tmp/dojo-max-of-list-0.almd:5:67
  in call to list.reduce()
  here: some(list.reduce(xs, (x) => x, (a, b) => if a > b then a else b))
  hint: Check the number of arguments
  try:
      // list.reduce() takes 2 arg(s) — you passed 3
      list.reduce(<xs: List[A]>, <f: fn(A, A) -> A>)
  |
5 |     some(list.reduce(xs, (x) => x, (a, b) => if a > b then a else b))
  |                                                                   ^
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got fn(Int) -> Int
  --> /tmp/dojo-max-of-list-0.almd:5:26
  in call to list.reduce()
  here: some(list.reduce(xs, (x) => x, (a, b) => if a > b then a else b))
  hint: Fix the argument type
  |
5 |     some(list.reduce(xs, (x) => x, (a, b) => if a > b then a else b))
  |                          ^
error[E001]: type mismatch in fn 'max_of_list': expected Option[Int] but got Option[Option[Int]]
  --> /tmp/dojo-max-of-list-0.almd:3:5
  in fn 'max_of_list'
  here: none
  hint: Fix the expression type or change the expected type
  |
3 |     none
  |     ^^^^

3 error(s) found
FAILED: /tmp/dojo-max-of-list-0.almd
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then 
    none
  else 
    some(list.reduce(xs, (a, b) => if a > b then a else b))
```

**Diagnostic:**

```
error[E001]: type mismatch in fn 'max_of_list': expected Option[Int] but got Option[Option[Int]]
  --> /tmp/dojo-max-of-list-1.almd:3:5
  in fn 'max_of_list'
  here: none
  hint: Fix the expression type or change the expected type
  |
3 |     none
  |     ^^^^

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
  else list.reduce(xs, (a, b) => if a > b then a else b)
```
