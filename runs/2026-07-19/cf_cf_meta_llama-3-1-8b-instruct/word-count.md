# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: import-error
- **diagnostic code**: `E004`

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ")
  list.fold(words, map.new(), (map, word) => {
    let count = map.get_or(word, 0)
    map.set(word, count + 1)
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-0.almd:4:34
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
4 |     let count = map.get_or(word, 0)
  |                                  ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-0.almd:5:27
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
5 |     map.set(word, count + 1)
  |                           ^
error[E005]: argument 'f' expects fn(Map[?0, ?1], String) -> Map[?0, ?1] but got fn(?2, Map[Int, V]) -> Map[Int, ?5]
  --> /tmp/dojo-word-count-0.almd:5:27
  in call to list.fold()
  hint: Fix the argument type
  |
5 |     map.set(word, count + 1)
  |                           ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map[String, Int], String) -> Map[String, Int] but got fn(Map[String, Int], Map[Int, V]) -> Map[Int, ?5]
  --> /tmp/dojo-word-count-0.almd:5:27
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(word, count + 1)
  |                           ^

4 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ")
  list.filter(words, (word) => !string.is_empty(word))
  list.fold(words, map.new(), (map, word) => {
    let count = map.get_or(word, 0)
    map.set(word, count + 1)
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: '!' is not valid in Almide at line 3:32
  --> /tmp/dojo-word-count-1.almd:3:32
  hint: Use 'not' for boolean negation. Write: not x
  |
3 |   list.filter(words, (word) => !string.is_empty(word))
  |                                ^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:5:34
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
5 |     let count = map.get_or(word, 0)
  |                                  ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:6:27
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
6 |     map.set(word, count + 1)
  |                           ^
error[E005]: argument 'f' expects fn(Map[?0, ?1], String) -> Map[?0, ?1] but got fn(?2, Map[Int, V]) -> Map[Int, ?5]
  --> /tmp/dojo-word-count-1.almd:6:27
  in call to list.fold()
  hint: Fix the argument type
  |
6 |     map.set(word, count + 1)
  |                           ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map[String, Int], String) -> Map[String, Int] but got fn(Map[String, Int], Map[Int, V]) -> Map[Int, ?5]
  --> /tmp/dojo-word-count-1.almd:6:27
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
6 |     map.set(word, count + 1)
  |                           ^

5 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ")
  list.filter(words, (word) => not string.is_empty(word))
  list.fold(words, map.new(), (map, word) => {
    let count = map.get_or(word, map.new())
    map.set(word, count + 1)
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:5:41
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
5 |     let count = map.get_or(word, map.new())
  |                                         ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:6:27
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
6 |     map.set(word, count + 1)
  |                           ^
error[E005]: argument 'f' expects fn(Map[?1, ?2], String) -> Map[?1, ?2] but got fn(?3, Map[Map[?5, ?6], V]) -> Map[Map[?5, ?6], ?8]
  --> /tmp/dojo-word-count-2.almd:6:27
  in call to list.fold()
  hint: Fix the argument type
  |
6 |     map.set(word, count + 1)
  |                           ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map[String, Int], String) -> Map[String, Int] but got fn(Map[String, Int], Map[Map[?5, ?6], V]) -> Map[Map[?5, ?6], ?8]
  --> /tmp/dojo-word-count-2.almd:6:27
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
6 |     map.set(word, count + 1)
  |                           ^

4 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ")
  list.filter(words, (word) => not string.is_empty(word))
  list.fold(words, map.new(), (map, word) => {
    let count = map.get_or(word, map.new(), 0)
    map.set(word, count + 1)
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:6:27
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
6 |     map.set(word, count + 1)
  |                           ^
error[E005]: argument 'f' expects fn(Map[?1, ?2], String) -> Map[?1, ?2] but got fn(?3, Map[Map[?5, ?6], Int]) -> Map[Map[?5, ?6], Int]
  --> /tmp/dojo-word-count-3.almd:6:27
  in call to list.fold()
  hint: Fix the argument type
  |
6 |     map.set(word, count + 1)
  |                           ^
error[E001]: type mismatch in call to map.set(): expected Map[?5, ?6] but got Int
  --> /tmp/dojo-word-count-3.almd:6:27
  in call to map.set()
  hint: Fix the expression type or change the expected type
  |
6 |     map.set(word, count + 1)
  |                           ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map[String, Int], String) -> Map[String, Int] but got fn(Map[String, Int], Map[Map[?5, ?6], Int]) -> Map[Map[?5, ?6], Int]
  --> /tmp/dojo-word-count-3.almd:6:27
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
6 |     map.set(word, count + 1)
  |                           ^

4 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
