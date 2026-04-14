# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ").filter(x => x != "")
  list.fold(words, Map[String, Int](), (map, word) => {
    let count = map.get_or(word, 0)
    map.set(word, count + 1)
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-0.almd:2:45
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let words = string.split(s, " ").filter(x => x != "")
  |                                             ^^
error: Lambda parameter must be wrapped in parentheses at line 2:45
  --> /tmp/dojo-word-count-0.almd:2:45
  |
2 |   let words = string.split(s, " ").filter(x => x != "")
  |                                             ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-0.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, Map[String, Int](), (map, word) => {
  |             ^^^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-0.almd:4:34
  in call to map.get_or()
  hint: Check the number of arguments
  |
4 |     let count = map.get_or(word, 0)
  |                                  ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-0.almd:5:27
  in call to map.set()
  hint: Check the number of arguments
  |
5 |     map.set(word, count + 1)
  |                           ^
error[E005]: argument 'f' expects fn(Map, Map[Int, V]) -> Map but got fn(?0, Map[Int, V]) -> Map[Int, ?3]
  --> /tmp/dojo-word-count-0.almd:5:27
  in call to list.fold()
  hint: Fix the argument type
  |
5 |     map.set(word, count + 1)
  |                           ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map, Map[Int, V]) -> Map but got fn(Map, Map[Int, V]) -> Map[Int, ?3]
  --> /tmp/dojo-word-count-0.almd:5:27
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(word, count + 1)
  |                           ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map
  --> /tmp/dojo-word-count-0.almd:5:27
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(word, count + 1)
  |                           ^

8 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ").filter((x) => x != "")
  list.fold(words, Map[String, Int](), (map, word) => {
    let count = map.get_or(word, 0)
    map.set(word, count + 1)
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:4:34
  in call to map.get_or()
  hint: Check the number of arguments
  |
4 |     let count = map.get_or(word, 0)
  |                                  ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:5:27
  in call to map.set()
  hint: Check the number of arguments
  |
5 |     map.set(word, count + 1)
  |                           ^
error[E005]: argument 'f' expects fn(Map, String) -> Map but got fn(?1, Map[Int, V]) -> Map[Int, ?4]
  --> /tmp/dojo-word-count-1.almd:5:27
  in call to list.fold()
  hint: Fix the argument type
  |
5 |     map.set(word, count + 1)
  |                           ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map, String) -> Map but got fn(Map, Map[Int, V]) -> Map[Int, ?4]
  --> /tmp/dojo-word-count-1.almd:5:27
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(word, count + 1)
  |                           ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map
  --> /tmp/dojo-word-count-1.almd:5:27
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(word, count + 1)
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
  let words = string.split(s, " ").filter((x) => x != "")
  list.fold(words, Map[String, Int](), (map, word) => {
    let count = map.get_or(word, 0)
    map.set(word, count + 1)
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:4:34
  in call to map.get_or()
  hint: Check the number of arguments
  |
4 |     let count = map.get_or(word, 0)
  |                                  ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:5:27
  in call to map.set()
  hint: Check the number of arguments
  |
5 |     map.set(word, count + 1)
  |                           ^
error[E005]: argument 'f' expects fn(Map, String) -> Map but got fn(?1, Map[Int, V]) -> Map[Int, ?4]
  --> /tmp/dojo-word-count-2.almd:5:27
  in call to list.fold()
  hint: Fix the argument type
  |
5 |     map.set(word, count + 1)
  |                           ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map, String) -> Map but got fn(Map, Map[Int, V]) -> Map[Int, ?4]
  --> /tmp/dojo-word-count-2.almd:5:27
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(word, count + 1)
  |                           ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map
  --> /tmp/dojo-word-count-2.almd:5:27
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(word, count + 1)
  |                           ^

5 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ").filter((x) => x != "")
  list.fold(words, Map[String, Int](), (map, word) => {
    let count = map.get_or(word, 0)
    map.set(word, count + 1)
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:4:34
  in call to map.get_or()
  hint: Check the number of arguments
  |
4 |     let count = map.get_or(word, 0)
  |                                  ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:5:27
  in call to map.set()
  hint: Check the number of arguments
  |
5 |     map.set(word, count + 1)
  |                           ^
error[E005]: argument 'f' expects fn(Map, String) -> Map but got fn(?1, Map[Int, V]) -> Map[Int, ?4]
  --> /tmp/dojo-word-count-3.almd:5:27
  in call to list.fold()
  hint: Fix the argument type
  |
5 |     map.set(word, count + 1)
  |                           ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map, String) -> Map but got fn(Map, Map[Int, V]) -> Map[Int, ?4]
  --> /tmp/dojo-word-count-3.almd:5:27
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(word, count + 1)
  |                           ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map
  --> /tmp/dojo-word-count-3.almd:5:27
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(word, count + 1)
  |                           ^

5 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
