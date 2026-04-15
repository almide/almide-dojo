# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, xs[0], (max, x) => if x > max then x else max) | some
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 3:69 (got Pipe '|')
  --> /tmp/dojo-max-of-list-0.almd:3:69
  |
3 |   else list.fold(xs, xs[0], (max, x) => if x > max then x else max) | some
  |                                                                     ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Int
  --> /tmp/dojo-max-of-list-0.almd:3:64
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
3 |   else list.fold(xs, xs[0], (max, x) => if x > max then x else max) | some
  |                                                                ^^^

2 error(s) found
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, none, (acc, x) => if acc == none then some(x) else if x > acc.unwrap() then some(x) else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-max-of-list-1.almd:3:80
  in method call .unwrap()
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
  |
3 |   else list.fold(xs, none, (acc, x) => if acc == none then some(x) else if x > acc.unwrap() then some(x) else acc)
  |                                                                                ^^^

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
  else list.fold(xs, none, (acc, x) => if acc == none then some(x) else if x > option.get(acc) then some(x) else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error[E002]: undefined function 'option.get'
  --> /tmp/dojo-max-of-list-2.almd:3:91
  in call to option.get()
  hint: No function 'get' in module 'option'. See docs/CHEATSHEET.md for available functions
  |
3 |   else list.fold(xs, none, (acc, x) => if acc == none then some(x) else if x > option.get(acc) then some(x) else acc)
  |                                                                                           ^^^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-2.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, none, (acc, x) => if acc == none then some(x) else if x > option.get(acc) then some(x) else acc)

// Corrected Code:
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, none, (acc, x) => if acc == none then some(x) else if x > option.get(acc) then some(x) else acc)

// Corrected Code:
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, none, (acc, x) => if acc == none then some(x) else if x > option.get(acc) then some(x) else acc)

// Corrected Code:
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, none, (acc, x) => if acc == none then some(x) else if x > option.get(acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error: Expected Then at line 20:1 (got Test 'test')
  --> /tmp/dojo-max-of-list-3.almd:20:1
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
20 | test "max_of_list empty" { assert_eq(max_of_list([]), none) }
   | ^
error[E012]: duplicate function 'max_of_list'
  at line 6
  in fn max_of_list
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
  |
1 | fn max_of_list(xs: List[Int]) -> Option[Int] =
  | -------------------------------------- first definition of 'max_of_list' here
...
6 | fn max_of_list(xs: List[Int]) -> Option[Int] =
  | ^^^^^^^^^^^^^^
error[E012]: duplicate function 'max_of_list'
  at line 11
  in fn max_of_list
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn max_of_list(xs: List[Int]) -> Option[Int] =
   | -------------------------------------- first definition of 'max_of_list' here
...
11 | fn max_of_list(xs: List[Int]) -> Option[Int] =
   | ^^^^^^^^^^^^^^
error[E002]: undefined function 'option.get'
  --> /tmp/dojo-max-of-list-3.almd:3:91
  in call to option.get()
  hint: No function 'get' in module 'option'. See docs/CHEATSHEET.md for available functions
  |
3 |   else list.fold(xs, none, (acc, x) => if acc == none then some(x) else if x > option.get(acc) then some(x) else acc)
  |                                                                                           ^^^
error[E002]: undefined function 'option.get'
  --> /tmp/dojo-max-of-list-3.almd:8:91
  in call to option.get()
  hint: No function 'get' in module 'option'. See docs/CHEATSHEET.md for available functions
  |
8 |   else list.fold(xs, none, (acc, x) => if acc == none then some(x) else if x > option.get(acc) then some(x) else acc)
  |                                                                                           ^^^
error[E002]: undefined function 'option.get'
  --> /tmp/dojo-max-of-list-3.almd:13:91
  in call to option.get()
  hint: No function 'get' in module 'option'. See docs/CHEATSHEET.md for available functions
   |
13 |   else list.fold(xs, none, (acc, x) => if acc == none then some(x) else if x > option.get(acc) then some(x) else acc)
   |                                                                                           ^^^

6 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
