# word-count

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /tmp/dojo-word-count-3.almd
error: 'def' is not a keyword in Almide at line 1:1
  --> /tmp/dojo-word-count-3.almd:1:1
  hint: Use 'fn name(...) -> Type = expr' or 'effect fn name(...) -> Result[T, E] = expr'.
  |
1 | def word_count(s: String): Map[String, Int] =
  | ^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-3.almd:8:48
  in call to word_count()
  hint: Check the function name
  |
8 | test "word_count empty" { assert_eq(word_count(""), [:]) }
  |                                                ^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-3.almd:9:54
  in call to word_count()
  hint: Check the function name
  |
9 | test "word_count single word" { assert_eq(word_count("hello"), ["hello": 1]) }
  |                                                      ^^^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-3.almd:10:56
  in call to word_count()
  hint: Check the function name
   |
10 | test "word_count two different" { assert_eq(word_count("a b"), ["a": 1, "b": 1]) }
   |                                                        ^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-3.almd:11:51
  in call to word_count()
  hint: Check the function name
   |
11 | test "word_count repeated" { assert_eq(word_count("the cat and the dog"), ["the": 2, "cat": 1, "and": 1, "dog": 1]) }
   |                                                   ^^^^^^^^^^^^^^^^^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-3.almd:12:51
  in call to word_count()
  hint: Check the function name
   |
12 | test "word_count all same" { assert_eq(word_count("x x x"), ["x": 3]) }
   |                                                   ^^^^^^^
error[E002]: undefined function 'word_count'
  --> /tmp/dojo-word-count-3.almd:13:57
  in call to word_count()
  hint: Check the function name
   |
13 | test "word_count case sensitive" { assert_eq(word_count("Go go GO"), ["Go": 1, "go": 1, "GO": 1]) }
   |                                                         ^^^^^^^^^^

7 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
def word_count(s: String): Map[String, Int] = 
  list.fold(
    list.filter(string.split(s, " "), (word) => word != ""), 
    Map.empty[String, Int], 
    (acc, word) => acc.set(word, acc.get_or_else(word, () => 0) + 1)
  )
```
