# list-sum

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn list_sum(xs: List[Int]) -> Int = 
  if xs == [] then 0 else xs.head + list_sum(xs.tail)
```

**Diagnostic:**

```
Compiling /tmp/dojo-list-sum-0.almd
Compile error for /tmp/dojo-list-sum-0.almd:
error[E0609]: no field `head` on type `&[i64]`
  --> src/main.rs:32:78
   |
32 |     if almide_eq!(xs.clone(), Vec::<i64>::new()) { 0i64 } else { (xs.clone().head + list_sum(&xs.tail)) }
   |                                                                              ^^^^ unknown field


error[E0609]: no field `tail` on type `&[i64]`
  --> src/main.rs:32:98
   |
32 |     if almide_eq!(xs.clone(), Vec::<i64>::new()) { 0i64 } else { (xs.clone().head + list_sum(&xs.tail)) }
   |                                                                                                  ^^^^ unknown field


error: could not compile `almide-out` (bin "almide-out" test) due to 2 previous errors; 1 warning emitted

FAILED: /tmp/dojo-list-sum-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn list_sum(xs: List[Int]) -> Int = 
  list.fold(xs, 0, (acc, x) => acc + x)
```
