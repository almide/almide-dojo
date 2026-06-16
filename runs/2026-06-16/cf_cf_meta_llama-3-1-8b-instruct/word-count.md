# word-count

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
Compiling /tmp/dojo-word-count-0.almd
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-0.almd:3:48
  in call to word_count()
  hint: Check the function name
  |
3 | test "word_count empty" { assert_eq(word_count(""), [:]) }
  |                                                ^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-0.almd:4:54
  in call to word_count()
  hint: Check the function name
  |
4 | test "word_count single word" { assert_eq(word_count("hello"), ["hello": 1]) }
  |                                                      ^^^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-0.almd:5:56
  in call to word_count()
  hint: Check the function name
  |
5 | test "word_count two different" { assert_eq(word_count("a b"), ["a": 1, "b": 1]) }
  |                                                        ^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-0.almd:6:51
  in call to word_count()
  hint: Check the function name
  |
6 | test "word_count repeated" { assert_eq(word_count("the cat and the dog"), ["the": 2, "cat": 1, "and": 1, "dog": 1]) }
  |                                                   ^^^^^^^^^^^^^^^^^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-0.almd:7:51
  in call to word_count()
  hint: Check the function name
  |
7 | test "word_count all same" { assert_eq(word_count("x x x"), ["x": 3]) }
  |                                                   ^^^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-0.almd:8:57
  in call to word_count()
  hint: Check the function name
  |
8 | test "word_count case sensitive" { assert_eq(word_count("Go go GO"), ["Go": 1, "go": 1, "GO": 1]) }
  |                                                         ^^^^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-1.almd:3:48
  in call to word_count()
  hint: Check the function name
  |
3 | test "word_count empty" { assert_eq(word_count(""), [:]) }
  |                                                ^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-1.almd:4:54
  in call to word_count()
  hint: Check the function name
  |
4 | test "word_count single word" { assert_eq(word_count("hello"), ["hello": 1]) }
  |                                                      ^^^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-1.almd:5:56
  in call to word_count()
  hint: Check the function name
  |
5 | test "word_count two different" { assert_eq(word_count("a b"), ["a": 1, "b": 1]) }
  |                                                        ^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-1.almd:6:51
  in call to word_count()
  hint: Check the function name
  |
6 | test "word_count repeated" { assert_eq(word_count("the cat and the dog"), ["the": 2, "cat": 1, "and": 1, "dog": 1]) }
  |                                                   ^^^^^^^^^^^^^^^^^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-1.almd:7:51
  in call to word_count()
  hint: Check the function name
  |
7 | test "word_count all same" { assert_eq(word_count("x x x"), ["x": 3]) }
  |                                                   ^^^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-1.almd:8:57
  in call to word_count()
  hint: Check the function name
  |
8 | test "word_count case sensitive" { assert_eq(word_count("Go go GO"), ["Go": 1, "go": 1, "GO": 1]) }
  |                                                         ^^^^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-2.almd:3:48
  in call to word_count()
  hint: Check the function name
  |
3 | test "word_count empty" { assert_eq(word_count(""), [:]) }
  |                                                ^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-2.almd:4:54
  in call to word_count()
  hint: Check the function name
  |
4 | test "word_count single word" { assert_eq(word_count("hello"), ["hello": 1]) }
  |                                                      ^^^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-2.almd:5:56
  in call to word_count()
  hint: Check the function name
  |
5 | test "word_count two different" { assert_eq(word_count("a b"), ["a": 1, "b": 1]) }
  |                                                        ^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-2.almd:6:51
  in call to word_count()
  hint: Check the function name
  |
6 | test "word_count repeated" { assert_eq(word_count("the cat and the dog"), ["the": 2, "cat": 1, "and": 1, "dog": 1]) }
  |                                                   ^^^^^^^^^^^^^^^^^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-2.almd:7:51
  in call to word_count()
  hint: Check the function name
  |
7 | test "word_count all same" { assert_eq(word_count("x x x"), ["x": 3]) }
  |                                                   ^^^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-2.almd:8:57
  in call to word_count()
  hint: Check the function name
  |
8 | test "word_count case sensitive" { assert_eq(word_count("Go go GO"), ["Go": 1, "go": 1, "GO": 1]) }
  |                                                         ^^^^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-3.almd:3:48
  in call to word_count()
  hint: Check the function name
  |
3 | test "word_count empty" { assert_eq(word_count(""), [:]) }
  |                                                ^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-3.almd:4:54
  in call to word_count()
  hint: Check the function name
  |
4 | test "word_count single word" { assert_eq(word_count("hello"), ["hello": 1]) }
  |                                                      ^^^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-3.almd:5:56
  in call to word_count()
  hint: Check the function name
  |
5 | test "word_count two different" { assert_eq(word_count("a b"), ["a": 1, "b": 1]) }
  |                                                        ^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-3.almd:6:51
  in call to word_count()
  hint: Check the function name
  |
6 | test "word_count repeated" { assert_eq(word_count("the cat and the dog"), ["the": 2, "cat": 1, "and": 1, "dog": 1]) }
  |                                                   ^^^^^^^^^^^^^^^^^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-3.almd:7:51
  in call to word_count()
  hint: Check the function name
  |
7 | test "word_count all same" { assert_eq(word_count("x x x"), ["x": 3]) }
  |                                                   ^^^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-3.almd:8:57
  in call to word_count()
  hint: Check the function name
  |
8 | test "word_count case sensitive" { assert_eq(word_count("Go go GO"), ["Go": 1, "go": 1, "GO": 1]) }
  |                                                         ^^^^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
