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
    (xs, ys) if xs.is_empty() or ys.is_empty() => []
    (x :: xs, y :: ys) => f(x, y) :: zip_with(xs, ys, f)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
error: Expected RParen at line 4:8 (got Colon ':')
  --> /tmp/dojo-zip-with-0.almd:4:8
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
  |
4 |     (x :: xs, y :: ys) => f(x, y) :: zip_with(xs, ys, f)
  |        ^

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
    (xs, ys) if xs.is_empty() or ys.is_empty() => []
    (x :: xs, y :: ys) => f(x, y) :: zip_with(xs, ys, f)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-1.almd
error: Expected RParen at line 4:8 (got Colon ':')
  --> /tmp/dojo-zip-with-1.almd:4:8
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
  |
4 |     (x :: xs, y :: ys) => f(x, y) :: zip_with(xs, ys, f)
  |        ^

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
    (xs, ys) if xs.is_empty() or ys.is_empty() => []
    (x :: xs, y :: ys) => f(x, y) :: zip_with(xs, ys, f)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-2.almd
error: Expected RParen at line 4:8 (got Colon ':')
  --> /tmp/dojo-zip-with-2.almd:4:8
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
  |
4 |     (x :: xs, y :: ys) => f(x, y) :: zip_with(xs, ys, f)
  |        ^

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
    (xs, ys) if xs.is_empty() or ys.is_empty() => []
    (x :: xs, y :: ys) => f(x, y) :: zip_with(xs, ys, f)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-3.almd
error: Expected RParen at line 4:8 (got Colon ':')
  --> /tmp/dojo-zip-with-3.almd:4:8
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
  |
4 |     (x :: xs, y :: ys) => f(x, y) :: zip_with(xs, ys, f)
  |        ^

1 error(s) found
Compile error for /tmp/dojo-zip-with-3.almd:
compile failed
FAILED: /tmp/dojo-zip-with-3.almd

1/1 test file(s) failed

```
