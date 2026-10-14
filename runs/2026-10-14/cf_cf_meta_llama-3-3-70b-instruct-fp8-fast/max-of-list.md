# max-of-list

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) 
  then none 
  else some(list.reduce(xs, xs |> list.first |> option.unwrap_or(0), (max, x) => if max > x then max else x))
```

**Diagnostic:**

```
error[E004]: list.reduce() expects 2 argument(s) but got 3
  --> /tmp/dojo-max-of-list-0.almd:2:87
  in call to list.reduce()
  here: else some(list.reduce(xs, xs |> list.first ?? 0, (max, x) => if max > x then max else x))
  hint: Check the number of arguments
  try:
      // list.reduce() takes 2 arg(s) — you passed 3
      list.reduce(<xs: List[A]>, <f: fn(A, A) -> A>)
  |
2 | else some(list.reduce(xs, xs |> list.first ?? 0, (max, x) => if max > x then max else x))
  |                                                                                       ^
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got Int
  --> /tmp/dojo-max-of-list-0.almd:2:30
  in call to list.reduce()
  here: else some(list.reduce(xs, xs |> list.first ?? 0, (max, x) => if max > x then max else x))
  hint: Fix the argument type
...
2 | else some(list.reduce(xs, xs |> list.first ?? 0, (max, x) => if max > x then max else x))
  |                              ^^
error[E001]: type mismatch in fn 'max_of_list': expected Option[Int] but got Option[Option[Int]]
  --> /tmp/dojo-max-of-list-0.almd:2:30
  in fn 'max_of_list'
  here: else some(list.reduce(xs, xs |> list.first ?? 0, (max, x) => if max > x then max else x))
  hint: Fix the expression type or change the expected type
  |
2 | else some(list.reduce(xs, xs |> list.first ?? 0, (max, x) => if max > x then max else x))
  |                              ^^

3 error(s) found
FAILED: /tmp/dojo-max-of-list-0.almd
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) 
  then none 
  else list.reduce(xs, (max, x) => if max > x then max else x)
```
