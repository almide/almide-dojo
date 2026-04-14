# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, x => x, (acc, x) => if x > acc then x else acc) some
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-max-of-list-0.almd:3:24
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
3 |   else list.fold(xs, x => x, (acc, x) => if x > acc then x else acc) some
  |                        ^^
error: Lambda parameter must be wrapped in parentheses at line 3:24
  --> /tmp/dojo-max-of-list-0.almd:3:24
  |
3 |   else list.fold(xs, x => x, (acc, x) => if x > acc then x else acc) some
  |                        ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-0.almd:5:50
  in call to max_of_list()
  hint: Check the function name
  |
5 | test "max_of_list empty" { assert_eq(max_of_list([]), none) }
  |                                                  ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-0.almd:6:52
  in call to max_of_list()
  hint: Check the function name
  |
6 | test "max_of_list single" { assert_eq(max_of_list([42]), some(42)) }
  |                                                    ^^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-0.almd:7:61
  in call to max_of_list()
  hint: Check the function name
  |
7 | test "max_of_list ascending" { assert_eq(max_of_list([1, 2, 3]), some(3)) }
  |                                                             ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-0.almd:8:62
  in call to max_of_list()
  hint: Check the function name
  |
8 | test "max_of_list descending" { assert_eq(max_of_list([3, 2, 1]), some(3)) }
  |                                                              ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-0.almd:9:62
  in call to max_of_list()
  hint: Check the function name
  |
9 | test "max_of_list duplicates" { assert_eq(max_of_list([5, 5, 5]), some(5)) }
  |                                                              ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-0.almd:10:64
  in call to max_of_list()
  hint: Check the function name
   |
10 | test "max_of_list negatives" { assert_eq(max_of_list([-3, -1, -2]), some(-1)) }
   |                                                                ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-0.almd:11:63
  in call to max_of_list()
  hint: Check the function name
   |
11 | test "max_of_list mixed" { assert_eq(max_of_list([-10, 0, 10, 5]), some(10)) }
   |                                                               ^

9 error(s) found
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, x => x, (acc, x) => if x > acc then x else acc) some
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-max-of-list-1.almd:3:24
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
3 |   else list.fold(xs, x => x, (acc, x) => if x > acc then x else acc) some
  |                        ^^
error: Lambda parameter must be wrapped in parentheses at line 3:24
  --> /tmp/dojo-max-of-list-1.almd:3:24
  |
3 |   else list.fold(xs, x => x, (acc, x) => if x > acc then x else acc) some
  |                        ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-1.almd:5:50
  in call to max_of_list()
  hint: Check the function name
  |
5 | test "max_of_list empty" { assert_eq(max_of_list([]), none) }
  |                                                  ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-1.almd:6:52
  in call to max_of_list()
  hint: Check the function name
  |
6 | test "max_of_list single" { assert_eq(max_of_list([42]), some(42)) }
  |                                                    ^^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-1.almd:7:61
  in call to max_of_list()
  hint: Check the function name
  |
7 | test "max_of_list ascending" { assert_eq(max_of_list([1, 2, 3]), some(3)) }
  |                                                             ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-1.almd:8:62
  in call to max_of_list()
  hint: Check the function name
  |
8 | test "max_of_list descending" { assert_eq(max_of_list([3, 2, 1]), some(3)) }
  |                                                              ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-1.almd:9:62
  in call to max_of_list()
  hint: Check the function name
  |
9 | test "max_of_list duplicates" { assert_eq(max_of_list([5, 5, 5]), some(5)) }
  |                                                              ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-1.almd:10:64
  in call to max_of_list()
  hint: Check the function name
   |
10 | test "max_of_list negatives" { assert_eq(max_of_list([-3, -1, -2]), some(-1)) }
   |                                                                ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-1.almd:11:63
  in call to max_of_list()
  hint: Check the function name
   |
11 | test "max_of_list mixed" { assert_eq(max_of_list([-10, 0, 10, 5]), some(10)) }
   |                                                               ^

9 error(s) found
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, x => x, (acc, x) => if x > acc then x else acc) some
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-max-of-list-2.almd:3:24
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
3 |   else list.fold(xs, x => x, (acc, x) => if x > acc then x else acc) some
  |                        ^^
error: Lambda parameter must be wrapped in parentheses at line 3:24
  --> /tmp/dojo-max-of-list-2.almd:3:24
  |
3 |   else list.fold(xs, x => x, (acc, x) => if x > acc then x else acc) some
  |                        ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-2.almd:5:50
  in call to max_of_list()
  hint: Check the function name
  |
5 | test "max_of_list empty" { assert_eq(max_of_list([]), none) }
  |                                                  ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-2.almd:6:52
  in call to max_of_list()
  hint: Check the function name
  |
6 | test "max_of_list single" { assert_eq(max_of_list([42]), some(42)) }
  |                                                    ^^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-2.almd:7:61
  in call to max_of_list()
  hint: Check the function name
  |
7 | test "max_of_list ascending" { assert_eq(max_of_list([1, 2, 3]), some(3)) }
  |                                                             ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-2.almd:8:62
  in call to max_of_list()
  hint: Check the function name
  |
8 | test "max_of_list descending" { assert_eq(max_of_list([3, 2, 1]), some(3)) }
  |                                                              ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-2.almd:9:62
  in call to max_of_list()
  hint: Check the function name
  |
9 | test "max_of_list duplicates" { assert_eq(max_of_list([5, 5, 5]), some(5)) }
  |                                                              ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-2.almd:10:64
  in call to max_of_list()
  hint: Check the function name
   |
10 | test "max_of_list negatives" { assert_eq(max_of_list([-3, -1, -2]), some(-1)) }
   |                                                                ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-2.almd:11:63
  in call to max_of_list()
  hint: Check the function name
   |
11 | test "max_of_list mixed" { assert_eq(max_of_list([-10, 0, 10, 5]), some(10)) }
   |                                                               ^

9 error(s) found
Compile error for /tmp/dojo-max-of-list-2.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, x => x, (acc, x) => if x > acc then x else acc) some
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-max-of-list-3.almd:3:24
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
3 |   else list.fold(xs, x => x, (acc, x) => if x > acc then x else acc) some
  |                        ^^
error: Lambda parameter must be wrapped in parentheses at line 3:24
  --> /tmp/dojo-max-of-list-3.almd:3:24
  |
3 |   else list.fold(xs, x => x, (acc, x) => if x > acc then x else acc) some
  |                        ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-3.almd:5:50
  in call to max_of_list()
  hint: Check the function name
  |
5 | test "max_of_list empty" { assert_eq(max_of_list([]), none) }
  |                                                  ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-3.almd:6:52
  in call to max_of_list()
  hint: Check the function name
  |
6 | test "max_of_list single" { assert_eq(max_of_list([42]), some(42)) }
  |                                                    ^^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-3.almd:7:61
  in call to max_of_list()
  hint: Check the function name
  |
7 | test "max_of_list ascending" { assert_eq(max_of_list([1, 2, 3]), some(3)) }
  |                                                             ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-3.almd:8:62
  in call to max_of_list()
  hint: Check the function name
  |
8 | test "max_of_list descending" { assert_eq(max_of_list([3, 2, 1]), some(3)) }
  |                                                              ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-3.almd:9:62
  in call to max_of_list()
  hint: Check the function name
  |
9 | test "max_of_list duplicates" { assert_eq(max_of_list([5, 5, 5]), some(5)) }
  |                                                              ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-3.almd:10:64
  in call to max_of_list()
  hint: Check the function name
   |
10 | test "max_of_list negatives" { assert_eq(max_of_list([-3, -1, -2]), some(-1)) }
   |                                                                ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-3.almd:11:63
  in call to max_of_list()
  hint: Check the function name
   |
11 | test "max_of_list mixed" { assert_eq(max_of_list([-10, 0, 10, 5]), some(10)) }
   |                                                               ^

9 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
