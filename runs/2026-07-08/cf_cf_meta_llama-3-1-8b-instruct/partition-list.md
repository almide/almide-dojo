# partition-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E010`

## Attempts

### Attempt 1 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  match list.partition(xs, (x) => predicate(x)) {
    some((matching, non_matching)) => (matching, non_matching),
    none => (list.new[Int](), list.new[Int]())
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-0.almd
error[E010]: non-exhaustive match: missing (_, _)
  --> /tmp/dojo-partition-list-0.almd:2:35
  in match
  hint: Add arms for (_, _), or use '_'
  |
2 |   match list.partition(xs, (x) => predicate(x)) {
  |                                   ^^^^^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-partition-list-0.almd:4:22
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
4 |     none => (list.new[Int](), list.new[Int]())
  |                      ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-partition-list-0.almd:4:39
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
4 |     none => (list.new[Int](), list.new[Int]())
  |                                       ^

3 error(s) found
Compile error for /tmp/dojo-partition-list-0.almd:
compile failed
FAILED: /tmp/dojo-partition-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  match list.partition(xs, (x) => predicate(x)) {
    some((matching, non_matching)) => (matching, non_matching),
    none => (list.new[Int](), list.new[Int]())
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-1.almd
error[E010]: non-exhaustive match: missing (_, _)
  --> /tmp/dojo-partition-list-1.almd:2:35
  in match
  hint: Add arms for (_, _), or use '_'
  |
2 |   match list.partition(xs, (x) => predicate(x)) {
  |                                   ^^^^^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-partition-list-1.almd:4:22
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
4 |     none => (list.new[Int](), list.new[Int]())
  |                      ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-partition-list-1.almd:4:39
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
4 |     none => (list.new[Int](), list.new[Int]())
  |                                       ^

3 error(s) found
Compile error for /tmp/dojo-partition-list-1.almd:
compile failed
FAILED: /tmp/dojo-partition-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  match list.partition(xs, (x) => predicate(x)) {
    some((matching, non_matching)) => (matching, non_matching),
    none => ([], [])
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-2.almd
error[E010]: non-exhaustive match: missing (_, _)
  --> /tmp/dojo-partition-list-2.almd:2:35
  in match
  hint: Add arms for (_, _), or use '_'
  |
2 |   match list.partition(xs, (x) => predicate(x)) {
  |                                   ^^^^^^^^^

1 error(s) found
Compile error for /tmp/dojo-partition-list-2.almd:
compile failed
FAILED: /tmp/dojo-partition-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  match list.partition(xs, (x) => predicate(x)) {
    some((matching, non_matching)) => (matching, non_matching),
    none => (list.empty[Int], list.empty[Int])
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-3.almd
error[E010]: non-exhaustive match: missing (_, _)
  --> /tmp/dojo-partition-list-3.almd:2:35
  in match
  hint: Add arms for (_, _), or use '_'
  |
2 |   match list.partition(xs, (x) => predicate(x)) {
  |                                   ^^^^^^^^^
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

3 error(s) found
Compile error for /tmp/dojo-partition-list-3.almd:
compile failed
FAILED: /tmp/dojo-partition-list-3.almd

1/1 test file(s) failed

```
