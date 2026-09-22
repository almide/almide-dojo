# zip-with

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
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
error[E005]: argument 'f' expects fn((Int, Int)) -> B but got fn((Int, Int), Int) -> Int
  --> /tmp/dojo-zip-with-0.almd:2:30
  in call to list.map()
  here: list.map(list.zip(xs, ys), (x, y) => f(x, y))
  hint: Fix the argument type
...
2 |   list.map(list.zip(xs, ys), (x, y) => f(x, y))
  |                              ^
error[E001]: type mismatch in call to f(): expected Int but got (Int, Int)
  --> /tmp/dojo-zip-with-0.almd:2:40
  in call to f()
  here: list.map(list.zip(xs, ys), (x, y) => f(x, y))
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(list.zip(xs, ys), (x, y) => f(x, y))
  |                                        ^

2 error(s) found
FAILED: /tmp/dojo-zip-with-0.almd
Compile error for /tmp/dojo-zip-with-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  list.map(list.zip(xs, ys), (pair) => f(pair.0, pair.1))
```
