# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "") 
  list.fold(words, map.new(), (map, word) => 
    map.set(word, map.get_or(word, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-0.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-0.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (map, word) =>
  |             ^^^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-0.almd:4:36
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
4 |     map.set(word, map.get_or(word, 0) + 1))
  |                                    ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-0.almd:4:41
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
4 |     map.set(word, map.get_or(word, 0) + 1))
  |                                         ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map[Int, ?1]
  --> /tmp/dojo-word-count-0.almd:4:41
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
4 |     map.set(word, map.get_or(word, 0) + 1))
  |                                         ^

5 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  list.fold(words, map.new(), (map, word) => 
    map.set(word, map.get_or(map, word, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-1.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-1.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (map, word) =>
  |             ^^^^^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:4:46
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
4 |     map.set(word, map.get_or(map, word, 0) + 1))
  |                                              ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map[Map[Int, V], Int], Map[Int, V]) -> Map[Map[Int, V], Int] but got fn(Map[Map[Int, V], Int], Map[Int, V]) -> Map[Int, ?4]
  --> /tmp/dojo-word-count-1.almd:4:46
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
4 |     map.set(word, map.get_or(map, word, 0) + 1))
  |                                              ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map[Map[Int, V], Int]
  --> /tmp/dojo-word-count-1.almd:4:46
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
4 |     map.set(word, map.get_or(map, word, 0) + 1))
  |                                              ^

5 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  list.fold(words, map.new(), (map, word) => 
    map.set(word, map.get_or(map, word, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-2.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (map, word) =>
  |             ^^^^^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:4:46
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
4 |     map.set(word, map.get_or(map, word, 0) + 1))
  |                                              ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map[Map[Int, V], Int], Map[Int, V]) -> Map[Map[Int, V], Int] but got fn(Map[Map[Int, V], Int], Map[Int, V]) -> Map[Int, ?4]
  --> /tmp/dojo-word-count-2.almd:4:46
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
4 |     map.set(word, map.get_or(map, word, 0) + 1))
  |                                              ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map[Map[Int, V], Int]
  --> /tmp/dojo-word-count-2.almd:4:46
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
4 |     map.set(word, map.get_or(map, word, 0) + 1))
  |                                              ^

5 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  list.fold(words, map.new(), (map, word) => 
    map.set(word, map.get_or(map, word, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-3.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-3.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (map, word) =>
  |             ^^^^^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:4:46
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
4 |     map.set(word, map.get_or(map, word, 0) + 1))
  |                                              ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map[Map[Int, V], Int], Map[Int, V]) -> Map[Map[Int, V], Int] but got fn(Map[Map[Int, V], Int], Map[Int, V]) -> Map[Int, ?4]
  --> /tmp/dojo-word-count-3.almd:4:46
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
4 |     map.set(word, map.get_or(map, word, 0) + 1))
  |                                              ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map[Map[Int, V], Int]
  --> /tmp/dojo-word-count-3.almd:4:46
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
4 |     map.set(word, map.get_or(map, word, 0) + 1))
  |                                              ^

5 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
