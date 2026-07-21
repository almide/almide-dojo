# zip-with

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] {
  list.map(list.zip(xs, ys), (pair) => f(pair.0, pair.1))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
error: Missing '=' before function body at line 1:78
  --> /tmp/dojo-zip-with-0.almd:1:78
  hint: Almide requires '=' before the body. Write: fn zip_with(...) -> Type = { ... }
  |
1 | fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] {
  |                                                                              ^

1 error(s) found
Compile error for /tmp/dojo-zip-with-0.almd:
compile failed
FAILED: /tmp/dojo-zip-with-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  list.map(list.zip(xs, ys), (pair) => f(pair.0, pair.1))
```
