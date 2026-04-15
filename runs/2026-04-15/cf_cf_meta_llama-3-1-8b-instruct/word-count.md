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
  |> list.filter(x => x != "") 
  |> list.fold(
    Map[String, Int](),
    (map, word) => 
      map.get_or(word, 0) 
      |> map.set(word, _ + 1)
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-0.almd:3:20
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
3 |   |> list.filter(x => x != "")
  |                    ^^

1 error(s) found
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
  |> list.fold(
    Map[String, Int](),
    (map, word) => 
      map.get_or(word, 0) 
      |> map.set(word, _ + 1)
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: Expected ')' to close function call opened at line 8:17
  --> /tmp/dojo-word-count-1.almd:8:26
  hint: Add ')' or check for a missing delimiter inside the function call
  |
8 |       |> map.set(word, _ + 1)
  |                 --------------- '(' opened here
  |
8 |       |> map.set(word, _ + 1)
  |                          ^

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
  |> list.fold(
    Map[String, Int](),
    (map, word) => 
      map.get_or(word, 0) 
      |> map.set(word, map.get_or(word, 0) + 1)
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:7:24
  in call to map.get_or()
  hint: Check the number of arguments
  |
7 |       map.get_or(word, 0)
  |                        ^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:8:41
  in call to map.get_or()
  hint: Check the number of arguments
  |
8 |       |> map.set(word, map.get_or(word, 0) + 1)
  |                                         ^
error[E005]: argument 'f' expects fn(Map, String) -> Map but got fn(?1, Map[Int, V]) -> Map[Map[Int, V], ?4]
  --> /tmp/dojo-word-count-2.almd:8:46
  in call to list.fold()
  hint: Fix the argument type
  |
8 |       |> map.set(word, map.get_or(word, 0) + 1)
  |                                              ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map, String) -> Map but got fn(Map, Map[Int, V]) -> Map[Map[Int, V], ?4]
  --> /tmp/dojo-word-count-2.almd:8:46
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
8 |       |> map.set(word, map.get_or(word, 0) + 1)
  |                                              ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map
  --> /tmp/dojo-word-count-2.almd:8:46
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
8 |       |> map.set(word, map.get_or(word, 0) + 1)
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
  string.split(s, " ") 
  |> list.filter((x) => x != "") 
  |> list.fold(
    Map[String, Int](),
    (map, word) => 
      map.set(word, map.get_or(word, 0) + 1)
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:7:38
  in call to map.get_or()
  hint: Check the number of arguments
  |
7 |       map.set(word, map.get_or(word, 0) + 1)
  |                                      ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:7:43
  in call to map.set()
  hint: Check the number of arguments
  |
7 |       map.set(word, map.get_or(word, 0) + 1)
  |                                           ^
error[E005]: argument 'f' expects fn(Map, String) -> Map but got fn(?1, Map[Int, V]) -> Map[Int, ?4]
  --> /tmp/dojo-word-count-3.almd:7:43
  in call to list.fold()
  hint: Fix the argument type
  |
7 |       map.set(word, map.get_or(word, 0) + 1)
  |                                           ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map, String) -> Map but got fn(Map, Map[Int, V]) -> Map[Int, ?4]
  --> /tmp/dojo-word-count-3.almd:7:43
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
7 |       map.set(word, map.get_or(word, 0) + 1)
  |                                           ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map
  --> /tmp/dojo-word-count-3.almd:7:43
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
7 |       map.set(word, map.get_or(word, 0) + 1)
  |                                           ^

5 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
