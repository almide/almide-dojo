# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error[E002]: undefined function 'mat_add'
  --> /tmp/dojo-matrix-ops-0.almd:3:71
  in call to mat_add()
  hint: Check the function name
  |
3 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
  |                                                                       ^
error[E002]: undefined function 'mat_add'
  --> /tmp/dojo-matrix-ops-0.almd:4:49
  in call to mat_add()
  hint: Check the function name
  |
4 | test "mat_add 1x1" { assert_eq(mat_add([[1]], [[2]]), [[3]]) }
  |                                                 ^
error[E002]: undefined function 'mat_add'
  --> /tmp/dojo-matrix-ops-0.almd:5:73
  in call to mat_add()
  hint: Check the function name
  |
5 | test "mat_add zeros" { assert_eq(mat_add([[0, 0], [0, 0]], [[1, 2], [3, 4]]), [[1, 2], [3, 4]]) }
  |                                                                         ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-0.almd:6:71
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
  try:
      // mat_transpose(...)  →  matrix.transpose(...)
      matrix.transpose(...)
  |
6 | test "mat_transpose 2x3" { assert_eq(mat_transpose([[1, 2, 3], [4, 5, 6]]), [[1, 4], [2, 5], [3, 6]]) }
  |                                                                       ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-0.almd:7:54
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
  try:
      // mat_transpose(...)  →  matrix.transpose(...)
      matrix.transpose(...)
  |
7 | test "mat_transpose 1x1" { assert_eq(mat_transpose([[5]]), [[5]]) }
  |                                                      ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-0.almd:8:54
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
  try:
      // mat_transpose(...)  →  matrix.transpose(...)
      matrix.transpose(...)
  |
8 | test "mat_transpose empty" { assert_eq(mat_transpose([]), []) }
  |                                                      ^
error[E002]: undefined function 'mat_scale'
  --> /tmp/dojo-matrix-ops-0.almd:9:62
  in call to mat_scale()
  hint: Check the function name
  |
9 | test "mat_scale 2x2" { assert_eq(mat_scale([[1, 2], [3, 4]], 3), [[3, 6], [9, 12]]) }
  |                                                              ^
error[E002]: undefined function 'mat_scale'
  --> /tmp/dojo-matrix-ops-0.almd:10:63
  in call to mat_scale()
  hint: Check the function name
   |
10 | test "mat_scale by 0" { assert_eq(mat_scale([[1, 2], [3, 4]], 0), [[0, 0], [0, 0]]) }
   |                                                               ^
error[E002]: undefined function 'mat_scale'
  --> /tmp/dojo-matrix-ops-0.almd:11:55
  in call to mat_scale()
  hint: Check the function name
   |
11 | test "mat_scale by 1" { assert_eq(mat_scale([[5, 6]], 1), [[5, 6]]) }
   |                                                       ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-0.almd:12:62
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
12 | test "mat_dot_row" { assert_eq(mat_dot_row([1, 2, 3], [4, 5, 6]), 32) }
   |                                                              ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-0.almd:13:57
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
13 | test "mat_dot_row single" { assert_eq(mat_dot_row([3], [4]), 12) }
   |                                                         ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-0.almd:14:54
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
14 | test "mat_dot_row empty" { assert_eq(mat_dot_row([], []), 0) }
   |                                                      ^

12 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error[E002]: undefined function 'mat_add'
  --> /tmp/dojo-matrix-ops-1.almd:3:71
  in call to mat_add()
  hint: Check the function name
  |
3 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
  |                                                                       ^
error[E002]: undefined function 'mat_add'
  --> /tmp/dojo-matrix-ops-1.almd:4:49
  in call to mat_add()
  hint: Check the function name
  |
4 | test "mat_add 1x1" { assert_eq(mat_add([[1]], [[2]]), [[3]]) }
  |                                                 ^
error[E002]: undefined function 'mat_add'
  --> /tmp/dojo-matrix-ops-1.almd:5:73
  in call to mat_add()
  hint: Check the function name
  |
5 | test "mat_add zeros" { assert_eq(mat_add([[0, 0], [0, 0]], [[1, 2], [3, 4]]), [[1, 2], [3, 4]]) }
  |                                                                         ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-1.almd:6:71
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
  try:
      // mat_transpose(...)  →  matrix.transpose(...)
      matrix.transpose(...)
  |
6 | test "mat_transpose 2x3" { assert_eq(mat_transpose([[1, 2, 3], [4, 5, 6]]), [[1, 4], [2, 5], [3, 6]]) }
  |                                                                       ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-1.almd:7:54
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
  try:
      // mat_transpose(...)  →  matrix.transpose(...)
      matrix.transpose(...)
  |
7 | test "mat_transpose 1x1" { assert_eq(mat_transpose([[5]]), [[5]]) }
  |                                                      ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-1.almd:8:54
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
  try:
      // mat_transpose(...)  →  matrix.transpose(...)
      matrix.transpose(...)
  |
8 | test "mat_transpose empty" { assert_eq(mat_transpose([]), []) }
  |                                                      ^
error[E002]: undefined function 'mat_scale'
  --> /tmp/dojo-matrix-ops-1.almd:9:62
  in call to mat_scale()
  hint: Check the function name
  |
9 | test "mat_scale 2x2" { assert_eq(mat_scale([[1, 2], [3, 4]], 3), [[3, 6], [9, 12]]) }
  |                                                              ^
error[E002]: undefined function 'mat_scale'
  --> /tmp/dojo-matrix-ops-1.almd:10:63
  in call to mat_scale()
  hint: Check the function name
   |
10 | test "mat_scale by 0" { assert_eq(mat_scale([[1, 2], [3, 4]], 0), [[0, 0], [0, 0]]) }
   |                                                               ^
error[E002]: undefined function 'mat_scale'
  --> /tmp/dojo-matrix-ops-1.almd:11:55
  in call to mat_scale()
  hint: Check the function name
   |
11 | test "mat_scale by 1" { assert_eq(mat_scale([[5, 6]], 1), [[5, 6]]) }
   |                                                       ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-1.almd:12:62
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
12 | test "mat_dot_row" { assert_eq(mat_dot_row([1, 2, 3], [4, 5, 6]), 32) }
   |                                                              ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-1.almd:13:57
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
13 | test "mat_dot_row single" { assert_eq(mat_dot_row([3], [4]), 12) }
   |                                                         ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-1.almd:14:54
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
14 | test "mat_dot_row empty" { assert_eq(mat_dot_row([], []), 0) }
   |                                                      ^

12 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error[E002]: undefined function 'mat_add'
  --> /tmp/dojo-matrix-ops-2.almd:3:71
  in call to mat_add()
  hint: Check the function name
  |
3 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
  |                                                                       ^
error[E002]: undefined function 'mat_add'
  --> /tmp/dojo-matrix-ops-2.almd:4:49
  in call to mat_add()
  hint: Check the function name
  |
4 | test "mat_add 1x1" { assert_eq(mat_add([[1]], [[2]]), [[3]]) }
  |                                                 ^
error[E002]: undefined function 'mat_add'
  --> /tmp/dojo-matrix-ops-2.almd:5:73
  in call to mat_add()
  hint: Check the function name
  |
5 | test "mat_add zeros" { assert_eq(mat_add([[0, 0], [0, 0]], [[1, 2], [3, 4]]), [[1, 2], [3, 4]]) }
  |                                                                         ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-2.almd:6:71
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
  try:
      // mat_transpose(...)  →  matrix.transpose(...)
      matrix.transpose(...)
  |
6 | test "mat_transpose 2x3" { assert_eq(mat_transpose([[1, 2, 3], [4, 5, 6]]), [[1, 4], [2, 5], [3, 6]]) }
  |                                                                       ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-2.almd:7:54
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
  try:
      // mat_transpose(...)  →  matrix.transpose(...)
      matrix.transpose(...)
  |
7 | test "mat_transpose 1x1" { assert_eq(mat_transpose([[5]]), [[5]]) }
  |                                                      ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-2.almd:8:54
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
  try:
      // mat_transpose(...)  →  matrix.transpose(...)
      matrix.transpose(...)
  |
8 | test "mat_transpose empty" { assert_eq(mat_transpose([]), []) }
  |                                                      ^
error[E002]: undefined function 'mat_scale'
  --> /tmp/dojo-matrix-ops-2.almd:9:62
  in call to mat_scale()
  hint: Check the function name
  |
9 | test "mat_scale 2x2" { assert_eq(mat_scale([[1, 2], [3, 4]], 3), [[3, 6], [9, 12]]) }
  |                                                              ^
error[E002]: undefined function 'mat_scale'
  --> /tmp/dojo-matrix-ops-2.almd:10:63
  in call to mat_scale()
  hint: Check the function name
   |
10 | test "mat_scale by 0" { assert_eq(mat_scale([[1, 2], [3, 4]], 0), [[0, 0], [0, 0]]) }
   |                                                               ^
error[E002]: undefined function 'mat_scale'
  --> /tmp/dojo-matrix-ops-2.almd:11:55
  in call to mat_scale()
  hint: Check the function name
   |
11 | test "mat_scale by 1" { assert_eq(mat_scale([[5, 6]], 1), [[5, 6]]) }
   |                                                       ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-2.almd:12:62
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
12 | test "mat_dot_row" { assert_eq(mat_dot_row([1, 2, 3], [4, 5, 6]), 32) }
   |                                                              ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-2.almd:13:57
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
13 | test "mat_dot_row single" { assert_eq(mat_dot_row([3], [4]), 12) }
   |                                                         ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-2.almd:14:54
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
14 | test "mat_dot_row empty" { assert_eq(mat_dot_row([], []), 0) }
   |                                                      ^

12 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error[E002]: undefined function 'mat_add'
  --> /tmp/dojo-matrix-ops-3.almd:3:71
  in call to mat_add()
  hint: Check the function name
  |
3 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
  |                                                                       ^
error[E002]: undefined function 'mat_add'
  --> /tmp/dojo-matrix-ops-3.almd:4:49
  in call to mat_add()
  hint: Check the function name
  |
4 | test "mat_add 1x1" { assert_eq(mat_add([[1]], [[2]]), [[3]]) }
  |                                                 ^
error[E002]: undefined function 'mat_add'
  --> /tmp/dojo-matrix-ops-3.almd:5:73
  in call to mat_add()
  hint: Check the function name
  |
5 | test "mat_add zeros" { assert_eq(mat_add([[0, 0], [0, 0]], [[1, 2], [3, 4]]), [[1, 2], [3, 4]]) }
  |                                                                         ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-3.almd:6:71
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
  try:
      // mat_transpose(...)  →  matrix.transpose(...)
      matrix.transpose(...)
  |
6 | test "mat_transpose 2x3" { assert_eq(mat_transpose([[1, 2, 3], [4, 5, 6]]), [[1, 4], [2, 5], [3, 6]]) }
  |                                                                       ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-3.almd:7:54
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
  try:
      // mat_transpose(...)  →  matrix.transpose(...)
      matrix.transpose(...)
  |
7 | test "mat_transpose 1x1" { assert_eq(mat_transpose([[5]]), [[5]]) }
  |                                                      ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-3.almd:8:54
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
  try:
      // mat_transpose(...)  →  matrix.transpose(...)
      matrix.transpose(...)
  |
8 | test "mat_transpose empty" { assert_eq(mat_transpose([]), []) }
  |                                                      ^
error[E002]: undefined function 'mat_scale'
  --> /tmp/dojo-matrix-ops-3.almd:9:62
  in call to mat_scale()
  hint: Check the function name
  |
9 | test "mat_scale 2x2" { assert_eq(mat_scale([[1, 2], [3, 4]], 3), [[3, 6], [9, 12]]) }
  |                                                              ^
error[E002]: undefined function 'mat_scale'
  --> /tmp/dojo-matrix-ops-3.almd:10:63
  in call to mat_scale()
  hint: Check the function name
   |
10 | test "mat_scale by 0" { assert_eq(mat_scale([[1, 2], [3, 4]], 0), [[0, 0], [0, 0]]) }
   |                                                               ^
error[E002]: undefined function 'mat_scale'
  --> /tmp/dojo-matrix-ops-3.almd:11:55
  in call to mat_scale()
  hint: Check the function name
   |
11 | test "mat_scale by 1" { assert_eq(mat_scale([[5, 6]], 1), [[5, 6]]) }
   |                                                       ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-3.almd:12:62
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
12 | test "mat_dot_row" { assert_eq(mat_dot_row([1, 2, 3], [4, 5, 6]), 32) }
   |                                                              ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-3.almd:13:57
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
13 | test "mat_dot_row single" { assert_eq(mat_dot_row([3], [4]), 12) }
   |                                                         ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-3.almd:14:54
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
14 | test "mat_dot_row empty" { assert_eq(mat_dot_row([], []), 0) }
   |                                                      ^

12 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
