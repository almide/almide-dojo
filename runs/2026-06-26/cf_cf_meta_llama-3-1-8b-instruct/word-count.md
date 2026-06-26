# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E012`

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  string.split(s, " ")
  |> list.filter(fn(x) => not(string.is_empty(x)))
  |> list.fold(Map.new(), (map, word) => 
    match map.get(word) {
      some(count) => map.set(word, count + 1),
      none => map.set(word, 1)
    })
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Expected expression at line 3:18 (got Fn 'fn')
  --> /tmp/dojo-word-count-0.almd:3:18
  |
3 |   |> list.filter(fn(x) => not(string.is_empty(x)))
  |                  ^
error: Expected function name at line 3:20 (got LParen '(')
  --> /tmp/dojo-word-count-0.almd:3:20
  |
3 |   |> list.filter(fn(x) => not(string.is_empty(x)))
  |                    ^

2 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  string.split(s, " ")
  |> list.filter((x) => not(string.is_empty(x)))
  |> list.fold(Map.new(), (map, word) => 
    match map.get(word) {
      some(count) => map.set(word, count + 1),
      none => map.set(word, 1)
    })
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error[E004]: map.get() expects 2 argument(s) but got 1
  --> /tmp/dojo-word-count-1.almd:5:19
  in call to map.get()
  hint: Check the number of arguments
  try:
      // map.get() takes 2 arg(s) — you passed 1
      map.get(<m: Map[K, V]>, <key: K>)
  |
5 |     match map.get(word) {
  |                   ^^^^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:6:44
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
6 |       some(count) => map.set(word, count + 1),
  |                                            ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:7:29
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
7 |       none => map.set(word, 1)
  |                             ^
error[E005]: argument 'f' expects fn(?1, String) -> ?1 but got fn(?2, Map[Int, V]) -> Map[K, ?6]
  --> /tmp/dojo-word-count-1.almd:7:29
  in call to list.fold()
  hint: Fix the argument type
  |
7 |       none => map.set(word, 1)
  |                             ^
error[E001]: type mismatch in method call: expected Map but got fn() -> Map[String, Int]
  --> /tmp/dojo-word-count-1.almd:4:16
  in method call
  hint: Fix the expression type or change the expected type
  |
4 |   |> list.fold(Map.new(), (map, word) =>
  |                ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(Map[String, Int], String) -> Map[String, Int] but got fn(Map[String, Int], Map[Int, V]) -> Map[K, ?6]
  --> /tmp/dojo-word-count-1.almd:7:29
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
7 |       none => map.set(word, 1)
  |                             ^

6 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  string.split(s, " ")
  |> list.filter((x) => not(string.is_empty(x)))
  |> list.fold(Map.new(), (map, word) => 
    match map.get(word) {
      some(count) => map.set(word, count + 1),
      none => map.set(map, word, 1)
    })
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error[E004]: map.get() expects 2 argument(s) but got 1
  --> /tmp/dojo-word-count-2.almd:5:19
  in call to map.get()
  hint: Check the number of arguments
  try:
      // map.get() takes 2 arg(s) — you passed 1
      map.get(<m: Map[K, V]>, <key: K>)
  |
5 |     match map.get(word) {
  |                   ^^^^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:6:44
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
6 |       some(count) => map.set(word, count + 1),
  |                                            ^
error[E001]: type mismatch in method call: expected Map but got fn() -> Map[String, Int]
  --> /tmp/dojo-word-count-2.almd:4:16
  in method call
  hint: Fix the expression type or change the expected type
  |
4 |   |> list.fold(Map.new(), (map, word) =>
  |                ^^^

3 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  string.split(s, " ")
  |> list.filter((x) => not(string.is_empty(x)))
  |> list.fold(Map.new(), (map, word) => 
    match map.get(word) {
      some(count) => map.set(map, word, count + 1),
      none => map.set(map, word, 1)
    })

// Fix: Use map.get_or to handle none case
// Fix: Use map.set to set the value in the map
fn word_count(s: String) -> Map[String, Int] = 
  string.split(s, " ")
  |> list.filter((x) => not(string.is_empty(x)))
  |> list.fold(Map.new(), (map, word) => 
    map.set(map, word, match map.get_or(map, word, 0) {
      some(count) => count + 1,
      none => 1
    }))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error[E012]: duplicate function 'word_count'
  at line 12
  in fn word_count
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn word_count(s: String) -> Map[String, Int] =
   | ------------------------------------- first definition of 'word_count' here
...
12 | fn word_count(s: String) -> Map[String, Int] =
   | ^^^^^^^^^^^^^
error[E004]: map.get() expects 2 argument(s) but got 1
  --> /tmp/dojo-word-count-3.almd:5:19
  in call to map.get()
  hint: Check the number of arguments
  try:
      // map.get() takes 2 arg(s) — you passed 1
      map.get(<m: Map[K, V]>, <key: K>)
  |
5 |     match map.get(word) {
  |                   ^^^^
error[E010]: non-exhaustive match: missing _
  --> /tmp/dojo-word-count-3.almd:16:52
  in match
  hint: match on Int requires a catch-all '_' pattern
   |
16 |     map.set(map, word, match map.get_or(map, word, 0) {
   |                                                    ^
error[E001]: type mismatch in method call: expected Map but got fn() -> Map[String, Int]
  --> /tmp/dojo-word-count-3.almd:4:16
  in method call
  hint: Fix the expression type or change the expected type
  |
4 |   |> list.fold(Map.new(), (map, word) =>
  |                ^^^
error[E001]: type mismatch in method call: expected Map but got fn() -> Map[String, Int]
  --> /tmp/dojo-word-count-3.almd:15:16
  in method call
  hint: Fix the expression type or change the expected type
   |
15 |   |> list.fold(Map.new(), (map, word) =>
   |                ^^^

5 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
