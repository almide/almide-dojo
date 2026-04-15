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
  |> list.fold(map.new(), (m, x) => 
    map.get_or(m, x, 0) + 1
    |> map.set(x, _))
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
  |> list.fold(map.new(), (m, x) => 
    map.get_or(m, x, 0) + 1
    |> map.set(x, _))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error[E005]: argument 'm' expects Map[K, V] but got Int
  --> /tmp/dojo-word-count-1.almd:6:19
  in call to map.set()
  hint: Fix the argument type
  |
6 |     |> map.set(x, _))
  |                   ^
error[E001]: type mismatch in call to map.set(): expected Map[String, V] but got Int
  --> /tmp/dojo-word-count-1.almd:6:19
  in call to map.set()
  hint: Fix the expression type or change the expected type
  |
6 |     |> map.set(x, _))
  |                   ^

2 error(s) found
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
  |> list.fold(map.new(), (m, x) => 
    map.set(x, map.get_or(m, x, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:5:38
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
5 |     map.set(x, map.get_or(m, x, 0) + 1))
  |                                      ^
error[E005]: argument 'f' expects fn(Map[?1, ?2], String) -> Map[?1, ?2] but got fn(Map[Map[Int, V], Int], Map[Int, V]) -> Map[Int, ?5]
  --> /tmp/dojo-word-count-2.almd:5:38
  in call to list.fold()
  hint: Fix the argument type
  |
5 |     map.set(x, map.get_or(m, x, 0) + 1))
  |                                      ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map[Map[Int, V], Int], String) -> Map[Map[Int, V], Int] but got fn(Map[Map[Int, V], Int], Map[Int, V]) -> Map[Int, ?5]
  --> /tmp/dojo-word-count-2.almd:5:38
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(x, map.get_or(m, x, 0) + 1))
  |                                      ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map[Map[Int, V], Int]
  --> /tmp/dojo-word-count-2.almd:5:38
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(x, map.get_or(m, x, 0) + 1))
  |                                      ^

4 error(s) found
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
  |> list.fold(map.new(), (m, x) => 
    map.set(x, map.get_or(m, x, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:5:38
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
5 |     map.set(x, map.get_or(m, x, 0) + 1))
  |                                      ^
error[E005]: argument 'f' expects fn(Map[?1, ?2], String) -> Map[?1, ?2] but got fn(Map[Map[Int, V], Int], Map[Int, V]) -> Map[Int, ?5]
  --> /tmp/dojo-word-count-3.almd:5:38
  in call to list.fold()
  hint: Fix the argument type
  |
5 |     map.set(x, map.get_or(m, x, 0) + 1))
  |                                      ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map[Map[Int, V], Int], String) -> Map[Map[Int, V], Int] but got fn(Map[Map[Int, V], Int], Map[Int, V]) -> Map[Int, ?5]
  --> /tmp/dojo-word-count-3.almd:5:38
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(x, map.get_or(m, x, 0) + 1))
  |                                      ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map[Map[Int, V], Int]
  --> /tmp/dojo-word-count-3.almd:5:38
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(x, map.get_or(m, x, 0) + 1))
  |                                      ^

4 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
