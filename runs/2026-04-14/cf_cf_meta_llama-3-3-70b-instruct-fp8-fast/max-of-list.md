# max-of-list

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Attempts

### Attempt 1 (FAIL)

```almide
def max_of_list(xs: List[Int]): Option[Int] = {
  if (list.is_empty(xs)) 
    none 
  else 
    some(list.fold(xs, xs.head, (x, y) => if (x > y) x else y))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error: 'def' is not a keyword in Almide at line 1:1
  --> /tmp/dojo-max-of-list-0.almd:1:1
  hint: Use 'fn name(...) -> Type = expr' or 'effect fn name(...) -> Result[T, E] = expr'.
  |
1 | def max_of_list(xs: List[Int]): Option[Int] = {
  | ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-0.almd:8:50
  in call to max_of_list()
  hint: Check the function name
  |
8 | test "max_of_list empty" { assert_eq(max_of_list([]), none) }
  |                                                  ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-0.almd:9:52
  in call to max_of_list()
  hint: Check the function name
  |
9 | test "max_of_list single" { assert_eq(max_of_list([42]), some(42)) }
  |                                                    ^^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-0.almd:10:61
  in call to max_of_list()
  hint: Check the function name
   |
10 | test "max_of_list ascending" { assert_eq(max_of_list([1, 2, 3]), some(3)) }
   |                                                             ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-0.almd:11:62
  in call to max_of_list()
  hint: Check the function name
   |
11 | test "max_of_list descending" { assert_eq(max_of_list([3, 2, 1]), some(3)) }
   |                                                              ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-0.almd:12:62
  in call to max_of_list()
  hint: Check the function name
   |
12 | test "max_of_list duplicates" { assert_eq(max_of_list([5, 5, 5]), some(5)) }
   |                                                              ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-0.almd:13:64
  in call to max_of_list()
  hint: Check the function name
   |
13 | test "max_of_list negatives" { assert_eq(max_of_list([-3, -1, -2]), some(-1)) }
   |                                                                ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-0.almd:14:63
  in call to max_of_list()
  hint: Check the function name
   |
14 | test "max_of_list mixed" { assert_eq(max_of_list([-10, 0, 10, 5]), some(10)) }
   |                                                               ^

8 error(s) found
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) 
    then none 
    else some(list.fold(xs, xs.head, (x, y) => if x > y then x else y))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
Compile error for /tmp/dojo-max-of-list-1.almd:
error: could not compile `almide-out` (bin "almide-out" test) due to 1 previous error; 2 warnings emitted

FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) 
    then none 
    else some(list.fold(xs, xs.head, (x, y) => if x > y then x else y))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
Compile error for /tmp/dojo-max-of-list-2.almd:
error: could not compile `almide-out` (bin "almide-out" test) due to 1 previous error; 2 warnings emitted

FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) 
    then none 
    else some(list.fold(xs, xs.head, (x, y) => if x > y then x else y))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
Compile error for /tmp/dojo-max-of-list-3.almd:
error: could not compile `almide-out` (bin "almide-out" test) due to 1 previous error; 2 warnings emitted

FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
