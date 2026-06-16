# binary-search

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
Compiling /tmp/dojo-binary-search-0.almd
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-0.almd:3:58
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
3 | test "binary_search empty" { assert_eq(binary_search([], 1), none) }
  |                                                          ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-0.almd:4:66
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
4 | test "binary_search single found" { assert_eq(binary_search([5], 5), some(0)) }
  |                                                                  ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-0.almd:5:70
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
5 | test "binary_search single not found" { assert_eq(binary_search([5], 3), none) }
  |                                                                      ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-0.almd:6:71
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
6 | test "binary_search first" { assert_eq(binary_search([1, 3, 5, 7, 9], 1), some(0)) }
  |                                                                       ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-0.almd:7:72
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
7 | test "binary_search middle" { assert_eq(binary_search([1, 3, 5, 7, 9], 5), some(2)) }
  |                                                                        ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-0.almd:8:70
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
8 | test "binary_search last" { assert_eq(binary_search([1, 3, 5, 7, 9], 9), some(4)) }
  |                                                                      ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-0.almd:9:79
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
9 | test "binary_search not found low" { assert_eq(binary_search([1, 3, 5, 7, 9], 0), none) }
  |                                                                               ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-0.almd:10:79
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
   |
10 | test "binary_search not found mid" { assert_eq(binary_search([1, 3, 5, 7, 9], 4), none) }
   |                                                                               ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-0.almd:11:80
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
   |
11 | test "binary_search not found high" { assert_eq(binary_search([1, 3, 5, 7, 9], 10), none) }
   |                                                                                ^^

9 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-1.almd:3:58
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
3 | test "binary_search empty" { assert_eq(binary_search([], 1), none) }
  |                                                          ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-1.almd:4:66
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
4 | test "binary_search single found" { assert_eq(binary_search([5], 5), some(0)) }
  |                                                                  ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-1.almd:5:70
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
5 | test "binary_search single not found" { assert_eq(binary_search([5], 3), none) }
  |                                                                      ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-1.almd:6:71
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
6 | test "binary_search first" { assert_eq(binary_search([1, 3, 5, 7, 9], 1), some(0)) }
  |                                                                       ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-1.almd:7:72
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
7 | test "binary_search middle" { assert_eq(binary_search([1, 3, 5, 7, 9], 5), some(2)) }
  |                                                                        ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-1.almd:8:70
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
8 | test "binary_search last" { assert_eq(binary_search([1, 3, 5, 7, 9], 9), some(4)) }
  |                                                                      ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-1.almd:9:79
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
9 | test "binary_search not found low" { assert_eq(binary_search([1, 3, 5, 7, 9], 0), none) }
  |                                                                               ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-1.almd:10:79
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
   |
10 | test "binary_search not found mid" { assert_eq(binary_search([1, 3, 5, 7, 9], 4), none) }
   |                                                                               ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-1.almd:11:80
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
   |
11 | test "binary_search not found high" { assert_eq(binary_search([1, 3, 5, 7, 9], 10), none) }
   |                                                                                ^^

9 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-2.almd:3:58
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
3 | test "binary_search empty" { assert_eq(binary_search([], 1), none) }
  |                                                          ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-2.almd:4:66
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
4 | test "binary_search single found" { assert_eq(binary_search([5], 5), some(0)) }
  |                                                                  ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-2.almd:5:70
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
5 | test "binary_search single not found" { assert_eq(binary_search([5], 3), none) }
  |                                                                      ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-2.almd:6:71
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
6 | test "binary_search first" { assert_eq(binary_search([1, 3, 5, 7, 9], 1), some(0)) }
  |                                                                       ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-2.almd:7:72
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
7 | test "binary_search middle" { assert_eq(binary_search([1, 3, 5, 7, 9], 5), some(2)) }
  |                                                                        ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-2.almd:8:70
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
8 | test "binary_search last" { assert_eq(binary_search([1, 3, 5, 7, 9], 9), some(4)) }
  |                                                                      ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-2.almd:9:79
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
9 | test "binary_search not found low" { assert_eq(binary_search([1, 3, 5, 7, 9], 0), none) }
  |                                                                               ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-2.almd:10:79
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
   |
10 | test "binary_search not found mid" { assert_eq(binary_search([1, 3, 5, 7, 9], 4), none) }
   |                                                                               ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-2.almd:11:80
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
   |
11 | test "binary_search not found high" { assert_eq(binary_search([1, 3, 5, 7, 9], 10), none) }
   |                                                                                ^^

9 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-3.almd:3:58
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
3 | test "binary_search empty" { assert_eq(binary_search([], 1), none) }
  |                                                          ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-3.almd:4:66
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
4 | test "binary_search single found" { assert_eq(binary_search([5], 5), some(0)) }
  |                                                                  ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-3.almd:5:70
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
5 | test "binary_search single not found" { assert_eq(binary_search([5], 3), none) }
  |                                                                      ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-3.almd:6:71
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
6 | test "binary_search first" { assert_eq(binary_search([1, 3, 5, 7, 9], 1), some(0)) }
  |                                                                       ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-3.almd:7:72
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
7 | test "binary_search middle" { assert_eq(binary_search([1, 3, 5, 7, 9], 5), some(2)) }
  |                                                                        ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-3.almd:8:70
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
8 | test "binary_search last" { assert_eq(binary_search([1, 3, 5, 7, 9], 9), some(4)) }
  |                                                                      ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-3.almd:9:79
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
9 | test "binary_search not found low" { assert_eq(binary_search([1, 3, 5, 7, 9], 0), none) }
  |                                                                               ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-3.almd:10:79
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
   |
10 | test "binary_search not found mid" { assert_eq(binary_search([1, 3, 5, 7, 9], 4), none) }
   |                                                                               ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-3.almd:11:80
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
   |
11 | test "binary_search not found high" { assert_eq(binary_search([1, 3, 5, 7, 9], 10), none) }
   |                                                                                ^^

9 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
