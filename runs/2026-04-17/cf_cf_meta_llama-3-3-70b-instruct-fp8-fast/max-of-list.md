# max-of-list

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then 
    none
  else 
    some(list.reduce(xs, list.first(xs).unwrap_or(0), (max, x) => int.max(max, x)).unwrap_or(0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error[E004]: list.reduce() expects 2 argument(s) but got 3
  --> /tmp/dojo-max-of-list-0.almd:5:80
  in call to list.reduce()
  hint: Check the number of arguments
  try:
      // list.reduce() takes 2 arg(s) — you passed 3
      list.reduce(<xs: List[A]>, <f: fn(A, A) -> A>)
  |
5 |     some(list.reduce(xs, list.first(xs).unwrap_or(0), (max, x) => int.max(max, x)).unwrap_or(0))
  |                                                                                ^
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got Int
  --> /tmp/dojo-max-of-list-0.almd:5:80
  in call to list.reduce()
  hint: Fix the argument type
  |
5 |     some(list.reduce(xs, list.first(xs).unwrap_or(0), (max, x) => int.max(max, x)).unwrap_or(0))
  |                                                                                ^
error[E001]: type mismatch in call to list.reduce(): expected fn(Int, Int) -> Int but got Int
  --> /tmp/dojo-max-of-list-0.almd:5:80
  in call to list.reduce()
  hint: Fix the expression type or change the expected type
  |
5 |     some(list.reduce(xs, list.first(xs).unwrap_or(0), (max, x) => int.max(max, x)).unwrap_or(0))
  |                                                                                ^

3 error(s) found
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then 
    none
  else 
    some(list.reduce(xs, (max, x) => int.max(max, x)).unwrap_or(0))
```
