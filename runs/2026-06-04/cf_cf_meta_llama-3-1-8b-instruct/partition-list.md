# partition-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) {
  let (matching, non_matching) = list.partition(xs, predicate)
  (matching, non_matching)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-0.almd
error: Missing '=' before function body at line 1:81
  --> /tmp/dojo-partition-list-0.almd:1:81
  hint: Almide requires '=' before the body. Write: fn partition(...) -> Type = { ... }
  |
1 | fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) {
  |                                                                                 ^

1 error(s) found
Compile error for /tmp/dojo-partition-list-0.almd:
compile failed
FAILED: /tmp/dojo-partition-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = {
  let (matching, non_matching) = list.partition(xs, predicate)
  (matching, non_matching)
}
```
