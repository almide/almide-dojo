# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter(x => x != "")
  list.fold(words, map.new(), (m, word) => 
    map.set(m, word, map.get_or(m, word, 0) + 1))
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
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-0.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (m, word) =>
  |             ^^^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter(x => x != "")
  list.fold(words, map.new(), (m, word) => 
    map.set(m, word, map.get_or(m, word, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-1.almd:2:45
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let words = string.split(s, " ").filter(x => x != "")
  |                                             ^^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-1.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (m, word) =>
  |             ^^^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter(x => x != "")
  list.fold(words, map.new(), (m, word) => 
    map.set(m, word, map.get_or(m, word, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-2.almd:2:45
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let words = string.split(s, " ").filter(x => x != "")
  |                                             ^^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (m, word) =>
  |             ^^^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter(x => x != "")
  list.fold(words, map.new(), (m, word) => 
    map.set(m, word, map.get_or(m, word, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-3.almd:2:45
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let words = string.split(s, " ").filter(x => x != "")
  |                                             ^^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-3.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (m, word) =>
  |             ^^^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
