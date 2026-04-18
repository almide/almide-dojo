# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "") 
  list.fold(words, map.new(), (m, x) => map.set(m, x, map.get_or(m, x, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-0.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-0.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (m, x) => map.set(m, x, map.get_or(m, x, 0) + 1))
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
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  list.fold(words, map.new(), (m, x) => map.set(m, x, map.get_or(m, x, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-1.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-1.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (m, x) => map.set(m, x, map.get_or(m, x, 0) + 1))
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
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  list.fold(words, map.new(), (m, x) => map.set(m, x, map.get_or(m, x, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-2.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (m, x) => map.set(m, x, map.get_or(m, x, 0) + 1))
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
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  let m = map.new()
  list.fold(words, m, (acc, x) => map.set(acc, x, map.get_or(acc, x, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-3.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-3.almd:4:13
  in variable words
  hint: Check the variable name
  |
4 |   list.fold(words, m, (acc, x) => map.set(acc, x, map.get_or(acc, x, 0) + 1))
  |             ^^^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
