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
    some(xs) => (xs, list.drop(xs, xs.len())),
    none => ([], xs)
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
    some(xs) => (xs, list.drop(xs, xs.len())),
    none => ([], xs)
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
    some(xs) => (xs, list.drop(xs, xs.len())),
    none => (list.empty(), xs)
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
error[E002]: undefined function 'list.empty'
  --> /tmp/dojo-partition-list-2.almd:4:24
  in call to list.empty()
  hint: Did you mean `[] (empty list literal)`?
  |
4 |     none => (list.empty(), xs)
  |                        ^

2 error(s) found
Compile error for /tmp/dojo-partition-list-2.almd:
compile failed
FAILED: /tmp/dojo-partition-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) =
  match list.partition(xs, predicate) {
    some(matching) => (matching, list.drop(xs, matching.len())),
    none => ([], xs)
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

1 error(s) found
Compile error for /tmp/dojo-partition-list-3.almd:
compile failed
FAILED: /tmp/dojo-partition-list-3.almd

1/1 test file(s) failed

```
