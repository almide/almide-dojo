# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ")
  list.fold(words, map.new(), (m, word) => 
    if string.is_empty(word) then m else 
      map.get_or(m, word, 0) + 1 -> map.set(m, word, map.get_or(m, word, 0) + 1)
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Expected ')' to close function call opened at line 3:12
  --> /tmp/dojo-word-count-0.almd:5:34
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   list.fold(words, map.new(), (m, word) =>
  |            --------------- '(' opened here
...
5 |       map.get_or(m, word, 0) + 1 -> map.set(m, word, map.get_or(m, word, 0) + 1)
  |                                  ^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-0.almd:2:31
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
2 |   let words = string.split(s, " ")
  |                               ^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ")
  list.filter(words, string.is_empty) |>
  list.fold(map.new(), (m, word) => 
    map.set(m, word, map.get_or(m, word, 0) + 1)
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ")
  list.filter(words, string.is_empty) |>
  list.fold(map.new(), (m, word) => 
    map.set(m, word, map.get_or(m, word, 0) + 1)
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ")
  list.filter(words, string.is_empty) |>
  list.fold(map.new(), (m, word) => 
    map.set(m, word, map.get_or(m, word, 0) + 1)
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
