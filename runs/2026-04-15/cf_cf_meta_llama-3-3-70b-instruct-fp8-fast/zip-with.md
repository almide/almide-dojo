# zip-with

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  list.map(list.zip(xs, ys), (pair) => f(pair._1, pair._2))
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
Compile error for /tmp/dojo-zip-with-0.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0609]: no field `_1` on type `(i64, i64)`
   --> <generated.rs>:247:42
    |
247 |         move |pair| __cap_2.clone()(pair._1, pair._2)
    |                                          ^^ unknown field
    |
help: a field with a similar name exists
    |
247 -         move |pair| __cap_2.clone()(pair._1, pair._2)
247 +         move |pair| __cap_2.clone()(pair.1, pair._2)
    |


error[E0609]: no field `_2` on type `(i64, i64)`
   --> <generated.rs>:247:51
    |
247 |         move |pair| __cap_2.clone()(pair._1, pair._2)
    |                                                   ^^ unknown field
    |
    = note: available fields are: `0`, `1`


error: could not compile `almide-generated` (bin "almide-generated" test) due to 2 previous errors; 2 warnings emitted

FAILED: /tmp/dojo-zip-with-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  list.map(list.zip(xs, ys), (pair) => f(pair.0, pair.1))
```
