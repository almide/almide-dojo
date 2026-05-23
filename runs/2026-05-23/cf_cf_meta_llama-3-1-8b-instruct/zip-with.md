# zip-with

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  list.zip(xs, ys)
  |> list.map(f)
  |> list.flatten
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
error[E005]: argument 'f' expects fn((Int, Int)) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-zip-with-0.almd:3:15
  in call to list.map()
  hint: Fix the argument type
  |
3 |   |> list.map(f)
  |               ^
error[E001]: type mismatch in call to list.map(): expected fn((Int, Int)) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-zip-with-0.almd:3:15
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |   |> list.map(f)
  |               ^

2 error(s) found
Compile error for /tmp/dojo-zip-with-0.almd:
compile failed
FAILED: /tmp/dojo-zip-with-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  list.zip(xs, ys)
  |> list.map((pair) => f(pair.first, pair.second))
  |> list.flatten
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-1.almd
error[E005]: argument 'xss' expects List[List[T]] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:3:25
  in call to list.flatten()
  hint: Fix the argument type
  |
3 |   |> list.map((pair) => f(pair.first, pair.second))
  |                         ^
error[E001]: type mismatch in call to list.flatten(): expected List[List[T]] but got List[Int]
  --> /tmp/dojo-zip-with-1.almd:3:25
  in call to list.flatten()
  hint: Fix the expression type or change the expected type
  |
3 |   |> list.map((pair) => f(pair.first, pair.second))
  |                         ^

2 error(s) found
Compile error for /tmp/dojo-zip-with-1.almd:
compile failed
FAILED: /tmp/dojo-zip-with-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  list.zip(xs, ys)
  |> list.map((pair) => f(pair.first, pair.second))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-2.almd
Compile error for /tmp/dojo-zip-with-2.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0609]: no field `first` on type `(i64, i64)`
   --> <generated.rs>:253:42
    |
253 |         move |pair| __cap_2.clone()(pair.first, pair.second)
    |                                          ^^^^^ unknown field
    |
    = note: available fields are: `0`, `1`


error[E0609]: no field `second` on type `(i64, i64)`
   --> <generated.rs>:253:54
    |
253 |         move |pair| __cap_2.clone()(pair.first, pair.second)
    |                                                      ^^^^^^ unknown field
    |
    = note: available fields are: `0`, `1`


error: could not compile `almide-generated` (bin "almide-generated" test) due to 2 previous errors; 2 warnings emitted

FAILED: /tmp/dojo-zip-with-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  list.zip(xs, ys)
  |> list.map((pair) => f(pair.0, pair.1))
}
```
