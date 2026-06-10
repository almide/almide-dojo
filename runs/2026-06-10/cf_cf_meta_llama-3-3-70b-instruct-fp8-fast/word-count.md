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
    non_empty_words = list.filter(words, (x) => not(string.is_empty(x)))
    init_map = map.new[String, Int]()
    freq_map = list.fold(non_empty_words, init_map, (acc, word) =>
      map.set(acc, word, map.get_or(acc, word, 0) + 1)
    )
  in
    freq_map
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-word-count-0.almd:2:6
  |
2 |   let
  |      ^
error: Expected expression at line 9:3 (got In 'in')
  --> /tmp/dojo-word-count-0.almd:9:3
  |
9 |   in
  |   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-0.almd:4:35
  in variable words
  hint: Check the variable name
  |
4 |     non_empty_words = list.filter(words, (x) => not(string.is_empty(x)))
  |                                   ^^^^^
error[E003]: undefined variable 'non_empty_words'
  --> /tmp/dojo-word-count-0.almd:6:26
  in variable non_empty_words
  hint: Check the variable name
  |
6 |     freq_map = list.fold(non_empty_words, init_map, (acc, word) =>
  |                          ^^^^^^^^^^^^^^^
error[E003]: undefined variable 'init_map'
  --> /tmp/dojo-word-count-0.almd:6:43
  in variable init_map
  hint: Did you mean `int.max`?
  try:
      // init_map  →  int.max
      int.max
  |
6 |     freq_map = list.fold(non_empty_words, init_map, (acc, word) =>
  |                                           ^^^^^^^^
error[E003]: undefined variable 'freq_map'
  --> /tmp/dojo-word-count-0.almd:10:5
  in variable freq_map
  hint: Check the variable name
   |
10 |     freq_map
   |     ^^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] =
  string.split(s, " ") 
  |> list.filter((x) => not(string.is_empty(x)))
  |> list.fold(map.new[String, Int](), (acc, word) => 
    map.set(acc, word, map.get_or(acc, word, 0) + 1)
  )
```
