# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  string.split(s, " ")
  |> list.filter((x) => x != "")
  |> list.fold(Map[String, Int](), (map, word) => 
    map.get_or(word, 0) + 1
    |> map.set(word, _))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-0.almd:5:22
  in call to map.get_or()
  hint: Check the number of arguments
  |
5 |     map.get_or(word, 0) + 1
  |                      ^
error[E005]: argument 'f' expects fn(Map, String) -> Map but got fn(?1, Map[Int, V]) -> Map[Map[Int, V], ?4]
  --> /tmp/dojo-word-count-0.almd:6:22
  in call to list.fold()
  hint: Fix the argument type
  |
6 |     |> map.set(word, _))
  |                      ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map, String) -> Map but got fn(Map, Map[Int, V]) -> Map[Map[Int, V], ?4]
  --> /tmp/dojo-word-count-0.almd:6:22
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
6 |     |> map.set(word, _))
  |                      ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map
  --> /tmp/dojo-word-count-0.almd:6:22
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
6 |     |> map.set(word, _))
  |                      ^

4 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  string.split(s, " ")
  |> list.filter((x) => x != "")
  |> list.fold(Map[String, Int](), (map, word) => 
    let count = map.get_or(word, 0)
    in map.set(word, count + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-1.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let count = map.get_or(word, 0)
  |     ^^^

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
  |> list.filter((x) => x != "")
  |> list.fold(Map[String, Int](), (map, word) => 
    map.set(word, map.get_or(word, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:5:36
  in call to map.get_or()
  hint: Check the number of arguments
  |
5 |     map.set(word, map.get_or(word, 0) + 1))
  |                                    ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:5:41
  in call to map.set()
  hint: Check the number of arguments
  |
5 |     map.set(word, map.get_or(word, 0) + 1))
  |                                         ^
error[E005]: argument 'f' expects fn(Map, String) -> Map but got fn(?1, Map[Int, V]) -> Map[Int, ?4]
  --> /tmp/dojo-word-count-2.almd:5:41
  in call to list.fold()
  hint: Fix the argument type
  |
5 |     map.set(word, map.get_or(word, 0) + 1))
  |                                         ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map, String) -> Map but got fn(Map, Map[Int, V]) -> Map[Int, ?4]
  --> /tmp/dojo-word-count-2.almd:5:41
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(word, map.get_or(word, 0) + 1))
  |                                         ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map
  --> /tmp/dojo-word-count-2.almd:5:41
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(word, map.get_or(word, 0) + 1))
  |                                         ^

5 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  string.split(s, " ")
  |> list.filter((x) => x != "")
  |> list.fold(Map[String, Int](), (map, word) => 
    let count = map.get_or(word, 0) + 1
    map.set(word, count))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-3.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let count = map.get_or(word, 0) + 1
  |     ^^^

1 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
