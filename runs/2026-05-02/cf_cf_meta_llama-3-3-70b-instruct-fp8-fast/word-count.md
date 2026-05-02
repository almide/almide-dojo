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
    non_empty_words = list.filter(words, (x) => x != "")
    count_map = list.fold(non_empty_words, map.new[String, Int](), (acc, word) =>
      map.set(acc, word, map.get_or(acc, word, 0) + 1)
    )
  in
    count_map
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-word-count-0.almd:2:6
  |
2 |   let
  |      ^
error: Expected expression at line 8:3 (got In 'in')
  --> /tmp/dojo-word-count-0.almd:8:3
  |
8 |   in
  |   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-0.almd:4:35
  in variable words
  hint: Check the variable name
  |
4 |     non_empty_words = list.filter(words, (x) => x != "")
  |                                   ^^^^^
error[E003]: undefined variable 'non_empty_words'
  --> /tmp/dojo-word-count-0.almd:5:27
  in variable non_empty_words
  hint: Check the variable name
  |
5 |     count_map = list.fold(non_empty_words, map.new[String, Int](), (acc, word) =>
  |                           ^^^^^^^^^^^^^^^
error[E003]: undefined variable 'count_map'
  --> /tmp/dojo-word-count-0.almd:9:5
  in variable count_map
  hint: Check the variable name
  |
9 |     count_map
  |     ^^^^^^^^^

5 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] =
  string.split(s, " ") 
  |> list.filter((x) => x != "") 
  |> list.fold(map.new[String, Int](), (acc, word) => 
    map.set(acc, word, map.get_or(acc, word, 0) + 1)
  )
```
