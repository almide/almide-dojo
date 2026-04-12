# max-of-list

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /tmp/dojo-max-of-list-3.almd
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-3.almd:3:50
  in call to max_of_list()
  hint: Check the function name
  |
3 | test "max_of_list empty" { assert_eq(max_of_list([]), none) }
  |                                                  ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-3.almd:4:52
  in call to max_of_list()
  hint: Check the function name
  |
4 | test "max_of_list single" { assert_eq(max_of_list([42]), some(42)) }
  |                                                    ^^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-3.almd:5:61
  in call to max_of_list()
  hint: Check the function name
  |
5 | test "max_of_list ascending" { assert_eq(max_of_list([1, 2, 3]), some(3)) }
  |                                                             ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-3.almd:6:62
  in call to max_of_list()
  hint: Check the function name
  |
6 | test "max_of_list descending" { assert_eq(max_of_list([3, 2, 1]), some(3)) }
  |                                                              ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-3.almd:7:62
  in call to max_of_list()
  hint: Check the function name
  |
7 | test "max_of_list duplicates" { assert_eq(max_of_list([5, 5, 5]), some(5)) }
  |                                                              ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-3.almd:8:64
  in call to max_of_list()
  hint: Check the function name
  |
8 | test "max_of_list negatives" { assert_eq(max_of_list([-3, -1, -2]), some(-1)) }
  |                                                                ^
error[E002]: undefined function 'max_of_list'
  --> /tmp/dojo-max-of-list-3.almd:9:63
  in call to max_of_list()
  hint: Check the function name
  |
9 | test "max_of_list mixed" { assert_eq(max_of_list([-10, 0, 10, 5]), some(10)) }
  |                                                               ^

7 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide

```
