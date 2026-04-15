# word-count

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  list.fold(
    list.filter(string.split(s, " "), x => x != ""),
    map.new(),
    (acc, x) => 
      map.set(
        acc, 
        x, 
        map.get_or(acc, x, 0) + 1
      )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-0.almd:3:41
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
3 |     list.filter(string.split(s, " "), x => x != ""),
  |                                         ^^
error: Lambda parameter must be wrapped in parentheses at line 3:41
  --> /tmp/dojo-word-count-0.almd:3:41
  |
3 |     list.filter(string.split(s, " "), x => x != ""),
  |                                         ^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-0.almd:13:48
  in call to word_count()
  hint: Check the function name
   |
13 | test "word_count empty" { assert_eq(word_count(""), [:]) }
   |                                                ^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-0.almd:14:54
  in call to word_count()
  hint: Check the function name
   |
14 | test "word_count single word" { assert_eq(word_count("hello"), ["hello": 1]) }
   |                                                      ^^^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-0.almd:15:56
  in call to word_count()
  hint: Check the function name
   |
15 | test "word_count two different" { assert_eq(word_count("a b"), ["a": 1, "b": 1]) }
   |                                                        ^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-0.almd:16:51
  in call to word_count()
  hint: Check the function name
   |
16 | test "word_count repeated" { assert_eq(word_count("the cat and the dog"), ["the": 2, "cat": 1, "and": 1, "dog": 1]) }
   |                                                   ^^^^^^^^^^^^^^^^^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-0.almd:17:51
  in call to word_count()
  hint: Check the function name
   |
17 | test "word_count all same" { assert_eq(word_count("x x x"), ["x": 3]) }
   |                                                   ^^^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-0.almd:18:57
  in call to word_count()
  hint: Check the function name
   |
18 | test "word_count case sensitive" { assert_eq(word_count("Go go GO"), ["Go": 1, "go": 1, "GO": 1]) }
   |                                                         ^^^^^^^^^^

8 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  list.fold(
    list.filter(string.split(s, " "), (x) => x != ""),
    map.new(),
    (acc, x) => 
      map.set(
        acc, 
        x, 
        map.get_or(acc, x, 0) + 1
      )
  )
```
