# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(|x| x != "") in
  let map = map.new() in
  list.fold(words, map, (m, w) => 
    match map.get(w) {
      some(x) => map.set(m, w, x + 1),
      none => map.set(m, w, 1)
    })
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: '|x|' closure syntax is not valid in Almide at line 2:51
  --> /tmp/dojo-word-count-0.almd:2:51
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   let words = string.split(s, " ") |> list.filter(|x| x != "") in
  |                                                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-0.almd:4:13
  in variable words
  hint: Check the variable name
  |
4 |   list.fold(words, map, (m, w) =>
  |             ^^^^^
error[E004]: map.get() expects 2 argument(s) but got 1
  --> /tmp/dojo-word-count-0.almd:5:19
  in call to map.get()
  hint: Check the number of arguments
  try:
      // map.get() takes 2 arg(s) — you passed 1
      map.get(<m: Map[K, V]>, <key: K>)
  |
5 |     match map.get(w) {
  |                   ^

3 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(|x| x != "") in
  let map = map.new() in
  list.fold(words, map, (m, w) => 
    match map.get(w) {
      some(x) => map.set(m, w, x + 1),
      none => map.set(m, w, 1)
    })

fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(x => x != "") in
  let map = map.new() in
  list.fold(words, map, (m, w) => 
    match map.get_or(m, w, 0) {
      some(x) => map.set(m, w, x + 1),
      none => map.set(m, w, 1)
    })
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: '|x|' closure syntax is not valid in Almide at line 2:51
  --> /tmp/dojo-word-count-1.almd:2:51
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   let words = string.split(s, " ") |> list.filter(|x| x != "") in
  |                                                   ^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-1.almd:11:53
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
   |
11 |   let words = string.split(s, " ") |> list.filter(x => x != "") in
   |                                                     ^^
error[E012]: duplicate function 'word_count'
  at line 10
  in fn word_count
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn word_count(s: String) -> Map[String, Int] =
   | ------------------------------------- first definition of 'word_count' here
...
10 | fn word_count(s: String) -> Map[String, Int] =
   | ^^^^^^^^^^^^^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-1.almd:4:13
  in variable words
  hint: Check the variable name
  |
4 |   list.fold(words, map, (m, w) =>
  |             ^^^^^
error[E004]: map.get() expects 2 argument(s) but got 1
  --> /tmp/dojo-word-count-1.almd:5:19
  in call to map.get()
  hint: Check the number of arguments
  try:
      // map.get() takes 2 arg(s) — you passed 1
      map.get(<m: Map[K, V]>, <key: K>)
  |
5 |     match map.get(w) {
  |                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-1.almd:13:13
  in variable words
  hint: Check the variable name
   |
13 |   list.fold(words, map, (m, w) =>
   |             ^^^^^
error[E010]: non-exhaustive match: missing _
  --> /tmp/dojo-word-count-1.almd:14:28
  in match
  hint: match on Int requires a catch-all '_' pattern
   |
14 |     match map.get_or(m, w, 0) {
   |                            ^

7 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(x => x != "") in
  let map = map.new() in
  list.fold(words, map, (m, w) => 
    match map.get_or(m, w, 0) {
      some(x) => map.set(m, w, x + 1),
      none => map.set(m, w, 1)
    })
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-2.almd:2:53
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let words = string.split(s, " ") |> list.filter(x => x != "") in
  |                                                     ^^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:4:13
  in variable words
  hint: Check the variable name
  |
4 |   list.fold(words, map, (m, w) =>
  |             ^^^^^
error[E010]: non-exhaustive match: missing _
  --> /tmp/dojo-word-count-2.almd:5:28
  in match
  hint: match on Int requires a catch-all '_' pattern
  |
5 |     match map.get_or(m, w, 0) {
  |                            ^

3 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(x => x != "") in
  let map = map.new() in
  list.fold(words, map, (m, w) => 
    match map.get_or(m, w, 0) {
      some(x) => map.set(m, w, x + 1),
      none => map.set(m, w, 1)
    })

  // fix non-exhaustive match error
  map
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-3.almd:2:53
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let words = string.split(s, " ") |> list.filter(x => x != "") in
  |                                                     ^^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-3.almd:4:13
  in variable words
  hint: Check the variable name
  |
4 |   list.fold(words, map, (m, w) =>
  |             ^^^^^
error[E010]: non-exhaustive match: missing _
  --> /tmp/dojo-word-count-3.almd:5:28
  in match
  hint: match on Int requires a catch-all '_' pattern
  |
5 |     match map.get_or(m, w, 0) {
  |                            ^

3 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
