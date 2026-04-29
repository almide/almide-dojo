# max-of-list

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
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
    some(list.reduce(xs, list.first(xs) |> option.unwrap_or(0), (max, x) => int.max(max, x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error[E004]: list.reduce() expects 2 argument(s) but got 3
  --> /tmp/dojo-max-of-list-0.almd:5:90
  in call to list.reduce()
  hint: Check the number of arguments
  try:
      // list.reduce() takes 2 arg(s) — you passed 3
      list.reduce(<xs: List[A]>, <f: fn(A, A) -> A>)
  |
5 |     some(list.reduce(xs, list.first(xs) |> option.unwrap_or(0), (max, x) => int.max(max, x)))
  |                                                                                          ^
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got Int
  --> /tmp/dojo-max-of-list-0.almd:5:90
  in call to list.reduce()
  hint: Fix the argument type
  |
5 |     some(list.reduce(xs, list.first(xs) |> option.unwrap_or(0), (max, x) => int.max(max, x)))
  |                                                                                          ^
error[E001]: type mismatch in call to list.reduce(): expected fn(Int, Int) -> Int but got Int
  --> /tmp/dojo-max-of-list-0.almd:5:90
  in call to list.reduce()
  hint: Fix the expression type or change the expected type
  |
5 |     some(list.reduce(xs, list.first(xs) |> option.unwrap_or(0), (max, x) => int.max(max, x)))
  |                                                                                          ^
error[E001]: type mismatch in fn 'max_of_list': expected Option[Int] but got Option[Option[Int]]
  --> /tmp/dojo-max-of-list-0.almd:5:90
  in fn 'max_of_list'
  hint: Fix the expression type or change the expected type
  |
5 |     some(list.reduce(xs, list.first(xs) |> option.unwrap_or(0), (max, x) => int.max(max, x)))
  |                                                                                          ^

4 error(s) found
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then 
    none
  else 
    some(list.reduce(xs, (x, y) => int.max(x, y)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error[E001]: type mismatch in fn 'max_of_list': expected Option[Int] but got Option[Option[Int]]
  --> /tmp/dojo-max-of-list-1.almd:5:47
  in fn 'max_of_list'
  hint: Fix the expression type or change the expected type
  |
5 |     some(list.reduce(xs, (x, y) => int.max(x, y)))
  |                                               ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then 
    none
  else 
    list.reduce(xs, (x, y) => int.max(x, y))
```
