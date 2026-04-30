# zip-with

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match (xs, ys) {
    (xs_list, ys_list) =>
      match (list.zip(xs_list, ys_list)) {
        (pair_list) =>
          match (pair_list) {
            (pair_list) =>
              list.map(pair_list, (pair) => match (pair) {
                (some((x, y))) => f(x, y)
                (none) => None
              })
          }
      }
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
error[E001]: type mismatch in match arm: expected Int but got Option[?1]
  --> /tmp/dojo-zip-with-0.almd:10:27
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
10 |                 (none) => None
   |                           ^^^^

1 error(s) found
Compile error for /tmp/dojo-zip-with-0.almd:
compile failed
FAILED: /tmp/dojo-zip-with-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match (xs, ys) {
    (xs_list, ys_list) =>
      match (list.zip(xs_list, ys_list)) {
        (pair_list) =>
          list.map(pair_list, (pair) => match (pair) {
            (some((x, y))) => f(x, y)
            (none) => None
          })
      }
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-1.almd
error[E001]: type mismatch in match arm: expected Int but got Option[?1]
  --> /tmp/dojo-zip-with-1.almd:8:23
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
8 |             (none) => None
  |                       ^^^^

1 error(s) found
Compile error for /tmp/dojo-zip-with-1.almd:
compile failed
FAILED: /tmp/dojo-zip-with-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match (xs, ys) {
    (xs_list, ys_list) =>
      match (list.zip(xs_list, ys_list)) {
        (pair_list) =>
          list.map(pair_list, (pair) => match (pair) {
            (some((x, y))) => f(x, y)
            (none) => None
          })
      }
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-2.almd
error[E001]: type mismatch in match arm: expected Int but got Option[?1]
  --> /tmp/dojo-zip-with-2.almd:8:23
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
8 |             (none) => None
  |                       ^^^^

1 error(s) found
Compile error for /tmp/dojo-zip-with-2.almd:
compile failed
FAILED: /tmp/dojo-zip-with-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = {
  match (xs, ys) {
    (xs_list, ys_list) =>
      match (list.zip(xs_list, ys_list)) {
        (pair_list) =>
          list.map(pair_list, (pair) => match (pair) {
            (some((x, y))) => f(x, y)
            (none) => None
          })
      }
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-3.almd
error[E001]: type mismatch in match arm: expected Int but got Option[?1]
  --> /tmp/dojo-zip-with-3.almd:8:23
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
8 |             (none) => None
  |                       ^^^^

1 error(s) found
Compile error for /tmp/dojo-zip-with-3.almd:
compile failed
FAILED: /tmp/dojo-zip-with-3.almd

1/1 test file(s) failed

```
