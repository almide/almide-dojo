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
  match list.partition(xs, predicate) {
    some(x) => (x, list.filter(list.drop(xs, list.len(x)), predicate => !predicate)),
    none => (list.empty[Int], list.empty[Int])
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-0.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-partition-list-0.almd:3:70
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
3 |     some(x) => (x, list.filter(list.drop(xs, list.len(x)), predicate => !predicate)),
  |                                                                      ^^

1 error(s) found
Compile error for /tmp/dojo-partition-list-0.almd:
compile failed
FAILED: /tmp/dojo-partition-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  match list.partition(xs, predicate) {
    some(x) => (x, list.filter(list.drop(xs, list.len(x)), (p) => !p)),
    none => (list.empty[Int], list.empty[Int])
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-1.almd
error: '!' is not valid in Almide at line 3:67
  --> /tmp/dojo-partition-list-1.almd:3:67
  hint: Use 'not' for boolean negation. Write: not x
  |
3 |     some(x) => (x, list.filter(list.drop(xs, list.len(x)), (p) => !p)),
  |                                                                   ^

1 error(s) found
Compile error for /tmp/dojo-partition-list-1.almd:
compile failed
FAILED: /tmp/dojo-partition-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = 
  match list.partition(xs, predicate) {
    some(x) => (x, list.filter(list.drop(xs, list.len(x)), (p) => not predicate(p))),
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
    some(x) => (x, list.filter(list.drop(xs, list.len(x)), predicate)),
    none => (list.empty[Int], list.empty[Int])
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-3.almd
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

3 error(s) found
Compile error for /tmp/dojo-partition-list-3.almd:
compile failed
FAILED: /tmp/dojo-partition-list-3.almd

1/1 test file(s) failed

```
