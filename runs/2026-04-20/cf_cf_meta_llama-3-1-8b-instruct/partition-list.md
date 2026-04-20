# partition-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) =
  (list.filter(xs, predicate), list.filter(xs, (x) => !predicate(x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-0.almd
error: '!' is not valid in Almide at line 2:55
  --> /tmp/dojo-partition-list-0.almd:2:55
  hint: Use 'not' for boolean negation. Write: not x
  |
2 |   (list.filter(xs, predicate), list.filter(xs, (x) => !predicate(x)))
  |                                                       ^

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
