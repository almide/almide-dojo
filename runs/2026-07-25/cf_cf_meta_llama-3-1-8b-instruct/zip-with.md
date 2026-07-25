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
  match (xs, ys) {
    (some(xs), some(ys)) => 
      list.map(list.zip(xs, ys), (pair) => f(pair.first, pair.second)),
    (none, none) => list.nil(),
    (some(_), none) => list.nil(),
    (none, some(_)) => list.nil()
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-0.almd
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-0.almd:5:29
  in call to list.nil()
  hint: Did you mean `list.all`?
  try:
      // list.nil(...)  →  list.all(...)
      list.all(...)
  |
5 |     (none, none) => list.nil(),
  |                             ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-0.almd:6:32
  in call to list.nil()
  hint: Did you mean `list.all`?
  try:
      // list.nil(...)  →  list.all(...)
      list.all(...)
  |
6 |     (some(_), none) => list.nil(),
  |                                ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-0.almd:7:32
  in call to list.nil()
  hint: Did you mean `list.all`?
  try:
      // list.nil(...)  →  list.all(...)
      list.all(...)
  |
7 |     (none, some(_)) => list.nil()
  |                                ^

3 error(s) found
Compile error for /tmp/dojo-zip-with-0.almd:
compile failed
FAILED: /tmp/dojo-zip-with-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match (xs, ys) {
    (some(xs), some(ys)) => 
      list.map(list.zip(xs, ys), (pair) => f(pair.first, pair.second)),
    (none, none) => list.nil(),
    (some(_), none) => list.nil(),
    (none, some(_)) => list.nil()
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-1.almd
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-1.almd:5:29
  in call to list.nil()
  hint: Did you mean `list.all`?
  try:
      // list.nil(...)  →  list.all(...)
      list.all(...)
  |
5 |     (none, none) => list.nil(),
  |                             ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-1.almd:6:32
  in call to list.nil()
  hint: Did you mean `list.all`?
  try:
      // list.nil(...)  →  list.all(...)
      list.all(...)
  |
6 |     (some(_), none) => list.nil(),
  |                                ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-1.almd:7:32
  in call to list.nil()
  hint: Did you mean `list.all`?
  try:
      // list.nil(...)  →  list.all(...)
      list.all(...)
  |
7 |     (none, some(_)) => list.nil()
  |                                ^

3 error(s) found
Compile error for /tmp/dojo-zip-with-1.almd:
compile failed
FAILED: /tmp/dojo-zip-with-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match (xs, ys) {
    (some(xs), some(ys)) => 
      list.map(list.zip(xs, ys), (pair) => f(pair.first, pair.second)),
    (none, none) => list.nil(),
    (some(_), none) => list.nil(),
    (none, some(_)) => list.nil()
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-2.almd
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:5:29
  in call to list.nil()
  hint: Did you mean `list.all`?
  try:
      // list.nil(...)  →  list.all(...)
      list.all(...)
  |
5 |     (none, none) => list.nil(),
  |                             ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:6:32
  in call to list.nil()
  hint: Did you mean `list.all`?
  try:
      // list.nil(...)  →  list.all(...)
      list.all(...)
  |
6 |     (some(_), none) => list.nil(),
  |                                ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-2.almd:7:32
  in call to list.nil()
  hint: Did you mean `list.all`?
  try:
      // list.nil(...)  →  list.all(...)
      list.all(...)
  |
7 |     (none, some(_)) => list.nil()
  |                                ^

3 error(s) found
Compile error for /tmp/dojo-zip-with-2.almd:
compile failed
FAILED: /tmp/dojo-zip-with-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn zip_with(xs: List[Int], ys: List[Int], f: (Int, Int) -> Int) -> List[Int] = 
  match (xs, ys) {
    (some(xs), some(ys)) => 
      list.map(list.zip(xs, ys), (pair) => f(pair.first, pair.second)),
    (none, none) => list.nil(),
    (some(_), none) => list.nil(),
    (none, some(_)) => list.nil()
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-zip-with-3.almd
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-3.almd:5:29
  in call to list.nil()
  hint: Did you mean `list.all`?
  try:
      // list.nil(...)  →  list.all(...)
      list.all(...)
  |
5 |     (none, none) => list.nil(),
  |                             ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-3.almd:6:32
  in call to list.nil()
  hint: Did you mean `list.all`?
  try:
      // list.nil(...)  →  list.all(...)
      list.all(...)
  |
6 |     (some(_), none) => list.nil(),
  |                                ^
error[E002]: undefined function 'list.nil'
  --> /tmp/dojo-zip-with-3.almd:7:32
  in call to list.nil()
  hint: Did you mean `list.all`?
  try:
      // list.nil(...)  →  list.all(...)
      list.all(...)
  |
7 |     (none, some(_)) => list.nil()
  |                                ^

3 error(s) found
Compile error for /tmp/dojo-zip-with-3.almd:
compile failed
FAILED: /tmp/dojo-zip-with-3.almd

1/1 test file(s) failed

```
