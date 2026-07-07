# partition-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  match list.partition(xs, predicate) {
    some((matching, non_matching)) => (matching, non_matching),
    none => error("partition failed")
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-0.almd
error[E010]: non-exhaustive match: missing (_, _)
  --> /tmp/dojo-partition-list-0.almd:2:28
  in match
  hint: Add arms for (_, _), or use '_'
  |
2 |   match list.partition(xs, predicate) {
  |                            ^^^^^^^^^
error[E002]: undefined function 'error'
  --> /tmp/dojo-partition-list-0.almd:4:19
  in call to error()
  hint: Check the function name
  |
4 |     none => error("partition failed")
  |                   ^^^^^^^^^^^^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-partition-list-0.almd:
compile failed
FAILED: /tmp/dojo-partition-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  match list.partition(xs, predicate) {
    some((matching, non_matching)) => (matching, non_matching),
    none => (list.empty[Int], list.empty[Int])
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-1.almd
error[E010]: non-exhaustive match: missing (_, _)
  --> /tmp/dojo-partition-list-1.almd:2:28
  in match
  hint: Add arms for (_, _), or use '_'
  |
2 |   match list.partition(xs, predicate) {
  |                            ^^^^^^^^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-partition-list-1.almd:4:14
  in variable list
  hint: Check the variable name
  |
4 |     none => (list.empty[Int], list.empty[Int])
  |              ^^^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-partition-list-1.almd:4:31
  in variable list
  hint: Check the variable name
  |
4 |     none => (list.empty[Int], list.empty[Int])
  |                               ^^^^

3 error(s) found
Compile error for /tmp/dojo-partition-list-1.almd:
compile failed
FAILED: /tmp/dojo-partition-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  match list.partition(xs, predicate) {
    some((matching, non_matching)) => (matching, non_matching),
    none => (list.empty[Int], list.empty[Int])
  }

fn list_partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  list.fold(xs, (empty, empty), (acc, x) => 
    if predicate(x) then (x::acc.0, acc.1) else (acc.0, x::acc.1)
  )

fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  list_partition(xs, predicate)
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-2.almd
error: Expected ')' to close parenthesized expression opened at line 9:26
  --> /tmp/dojo-partition-list-2.almd:9:28
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
9 |     if predicate(x) then (x::acc.0, acc.1) else (acc.0, x::acc.1)
  |                          --------------- '(' opened here
  |
9 |     if predicate(x) then (x::acc.0, acc.1) else (acc.0, x::acc.1)
  |                            ^
error[E012]: duplicate function 'partition'
  at line 12
  in fn partition
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) =
   | ------------------------------------ first definition of 'partition' here
...
12 | fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) =
   | ^^^^^^^^^^^^
error[E010]: non-exhaustive match: missing (_, _)
  --> /tmp/dojo-partition-list-2.almd:2:28
  in match
  hint: Add arms for (_, _), or use '_'
  |
2 |   match list.partition(xs, predicate) {
  |                            ^^^^^^^^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-partition-list-2.almd:4:14
  in variable list
  hint: Check the variable name
  |
4 |     none => (list.empty[Int], list.empty[Int])
  |              ^^^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-partition-list-2.almd:4:31
  in variable list
  hint: Check the variable name
  |
4 |     none => (list.empty[Int], list.empty[Int])
  |                               ^^^^

5 error(s) found
Compile error for /tmp/dojo-partition-list-2.almd:
compile failed
FAILED: /tmp/dojo-partition-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  list.partition(xs, predicate)

fn list_partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  list.fold(xs, (list.empty[Int], list.empty[Int]), (acc, x) => 
    if predicate(x) then (x::acc.0, acc.1) else (acc.0, x::acc.1)
  )

fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  list_partition(xs, predicate)
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-3.almd
error: Expected ')' to close parenthesized expression opened at line 6:26
  --> /tmp/dojo-partition-list-3.almd:6:28
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
6 |     if predicate(x) then (x::acc.0, acc.1) else (acc.0, x::acc.1)
  |                          --------------- '(' opened here
  |
6 |     if predicate(x) then (x::acc.0, acc.1) else (acc.0, x::acc.1)
  |                            ^
error[E012]: duplicate function 'partition'
  at line 9
  in fn partition
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
  |
1 | fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) =
  | ------------------------------------ first definition of 'partition' here
...
9 | fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) =
  | ^^^^^^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-partition-list-3.almd:
compile failed
FAILED: /tmp/dojo-partition-list-3.almd

1/1 test file(s) failed

```
