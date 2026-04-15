# zip-with

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match xs {
    | [] => []
    | x :: xs_tail => match ys {
      | [] => []
      | y :: ys_tail => f(x, y) :: zip_with(xs_tail, ys_tail, f)
    }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-zip-with-0.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | [] => []
  |     ^

1 error(s) found
Compile error for /tmp/dojo-zip-with-0.almd:
compile failed
FAILED: /tmp/dojo-zip-with-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match xs {
    | [] => []
    | x :: xs_tail => match ys {
      | [] => []
      | y :: ys_tail => f(x, y) :: zip_with(xs_tail, ys_tail, f)
    }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-1.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-zip-with-1.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | [] => []
  |     ^

1 error(s) found
Compile error for /tmp/dojo-zip-with-1.almd:
compile failed
FAILED: /tmp/dojo-zip-with-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match xs {
    | [] => []
    | x :: xs_tail => match ys {
      | [] => []
      | y :: ys_tail => f(x, y) :: zip_with(xs_tail, ys_tail, f)
    }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-2.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-zip-with-2.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | [] => []
  |     ^

1 error(s) found
Compile error for /tmp/dojo-zip-with-2.almd:
compile failed
FAILED: /tmp/dojo-zip-with-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match xs {
    | [] => []
    | x :: xs_tail => match ys {
      | [] => []
      | y :: ys_tail => f(x, y) :: zip_with(xs_tail, ys_tail, f)
    }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-3.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-zip-with-3.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | [] => []
  |     ^

1 error(s) found
Compile error for /tmp/dojo-zip-with-3.almd:
compile failed
FAILED: /tmp/dojo-zip-with-3.almd

1/1 test file(s) failed

```
