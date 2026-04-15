# partition-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) =
  (list.partition(xs, predicate), list.partition(xs, (x) => not predicate(x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-0.almd
error[E001]: type mismatch in fn 'partition': expected (List[Int], List[Int]) but got ((List[Int], List[Int]), (List[Int], List[Int]))
  --> /tmp/dojo-partition-list-0.almd:2:65
  in fn 'partition'
  hint: Fix the expression type or change the expected type
  |
2 |   (list.partition(xs, predicate), list.partition(xs, (x) => not predicate(x)))
  |                                                                 ^^^^^^^^^

1 error(s) found
Compile error for /tmp/dojo-partition-list-0.almd:
compile failed
FAILED: /tmp/dojo-partition-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) =
  (list.filter(xs, predicate), list.filter(xs, (x) => not predicate(x)))
```
