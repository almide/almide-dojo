# custom-linked-list

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
Compiling /tmp/dojo-custom-linked-list-0.almd
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:3:73
  in call to from_list()
  hint: Check the function name
  |
3 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
  |                                                                         ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:3:73
  in call to to_list()
  hint: Check the function name
  |
3 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
  |                                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:4:54
  in call to from_list()
  hint: Check the function name
  |
4 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
  |                                                      ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:4:54
  in call to to_list()
  hint: Check the function name
  |
4 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
  |                                                      ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-0.almd:5:40
  in call to my_len()
  hint: Check the function name
  |
5 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
  |                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:6:57
  in call to from_list()
  hint: Check the function name
  |
6 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
  |                                                         ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-0.almd:6:57
  in call to my_len()
  hint: Check the function name
  |
6 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
  |                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:7:66
  in call to from_list()
  hint: Check the function name
  |
7 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
  |                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-0.almd:7:82
  in call to my_map()
  hint: Check the function name
  |
7 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
  |                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:7:82
  in call to to_list()
  hint: Check the function name
  |
7 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
  |                                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-0.almd:8:65
  in call to my_map()
  hint: Check the function name
  |
8 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  |                                                                 ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:8:65
  in call to to_list()
  hint: Check the function name
  |
8 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  |                                                                 ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:9:77
  in call to from_list()
  hint: Check the function name
  |
9 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
  |                                                                             ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-0.almd:9:98
  in call to my_filter()
  hint: Did you mean `map.filter`?
  try:
      // my_filter(...)  →  map.filter(...)
      map.filter(...)
  |
9 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
  |                                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:9:98
  in call to to_list()
  hint: Check the function name
  |
9 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
  |                                                                                                  ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:10:70
  in call to from_list()
  hint: Check the function name
   |
10 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                      ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-0.almd:10:91
  in call to my_filter()
  hint: Did you mean `map.filter`?
  try:
      // my_filter(...)  →  map.filter(...)
      map.filter(...)
   |
10 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:10:91
  in call to to_list()
  hint: Check the function name
   |
10 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:11:67
  in call to from_list()
  hint: Check the function name
   |
11 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-0.almd:11:67
  in call to my_reverse()
  hint: Check the function name
   |
11 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:11:67
  in call to to_list()
  hint: Check the function name
   |
11 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-0.almd:12:56
  in call to my_reverse()
  hint: Check the function name
   |
12 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:12:56
  in call to to_list()
  hint: Check the function name
   |
12 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-0.almd:13:68
  in call to from_list()
  hint: Check the function name
   |
13 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-0.almd:13:68
  in call to my_reverse()
  hint: Check the function name
   |
13 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-0.almd:13:68
  in call to to_list()
  hint: Check the function name
   |
13 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^

26 error(s) found
Compile error for /tmp/dojo-custom-linked-list-0.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-1.almd
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:3:73
  in call to from_list()
  hint: Check the function name
  |
3 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
  |                                                                         ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:3:73
  in call to to_list()
  hint: Check the function name
  |
3 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
  |                                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:4:54
  in call to from_list()
  hint: Check the function name
  |
4 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
  |                                                      ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:4:54
  in call to to_list()
  hint: Check the function name
  |
4 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
  |                                                      ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-1.almd:5:40
  in call to my_len()
  hint: Check the function name
  |
5 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
  |                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:6:57
  in call to from_list()
  hint: Check the function name
  |
6 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
  |                                                         ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-1.almd:6:57
  in call to my_len()
  hint: Check the function name
  |
6 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
  |                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:7:66
  in call to from_list()
  hint: Check the function name
  |
7 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
  |                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-1.almd:7:82
  in call to my_map()
  hint: Check the function name
  |
7 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
  |                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:7:82
  in call to to_list()
  hint: Check the function name
  |
7 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
  |                                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-1.almd:8:65
  in call to my_map()
  hint: Check the function name
  |
8 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  |                                                                 ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:8:65
  in call to to_list()
  hint: Check the function name
  |
8 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  |                                                                 ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:9:77
  in call to from_list()
  hint: Check the function name
  |
9 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
  |                                                                             ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-1.almd:9:98
  in call to my_filter()
  hint: Did you mean `map.filter`?
  try:
      // my_filter(...)  →  map.filter(...)
      map.filter(...)
  |
9 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
  |                                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:9:98
  in call to to_list()
  hint: Check the function name
  |
9 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
  |                                                                                                  ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:10:70
  in call to from_list()
  hint: Check the function name
   |
10 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                      ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-1.almd:10:91
  in call to my_filter()
  hint: Did you mean `map.filter`?
  try:
      // my_filter(...)  →  map.filter(...)
      map.filter(...)
   |
10 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:10:91
  in call to to_list()
  hint: Check the function name
   |
10 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:11:67
  in call to from_list()
  hint: Check the function name
   |
11 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-1.almd:11:67
  in call to my_reverse()
  hint: Check the function name
   |
11 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:11:67
  in call to to_list()
  hint: Check the function name
   |
11 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-1.almd:12:56
  in call to my_reverse()
  hint: Check the function name
   |
12 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:12:56
  in call to to_list()
  hint: Check the function name
   |
12 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-1.almd:13:68
  in call to from_list()
  hint: Check the function name
   |
13 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-1.almd:13:68
  in call to my_reverse()
  hint: Check the function name
   |
13 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-1.almd:13:68
  in call to to_list()
  hint: Check the function name
   |
13 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^

26 error(s) found
Compile error for /tmp/dojo-custom-linked-list-1.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-2.almd
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:3:73
  in call to from_list()
  hint: Check the function name
  |
3 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
  |                                                                         ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:3:73
  in call to to_list()
  hint: Check the function name
  |
3 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
  |                                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:4:54
  in call to from_list()
  hint: Check the function name
  |
4 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
  |                                                      ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:4:54
  in call to to_list()
  hint: Check the function name
  |
4 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
  |                                                      ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-2.almd:5:40
  in call to my_len()
  hint: Check the function name
  |
5 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
  |                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:6:57
  in call to from_list()
  hint: Check the function name
  |
6 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
  |                                                         ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-2.almd:6:57
  in call to my_len()
  hint: Check the function name
  |
6 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
  |                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:7:66
  in call to from_list()
  hint: Check the function name
  |
7 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
  |                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-2.almd:7:82
  in call to my_map()
  hint: Check the function name
  |
7 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
  |                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:7:82
  in call to to_list()
  hint: Check the function name
  |
7 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
  |                                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-2.almd:8:65
  in call to my_map()
  hint: Check the function name
  |
8 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  |                                                                 ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:8:65
  in call to to_list()
  hint: Check the function name
  |
8 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  |                                                                 ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:9:77
  in call to from_list()
  hint: Check the function name
  |
9 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
  |                                                                             ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-2.almd:9:98
  in call to my_filter()
  hint: Did you mean `map.filter`?
  try:
      // my_filter(...)  →  map.filter(...)
      map.filter(...)
  |
9 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
  |                                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:9:98
  in call to to_list()
  hint: Check the function name
  |
9 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
  |                                                                                                  ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:10:70
  in call to from_list()
  hint: Check the function name
   |
10 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                      ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-2.almd:10:91
  in call to my_filter()
  hint: Did you mean `map.filter`?
  try:
      // my_filter(...)  →  map.filter(...)
      map.filter(...)
   |
10 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:10:91
  in call to to_list()
  hint: Check the function name
   |
10 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:11:67
  in call to from_list()
  hint: Check the function name
   |
11 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-2.almd:11:67
  in call to my_reverse()
  hint: Check the function name
   |
11 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:11:67
  in call to to_list()
  hint: Check the function name
   |
11 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-2.almd:12:56
  in call to my_reverse()
  hint: Check the function name
   |
12 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:12:56
  in call to to_list()
  hint: Check the function name
   |
12 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-2.almd:13:68
  in call to from_list()
  hint: Check the function name
   |
13 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-2.almd:13:68
  in call to my_reverse()
  hint: Check the function name
   |
13 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-2.almd:13:68
  in call to to_list()
  hint: Check the function name
   |
13 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^

26 error(s) found
Compile error for /tmp/dojo-custom-linked-list-2.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-custom-linked-list-3.almd
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:3:73
  in call to from_list()
  hint: Check the function name
  |
3 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
  |                                                                         ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:3:73
  in call to to_list()
  hint: Check the function name
  |
3 | test "from_list to_list roundtrip" { assert_eq(to_list(from_list([1, 2, 3])), [1, 2, 3]) }
  |                                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:4:54
  in call to from_list()
  hint: Check the function name
  |
4 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
  |                                                      ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:4:54
  in call to to_list()
  hint: Check the function name
  |
4 | test "from_list empty" { assert_eq(to_list(from_list([])), []) }
  |                                                      ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-3.almd:5:40
  in call to my_len()
  hint: Check the function name
  |
5 | test "my_len empty" { assert_eq(my_len(Nil), 0) }
  |                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:6:57
  in call to from_list()
  hint: Check the function name
  |
6 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
  |                                                         ^
error[E002]: undefined function 'my_len'
  --> /tmp/dojo-custom-linked-list-3.almd:6:57
  in call to my_len()
  hint: Check the function name
  |
6 | test "my_len three" { assert_eq(my_len(from_list([1, 2, 3])), 3) }
  |                                                         ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:7:66
  in call to from_list()
  hint: Check the function name
  |
7 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
  |                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-3.almd:7:82
  in call to my_map()
  hint: Check the function name
  |
7 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
  |                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:7:82
  in call to to_list()
  hint: Check the function name
  |
7 | test "my_map double" { assert_eq(to_list(my_map(from_list([1, 2, 3]), (x) => x * 2)), [2, 4, 6]) }
  |                                                                                  ^
error[E002]: undefined function 'my_map'
  --> /tmp/dojo-custom-linked-list-3.almd:8:65
  in call to my_map()
  hint: Check the function name
  |
8 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  |                                                                 ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:8:65
  in call to to_list()
  hint: Check the function name
  |
8 | test "my_map on nil" { assert_eq(to_list(my_map(Nil, (x) => x + 1)), []) }
  |                                                                 ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:9:77
  in call to from_list()
  hint: Check the function name
  |
9 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
  |                                                                             ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-3.almd:9:98
  in call to my_filter()
  hint: Did you mean `map.filter`?
  try:
      // my_filter(...)  →  map.filter(...)
      map.filter(...)
  |
9 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
  |                                                                                                  ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:9:98
  in call to to_list()
  hint: Check the function name
  |
9 | test "my_filter evens" { assert_eq(to_list(my_filter(from_list([1, 2, 3, 4, 5]), (x) => x % 2 == 0)), [2, 4]) }
  |                                                                                                  ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:10:70
  in call to from_list()
  hint: Check the function name
   |
10 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                      ^
error[E002]: undefined function 'my_filter'
  --> /tmp/dojo-custom-linked-list-3.almd:10:91
  in call to my_filter()
  hint: Did you mean `map.filter`?
  try:
      // my_filter(...)  →  map.filter(...)
      map.filter(...)
   |
10 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:10:91
  in call to to_list()
  hint: Check the function name
   |
10 | test "my_filter none" { assert_eq(to_list(my_filter(from_list([1, 3, 5]), (x) => x % 2 == 0)), []) }
   |                                                                                           ^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:11:67
  in call to from_list()
  hint: Check the function name
   |
11 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-3.almd:11:67
  in call to my_reverse()
  hint: Check the function name
   |
11 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:11:67
  in call to to_list()
  hint: Check the function name
   |
11 | test "my_reverse" { assert_eq(to_list(my_reverse(from_list([1, 2, 3]))), [3, 2, 1]) }
   |                                                                   ^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-3.almd:12:56
  in call to my_reverse()
  hint: Check the function name
   |
12 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:12:56
  in call to to_list()
  hint: Check the function name
   |
12 | test "my_reverse empty" { assert_eq(to_list(my_reverse(Nil)), []) }
   |                                                        ^^^
error[E002]: undefined function 'from_list'
  --> /tmp/dojo-custom-linked-list-3.almd:13:68
  in call to from_list()
  hint: Check the function name
   |
13 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'my_reverse'
  --> /tmp/dojo-custom-linked-list-3.almd:13:68
  in call to my_reverse()
  hint: Check the function name
   |
13 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^
error[E002]: undefined function 'to_list'
  --> /tmp/dojo-custom-linked-list-3.almd:13:68
  in call to to_list()
  hint: Check the function name
   |
13 | test "my_reverse single" { assert_eq(to_list(my_reverse(from_list([42]))), [42]) }
   |                                                                    ^^

26 error(s) found
Compile error for /tmp/dojo-custom-linked-list-3.almd:
compile failed
FAILED: /tmp/dojo-custom-linked-list-3.almd

1/1 test file(s) failed

```
