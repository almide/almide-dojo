# zip-with

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.first, pair.second)),
    none => list.empty[Int]
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
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.first, pair.second)),
    none => list.empty[Int]
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
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match map.zip(xs, ys) {
    some(pairs) => map.map(pairs, (pair) => f(pair.first, pair.second)),
    none => list.empty[Int]
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-2.almd
error[E002]: undefined function 'map.zip'
  --> /tmp/dojo-zip-with-2.almd:2:21
  in call to map.zip()
  hint: Did you mean `map.map`?
  try:
      // map.zip(...)  →  map.map(...)
      map.map(...)
  |
2 |   match map.zip(xs, ys) {
  |                     ^^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-zip-with-2.almd:4:13
  in variable list
  hint: Check the variable name
  |
4 |     none => list.empty[Int]
  |             ^^^^
error[E001]: type mismatch in fn 'zip_with': expected List[Int] but got Map[?1, Int]
  --> /tmp/dojo-zip-with-2.almd:4:24
  in fn 'zip_with'
  hint: Fix the expression type or change the expected type
  |
4 |     none => list.empty[Int]
  |                        ^^^

3 error(s) found
Compile error for /tmp/dojo-zip-with-2.almd:
compile failed
FAILED: /tmp/dojo-zip-with-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] =
  match list.zip(xs, ys) {
    some(pairs) => list.map(pairs, (pair) => f(pair.first, pair.second)),
    none => list.empty[Int]
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
