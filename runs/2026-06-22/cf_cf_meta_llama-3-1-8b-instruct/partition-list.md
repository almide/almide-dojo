# partition-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E012`

## Attempts

### Attempt 1 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  match list.partition(xs, predicate) {
    some((matching, non_matching)) => (matching, non_matching)
    none => (list.empty[Int], list.empty[Int])
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
error[E003]: undefined variable 'list'
  --> /tmp/dojo-partition-list-0.almd:4:14
  in variable list
  hint: Check the variable name
  |
4 |     none => (list.empty[Int], list.empty[Int])
  |              ^^^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-partition-list-0.almd:4:31
  in variable list
  hint: Check the variable name
  |
4 |     none => (list.empty[Int], list.empty[Int])
  |                               ^^^^

3 error(s) found
Compile error for /tmp/dojo-partition-list-0.almd:
compile failed
FAILED: /tmp/dojo-partition-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  match list.partition(xs, predicate) {
    some((matching, non_matching)) => (matching, non_matching)
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
    some((matching, non_matching)) => (matching, non_matching)
    none => (list.empty[Int], list.empty[Int])
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-2.almd
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

3 error(s) found
Compile error for /tmp/dojo-partition-list-2.almd:
compile failed
FAILED: /tmp/dojo-partition-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  match list.partition(xs, predicate) {
    some((matching, non_matching)) => (matching, non_matching)
    none => (list.empty[Int], list.empty[Int])
  }

fn list_partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  match list.partition(xs, predicate) {
    some((matching, non_matching)) => (matching, non_matching)
    none => (list.empty[Int], list.empty[Int])
  }

fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  list_partition(xs, predicate)
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-3.almd
error[E012]: duplicate function 'partition'
  at line 13
  in fn partition
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) =
   | ------------------------------------ first definition of 'partition' here
...
13 | fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) =
   | ^^^^^^^^^^^^
error[E010]: non-exhaustive match: missing (_, _)
  --> /tmp/dojo-partition-list-3.almd:2:28
  in match
  hint: Add arms for (_, _), or use '_'
  |
2 |   match list.partition(xs, predicate) {
  |                            ^^^^^^^^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-partition-list-3.almd:4:14
  in variable list
  hint: Check the variable name
  |
4 |     none => (list.empty[Int], list.empty[Int])
  |              ^^^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-partition-list-3.almd:4:31
  in variable list
  hint: Check the variable name
  |
4 |     none => (list.empty[Int], list.empty[Int])
  |                               ^^^^
error[E010]: non-exhaustive match: missing (_, _)
  --> /tmp/dojo-partition-list-3.almd:8:28
  in match
  hint: Add arms for (_, _), or use '_'
  |
8 |   match list.partition(xs, predicate) {
  |                            ^^^^^^^^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-partition-list-3.almd:10:14
  in variable list
  hint: Check the variable name
   |
10 |     none => (list.empty[Int], list.empty[Int])
   |              ^^^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-partition-list-3.almd:10:31
  in variable list
  hint: Check the variable name
   |
10 |     none => (list.empty[Int], list.empty[Int])
   |                               ^^^^

7 error(s) found
Compile error for /tmp/dojo-partition-list-3.almd:
compile failed
FAILED: /tmp/dojo-partition-list-3.almd

1/1 test file(s) failed

```
