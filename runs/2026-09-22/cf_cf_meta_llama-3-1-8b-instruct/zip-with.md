# zip-with

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match (list.first(xs), list.first(ys)) {
    (some(x), some(y)) => list.cons(f(x, y), list.zip_with(list.drop(xs, 1), list.drop(ys, 1), f))
    (_, _) => list.nil()
  }
```

**Diagnostic:**

```
error[E002]: undefined function 'list.cons'
  --> /tmp/dojo-zip-with-0.almd:3:96
  in call to list.cons()
  here: (some(x), some(y)) => list.cons(f(x, y), list.zip_with(list.drop(xs, 1), list.drop(ys, 1), f))
  hint: Did you mean `list.count`?
  try:
      list.count
  |
3 |     (some(x), some(y)) => list.cons(f(x, y), list.zip_with(list.drop(xs, 1), list.drop(ys, 1), f))
  |                                                                                                ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-0.almd:4:15
  in call to list.nil()
  here: (_, _) => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
  |
4 |     (_, _) => list.nil()
  |               ^^^^^^^^^^

2 error(s) found
FAILED: /tmp/dojo-zip-with-0.almd
Compile error for /tmp/dojo-zip-with-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match (list.first(xs), list.first(ys)) {
    (some(x), some(y)) => list.cons(f(x, y), list.zip_with(list.drop(xs, 1), list.drop(ys, 1), f))
    (none, _) | (_, none) => list.nil()
  }
```

**Diagnostic:**

```
error[E002]: undefined function 'list.cons'
  --> /tmp/dojo-zip-with-1.almd:3:96
  in call to list.cons()
  here: (some(x), some(y)) => list.cons(f(x, y), list.zip_with(list.drop(xs, 1), list.drop(ys, 1), f))
  hint: Did you mean `list.count`?
  try:
      list.count
  |
3 |     (some(x), some(y)) => list.cons(f(x, y), list.zip_with(list.drop(xs, 1), list.drop(ys, 1), f))
  |                                                                                                ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-1.almd:4:30
  in call to list.nil()
  here: (none, _) | (_, none) => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
  |
4 |     (none, _) | (_, none) => list.nil()
  |                              ^^^^^^^^^^

2 error(s) found
FAILED: /tmp/dojo-zip-with-1.almd
Compile error for /tmp/dojo-zip-with-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match (list.first(xs), list.first(ys)) {
    (some(x), some(y)) => list.cons(f(x, y), list.zip_with(list.drop(xs, 1), list.drop(ys, 1), f))
    (none, _) | (_, none) => list.nil()
  }
```

**Diagnostic:**

```
error[E002]: undefined function 'list.cons'
  --> /tmp/dojo-zip-with-2.almd:3:96
  in call to list.cons()
  here: (some(x), some(y)) => list.cons(f(x, y), list.zip_with(list.drop(xs, 1), list.drop(ys, 1), f))
  hint: Did you mean `list.count`?
  try:
      list.count
  |
3 |     (some(x), some(y)) => list.cons(f(x, y), list.zip_with(list.drop(xs, 1), list.drop(ys, 1), f))
  |                                                                                                ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:4:30
  in call to list.nil()
  here: (none, _) | (_, none) => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
  |
4 |     (none, _) | (_, none) => list.nil()
  |                              ^^^^^^^^^^

2 error(s) found
FAILED: /tmp/dojo-zip-with-2.almd
Compile error for /tmp/dojo-zip-with-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match (list.first(xs), list.first(ys)) {
    (some(x), some(y)) => list.cons(f(x, y), list.zip_with(list.drop(xs, 1), list.drop(ys, 1), f))
    (none, _) | (_, none) => list.nil()
  }
```

**Diagnostic:**

```
error[E002]: undefined function 'list.cons'
  --> /tmp/dojo-zip-with-3.almd:3:96
  in call to list.cons()
  here: (some(x), some(y)) => list.cons(f(x, y), list.zip_with(list.drop(xs, 1), list.drop(ys, 1), f))
  hint: Did you mean `list.count`?
  try:
      list.count
  |
3 |     (some(x), some(y)) => list.cons(f(x, y), list.zip_with(list.drop(xs, 1), list.drop(ys, 1), f))
  |                                                                                                ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-3.almd:4:30
  in call to list.nil()
  here: (none, _) | (_, none) => list.nil()
  hint: Did you mean `list.all`?
  try:
      list.all
  |
4 |     (none, _) | (_, none) => list.nil()
  |                              ^^^^^^^^^^

2 error(s) found
FAILED: /tmp/dojo-zip-with-3.almd
Compile error for /tmp/dojo-zip-with-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
