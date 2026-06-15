# partition-list

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
Compiling /tmp/dojo-partition-list-0.almd
error[E002]: undefined function 'partition'
  --> /tmp/dojo-partition-list-0.almd:3:79
  in call to partition()
  hint: Check the function name
  |
3 | test "partition evens" { assert_eq(partition([1, 2, 3, 4, 5], (x) => x % 2 == 0), ([2, 4], [1, 3, 5])) }
  |                                                                               ^
error[E002]: undefined function 'partition'
  --> /tmp/dojo-partition-list-0.almd:4:61
  in call to partition()
  hint: Check the function name
  |
4 | test "partition empty" { assert_eq(partition([], (x) => x > 0), ([], [])) }
  |                                                             ^
error[E002]: undefined function 'partition'
  --> /tmp/dojo-partition-list-0.almd:5:77
  in call to partition()
  hint: Check the function name
  |
5 | test "partition all match" { assert_eq(partition([2, 4, 6], (x) => x % 2 == 0), ([2, 4, 6], [])) }
  |                                                                             ^
error[E002]: undefined function 'partition'
  --> /tmp/dojo-partition-list-0.almd:6:78
  in call to partition()
  hint: Check the function name
  |
6 | test "partition none match" { assert_eq(partition([1, 3, 5], (x) => x % 2 == 0), ([], [1, 3, 5])) }
  |                                                                              ^
error[E002]: undefined function 'partition'
  --> /tmp/dojo-partition-list-0.almd:7:80
  in call to partition()
  hint: Check the function name
  |
7 | test "partition positives" { assert_eq(partition([-1, 0, 1, 2, -3], (x) => x > 0), ([1, 2], [-1, 0, -3])) }
  |                                                                                ^

5 error(s) found
Compile error for /tmp/dojo-partition-list-0.almd:
compile failed
FAILED: /tmp/dojo-partition-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-1.almd
error[E002]: undefined function 'partition'
  --> /tmp/dojo-partition-list-1.almd:3:79
  in call to partition()
  hint: Check the function name
  |
3 | test "partition evens" { assert_eq(partition([1, 2, 3, 4, 5], (x) => x % 2 == 0), ([2, 4], [1, 3, 5])) }
  |                                                                               ^
error[E002]: undefined function 'partition'
  --> /tmp/dojo-partition-list-1.almd:4:61
  in call to partition()
  hint: Check the function name
  |
4 | test "partition empty" { assert_eq(partition([], (x) => x > 0), ([], [])) }
  |                                                             ^
error[E002]: undefined function 'partition'
  --> /tmp/dojo-partition-list-1.almd:5:77
  in call to partition()
  hint: Check the function name
  |
5 | test "partition all match" { assert_eq(partition([2, 4, 6], (x) => x % 2 == 0), ([2, 4, 6], [])) }
  |                                                                             ^
error[E002]: undefined function 'partition'
  --> /tmp/dojo-partition-list-1.almd:6:78
  in call to partition()
  hint: Check the function name
  |
6 | test "partition none match" { assert_eq(partition([1, 3, 5], (x) => x % 2 == 0), ([], [1, 3, 5])) }
  |                                                                              ^
error[E002]: undefined function 'partition'
  --> /tmp/dojo-partition-list-1.almd:7:80
  in call to partition()
  hint: Check the function name
  |
7 | test "partition positives" { assert_eq(partition([-1, 0, 1, 2, -3], (x) => x > 0), ([1, 2], [-1, 0, -3])) }
  |                                                                                ^

5 error(s) found
Compile error for /tmp/dojo-partition-list-1.almd:
compile failed
FAILED: /tmp/dojo-partition-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-2.almd
error[E002]: undefined function 'partition'
  --> /tmp/dojo-partition-list-2.almd:3:79
  in call to partition()
  hint: Check the function name
  |
3 | test "partition evens" { assert_eq(partition([1, 2, 3, 4, 5], (x) => x % 2 == 0), ([2, 4], [1, 3, 5])) }
  |                                                                               ^
error[E002]: undefined function 'partition'
  --> /tmp/dojo-partition-list-2.almd:4:61
  in call to partition()
  hint: Check the function name
  |
4 | test "partition empty" { assert_eq(partition([], (x) => x > 0), ([], [])) }
  |                                                             ^
error[E002]: undefined function 'partition'
  --> /tmp/dojo-partition-list-2.almd:5:77
  in call to partition()
  hint: Check the function name
  |
5 | test "partition all match" { assert_eq(partition([2, 4, 6], (x) => x % 2 == 0), ([2, 4, 6], [])) }
  |                                                                             ^
error[E002]: undefined function 'partition'
  --> /tmp/dojo-partition-list-2.almd:6:78
  in call to partition()
  hint: Check the function name
  |
6 | test "partition none match" { assert_eq(partition([1, 3, 5], (x) => x % 2 == 0), ([], [1, 3, 5])) }
  |                                                                              ^
error[E002]: undefined function 'partition'
  --> /tmp/dojo-partition-list-2.almd:7:80
  in call to partition()
  hint: Check the function name
  |
7 | test "partition positives" { assert_eq(partition([-1, 0, 1, 2, -3], (x) => x > 0), ([1, 2], [-1, 0, -3])) }
  |                                                                                ^

5 error(s) found
Compile error for /tmp/dojo-partition-list-2.almd:
compile failed
FAILED: /tmp/dojo-partition-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-partition-list-3.almd
error[E002]: undefined function 'partition'
  --> /tmp/dojo-partition-list-3.almd:3:79
  in call to partition()
  hint: Check the function name
  |
3 | test "partition evens" { assert_eq(partition([1, 2, 3, 4, 5], (x) => x % 2 == 0), ([2, 4], [1, 3, 5])) }
  |                                                                               ^
error[E002]: undefined function 'partition'
  --> /tmp/dojo-partition-list-3.almd:4:61
  in call to partition()
  hint: Check the function name
  |
4 | test "partition empty" { assert_eq(partition([], (x) => x > 0), ([], [])) }
  |                                                             ^
error[E002]: undefined function 'partition'
  --> /tmp/dojo-partition-list-3.almd:5:77
  in call to partition()
  hint: Check the function name
  |
5 | test "partition all match" { assert_eq(partition([2, 4, 6], (x) => x % 2 == 0), ([2, 4, 6], [])) }
  |                                                                             ^
error[E002]: undefined function 'partition'
  --> /tmp/dojo-partition-list-3.almd:6:78
  in call to partition()
  hint: Check the function name
  |
6 | test "partition none match" { assert_eq(partition([1, 3, 5], (x) => x % 2 == 0), ([], [1, 3, 5])) }
  |                                                                              ^
error[E002]: undefined function 'partition'
  --> /tmp/dojo-partition-list-3.almd:7:80
  in call to partition()
  hint: Check the function name
  |
7 | test "partition positives" { assert_eq(partition([-1, 0, 1, 2, -3], (x) => x > 0), ([1, 2], [-1, 0, -3])) }
  |                                                                                ^

5 error(s) found
Compile error for /tmp/dojo-partition-list-3.almd:
compile failed
FAILED: /tmp/dojo-partition-list-3.almd

1/1 test file(s) failed

```
