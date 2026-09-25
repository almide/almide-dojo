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
    some(list.reduce(xs, list.first(xs) |> option.unwrap, (max, x) => if x > max then x else max))
```

**Diagnostic:**

```
error[E002]: undefined function 'option.unwrap'
  --> /tmp/dojo-max-of-list-0.almd:5:37
  in call to option.unwrap()
  here: some(list.reduce(xs, list.first(xs) |> option.unwrap, (max, x) => if x > max then x else max))
  hint: Did you mean `option.unwrap_or`?
  try:
      // option.unwrap(...)  →  option.unwrap_or(...)
      option.unwrap_or(...)
  |
5 |     some(list.reduce(xs, list.first(xs) |> option.unwrap, (max, x) => if x > max then x else max))
  |                                     ^^
error[E004]: list.reduce() expects 2 argument(s) but got 3
  --> /tmp/dojo-max-of-list-0.almd:5:94
  in call to list.reduce()
  here: some(list.reduce(xs, list.first(xs) |> option.unwrap, (max, x) => if x > max then x else max))
  hint: Check the number of arguments
  try:
      // list.reduce() takes 2 arg(s) — you passed 3
      list.reduce(<xs: List[A]>, <f: fn(A, A) -> A>)
  |
5 |     some(list.reduce(xs, list.first(xs) |> option.unwrap, (max, x) => if x > max then x else max))
  |                                                                                              ^^^
error[E001]: type mismatch in fn 'max_of_list': expected Option[Int] but got Option[Option[Int]]
  --> /tmp/dojo-max-of-list-0.almd:5:94
  in fn 'max_of_list'
  here: some(list.reduce(xs, list.first(xs) |> option.unwrap, (max, x) => if x > max then x else max))
  hint: Fix the expression type or change the expected type
  |
5 |     some(list.reduce(xs, list.first(xs) |> option.unwrap, (max, x) => if x > max then x else max))
  |                                                                                              ^^^

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
    some(list.reduce(xs, (x, y) => if x > y then x else y))
```

**Diagnostic:**

```
error[E001]: type mismatch in fn 'max_of_list': expected Option[Int] but got Option[Option[Int]]
  --> /tmp/dojo-max-of-list-1.almd:5:57
  in fn 'max_of_list'
  here: some(list.reduce(xs, (x, y) => if x > y then x else y))
  hint: Fix the expression type or change the expected type
  |
5 |     some(list.reduce(xs, (x, y) => if x > y then x else y))
  |                                                         ^

1 error(s) found
FAILED: /tmp/dojo-max-of-list-1.almd
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (PASS)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then 
    none
  else 
    list.reduce(xs, (x, y) => if x > y then x else y)
```
