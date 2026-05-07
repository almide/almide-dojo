# word-count

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] =
  let
    words = string.split(s, " ")
    filtered_words = list.filter(words, (word) => not(string.is_empty(word)))
    empty_map = map.new[String, Int]()
  in
    list.fold(
      filtered_words,
      empty_map,
      (acc, word) =>
        map.set(
          acc,
          word,
          map.get_or(acc, word, 0) + 1
        )
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-word-count-0.almd:2:6
  |
2 |   let
  |      ^
error: Expected expression at line 6:3 (got In 'in')
  --> /tmp/dojo-word-count-0.almd:6:3
  |
6 |   in
  |   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-0.almd:4:34
  in variable words
  hint: Check the variable name
  |
4 |     filtered_words = list.filter(words, (word) => not(string.is_empty(word)))
  |                                  ^^^^^
error[E003]: undefined variable 'filtered_words'
  --> /tmp/dojo-word-count-0.almd:8:7
  in variable filtered_words
  hint: Check the variable name
  |
8 |       filtered_words,
  |       ^^^^^^^^^^^^^^
error[E003]: undefined variable 'empty_map'
  --> /tmp/dojo-word-count-0.almd:9:7
  in variable empty_map
  hint: Check the variable name
  |
9 |       empty_map,
  |       ^^^^^^^^^

5 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] =
  let words = string.split(s, " ")
  let filtered_words = list.filter(words, (word) => not(string.is_empty(word)))
  let empty_map = map.new[String, Int]()
  in list.fold(
    filtered_words,
    empty_map,
    (acc, word) =>
      map.set(
        acc,
        word,
        map.get_or(acc, word, 0) + 1
      )
  )
```
