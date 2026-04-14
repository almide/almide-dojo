# partition-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1

## Attempts

### Attempt 1 (FAIL)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = {
  let (matching, non_matching) = list.fold(xs, ([], []), (acc, x) => {
    if predicate(x) then (acc._1 + [x], acc._2)
    else (acc._1, acc._2 + [x])
  })
  (matching, non_matching)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-0.almd
Compile error for /tmp/dojo-partition-list-0.almd:
error: could not compile `almide-out` (bin "almide-out" test) due to 4 previous errors; 1 warning emitted

FAILED: /tmp/dojo-partition-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn partition(xs: List[Int], predicate: (Int) -> Bool) -> (List[Int], List[Int]) = {
  let (matching, non_matching) = list.fold(xs, ([], []), (acc, x) => {
    let (matching, non_matching) = acc
    if predicate(x) then (matching + [x], non_matching)
    else (matching, non_matching + [x])
  })
  (matching, non_matching)
}
```
