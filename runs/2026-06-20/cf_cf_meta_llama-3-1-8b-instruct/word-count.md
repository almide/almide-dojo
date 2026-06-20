# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ")
  let words = list.filter(words, fn(x) => x.is_not_empty())
  list.fold(words, map.new(), (map, word) => 
    map.set_or(map, word, 0) + 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Expected expression at line 3:34 (got Fn 'fn')
  --> /tmp/dojo-word-count-0.almd:3:34
  |
3 |   let words = list.filter(words, fn(x) => x.is_not_empty())
  |                                  ^
error[E002]: undefined function 'map.set_or'
  --> /tmp/dojo-word-count-0.almd:5:27
  in call to map.set_or()
  hint: Did you mean `map.get_or`?
  try:
      // map.set_or(...)  →  map.get_or(...)
      map.get_or(...)
  |
5 |     map.set_or(map, word, 0) + 1)
  |                           ^

2 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ")
  let words = list.filter(words, fn(x) => x.is_not_empty())
  list.fold(words, map.new(), (map, word) => 
    map.set(map, word, map.get_or(map, word, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: Expected expression at line 3:34 (got Fn 'fn')
  --> /tmp/dojo-word-count-1.almd:3:34
  |
3 |   let words = list.filter(words, fn(x) => x.is_not_empty())
  |                                  ^

1 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ")
  let words = list.filter(words, (x) => x.is_not_empty())
  list.fold(words, map.new(), (map, word) => 
    map.set(map, word, map.get_or(map, word, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error[E005]: argument 'f' expects fn(String) -> Bool but got fn(fn() -> ?1) -> ?1
  --> /tmp/dojo-word-count-2.almd:3:41
  in call to list.filter()
  hint: Fix the argument type
  |
3 |   let words = list.filter(words, (x) => x.is_not_empty())
  |                                         ^
error[E001]: type mismatch in call to list.filter(): expected fn(String) -> Bool but got fn(fn() -> ?1) -> ?1
  --> /tmp/dojo-word-count-2.almd:3:41
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
3 |   let words = list.filter(words, (x) => x.is_not_empty())
  |                                         ^

2 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ")
  list.filter(words, (x) => x.is_not_empty())
  list.fold(words, map.new(), (map, word) => 
    map.set(map, word, map.get_or(map, word, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error[E005]: argument 'f' expects fn(String) -> Bool but got fn(fn() -> ?1) -> ?1
  --> /tmp/dojo-word-count-3.almd:3:29
  in call to list.filter()
  hint: Fix the argument type
  |
3 |   list.filter(words, (x) => x.is_not_empty())
  |                             ^
error[E001]: type mismatch in call to list.filter(): expected fn(String) -> Bool but got fn(fn() -> ?1) -> ?1
  --> /tmp/dojo-word-count-3.almd:3:29
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
3 |   list.filter(words, (x) => x.is_not_empty())
  |                             ^

2 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
