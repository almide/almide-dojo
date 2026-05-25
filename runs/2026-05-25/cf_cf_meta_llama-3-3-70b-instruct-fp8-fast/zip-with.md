# zip-with

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  list.map(list.zip(xs, ys), (x, y) => f(x, y))
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
error[E005]: argument 'f' expects fn((Int, Int)) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-zip-with-0.almd:2:40
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(list.zip(xs, ys), (x, y) => f(x, y))
  |                                        ^
error[E001]: type mismatch in call to list.map(): expected fn((Int, Int)) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-zip-with-0.almd:2:40
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(list.zip(xs, ys), (x, y) => f(x, y))
  |                                        ^

2 error(s) found
Compile error for /tmp/dojo-zip-with-0.almd:
compile failed
FAILED: /tmp/dojo-zip-with-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  list.map(list.zip(xs, ys), (pair) => f(pair._1, pair._2))
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-1.almd
Compile error for /tmp/dojo-zip-with-1.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0609]: no field `_1` on type `(i64, i64)`
   --> <generated.rs>:253:42
    |
253 |         move |pair| __cap_2.clone()(pair._1, pair._2)
    |                                          ^^ unknown field
    |
help: a field with a similar name exists
    |
253 -         move |pair| __cap_2.clone()(pair._1, pair._2)
253 +         move |pair| __cap_2.clone()(pair.1, pair._2)
    |


error[E0609]: no field `_2` on type `(i64, i64)`
   --> <generated.rs>:253:51
    |
253 |         move |pair| __cap_2.clone()(pair._1, pair._2)
    |                                                   ^^ unknown field
    |
    = note: available fields are: `0`, `1`


error: could not compile `almide-generated` (bin "almide-generated" test) due to 2 previous errors; 2 warnings emitted

FAILED: /tmp/dojo-zip-with-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  list.map(list.zip(xs, ys), (pair) => f(pair.0, pair.1))
```
