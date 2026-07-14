# zip-with

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  list.zip(xs, ys).map((a, b) => f(a, b))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
error[E005]: argument 'f' expects fn((Int, Int)) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-zip-with-0.almd:2:16
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.zip(xs, ys).map((a, b) => f(a, b))
  |                ^^
error[E001]: type mismatch in call to list.map(): expected fn((Int, Int)) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-zip-with-0.almd:2:16
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.zip(xs, ys).map((a, b) => f(a, b))
  |                ^^

2 error(s) found
Compile error for /tmp/dojo-zip-with-0.almd:
compile failed
FAILED: /tmp/dojo-zip-with-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  list.zip(xs, ys).map((a, b) => f(a, b)).take(list.len(xs))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-1.almd
error[E005]: argument 'f' expects fn((Int, Int)) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-zip-with-1.almd:2:16
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.zip(xs, ys).map((a, b) => f(a, b)).take(list.len(xs))
  |                ^^
error[E001]: type mismatch in call to list.map(): expected fn((Int, Int)) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-zip-with-1.almd:2:16
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.zip(xs, ys).map((a, b) => f(a, b)).take(list.len(xs))
  |                ^^

2 error(s) found
Compile error for /tmp/dojo-zip-with-1.almd:
compile failed
FAILED: /tmp/dojo-zip-with-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  list.zip(xs, ys).map((x) => f(x.0, x.1)).take(list.len(xs))
}
```
