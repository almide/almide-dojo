# zip-with

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
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

### Attempt 2 (PASS)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  list.map(list.zip(xs, ys), (p) => f(p.0, p.1))
```
