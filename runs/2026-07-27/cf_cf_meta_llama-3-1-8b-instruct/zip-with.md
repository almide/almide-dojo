# zip-with

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match (xs, ys) {
    (some(x), some(y)) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    (none, _) | (_, none) => list.nil()
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
error: Expected pattern at line 3:34 (got Colon ':')
  --> /tmp/dojo-zip-with-0.almd:3:34
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     (some(x), some(y)) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  |                                  ^

1 error(s) found
Compile error for /tmp/dojo-zip-with-0.almd:
compile failed
FAILED: /tmp/dojo-zip-with-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match (xs, ys) {
    (some(x), some(y)) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    (_, none) | (none, _) => list.nil()
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-1.almd
error: Expected pattern at line 3:34 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:3:34
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     (some(x), some(y)) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  |                                  ^

1 error(s) found
Compile error for /tmp/dojo-zip-with-1.almd:
compile failed
FAILED: /tmp/dojo-zip-with-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match (xs, ys) {
    (some(x), some(y)) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    (none, _) | (_, none) => list.nil()
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-2.almd
error: Expected pattern at line 3:34 (got Colon ':')
  --> /tmp/dojo-zip-with-2.almd:3:34
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     (some(x), some(y)) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  |                                  ^

1 error(s) found
Compile error for /tmp/dojo-zip-with-2.almd:
compile failed
FAILED: /tmp/dojo-zip-with-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match (xs, ys) {
    (some(x), some(y)) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
    (_, none) | (none, _) => list.nil()
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-3.almd
error: Expected pattern at line 3:34 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:3:34
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     (some(x), some(y)) => (x, y) :: zip_with(list.drop(xs, 1), list.drop(ys, 1), f)
  |                                  ^

1 error(s) found
Compile error for /tmp/dojo-zip-with-3.almd:
compile failed
FAILED: /tmp/dojo-zip-with-3.almd

1/1 test file(s) failed

```
