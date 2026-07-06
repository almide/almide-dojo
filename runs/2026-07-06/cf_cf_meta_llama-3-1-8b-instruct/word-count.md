# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => string.is_not_empty(x))
  list.fold(words, map.new(), fn(map, word) => 
    map.set_or(map, word, 0) |> fn(map) => map.set(map, word, map.get_or(map, word, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-0.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => string.is_not_empty(x))
  |                                                   ^
error: Expected expression at line 3:31 (got Fn 'fn')
  --> /tmp/dojo-word-count-0.almd:3:31
  |
3 |   list.fold(words, map.new(), fn(map, word) =>
  |                               ^
error: Expected expression at line 4:33 (got Fn 'fn')
  --> /tmp/dojo-word-count-0.almd:4:33
  |
4 |     map.set_or(map, word, 0) |> fn(map) => map.set(map, word, map.get_or(map, word, 0) + 1))
  |                                 ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-0.almd:2:3
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => string.is_not_empty(x))
  |   ^^^

4 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => string.is_not_empty(x))
  list.fold(words, map.new(), fn(map, word) => 
    map.set(map, word, map.get_or(map, word, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-1.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => string.is_not_empty(x))
  |                                                   ^
error: Expected expression at line 3:31 (got Fn 'fn')
  --> /tmp/dojo-word-count-1.almd:3:31
  |
3 |   list.fold(words, map.new(), fn(map, word) =>
  |                               ^
error: Expected expression at line 4:53 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:4:53
  |
4 |     map.set(map, word, map.get_or(map, word, 0) + 1))
  |                                                     ^
error[E003]: undefined variable 'map'
  --> /tmp/dojo-word-count-1.almd:4:13
  in variable map
  hint: Check the variable name
  |
4 |     map.set(map, word, map.get_or(map, word, 0) + 1))
  |             ^^^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:4:18
  in variable word
  hint: Check the variable name
  |
4 |     map.set(map, word, map.get_or(map, word, 0) + 1))
  |                  ^^^^
error[E003]: undefined variable 'map'
  --> /tmp/dojo-word-count-1.almd:4:35
  in variable map
  hint: Check the variable name
  |
4 |     map.set(map, word, map.get_or(map, word, 0) + 1))
  |                                   ^^^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:4:40
  in variable word
  hint: Check the variable name
  |
4 |     map.set(map, word, map.get_or(map, word, 0) + 1))
  |                                        ^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-1.almd:4:51
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
4 |     map.set(map, word, map.get_or(map, word, 0) + 1))
  |                                                   ^

8 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => string.is_not_empty(x))
  list.fold(words, map.new(), fn(map, word) => 
    let count = map.get_or(map, word, 0)
    map.set(map, word, count + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-2.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => string.is_not_empty(x))
  |                                                   ^
error: Expected expression at line 3:31 (got Fn 'fn')
  --> /tmp/dojo-word-count-2.almd:3:31
  |
3 |   list.fold(words, map.new(), fn(map, word) =>
  |                               ^
error: Expected expression at line 5:34 (got RParen ')')
  --> /tmp/dojo-word-count-2.almd:5:34
  |
5 |     map.set(map, word, count + 1))
  |                                  ^
error[E003]: undefined variable 'map'
  --> /tmp/dojo-word-count-2.almd:4:28
  in variable map
  hint: Check the variable name
  |
4 |     let count = map.get_or(map, word, 0)
  |                            ^^^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-2.almd:4:33
  in variable word
  hint: Check the variable name
  |
4 |     let count = map.get_or(map, word, 0)
  |                                 ^^^^
error[E003]: undefined variable 'map'
  --> /tmp/dojo-word-count-2.almd:5:13
  in variable map
  hint: Check the variable name
  |
5 |     map.set(map, word, count + 1))
  |             ^^^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-2.almd:5:18
  in variable word
  hint: Check the variable name
  |
5 |     map.set(map, word, count + 1))
  |                  ^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-2.almd:5:32
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
5 |     map.set(map, word, count + 1))
  |                                ^

8 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => string.is_not_empty(x))
  list.fold(words, map.new(), fn(map, word) => 
    let count = map.get_or(map, word, 0)
    map.set(map, word, count + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-3.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => string.is_not_empty(x))
  |                                                   ^
error: Expected expression at line 3:31 (got Fn 'fn')
  --> /tmp/dojo-word-count-3.almd:3:31
  |
3 |   list.fold(words, map.new(), fn(map, word) =>
  |                               ^
error: Expected expression at line 5:34 (got RParen ')')
  --> /tmp/dojo-word-count-3.almd:5:34
  |
5 |     map.set(map, word, count + 1))
  |                                  ^
error[E003]: undefined variable 'map'
  --> /tmp/dojo-word-count-3.almd:4:28
  in variable map
  hint: Check the variable name
  |
4 |     let count = map.get_or(map, word, 0)
  |                            ^^^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-3.almd:4:33
  in variable word
  hint: Check the variable name
  |
4 |     let count = map.get_or(map, word, 0)
  |                                 ^^^^
error[E003]: undefined variable 'map'
  --> /tmp/dojo-word-count-3.almd:5:13
  in variable map
  hint: Check the variable name
  |
5 |     map.set(map, word, count + 1))
  |             ^^^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-3.almd:5:18
  in variable word
  hint: Check the variable name
  |
5 |     map.set(map, word, count + 1))
  |                  ^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-3.almd:5:32
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
5 |     map.set(map, word, count + 1))
  |                                ^

8 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
