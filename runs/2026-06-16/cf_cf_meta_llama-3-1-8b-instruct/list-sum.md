# list-sum

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
Compiling /tmp/dojo-list-sum-0.almd
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-0.almd:3:44
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
3 | test "list_sum empty" { assert_eq(list_sum([]), 0) }
  |                                            ^
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-0.almd:4:46
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
4 | test "list_sum single" { assert_eq(list_sum([7]), 7) }
  |                                              ^
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-0.almd:5:60
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
5 | test "list_sum multiple" { assert_eq(list_sum([1, 2, 3, 4, 5]), 15) }
  |                                                            ^
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-0.almd:6:58
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
6 | test "list_sum negatives" { assert_eq(list_sum([-1, -2, -3]), -6) }
  |                                                          ^
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-0.almd:7:57
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
7 | test "list_sum mixed" { assert_eq(list_sum([10, -5, 3, -8]), 0) }
  |                                                         ^
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-0.almd:8:51
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
8 | test "list_sum zeros" { assert_eq(list_sum([0, 0, 0]), 0) }
  |                                                   ^

6 error(s) found
Compile error for /tmp/dojo-list-sum-0.almd:
compile failed
FAILED: /tmp/dojo-list-sum-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-list-sum-1.almd
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-1.almd:3:44
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
3 | test "list_sum empty" { assert_eq(list_sum([]), 0) }
  |                                            ^
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-1.almd:4:46
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
4 | test "list_sum single" { assert_eq(list_sum([7]), 7) }
  |                                              ^
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-1.almd:5:60
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
5 | test "list_sum multiple" { assert_eq(list_sum([1, 2, 3, 4, 5]), 15) }
  |                                                            ^
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-1.almd:6:58
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
6 | test "list_sum negatives" { assert_eq(list_sum([-1, -2, -3]), -6) }
  |                                                          ^
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-1.almd:7:57
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
7 | test "list_sum mixed" { assert_eq(list_sum([10, -5, 3, -8]), 0) }
  |                                                         ^
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-1.almd:8:51
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
8 | test "list_sum zeros" { assert_eq(list_sum([0, 0, 0]), 0) }
  |                                                   ^

6 error(s) found
Compile error for /tmp/dojo-list-sum-1.almd:
compile failed
FAILED: /tmp/dojo-list-sum-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-list-sum-2.almd
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-2.almd:3:44
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
3 | test "list_sum empty" { assert_eq(list_sum([]), 0) }
  |                                            ^
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-2.almd:4:46
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
4 | test "list_sum single" { assert_eq(list_sum([7]), 7) }
  |                                              ^
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-2.almd:5:60
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
5 | test "list_sum multiple" { assert_eq(list_sum([1, 2, 3, 4, 5]), 15) }
  |                                                            ^
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-2.almd:6:58
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
6 | test "list_sum negatives" { assert_eq(list_sum([-1, -2, -3]), -6) }
  |                                                          ^
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-2.almd:7:57
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
7 | test "list_sum mixed" { assert_eq(list_sum([10, -5, 3, -8]), 0) }
  |                                                         ^
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-2.almd:8:51
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
8 | test "list_sum zeros" { assert_eq(list_sum([0, 0, 0]), 0) }
  |                                                   ^

6 error(s) found
Compile error for /tmp/dojo-list-sum-2.almd:
compile failed
FAILED: /tmp/dojo-list-sum-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-list-sum-3.almd
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-3.almd:3:44
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
3 | test "list_sum empty" { assert_eq(list_sum([]), 0) }
  |                                            ^
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-3.almd:4:46
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
4 | test "list_sum single" { assert_eq(list_sum([7]), 7) }
  |                                              ^
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-3.almd:5:60
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
5 | test "list_sum multiple" { assert_eq(list_sum([1, 2, 3, 4, 5]), 15) }
  |                                                            ^
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-3.almd:6:58
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
6 | test "list_sum negatives" { assert_eq(list_sum([-1, -2, -3]), -6) }
  |                                                          ^
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-3.almd:7:57
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
7 | test "list_sum mixed" { assert_eq(list_sum([10, -5, 3, -8]), 0) }
  |                                                         ^
error[E002]: undefined function 'list_sum'
  --> /tmp/dojo-list-sum-3.almd:8:51
  in call to list_sum()
  hint: Did you mean `list.sum`?
  try:
      // list_sum(...)  →  list.sum(...)
      list.sum(...)
  |
8 | test "list_sum zeros" { assert_eq(list_sum([0, 0, 0]), 0) }
  |                                                   ^

6 error(s) found
Compile error for /tmp/dojo-list-sum-3.almd:
compile failed
FAILED: /tmp/dojo-list-sum-3.almd

1/1 test file(s) failed

```
