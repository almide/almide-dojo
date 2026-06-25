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
  let freq_map = list.fold(words, map.new(), (map, word) => {
    let count = map.get_or(word, 0)
    map.set(word, count + 1)
  })
  freq_map
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
  let freq_map = list.fold(words, map.new(), (map, word) => {
    let count = map.get_or(word, 0)
    map.set(word, count + 1)
  })
  freq_map
}

// Corrected code:
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ")
  let words = list.filter(words, (word) => string.len(word) > 0)
  let freq_map = list.fold(words, map.new(), (map, word) => {
    let count = map.get_or(word, 0)
    map.set(word, count + 1)
  })
  freq_map
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error[E012]: duplicate function 'word_count'
  at line 11
  in fn word_count
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn word_count(s: String) -> Map[String, Int] = {
   | ------------------------------------- first definition of 'word_count' here
...
11 | fn word_count(s: String) -> Map[String, Int] = {
   | ^^^^^^^^^^^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:4:34
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
4 |     let count = map.get_or(word, 0)
  |                                  ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:5:27
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
5 |     map.set(word, count + 1)
  |                           ^
error[E005]: argument 'f' expects fn(Map[?0, ?1], String) -> Map[?0, ?1] but got fn(?2, Map[Int, V]) -> Map[Int, ?5]
  --> /tmp/dojo-word-count-1.almd:5:27
  in call to list.fold()
  hint: Fix the argument type
  |
5 |     map.set(word, count + 1)
  |                           ^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:15:34
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
   |
15 |     let count = map.get_or(word, 0)
   |                                  ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:16:27
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
   |
16 |     map.set(word, count + 1)
   |                           ^
error[E005]: argument 'f' expects fn(Map[?7, ?8], String) -> Map[?7, ?8] but got fn(?9, Map[Int, V]) -> Map[Int, ?12]
  --> /tmp/dojo-word-count-1.almd:16:27
  in call to list.fold()
  hint: Fix the argument type
   |
16 |     map.set(word, count + 1)
   |                           ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map[String, Int], String) -> Map[String, Int] but got fn(Map[String, Int], Map[Int, V]) -> Map[Int, ?5]
  --> /tmp/dojo-word-count-1.almd:5:27
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(word, count + 1)
  |                           ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map[String, Int], String) -> Map[String, Int] but got fn(Map[String, Int], Map[Int, V]) -> Map[Int, ?12]
  --> /tmp/dojo-word-count-1.almd:16:27
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
16 |     map.set(word, count + 1)
   |                           ^

9 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ")
  let words = list.filter(words, (word) => string.len(word) > 0)
  let freq_map = map.new()
  list.fold(words, freq_map, (map, word) => {
    let count = map.get_or(word, 0)
    map.set(word, count + 1)
    map
  })
  freq_map
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:6:34
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
6 |     let count = map.get_or(word, 0)
  |                                  ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:7:27
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
7 |     map.set(word, count + 1)
  |                           ^
error[E005]: argument 'f' expects fn(Map[?1, ?2], String) -> Map[?1, ?2] but got fn(?3, Map[Int, V]) -> ?3
  --> /tmp/dojo-word-count-2.almd:8:5
  in call to list.fold()
  hint: Fix the argument type
  |
8 |     map
  |     ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(Map[String, Int], String) -> Map[String, Int] but got fn(Map[String, Int], Map[Int, V]) -> Map[String, Int]
  --> /tmp/dojo-word-count-2.almd:8:5
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
8 |     map
  |     ^^^

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
  let words = list.filter(words, (word) => string.len(word) > 0)
  let freq_map = map.new()
  list.fold(words, freq_map, (map, word) => {
    let count = map.get_or(word, 0)
    map.set(word, count + 1)
    map
  })
  freq_map
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:6:34
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
6 |     let count = map.get_or(word, 0)
  |                                  ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:7:27
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
7 |     map.set(word, count + 1)
  |                           ^
error[E005]: argument 'f' expects fn(Map[?1, ?2], String) -> Map[?1, ?2] but got fn(?3, Map[Int, V]) -> ?3
  --> /tmp/dojo-word-count-3.almd:8:5
  in call to list.fold()
  hint: Fix the argument type
  |
8 |     map
  |     ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(Map[String, Int], String) -> Map[String, Int] but got fn(Map[String, Int], Map[Int, V]) -> Map[String, Int]
  --> /tmp/dojo-word-count-3.almd:8:5
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
8 |     map
  |     ^^^

4 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
