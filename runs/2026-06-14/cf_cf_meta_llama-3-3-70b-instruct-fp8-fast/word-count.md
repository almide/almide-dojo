# word-count

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] =
  let words = string.split(s, " ")
  let filtered_words = list.filter(words, (x) => x != "")
  let initial_map = map.new[String, Int]()
  let count_map = list.fold(
    filtered_words,
    initial_map,
    (acc, word) =>
      let current_count = map.get_or(acc, word, 0)
      map.set(acc, word, current_count + 1)
  )
  count_map
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-0.almd:9:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |       let current_count = map.get_or(acc, word, 0)
  |       ^^^
error: Expected expression at line 11:3 (got RParen ')')
  --> /tmp/dojo-word-count-0.almd:11:3
   |
11 |   )
   |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-word-count-0.almd:10:15
  in variable acc
  hint: Check the variable name
   |
10 |       map.set(acc, word, current_count + 1)
   |               ^^^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-0.almd:10:20
  in variable word
  hint: Did you mean `words`?
  try:
      // word  →  words
      words
   |
10 |       map.set(acc, word, current_count + 1)
   |                    ^^^^
error[E003]: undefined variable 'current_count'
  --> /tmp/dojo-word-count-0.almd:10:26
  in variable current_count
  hint: Check the variable name
   |
10 |       map.set(acc, word, current_count + 1)
   |                          ^^^^^^^^^^^^^
error[E003]: undefined variable 'count_map'
  --> /tmp/dojo-word-count-0.almd:12:3
  in variable count_map
  hint: Check the variable name
   |
12 |   count_map
   |   ^^^^^^^^^

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
  |> list.filter((x) => x != "") 
  |> list.fold(map.new[String, Int](), (acc, word) => 
    map.set(acc, word, map.get_or(acc, word, 0) + 1)
  )
```
