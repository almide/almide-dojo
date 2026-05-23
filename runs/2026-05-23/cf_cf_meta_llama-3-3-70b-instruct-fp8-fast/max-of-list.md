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
    some(list.reduce(xs, list.first(xs) |> option.unwrap, (max, x) => if max > x then max else x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error[E002]: undefined function 'option.unwrap'
  --> /tmp/dojo-max-of-list-0.almd:5:37
  in call to option.unwrap()
  hint: No function 'unwrap' in module 'option'. See docs/CHEATSHEET.md for available functions
  |
5 |     some(list.reduce(xs, list.first(xs) |> option.unwrap, (max, x) => if max > x then max else x))
  |                                     ^^
error[E004]: list.reduce() expects 2 argument(s) but got 3
  --> /tmp/dojo-max-of-list-0.almd:5:96
  in call to list.reduce()
  hint: Check the number of arguments
  try:
      // list.reduce() takes 2 arg(s) — you passed 3
      list.reduce(<xs: List[A]>, <f: fn(A, A) -> A>)
  |
5 |     some(list.reduce(xs, list.first(xs) |> option.unwrap, (max, x) => if max > x then max else x))
  |                                                                                                ^
error[E001]: type mismatch in fn 'max_of_list': expected Option[Int] but got Option[Option[Int]]
  --> /tmp/dojo-max-of-list-0.almd:5:96
  in fn 'max_of_list'
  hint: Fix the expression type or change the expected type
  |
5 |     some(list.reduce(xs, list.first(xs) |> option.unwrap, (max, x) => if max > x then max else x))
  |                                                                                                ^

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
    list.reduce(xs, (max, x) => if max > x then max else x)
```
