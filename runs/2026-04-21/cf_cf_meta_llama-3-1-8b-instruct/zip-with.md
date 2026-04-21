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
    (nil, _) => nil
    (_, nil) => nil
    (list_cons(x, xs_tail), list_cons(y, ys_tail)) =>
      list_cons(f(x, y), zip_with(xs_tail, ys_tail, f))
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
error: 'nil' does not exist in Almide at line 3:17
  --> /tmp/dojo-zip-with-0.almd:3:17
  hint: Almide has no null. Use Option[T] with 'some(v)' / 'none'.
  |
3 |     (nil, _) => nil
  |                 ^

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
    (none, _) => none
    (_, none) => none
    (list_cons(x, xs_tail), list_cons(y, ys_tail)) =>
      list_cons(f(x, y), zip_with(xs_tail, ys_tail, f))
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-1.almd
error: Expected RParen at line 5:15 (got LParen '(')
  --> /tmp/dojo-zip-with-1.almd:5:15
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
  |
5 |     (list_cons(x, xs_tail), list_cons(y, ys_tail)) =>
  |               ^

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
    (none, _) => none
    (_, none) => none
    (list_cons(x, xs_tail), list_cons(y, ys_tail)) =>
      list_cons(f(x, y), zip_with(xs_tail, ys_tail, f))
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-2.almd
error: Expected RParen at line 5:15 (got LParen '(')
  --> /tmp/dojo-zip-with-2.almd:5:15
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
  |
5 |     (list_cons(x, xs_tail), list_cons(y, ys_tail)) =>
  |               ^

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
    (none, _) => none
    (_, none) => none
    (list_cons(x, xs_tail), list_cons(y, ys_tail)) =>
      list_cons(f(x, y), zip_with(xs_tail, ys_tail, f))
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-3.almd
error: Expected RParen at line 5:15 (got LParen '(')
  --> /tmp/dojo-zip-with-3.almd:5:15
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
  |
5 |     (list_cons(x, xs_tail), list_cons(y, ys_tail)) =>
  |               ^

1 error(s) found
Compile error for /tmp/dojo-zip-with-3.almd:
compile failed
FAILED: /tmp/dojo-zip-with-3.almd

1/1 test file(s) failed

```
