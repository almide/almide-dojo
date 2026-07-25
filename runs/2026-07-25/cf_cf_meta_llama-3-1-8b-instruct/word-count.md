# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: import-error
- **diagnostic code**: `E004`

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  string.split(s, " ") 
  |> list.filter(fn(x) => not(string.is_empty(x)))
  |> list.fold(map.new[String, Int](), fn(map, word) => 
    map.get_or(word, 0) 
    |> map.set(word, _ + 1)
  )
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
error: Expected function name at line 4:42 (got LParen '(')
  --> /tmp/dojo-word-count-0.almd:4:42
  |
4 |   |> list.fold(map.new[String, Int](), fn(map, word) =>
  |                                          ^

3 error(s) found
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
  |> list.fold(map.new[String, Int](), (map, word) => 
    map.get_or(word, 0) 
    |> map.set(word, _ + 1)
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: Expected ')' to close function call opened at line 6:15
  --> /tmp/dojo-word-count-1.almd:6:24
  hint: Add ')' or check for a missing delimiter inside the function call
  |
6 |     |> map.set(word, _ + 1)
  |               --------------- '(' opened here
  |
6 |     |> map.set(word, _ + 1)
  |                        ^

1 error(s) found
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
  |> list.fold(map.new[String, Int](), (map, word) => 
    map.get_or(word, 0) 
    |> map.set(word, (_ + 1))
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:5:22
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
5 |     map.get_or(word, 0)
  |                      ^
error[E005]: argument 'f' expects fn(Map[?1, ?2], String) -> Map[?1, ?2] but got fn(?3, Map[Int, V]) -> Map[Map[Int, V], ?6]
  --> /tmp/dojo-word-count-2.almd:6:27
  in call to list.fold()
  hint: Fix the argument type
  |
6 |     |> map.set(word, (_ + 1))
  |                           ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map[String, Int], String) -> Map[String, Int] but got fn(Map[String, Int], Map[Int, V]) -> Map[Map[Int, V], ?6]
  --> /tmp/dojo-word-count-2.almd:6:27
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
6 |     |> map.set(word, (_ + 1))
  |                           ^

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
  |> list.fold(map.new[String, Int](), (map, word) => 
    map.set(word, (map.get_or(word, 0) + 1))
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:5:37
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
5 |     map.set(word, (map.get_or(word, 0) + 1))
  |                                     ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:5:42
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
5 |     map.set(word, (map.get_or(word, 0) + 1))
  |                                          ^
error[E005]: argument 'f' expects fn(Map[?1, ?2], String) -> Map[?1, ?2] but got fn(?3, Map[Int, V]) -> Map[Int, ?6]
  --> /tmp/dojo-word-count-3.almd:5:42
  in call to list.fold()
  hint: Fix the argument type
  |
5 |     map.set(word, (map.get_or(word, 0) + 1))
  |                                          ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map[String, Int], String) -> Map[String, Int] but got fn(Map[String, Int], Map[Int, V]) -> Map[Int, ?6]
  --> /tmp/dojo-word-count-3.almd:5:42
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(word, (map.get_or(word, 0) + 1))
  |                                          ^

4 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
