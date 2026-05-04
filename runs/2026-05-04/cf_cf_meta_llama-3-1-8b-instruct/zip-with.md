# zip-with

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match (xs, ys) {
    (xs, ys) => match (list.zip(xs, ys)) {
      (pairs) => list.map(pairs, (pair) => f(pair.first, pair.second))
    }
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
Compile error for /tmp/dojo-zip-with-0.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0609]: no field `first` on type `(i64, i64)`
   --> <generated.rs>:255:50
    |
255 |                 move |pair| __cap_2.clone()(pair.first, pair.second)
    |                                                  ^^^^^ unknown field
    |
    = note: available fields are: `0`, `1`


error[E0609]: no field `second` on type `(i64, i64)`
   --> <generated.rs>:255:62
    |
255 |                 move |pair| __cap_2.clone()(pair.first, pair.second)
    |                                                              ^^^^^^ unknown field
    |
    = note: available fields are: `0`, `1`


error: could not compile `almide-generated` (bin "almide-generated" test) due to 2 previous errors; 2 warnings emitted

FAILED: /tmp/dojo-zip-with-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match (xs, ys) {
    (xs, ys) => match (list.zip(xs, ys)) {
      (pairs) => list.map(pairs, (pair) => f(pair.0, pair.1))
    }
  }
}
```
