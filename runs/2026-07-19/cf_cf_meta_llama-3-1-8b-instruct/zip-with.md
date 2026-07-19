# zip-with

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match (list.zip(xs, ys)) {
    some(zipped) => list.map(zipped, (pair) => f(pair.first, pair.second)),
    none => list.empty[Int]
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
error[E003]: undefined variable 'list'
  --> /tmp/dojo-zip-with-0.almd:4:13
  in variable list
  hint: Check the variable name
  |
4 |     none => list.empty[Int]
  |             ^^^^

1 error(s) found
Compile error for /tmp/dojo-zip-with-0.almd:
compile failed
FAILED: /tmp/dojo-zip-with-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match (list.zip(xs, ys)) {
    some(zipped) => list.map(zipped, (pair) => f(pair.first, pair.second)),
    none => list.empty[Int]
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-1.almd
error[E003]: undefined variable 'list'
  --> /tmp/dojo-zip-with-1.almd:4:13
  in variable list
  hint: Check the variable name
  |
4 |     none => list.empty[Int]
  |             ^^^^

1 error(s) found
Compile error for /tmp/dojo-zip-with-1.almd:
compile failed
FAILED: /tmp/dojo-zip-with-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match (list.zip(xs, ys)) {
    some(zipped) => list.map(zipped, (pair) => f(pair.first, pair.second)),
    none => list.empty[Int]
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-2.almd
error[E003]: undefined variable 'list'
  --> /tmp/dojo-zip-with-2.almd:4:13
  in variable list
  hint: Check the variable name
  |
4 |     none => list.empty[Int]
  |             ^^^^

1 error(s) found
Compile error for /tmp/dojo-zip-with-2.almd:
compile failed
FAILED: /tmp/dojo-zip-with-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match (list.zip(xs, ys)) {
    some(zipped) => list.map(zipped, (pair) => f(pair.first, pair.second)),
    none => list.empty[Int]
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-3.almd
error[E003]: undefined variable 'list'
  --> /tmp/dojo-zip-with-3.almd:4:13
  in variable list
  hint: Check the variable name
  |
4 |     none => list.empty[Int]
  |             ^^^^

1 error(s) found
Compile error for /tmp/dojo-zip-with-3.almd:
compile failed
FAILED: /tmp/dojo-zip-with-3.almd

1/1 test file(s) failed

```
