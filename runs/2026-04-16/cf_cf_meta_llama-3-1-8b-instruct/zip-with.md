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
    (xs, ys) when list.is_empty(xs) || list.is_empty(ys) => list.empty[Int]
    (xs, ys) => list.zip(xs, ys).map((x, y) => f(x, y))
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
error: Expected FatArrow at line 3:14 (got Ident 'when')
  --> /tmp/dojo-zip-with-0.almd:3:14
  |
3 |     (xs, ys) when list.is_empty(xs) || list.is_empty(ys) => list.empty[Int]
  |              ^

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
    (xs, ys) when list.is_empty(xs) || list.is_empty(ys) => list.empty[Int]
    (xs, ys) => list.zip(xs, ys).map((x, y) => f(x, y))
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-1.almd
error: Expected FatArrow at line 3:14 (got Ident 'when')
  --> /tmp/dojo-zip-with-1.almd:3:14
  |
3 |     (xs, ys) when list.is_empty(xs) || list.is_empty(ys) => list.empty[Int]
  |              ^

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
    (xs, ys) when list.is_empty(xs) || list.is_empty(ys) => list.empty[Int]
    (xs, ys) => list.zip(xs, ys).map((x, y) => f(x, y))
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-2.almd
error: Expected FatArrow at line 3:14 (got Ident 'when')
  --> /tmp/dojo-zip-with-2.almd:3:14
  |
3 |     (xs, ys) when list.is_empty(xs) || list.is_empty(ys) => list.empty[Int]
  |              ^

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
    (xs, ys) when list.is_empty(xs) || list.is_empty(ys) => list.empty[Int]
    (xs, ys) => list.zip(xs, ys).map((x, y) => f(x, y))
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-3.almd
error: Expected FatArrow at line 3:14 (got Ident 'when')
  --> /tmp/dojo-zip-with-3.almd:3:14
  |
3 |     (xs, ys) when list.is_empty(xs) || list.is_empty(ys) => list.empty[Int]
  |              ^

1 error(s) found
Compile error for /tmp/dojo-zip-with-3.almd:
compile failed
FAILED: /tmp/dojo-zip-with-3.almd

1/1 test file(s) failed

```
